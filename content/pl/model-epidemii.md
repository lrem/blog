+++
# vim:set nosmartindent nocindent ft=markdown:
date = "2010-12-08T19:05:53"
draft = false
title = "Model epidemii"
+++
Znajomy wykładał dzisiaj o _mean field approximating the disease spreading
model_, postanowiłem posłuchać. Niestety nie przewidziałem jak bardzo
podstawowy będzie dzisiejszy wykład. Stąd zamiast słuchać zacząłem pisać. Tak
powstała wizualizacja tegoż modelu, w wersji z dyskretnym czasem. Kompletny
kod poniżej.

Przykładowa stopklatka z wizualizacji: ![](http://maxnet.org.pl/~lrem/sis.png)
Węzły czerwone są zarażone, ich etykiety oznaczają czas zarażenia. Dwie liczby
komentarza to aktualny czas oraz liczba już zarażonych węzłów.

Kod działa pod OS X, wymaga [graphviza](http://www.graphviz.org/). Pod
Linuksem _chyba_ wystarczy zastąpić polecenie _open_ jakimś odpowiednikiem
(xdg-open? przeglądarką pdf-ów?). Linia kontrolująca parametry modelu jest pod
koniec, jej znaczenie: `g = graph(liczba wierzchołków, średnia liczba
krawędzi, początkowa liczba chorych, szansa na wyleczenie)`

    
    
    
    #!/usr/bin/env python
    
    from random import *
    from time import sleep
    from os import system
    
    class node:
        def __init__(self, num):
            self.infected = False
            self.infecting = False
            self.links = []
            self.num = num
            self.changeTime = 0
    
        def bond(self, other):
            self.links.append(other)
            other.links.append(self)
    
        def color(self):
            if self.infected:
                return "red"
            else:
                return "blue"
    
    class graph:
    
        def fix(self):
            for n in self.nodes:
                if len(n.links) == 0:
                    o = sample(self.nodes, 1)[0]
                    while n == o:
                        o = sample(self.nodes, 1)[0]
                    n.bond(o)
    
        def rand1(self, N, K, I, C):
            self.Pcure = C
            self.nodes = map(lambda x: node(x), xrange(N))
            for i in xrange(N * K / 2):
                a = randint(0, N - 1)
                b = randint(0, N - 1)
                while a == b:
                    b = randint(0, N - 1)
                self.nodes[a].bond(self.nodes[b])
            self.fix()
            for n in sample(self.nodes, I):
                n.infected = True
                n.infecting = True
            self.time = 0
    
        def clique(self, N, K, I, C):
            self.Pcure = C
            self.nodes = map(lambda x: node(x), xrange(N))
            for i in xrange(N):
                for j in xrange(i):
                    self.nodes[i].bond(self.nodes[j])
            for n in sample(self.nodes, I):
                n.infected = True
                n.infecting = True
            self.time = 0
    
        def erdos(self, N, K, I, C):
            self.Pcure = C
            self.nodes = map(lambda x: node(x), xrange(N))
            q = float(K * N) / (N * (N-1) / 2)
            for i in xrange(N):
                for j in xrange(i):
                    if uniform(0, 1) < q:
                        self.nodes[i].bond(self.nodes[j])
            for n in sample(self.nodes, I):
                n.infected = True
                n.infecting = True
            self.time = 0
    
    
        def slottedStep(self):
            self.time += 1
            for n in self.nodes:
                if n.infected and uniform(0, 1) < self.Pcure:
                    n.infected = False
                    n.changeTime = self.time
            for n in self.nodes:
                if n.infecting:
                    x = sample(n.links, 1)[0]
                    if not x.infected:
                        x.infected = True
                        x.changeTime = self.time
            for n in self.nodes:
                n.infecting = n.infected
    
        def show(self):
            infected = 0
            for n in self.nodes:
                if n.infected:
                    infected += 1
            print " ".join(map(lambda n: repr(n.infected), self.nodes))
            dot = file("sis.dot", "w")
            print >> dot, "graph g {"
            print >> dot, "graph [dpi=300, overlap=scale, splines=true, aspect=1];"
            print >> dot, "frame [label=\"%d, %d\", fontsize=30, shape=none];" % (self.time, infected)
            for n in self.nodes:
                print >> dot, "n%d [color = %s, style = filled, label=%d];" % (n.num, n.color(), n.changeTime)
                for m in n.links:
                    if n.num < m.num:
                        print >> dot, "n%d -- n%d;" % (n.num, m.num)
            print >> dot, "}"
            dot.close()
            system("neato -Tpdf -o sis.pdf sis.dot")
            system("open sis.pdf")
    
        def __init__(self, N, K, I, C):
            self.erdos(N, K, I, C)
    
    
    while True:
        g = graph(32, 8, 1, 0.0)
        g.show()
        interesting = True
        while interesting:
            sleep(0.5)
            g.slottedStep()
            g.show()
            interesting = False
            for n in g.nodes:
                interesting = interesting or not n.infected
        sleep(2)
    


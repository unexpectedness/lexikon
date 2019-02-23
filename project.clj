(defproject lexikon "0.2.1"
  :description "Reify, manipulate and replay the lexical environment in Clojure"
  :url "https://github.com/unexpectedness/lexikon"
  :license {:name "Eclipse Public License"
            :url "http://www.eclipse.org/legal/epl-v10.html"}
  :dependencies [[org.clojure/clojure "1.9.0"]
                 [net.clojars.unexpectedness/shuriken "0.14.1"]]
  :profiles {:dev {:dependencies [[codox-theme-rdash "0.1.2"]]}}
  :plugins [[lein-codox "0.10.3"]]
  :codox {:source-uri "https://github.com/unexpectedness/threading/" \
                      "blob/{version}/{filepath}#L{line}"
          :metadata {:doc/format :markdown}
          :themes [:rdash]})

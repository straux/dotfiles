{:user {:deploy-repositories [["releases"  {:url "http://artifactory.oscaroad.com/artifactory/libs-release-local"
                                            :creds :gpg}]
                              ["snapshots" {:url "http://artifactory.oscaroad.com/artifactory/libs-snapshot-local"
                                            :creds :gpg}]]
        :signing {:gpg-key "2BC5AB85"}
        :mirrors {
                  "central" {:name "central"
                              :url "http://artifactory.oscaroad.com/artifactory/remote-repos/"
                              }
                  #"clojars" {:name "clojars"
                              :url "http://artifactory.oscaroad.com/artifactory/remote-repos/"
                              }
                    }

        :plugins [[lein-cloverage "1.0.6" :exclusions  [org.clojure/clojure]]
                  [lein-pprint "1.1.2" :exclusions  [org.clojure/clojure]]
                  [lein-ancient "0.6.8" :exclusions  [org.clojure/clojure]]
                  [lein-codox "0.9.1" :exclusions  [org.clojure/clojure]]]
        :dependencies [[debugger "0.1.7" :exclusions  [org.clojure/clojure]]]
        }}

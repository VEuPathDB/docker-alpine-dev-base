#!groovy

@Library('pipelib@publish-branches')
import org.veupathdb.lib.Builder

node('podbuild') {
  def builder = new Builder(this)

  builder.gitClone()
  builder.buildContainers([
    [ name: 'alpine-dev-base' ]
  ])
}
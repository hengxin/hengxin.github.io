---
layout: post
title: "Specification and Complexity of Collaborative Text Editing"
date: 2017-01-03 21:46:02 +0800
published: true
comments: true
categories: [Replicated Data Types, Research, Paper Summary]
---

## Collaborative Text Editing System

<!-- more -->

## System Model

## Replicated List

A shared document is modeled as a replicated list object, which allows its clients to
insert and delete elements at different replicas.

- `ins(a, k):` insert element `a` at the position `k`; return the contents of the list
- `del(a):` delete the element `a`; return the contents of the list
- `read():` return the contents of the list

### Specification of List


## The RGA Protocol

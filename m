Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 333FA26C963
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Sep 2020 21:08:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727458AbgIPTHn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Sep 2020 15:07:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727178AbgIPRoz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Sep 2020 13:44:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 695BAC00217A
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Sep 2020 07:43:46 -0700 (PDT)
Received: from Q.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E034026B;
        Wed, 16 Sep 2020 16:43:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600267404;
        bh=pb7o7zCPBB7hwNHEgOgJG2k0ddSL9nA38rs3w0JTW7k=;
        h=From:To:Cc:Subject:Date:From;
        b=mo+FuWBLRKW7+BlrKXp5RidaY8qFqmllPBERjuzABdYjjNDY4fKXey4Bmk4t9IU07
         jcoxJue646LVgm/YcJ2yw9xte3XWekjC0XaI8Nr8cid0q1KV5UsE9qbyHhktnw6g5H
         yug8JFhK324VfBt9Ty6XraG3kiSQI2pGrQYkd9e8=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [VSP-Tests PATCH 0/3] Run as user, and python3 support
Date:   Wed, 16 Sep 2020 15:42:59 +0100
Message-Id: <20200916144302.1483470-1-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

My development target now runs as a user, rather than root and fails to
obtain timestamps through the /proc/timer_list which requires root
access, and generates a warning on every log output.

Whilst not fatal, this can be fixed by using a c-based implementation to
read the monotonic timestamps without parsing proc manually with awk.

This has the extra advantage of not spawning extra processes for every
line that is logged, and simplifies the timestamp handling.

Furthermore, python2 is no longer available on my platforms so the
gen-lut.py script is updated to run as python3.

I am aware that there is a second python2 tool in this repository, for
converting histograms, however I have not yet identified what files this
process so I have not completed the python3 migration for that file yet.

If someone wants to complete this, I have the initial conversion, or
alternatively - if someone has a set of appropriate histograms to give
me I can update and validate the tool myself.


Kieran Bingham (3):
  gen-lut: Update for python3
  src: monotonic-ts: Monotonic timestamp logging
  scripts/logger: Use new monotonic-ts tool

 data/frames/gen-lut.py | 18 +++++++++---------
 scripts/logger.sh      | 20 ++++----------------
 src/Makefile           | 10 +++++++---
 src/monotonic-ts.c     | 37 +++++++++++++++++++++++++++++++++++++
 4 files changed, 57 insertions(+), 28 deletions(-)
 create mode 100644 src/monotonic-ts.c

-- 
2.25.1


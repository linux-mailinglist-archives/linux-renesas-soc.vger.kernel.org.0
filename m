Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94CAB26DE36
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Sep 2020 16:28:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726478AbgIQO2m (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Sep 2020 10:28:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727562AbgIQO2X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Sep 2020 10:28:23 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7D59C06121E
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Sep 2020 07:05:56 -0700 (PDT)
Received: from Q.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 168172DB;
        Thu, 17 Sep 2020 16:04:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600351494;
        bh=1DXRMznDHGALjYRXyTjbVwZMDpXXHk1Bi1LR7NuJYoQ=;
        h=From:To:Cc:Subject:Date:From;
        b=Z1q//gBPT3HwTBNBqwLeh7t7eOBt2hWFYYyJPoiGDEWyTXmF9jKysSyPzA6vnMsiI
         wpsgH7Vp/rUTwODWFDQNiwrpndJ3RW3IN5vTDDm3pUlEQox0GIc/TJXIDggGd4BvbS
         qEA/zWMa/JxywSY50IuwE/DLhviXSmpiDXjgTWKQ=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [VSP-Tests PATCH v2 0/3] Run as user, and python3 support
Date:   Thu, 17 Sep 2020 15:04:47 +0100
Message-Id: <20200917140450.12264-1-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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


Version two updated with comments from Laurent, and collects his tags.

--
Regards

Kieran

Kieran Bingham (3):
  gen-lut: Update for python3
  src: monotonic-ts: Monotonic timestamp logging
  scripts/logger: Use new monotonic-ts tool

 data/frames/gen-lut.py | 18 +++++++++---------
 scripts/logger.sh      | 20 ++++----------------
 src/Makefile           |  9 +++++++--
 src/monotonic-ts.c     | 36 ++++++++++++++++++++++++++++++++++++
 4 files changed, 56 insertions(+), 27 deletions(-)
 create mode 100644 src/monotonic-ts.c

-- 
2.25.1


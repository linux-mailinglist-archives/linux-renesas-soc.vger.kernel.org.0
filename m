Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 066CF23F529
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  8 Aug 2020 01:21:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726166AbgHGXVj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Aug 2020 19:21:39 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48952 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726096AbgHGXVj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Aug 2020 19:21:39 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D2649CC;
        Sat,  8 Aug 2020 01:21:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1596842496;
        bh=JCYSKoYMRl+Opdzc1SUgvfhCY7ny/kya/BQcf0wy9fE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OHpoD5y3m5A4Y4GIDPos+Gm35gkrftm0liNn7zZukE8PI325g3MNMU6s9Yz4/hk+k
         ZVbdDeKgppPt9uUVhBw1RiV+Ut76ueoU3n3c4chUQvXiHbtPjUjdDyTBLxtOjAB3nS
         Ohbtx9Trr/31rGbKXCXWEds1yjdl7sUOqcd0mUlc=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [kms-tests] [PATCH 2/6] kmstest: Add additional geometry classes
Date:   Sat,  8 Aug 2020 02:21:15 +0300
Message-Id: <20200807232119.28854-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200807232119.28854-1-laurent.pinchart@ideasonboard.com>
References: <20200807232119.28854-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add Dist, Point and Size classes in addition to the Rect class.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/kmstest.py | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/tests/kmstest.py b/tests/kmstest.py
index 0281c6727271..949bb20b8b1a 100755
--- a/tests/kmstest.py
+++ b/tests/kmstest.py
@@ -205,6 +205,37 @@ class CRCReader(object):
         return crcs
 
 
+class Dist(object):
+    def __init__(self, x, y):
+        self.x = x
+        self.y = y
+
+    def __repr__(self):
+        return "(%d,%d)" % (self.x, self.y)
+
+
+class Point(object):
+    def __init__(self, x, y):
+        self.x = x
+        self.y = y
+
+    def __repr__(self):
+        return "(%d,%d)" % (self.x, self.y)
+
+    def move(self, distance):
+        self.x += distance.x
+        self.y += distance.y
+
+
+class Size(object):
+    def __init__(self, width, height):
+        self.width = width
+        self.height = height
+
+    def __repr__(self):
+        return "%ux%u" % (self.width, self.height)
+
+
 class Rect(object):
     def __init__(self, left, top, width, height):
         self.left = left
-- 
Regards,

Laurent Pinchart


Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41419585F76
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 31 Jul 2022 17:20:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233771AbiGaPUk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 31 Jul 2022 11:20:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232548AbiGaPUj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 31 Jul 2022 11:20:39 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A26F7260D
        for <linux-renesas-soc@vger.kernel.org>; Sun, 31 Jul 2022 08:20:38 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2B1086D4;
        Sun, 31 Jul 2022 17:20:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1659280837;
        bh=GdbhRD+IZtalaTcAijl8rQrM63Eq773gcNvZ0V2Us3c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YCx1xvCejOgxWFV0uFz8n4OaiZH1+5+nOgTXEaMQ05TZOMY1mPGkM9UfHm5NuBYIF
         WMp9YjrZ5wUyhNjU+lb9EWgAtFPssWnNO8aHcBRSOATH0xels8WBPVPp5o3jpRQw5B
         ZKR0h33c6OazGrc2P5Rtp4Iwgt2eZi4XJHT0Tfj0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [kms-test] [PATCH 4/7] kmstest: Fix exception handling in CRCReader constructor and destructor
Date:   Sun, 31 Jul 2022 18:20:21 +0300
Message-Id: <20220731152024.24090-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220731152024.24090-1-laurent.pinchart@ideasonboard.com>
References: <20220731152024.24090-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

If an exception occurs in the CRCReader constructor, the self.dir,
self.ctrl and self.data members may not be set. This causes another
exception to be thrown by the destructor when it tries to access those
members. Fix it by initializing all the members first, and only closing
the dir and ctrl file descriptors if they have been successfully opened.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/kmstest.py | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tests/kmstest.py b/tests/kmstest.py
index 177110ebd894..960c27f301ce 100755
--- a/tests/kmstest.py
+++ b/tests/kmstest.py
@@ -168,17 +168,21 @@ class CRCReader(object):
 
     def __init__(self, crtc):
         self.pipe = crtc.idx
+        self.ctrl = -1
+        self.dir = -1
+        self.data = -1
 
         # Hardcode the device minor to 0 as the KMSTest constructor opens the
         # default card object.
         self.dir = os.open(f'/sys/kernel/debug/dri/0/crtc-{self.pipe}/crc', 0)
         self.ctrl = os.open('control', os.O_WRONLY, dir_fd = self.dir)
-        self.data = -1
 
     def __del__(self):
         self.stop()
-        os.close(self.ctrl)
-        os.close(self.dir)
+        if self.ctrl != -1:
+            os.close(self.ctrl)
+        if self.dir != -1:
+            os.close(self.dir)
 
     def start(self, source):
         os.write(self.ctrl, source.encode('ascii'))
-- 
Regards,

Laurent Pinchart


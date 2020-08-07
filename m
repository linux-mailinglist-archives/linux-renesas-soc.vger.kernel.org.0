Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72A0323F52A
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  8 Aug 2020 01:21:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726096AbgHGXVj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Aug 2020 19:21:39 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48954 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbgHGXVj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Aug 2020 19:21:39 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD46AB91;
        Sat,  8 Aug 2020 01:21:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1596842497;
        bh=eZAihn7YKGz3HHIGU40HgYGj5i/+LyyCf3zokuJzc48=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZOicoZIKu2gMIsL/61GDK4jKjURIEy63isfnrnj+7V2l2D+n3PQCUmfYx2XyJp46e
         t+S0/C0NpHBhlYhaTP1+RiRzNQG+9akmweK/9SPvJA3wY/efchHbwtCanFRrLk5U+W
         JaSbpFct/sEsIVCsBc+3cWkeg1TqZlCgfKTJRcRo=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [kms-tests] [PATCH 3/6] tests: crc: Disable CRTC regarless of test status
Date:   Sat,  8 Aug 2020 02:21:16 +0300
Message-Id: <20200807232119.28854-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200807232119.28854-1-laurent.pinchart@ideasonboard.com>
References: <20200807232119.28854-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The CRTC should be disabled when the test completes, regardless of
whether it succeeds or fails.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/kms-test-crc.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/kms-test-crc.py b/tests/kms-test-crc.py
index dcdfcd4abb71..e3e31b34e2d4 100755
--- a/tests/kms-test-crc.py
+++ b/tests/kms-test-crc.py
@@ -105,7 +105,8 @@ class CRCTest(kmstest.KMSTest):
 
                 self.logger.log("CRC value 0x%08x" % crcs[0])
             else:
-                self.atomic_crtc_disable(crtc)
                 self.success()
 
+            self.atomic_crtc_disable(crtc)
+
 CRCTest().execute()
-- 
Regards,

Laurent Pinchart


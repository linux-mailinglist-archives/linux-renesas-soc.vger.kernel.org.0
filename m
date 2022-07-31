Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0CFB586073
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 31 Jul 2022 20:52:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237673AbiGaSwr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 31 Jul 2022 14:52:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237649AbiGaSwl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 31 Jul 2022 14:52:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5F0F959A
        for <linux-renesas-soc@vger.kernel.org>; Sun, 31 Jul 2022 11:52:38 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D0964415;
        Sun, 31 Jul 2022 20:52:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1659293557;
        bh=cCuKZ2f0lHj9gooIf7Nxg5YrlNEnz2MB9DgutAuSDxE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OXYCdIK/yC39lfdJaFq0eMsa/z6a4MLIqLIYLJE32IRDAycg/Db7KHoxgbLdtTfIH
         bzztzHmTk6bWSN/zomPgpt5OqV2obihcYGWOMSZ6pEvwyYIA1K8O2eh4XIguDhMC1I
         QrkGNomd1KBRrCn1i/S1RJJiX0jf02WwDWa0BbB0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [kms-test] [PATCH 8/7] tests: Don't skip formats and plane-position tests on unconnected connector
Date:   Sun, 31 Jul 2022 21:52:32 +0300
Message-Id: <20220731185232.11121-1-laurent.pinchart@ideasonboard.com>
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

The formats and plane-position tests need one connected connector. Don't
skip them upon the first unconnected connector, only when no connected
connector can be found.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/kms-test-formats.py        | 2 +-
 tests/kms-test-plane-position.py | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/kms-test-formats.py b/tests/kms-test-formats.py
index afc5454d0b5d..a4f4fbfa3071 100755
--- a/tests/kms-test-formats.py
+++ b/tests/kms-test-formats.py
@@ -15,7 +15,7 @@ class FormatsTest(kmstest.KMSTest):
         # Find a CRTC with a connected connector and at least one plane
         for connector in self.output_connectors():
             if not connector.connected():
-                self.skip('unconnected connector')
+                self.logger.log(f'unconnected connector {connector.fullname}')
                 continue
 
             try:
diff --git a/tests/kms-test-plane-position.py b/tests/kms-test-plane-position.py
index 5dfcfaaba05e..c85375adc0d2 100755
--- a/tests/kms-test-plane-position.py
+++ b/tests/kms-test-plane-position.py
@@ -15,7 +15,7 @@ class PlanePositionTest(kmstest.KMSTest):
         # Find a CRTC with a connected connector and at least two planes
         for connector in self.output_connectors():
             if not connector.connected():
-                self.skip('unconnected connector')
+                self.logger.log(f'unconnected connector {connector.fullname}')
                 continue
 
             try:

-- 
Regards,

Laurent Pinchart


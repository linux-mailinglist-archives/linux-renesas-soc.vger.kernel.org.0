Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DB3D7667D9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jul 2023 10:53:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235114AbjG1Ixb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Jul 2023 04:53:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235170AbjG1Iwf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Jul 2023 04:52:35 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C2FC5261
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jul 2023 01:50:44 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:12b0:7b7e:d1ff:7873])
        by baptiste.telenet-ops.be with bizsmtp
        id SYqi2A00f0d1nm801YqiJt; Fri, 28 Jul 2023 10:50:43 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qPJB7-002lSg-IX;
        Fri, 28 Jul 2023 10:50:42 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qPJBK-00AjtQ-Me;
        Fri, 28 Jul 2023 10:50:42 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 12/13] of: unittest-data: Fix whitespace - indentation
Date:   Fri, 28 Jul 2023 10:50:38 +0200
Message-Id: <4df783995a7d34364cb06002bdfeb9eaf2ad4e80.1690533838.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690533838.git.geert+renesas@glider.be>
References: <cover.1690533838.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Single space for each indentation level.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - No changes.
---
 drivers/of/unittest-data/overlay_bad_add_dup_node.dtso | 6 +++---
 drivers/of/unittest-data/overlay_bad_add_dup_prop.dtso | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/of/unittest-data/overlay_bad_add_dup_node.dtso b/drivers/of/unittest-data/overlay_bad_add_dup_node.dtso
index a8d8534f725c10ea..11aa1401244d9685 100644
--- a/drivers/of/unittest-data/overlay_bad_add_dup_node.dtso
+++ b/drivers/of/unittest-data/overlay_bad_add_dup_node.dtso
@@ -21,7 +21,7 @@ controller {
 };
 
 &spin_ctrl_1 {
-		controller {
-			power_bus_emergency = < 0x101 0x102 >;
-		};
+	controller {
+		power_bus_emergency = < 0x101 0x102 >;
+	};
 };
diff --git a/drivers/of/unittest-data/overlay_bad_add_dup_prop.dtso b/drivers/of/unittest-data/overlay_bad_add_dup_prop.dtso
index 3f0ee9cbefb815be..5af099cc2174e273 100644
--- a/drivers/of/unittest-data/overlay_bad_add_dup_prop.dtso
+++ b/drivers/of/unittest-data/overlay_bad_add_dup_prop.dtso
@@ -32,7 +32,7 @@ electric {
 };
 
 &spin_ctrl_1 {
-		electric {
-			rpm_avail = < 100 200 >;
-		};
+	electric {
+		rpm_avail = < 100 200 >;
+	};
 };
-- 
2.34.1


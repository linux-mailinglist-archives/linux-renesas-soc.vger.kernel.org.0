Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1775B493BCC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jan 2022 15:15:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354938AbiASOPQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jan 2022 09:15:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354949AbiASOPM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jan 2022 09:15:12 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 858AEC06173E
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Jan 2022 06:15:12 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:a44d:f245:bac9:611c])
        by andre.telenet-ops.be with bizsmtp
        id keFA2600N2FKFx601eFANc; Wed, 19 Jan 2022 15:15:11 +0100
Received: from rox.of.borg ([192.168.97.57] helo=rox)
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nABjy-00AS7w-Mc; Wed, 19 Jan 2022 15:15:10 +0100
Received: from geert by rox with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nABjy-009iiA-5g; Wed, 19 Jan 2022 15:15:10 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 2/3] gpio: rcar: Add R-Car Gen4 support
Date:   Wed, 19 Jan 2022 15:15:07 +0100
Message-Id: <495378ce476e9baf5257582520aa6dc58485010c.1642601310.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1642601310.git.geert+renesas@glider.be>
References: <cover.1642601310.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

R-Car V3U (R8A779A0) was the first member of the R-Car Gen4 family.
Generalize the support for R-Car V3U to other SoCs in the R-Car Gen4
family by adding a family-specific compatible value.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/gpio-rcar.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index bb293373b635fd93..ccb67ede307aadac 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -461,7 +461,7 @@ static const struct gpio_rcar_info gpio_rcar_info_gen3 = {
 	.has_inen = false,
 };
 
-static const struct gpio_rcar_info gpio_rcar_info_v3u = {
+static const struct gpio_rcar_info gpio_rcar_info_gen4 = {
 	.has_outdtsel = true,
 	.has_both_edge_trigger = true,
 	.has_always_in = true,
@@ -471,7 +471,7 @@ static const struct gpio_rcar_info gpio_rcar_info_v3u = {
 static const struct of_device_id gpio_rcar_of_table[] = {
 	{
 		.compatible = "renesas,gpio-r8a779a0",
-		.data = &gpio_rcar_info_v3u,
+		.data = &gpio_rcar_info_gen4,
 	}, {
 		.compatible = "renesas,rcar-gen1-gpio",
 		.data = &gpio_rcar_info_gen1,
@@ -481,6 +481,9 @@ static const struct of_device_id gpio_rcar_of_table[] = {
 	}, {
 		.compatible = "renesas,rcar-gen3-gpio",
 		.data = &gpio_rcar_info_gen3,
+	}, {
+		.compatible = "renesas,rcar-gen4-gpio",
+		.data = &gpio_rcar_info_gen4,
 	}, {
 		.compatible = "renesas,gpio-rcar",
 		.data = &gpio_rcar_info_gen1,
-- 
2.25.1


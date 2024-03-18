Return-Path: <linux-renesas-soc+bounces-3865-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B3087EEF6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Mar 2024 18:36:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E67D5281D39
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Mar 2024 17:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A226B56745;
	Mon, 18 Mar 2024 17:33:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADE115674B;
	Mon, 18 Mar 2024 17:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710783226; cv=none; b=Sn908eVtD8uMYIyBwDMtSH0A8uAC/Yjx3/BiT1vUN0k3Ct8jpO8BnGrZGqNVkmSvP/1T1mQZ439rw5pP3gYibgABpDxVkmNe4J8ubZDhlsbL0F8HkVYi3Z6nEY+lCMbc1QhxX769FdjKfpqUo6K8apJdMRRiFptBalN6yiMD4bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710783226; c=relaxed/simple;
	bh=KuBv1s1rUd1QcRd8mXN7qBPmnnsEWIV03gtKsVQjV3A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=o9pnFPh1JGnLbCSTUF6R4o9gBCh/0JdU0OavWrNAJU1LwoItdGz5Ld1yFoRb+rwWeyUQTlBXamBBzZo3RR93Xqi+XawiPk5/xoJgr3djuWIbcH5hsC0VjoCzanjG2750WE61l/ttnaW7Lbt1FYo5Y4P7AzonGfqF1AmYAex+FP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.07,134,1708354800"; 
   d="scan'208";a="198216100"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 19 Mar 2024 02:33:43 +0900
Received: from localhost.localdomain (unknown [10.226.93.20])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id B5F4240359E9;
	Tue, 19 Mar 2024 02:33:39 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Huy Nguyen <huy.nguyen.wh@renesas.com>,
	Rob Herring <robh@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-usb@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 4/6] usb: renesas_usbhs: Update usbhs pipe configuration for RZ/G2L family
Date: Mon, 18 Mar 2024 17:33:17 +0000
Message-Id: <20240318173319.201799-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240318173319.201799-1-biju.das.jz@bp.renesas.com>
References: <20240318173319.201799-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RZ/G2L family SoCs has 10 pipe buffers compared to 16 pipe buffers on
RZ/A2M. Update the pipe configuration for RZ/G2L family SoCs and use
family SoC specific compatible to handle this difference.

The pipe configuration of RZ/G2L is same as usbhsc_rzg2l_default_pipe[],
so select the default pipe configuration for RZ/G2L SoCs by setting
.has_new_pipe_configs to zero.

Add SoC specific compatible to OF table to avoid ABI breakage with old
DTB. To optimize memory usage the SoC specific compatible will be removed
later.

Based on the patch in BSP by Huy Nguyen <huy.nguyen.wh@renesas.com>

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Credit  Huy Nguyen's work in the commit message and dropped his name
   from Signed-off-by tag.
 * Selection of usbhsc_rzg2l_default_pipe[] by setting the variable
   has_new_pipe_configs to zero.
 * Updated commit description.
 * Dropped the check 'priv->dparam.pipe_configs' as it is same as
   checking !has_new_pipe_configs.
v2->v3:
 * Updated commit description
 * Dropped usbhsc_rzg2l_pipe[] and reusing the default_pipe[].
v1->v2:
 * Dropped using of_device_is_compatible() in probe.
 * Added usbhs_rzg2l_plat_info and replaced the device data for RZ/G2L
   from usbhs_rza2_plat_info->usbhs_rzg2l_plat_info.
 * Moved usbhsc_rzg2l_pipe table near to the user.
 * Updated commit description.
---
 drivers/usb/renesas_usbhs/common.c | 20 ++++++++++++++++++--
 drivers/usb/renesas_usbhs/rza.h    |  1 +
 drivers/usb/renesas_usbhs/rza2.c   | 13 +++++++++++++
 3 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index 177fa3144a47..df94375f6c23 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -363,7 +363,7 @@ static void usbhsc_clk_disable_unprepare(struct usbhs_priv *priv)
  *		platform default param
  */
 
-/* commonly used on old SH-Mobile SoCs */
+/* commonly used on old SH-Mobile and RZ/G2L family SoCs */
 static struct renesas_usbhs_driver_pipe_config usbhsc_default_pipe[] = {
 	RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_CONTROL, 64, 0x00, false),
 	RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_ISOC, 1024, 0x08, true),
@@ -565,6 +565,18 @@ static const struct of_device_id usbhs_of_match[] = {
 		.compatible = "renesas,usbhs-r8a77995",
 		.data = &usbhs_rcar_gen3_with_pll_plat_info,
 	},
+	{
+		.compatible = "renesas,usbhs-r9a07g043",
+		.data = &usbhs_rzg2l_plat_info,
+	},
+	{
+		.compatible = "renesas,usbhs-r9a07g044",
+		.data = &usbhs_rzg2l_plat_info,
+	},
+	{
+		.compatible = "renesas,usbhs-r9a07g054",
+		.data = &usbhs_rzg2l_plat_info,
+	},
 	{
 		.compatible = "renesas,rcar-gen2-usbhs",
 		.data = &usbhs_rcar_gen2_plat_info,
@@ -581,6 +593,10 @@ static const struct of_device_id usbhs_of_match[] = {
 		.compatible = "renesas,rza2-usbhs",
 		.data = &usbhs_rza2_plat_info,
 	},
+	{
+		.compatible = "renesas,rzg2l-usbhs",
+		.data = &usbhs_rzg2l_plat_info,
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, usbhs_of_match);
@@ -642,7 +658,7 @@ static int usbhs_probe(struct platform_device *pdev)
 	if (usbhs_get_dparam(priv, has_new_pipe_configs)) {
 		priv->dparam.pipe_configs = usbhsc_new_pipe;
 		priv->dparam.pipe_size = ARRAY_SIZE(usbhsc_new_pipe);
-	} else if (!priv->dparam.pipe_configs) {
+	} else {
 		priv->dparam.pipe_configs = usbhsc_default_pipe;
 		priv->dparam.pipe_size = ARRAY_SIZE(usbhsc_default_pipe);
 	}
diff --git a/drivers/usb/renesas_usbhs/rza.h b/drivers/usb/renesas_usbhs/rza.h
index a29b75fef057..8b879aa34a20 100644
--- a/drivers/usb/renesas_usbhs/rza.h
+++ b/drivers/usb/renesas_usbhs/rza.h
@@ -3,3 +3,4 @@
 
 extern const struct renesas_usbhs_platform_info usbhs_rza1_plat_info;
 extern const struct renesas_usbhs_platform_info usbhs_rza2_plat_info;
+extern const struct renesas_usbhs_platform_info usbhs_rzg2l_plat_info;
diff --git a/drivers/usb/renesas_usbhs/rza2.c b/drivers/usb/renesas_usbhs/rza2.c
index f079817250bb..b83699eab373 100644
--- a/drivers/usb/renesas_usbhs/rza2.c
+++ b/drivers/usb/renesas_usbhs/rza2.c
@@ -71,3 +71,16 @@ const struct renesas_usbhs_platform_info usbhs_rza2_plat_info = {
 		.has_new_pipe_configs = 1,
 	},
 };
+
+const struct renesas_usbhs_platform_info usbhs_rzg2l_plat_info = {
+	.platform_callback = {
+		.hardware_init = usbhs_rza2_hardware_init,
+		.hardware_exit = usbhs_rza2_hardware_exit,
+		.power_ctrl = usbhs_rza2_power_ctrl,
+		.get_id = usbhs_get_id_as_gadget,
+	},
+	.driver_param = {
+		.has_cnen = 1,
+		.cfifo_byte_addr = 1,
+	},
+};
-- 
2.25.1



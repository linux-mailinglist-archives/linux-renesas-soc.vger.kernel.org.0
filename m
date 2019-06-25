Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83E2F52301
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2019 07:39:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728365AbfFYFjn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Jun 2019 01:39:43 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:59344 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728367AbfFYFji (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jun 2019 01:39:38 -0400
X-IronPort-AV: E=Sophos;i="5.62,413,1554735600"; 
   d="scan'208";a="19607558"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 25 Jun 2019 14:39:32 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id A3F2840031EF;
        Tue, 25 Jun 2019 14:39:32 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 06/13] usb: renesas_usbhs: Remove type member from renesas_usbhs_driver_param
Date:   Tue, 25 Jun 2019 14:38:50 +0900
Message-Id: <1561441137-3090-7-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561441137-3090-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1561441137-3090-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Now no one uses the type member so that this patch removes it.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/renesas_usbhs/common.c | 5 -----
 include/linux/usb/renesas_usbhs.h  | 7 -------
 2 files changed, 12 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index 530e2eb7..1872756 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -528,7 +528,6 @@ int usbhsc_schedule_notify_hotplug(struct platform_device *pdev)
 static const struct usbhs_of_data rcar_gen2_data = {
 	.platform_callback = &usbhs_rcar2_ops,
 	.param = {
-		.type = USBHS_TYPE_RCAR_GEN2,
 		.has_usb_dmac = 1,
 		.pipe_configs = usbhsc_new_pipe,
 		.pipe_size = ARRAY_SIZE(usbhsc_new_pipe),
@@ -538,7 +537,6 @@ static const struct usbhs_of_data rcar_gen2_data = {
 static const struct usbhs_of_data rcar_gen3_data = {
 	.platform_callback = &usbhs_rcar3_ops,
 	.param = {
-		.type = USBHS_TYPE_RCAR_GEN3,
 		.has_usb_dmac = 1,
 		.multi_clks = 1,
 		.pipe_configs = usbhsc_new_pipe,
@@ -549,7 +547,6 @@ static const struct usbhs_of_data rcar_gen3_data = {
 static const struct usbhs_of_data rcar_gen3_with_pll_data = {
 	.platform_callback = &usbhs_rcar3_with_pll_ops,
 	.param = {
-		.type = USBHS_TYPE_RCAR_GEN3_WITH_PLL,
 		.has_usb_dmac = 1,
 		.multi_clks = 1,
 		.pipe_configs = usbhsc_new_pipe,
@@ -560,7 +557,6 @@ static const struct usbhs_of_data rcar_gen3_with_pll_data = {
 static const struct usbhs_of_data rza1_data = {
 	.platform_callback = &usbhs_rza1_ops,
 	.param = {
-		.type = USBHS_TYPE_RZA1,
 		.pipe_configs = usbhsc_new_pipe,
 		.pipe_size = ARRAY_SIZE(usbhsc_new_pipe),
 	}
@@ -569,7 +565,6 @@ static const struct usbhs_of_data rza1_data = {
 static const struct usbhs_of_data rza2_data = {
 	.platform_callback = &usbhs_rza2_ops,
 	.param = {
-		.type = USBHS_TYPE_RZA2,
 		.has_cnen = 1,
 		.cfifo_byte_addr = 1,
 		.pipe_configs = usbhsc_new_pipe,
diff --git a/include/linux/usb/renesas_usbhs.h b/include/linux/usb/renesas_usbhs.h
index e249c21..fee84b7 100644
--- a/include/linux/usb/renesas_usbhs.h
+++ b/include/linux/usb/renesas_usbhs.h
@@ -170,7 +170,6 @@ struct renesas_usbhs_driver_param {
 	 */
 	int pio_dma_border; /* default is 64byte */
 
-	uintptr_t type;
 	u32 enable_gpio;
 
 	/*
@@ -184,12 +183,6 @@ struct renesas_usbhs_driver_param {
 	u32 multi_clks:1;
 };
 
-#define USBHS_TYPE_RCAR_GEN2		1
-#define USBHS_TYPE_RCAR_GEN3		2
-#define USBHS_TYPE_RCAR_GEN3_WITH_PLL	3
-#define USBHS_TYPE_RZA1			4
-#define USBHS_TYPE_RZA2			5
-
 /*
  * option:
  *
-- 
2.7.4


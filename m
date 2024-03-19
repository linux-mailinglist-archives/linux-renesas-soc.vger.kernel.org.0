Return-Path: <linux-renesas-soc+bounces-3885-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BAB87FC3C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Mar 2024 11:54:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D759F1F22E99
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Mar 2024 10:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44E8E7E564;
	Tue, 19 Mar 2024 10:54:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F21F77E10C;
	Tue, 19 Mar 2024 10:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710845658; cv=none; b=IlesQ5mGJNUWrwkiBNmO1ZWUtHTwUuHN/BD7MllIr/7tCcSbDXd80953TBeTh5AIBzismc4PfF/z7sfp62A144ArHfdhHpc+5Uh30/NBYIoJyH4A8qVlxOW6zgbUV5o8yE04nbcoTV4h9Zaq7bcX5Z8/3kTBXa0E7Yc1ogNR4EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710845658; c=relaxed/simple;
	bh=yGOd+u7cHytye3IDOHeBUl7oE8KjC9R2wfhVRXE7Klg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YIq1r5mroGey8vnc4Y0vtEAuYq+8aeFPyVGzJvxSBAxTGRMyoqt2UeYswOmizsj5MpvrSEcmCSqI2dcWDYSTliL/rjauP9RNcAWI3O5stPOnd1Hm8i2hhSI6CzVdcC2GK3e65BkX+3x9pxFj3AHa2Ta12VJw97CqJoJRZsG19RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="202296502"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 19 Mar 2024 19:54:15 +0900
Received: from localhost.localdomain (unknown [10.226.92.214])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 217714006DFB;
	Tue, 19 Mar 2024 19:54:11 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-usb@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v5 3/6] usb: renesas_usbhs: Improve usbhsc_default_pipe[] for isochronous transfers
Date: Tue, 19 Mar 2024 10:53:53 +0000
Message-Id: <20240319105356.87287-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240319105356.87287-1-biju.das.jz@bp.renesas.com>
References: <20240319105356.87287-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per the hardware manual, double buffer setting results in fewer
interrupts for high-speed data transfers. Improve usbhsc_default_pipe[]
for isochronous transfers by updating the table from single->double
buffering and update the pipe number accordingly.

Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4->v5:
 * No change
v3->v4:
 * Added Rbtag from Geert.
v3:
 * New patch
---
 drivers/usb/renesas_usbhs/common.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index 0c62e4c6c88d..177fa3144a47 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -366,11 +366,11 @@ static void usbhsc_clk_disable_unprepare(struct usbhs_priv *priv)
 /* commonly used on old SH-Mobile SoCs */
 static struct renesas_usbhs_driver_pipe_config usbhsc_default_pipe[] = {
 	RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_CONTROL, 64, 0x00, false),
-	RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_ISOC, 1024, 0x08, false),
-	RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_ISOC, 1024, 0x18, false),
-	RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_BULK, 512, 0x28, true),
-	RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_BULK, 512, 0x38, true),
+	RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_ISOC, 1024, 0x08, true),
+	RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_ISOC, 1024, 0x28, true),
 	RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_BULK, 512, 0x48, true),
+	RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_BULK, 512, 0x58, true),
+	RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_BULK, 512, 0x68, true),
 	RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_INT, 64, 0x04, false),
 	RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_INT, 64, 0x05, false),
 	RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_INT, 64, 0x06, false),
-- 
2.25.1



Return-Path: <linux-renesas-soc+bounces-3814-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB1687D3C0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Mar 2024 19:40:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE67FB23083
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Mar 2024 18:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75D0414A9F;
	Fri, 15 Mar 2024 18:39:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E44B71EF1A;
	Fri, 15 Mar 2024 18:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710527984; cv=none; b=tkGyFaJMGlIs/y2KtuYYiiKFKJJtXkCXdo6NiK9Bmo75WqKHfzTS3s7LOMZwxxinDYKkff6L7TxaQRErWbtaL5cU0D9rFTR9zGvbYYk5zCLvdlnPdemQcn8B6In1jOPzxI+ThBtHMSDqYDBLbMcoEQcdD3uunq8UdjwnCfvJCqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710527984; c=relaxed/simple;
	bh=C7kyR2ki1djI2qeuMUNpOihBcNvbesmD4ziXi1Fyq38=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Dx+guNjghsrq+TalFLRQc++Hz5oMZYcRkksUb1n0S93ZtQTPLFF8/BG/6WeV+avdat+E6Ae9j0907dL4TB9z6XtmJmv6sFtyeh2B21bNSxYNWjQq3ZhoX1ugdzgN/ttV78lyxj7VNUAqxKr0GanN+ABra9Y2qLh3IjHWdqkwJp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.07,129,1708354800"; 
   d="scan'208";a="197917684"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 16 Mar 2024 03:39:39 +0900
Received: from localhost.localdomain (unknown [10.226.93.102])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id C2D4A4066236;
	Sat, 16 Mar 2024 03:39:35 +0900 (JST)
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
Subject: [PATCH v3 3/7] usb: renesas_usbhs: Improve usbhsc_default_pipe[] for isochronous transfers
Date: Fri, 15 Mar 2024 18:39:17 +0000
Message-Id: <20240315183921.375751-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240315183921.375751-1-biju.das.jz@bp.renesas.com>
References: <20240315183921.375751-1-biju.das.jz@bp.renesas.com>
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
---
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



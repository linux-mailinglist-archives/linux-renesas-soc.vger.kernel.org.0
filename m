Return-Path: <linux-renesas-soc+bounces-12961-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3C2A2DEA9
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Feb 2025 15:57:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12DAB18870D6
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Feb 2025 14:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E767B1AF0D7;
	Sun,  9 Feb 2025 14:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="akoSyiXc";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="pa3F8H7N"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2034191F6A;
	Sun,  9 Feb 2025 14:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739113050; cv=none; b=I2bxtdf5t0o8x29fIRyf1qCcsNN+7Z7aUYx0xs0hGRd8JO/r6JB5HIqNg7Z4FaQvtaBgp7w6WTHhYRWhXfWOrz66iPEF0R4KG/aoopFDEcosI/byPkGJ1QD/BHx4AWhQ350mwycbXYEtAgj3FWUDtmhPeRKzn7WU05S0CNx5S0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739113050; c=relaxed/simple;
	bh=PIGePOzmE5SHR/i1OdpU2aHwG6R5h0p6VxXXNdRt93Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iqFpieW21xdIBdjW0fnytrrxEsLb/QGUkNrftDQ4Hzj98NtuNxdWgTcxK4r2lxzEIGW/BOZkRMzy+wKc0kmSCCUxnQRhAocXe2SX6GEyG3kxNTnDsarg57XtuLNcLXtrnN0gKkCgpbQEeV7YsphqAuLjdbDmre4pbl0GMFJRXbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=akoSyiXc; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=pa3F8H7N; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4YrW5f4wpYz9spc;
	Sun,  9 Feb 2025 15:57:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1739113046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OAgT921mppL8CPwHRQr78VfjSXeXamRGe0P05K9LV/k=;
	b=akoSyiXcsi8KExQD8Z8rx7soEcbLrkmjcfDz8L0NeiQd3ryvZvhBG8MHgFVIhMDymQd5tJ
	90GB2wIeB0OZW+AXYJH08rZFZStuRwf8VMmRqN+sfGkrlyI61TAQFIzhaWqrurocZifFns
	PK7G2EQdSaH6Dmm1N431xNCe1QGi7Ez9+y1Ueb3qxR+uWbiWbex0gwJUFAd9QUK5Xk2Nb7
	TbG7x3wlbxtrgMVkvPc25Bjf4fO4ztKq1fAr9PEIvwcVkvaDlc/6s2mbLxKuLN8c+XdFKV
	cZ9E7Q0kFdtlSq1YZdAjHu195vX+s6+G5rp9ASd4VsuAtU3WxXCUVJTwjP3Rvg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1739113044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OAgT921mppL8CPwHRQr78VfjSXeXamRGe0P05K9LV/k=;
	b=pa3F8H7N5P/921piFaM0KGMzS+C/EL+E9nHK2JuuQssMTObrbEyb7mgveyU3u8q5SGsyTu
	0tzPs665fVSm/gmH8/vhMsGZkc8al9cKdzmSXT5Me2/euYDGYSAKcfJF294Wukj9dschYu
	S+1dCS0Iy4UURB55uKEP3255f5LqsANvezxT1RdiVV3F6ayoaxCwxP6mxMfOmMgvT35TbX
	N75H11xapep8nuBUGZQdkDMu6M/tO4GsvvCw0CbPdbeLaVrM7M2F7XiEyXxkSas2LDIPqK
	9XqGV5BUx+SuvVEFx/1iR64s15nidY7HCd6TffWEjQQ49cJzqRg1sLAKFbNPoQ==
To: linux-usb@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Chris Brandt <chris.brandt@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Oliver Neukum <oneukum@suse.com>,
	linux-renesas-soc@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] USB: cdc-acm: Fill in Renesas R-Car D3 USB Download mode quirk
Date: Sun,  9 Feb 2025 15:56:11 +0100
Message-ID: <20250209145708.106914-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ay9ndtnfw8zw8h5sikwtkr87oiwdt7dn
X-MBO-RS-ID: 7c22f8b45334080e7da

Add Renesas R-Car D3 USB Download mode quirk and update comments
on all the other Renesas R-Car USB Download mode quirks to discern
them from each other. This follows R-Car Series, 3rd Generation
reference manual Rev.2.00 chapter 19.2.8 USB download mode .

Fixes: 6d853c9e4104 ("usb: cdc-acm: Add DISABLE_ECHO for Renesas USB Download mode")
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Chris Brandt <chris.brandt@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Oliver Neukum <oneukum@suse.com>
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-usb@vger.kernel.org
Cc: stable@vger.kernel.org
---
 drivers/usb/class/cdc-acm.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index 6b37d1c47fce1..06c7d86c5449e 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -1727,13 +1727,16 @@ static const struct usb_device_id acm_ids[] = {
 	{ USB_DEVICE(0x0870, 0x0001), /* Metricom GS Modem */
 	.driver_info = NO_UNION_NORMAL, /* has no union descriptor */
 	},
-	{ USB_DEVICE(0x045b, 0x023c),	/* Renesas USB Download mode */
+	{ USB_DEVICE(0x045b, 0x023c),	/* Renesas R-Car H3 USB Download mode */
 	.driver_info = DISABLE_ECHO,	/* Don't echo banner */
 	},
-	{ USB_DEVICE(0x045b, 0x0248),	/* Renesas USB Download mode */
+	{ USB_DEVICE(0x045b, 0x0247),	/* Renesas R-Car D3 USB Download mode */
 	.driver_info = DISABLE_ECHO,	/* Don't echo banner */
 	},
-	{ USB_DEVICE(0x045b, 0x024D),	/* Renesas USB Download mode */
+	{ USB_DEVICE(0x045b, 0x0248),	/* Renesas R-Car M3-N USB Download mode */
+	.driver_info = DISABLE_ECHO,	/* Don't echo banner */
+	},
+	{ USB_DEVICE(0x045b, 0x024D),	/* Renesas R-Car E3 USB Download mode */
 	.driver_info = DISABLE_ECHO,	/* Don't echo banner */
 	},
 	{ USB_DEVICE(0x0e8d, 0x0003), /* FIREFLY, MediaTek Inc; andrey.arapov@gmail.com */
-- 
2.47.2



Return-Path: <linux-renesas-soc+bounces-22260-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9151B97E37
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 02:30:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F2AE188F3EE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 00:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75568175BF;
	Wed, 24 Sep 2025 00:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Ohdo7pd6";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ZJhHTOeZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B5CCA4E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 00:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758673842; cv=none; b=Wqn1kZ+wS30IQXPEr73vng5mMdP3q2cK1mA/A//NXZMQh++UeWj5teqw2r2JJyxINzi1aPLoR/C+xrVak5s0IjHtgx3NUGmSg9Dhoo5JmV3T6ZTiNmkrvtNqx9Rdl9UZKu6CgffkyR/Co9KOV2l75FBigM1GB21VkeCwzor5pzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758673842; c=relaxed/simple;
	bh=BT88K/YFIzzEZUHEaH/ivdPzwhIjrlPxJjG8B3z8rB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b+1jZDos9PfXCPtBa+xIIPiyP1HDAEe43NFx7tTaIZo5iyRGhcZHXrs9TrQX82OfCnFwz+ykxIbPjlrpdOTSRQKcTRllEjKKbhC5dyzrtr4Vu4mEXTrr/C8E0Qm2C7lEFaLXCEMeq8IF9jUiUtNxIPyjZYUWCdxZnhHe8GE2J2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Ohdo7pd6; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ZJhHTOeZ; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cWd6k4jw9z9tCh;
	Wed, 24 Sep 2025 02:30:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758673838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KyswbkBmb0yEMFf/4z6dAe9yUwauwF6vMhdUoBUPfbM=;
	b=Ohdo7pd6k+kljbTo10wBx2ZqzywtXKUPXIjbzr5q8BM/1WncUnZVwM8VIc27+Ga+aS3+Oa
	DdaW3DZo/9uiBdKuCTXAr8jsw8+a9YD+akWMCLImSX0yxZUaQSID816pIKUjNR7ZCBZ0IJ
	BgFobVNZDBfzEhz+YbE9JZU2DFjWjfy7+9mlCVd7S0jWTdgemT5hAx2bP94fbWOtvwhbsT
	nJ1hclThyXi7ttW/M5VKsnrlxL8+f6wkMhNaoOj0SEovCVP/QwV71wUPvKaxnXKn01K5nF
	RXBBRtnR5JiQLVYRqahOVPkaIG+TrXs7LKwG9/iVC9BtL94ctoQxATL/zeh6mw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758673836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KyswbkBmb0yEMFf/4z6dAe9yUwauwF6vMhdUoBUPfbM=;
	b=ZJhHTOeZB9ZoVxxN3f+04IBcKTA5NVzvPYBawwN7wRRbhzMOzTPmXqeptAPBrlFMOBnehA
	OstY1LbwbqyVDPaSQ0vXO8u+mfPg729XX0ClTsgv7fdVzcQ8tTP80tMc9hzIuuht3CKE2W
	h1C0mFXqVWtUtjpFx5XiY65kEZOpV7w2MB/zTUsAqhpXpeLC8CbdQvQZPrCMgtDjCIdFfF
	i+zQ9nYQBrKzUm83arfcCxqmqTj4otXoCfu34h2z669gmDNMDHjsmLp0EHDxIfUdTBupFG
	IGm6EKIfyewauUrho9dclGwdoRtRqrD+bHNg6kaA/MFBueDX0vc1GirZIaOWPA==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	David Airlie <airlied@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 06/10] drm/rcar-du: dsi: Clean up TXVMPSPHSETR DT macros
Date: Wed, 24 Sep 2025 02:28:23 +0200
Message-ID: <20250924003003.91039-7-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250924003003.91039-1-marek.vasut+renesas@mailbox.org>
References: <20250924003003.91039-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 1eqsm63cjp7n67gdbarnrdotqa64ir9k
X-MBO-RS-ID: 1601bec5652aaa3bbcd

Introduce TXVMPSPHSETR_DT_MASK macro and use FIELD_PREP() to generate
appropriate bitfield from mask and value without bitshift.

Do not convert bits and bitfields to BIT() and GENMASK() yet, to be
consisten with the current style. Conversion to BIT() and GENMASK()
macros is done at the very end of this series in the last two patches.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: David Airlie <airlied@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
NOTE: No functional change expected, this is a preparatory patch which
partly removes macros which evaluate to zeroes from rcar_mipi_dsi_regs.h .
The other patches in this series proceed with that job, piece by piece,
to make it all reviewable.
---
V2: Move FIELD_PREP() back into rcar_mipi_dsi_regs.h
---
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
index 850f8e214a964..7c828f46cbb76 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
@@ -168,11 +168,12 @@
 #define TXVMSCR_STR			(1 << 16)
 
 #define TXVMPSPHSETR			0x1c0
-#define TXVMPSPHSETR_DT_RGB16		(0x0e << 16)
-#define TXVMPSPHSETR_DT_RGB18		(0x1e << 16)
-#define TXVMPSPHSETR_DT_RGB18_LS	(0x2e << 16)
-#define TXVMPSPHSETR_DT_RGB24		(0x3e << 16)
-#define TXVMPSPHSETR_DT_YCBCR16		(0x2c << 16)
+#define TXVMPSPHSETR_DT_MASK		(0x3f << 16)
+#define TXVMPSPHSETR_DT_RGB16		FIELD_PREP(TXVMPSPHSETR_DT_MASK, 0x0e)
+#define TXVMPSPHSETR_DT_RGB18		FIELD_PREP(TXVMPSPHSETR_DT_MASK, 0x1e)
+#define TXVMPSPHSETR_DT_RGB18_LS	FIELD_PREP(TXVMPSPHSETR_DT_MASK, 0x2e)
+#define TXVMPSPHSETR_DT_RGB24		FIELD_PREP(TXVMPSPHSETR_DT_MASK, 0x3e)
+#define TXVMPSPHSETR_DT_YCBCR16		FIELD_PREP(TXVMPSPHSETR_DT_MASK, 0x2c)
 
 #define TXVMVPRMSET0R			0x1d0
 #define TXVMVPRMSET0R_HSPOL_HIG		(0 << 17)
-- 
2.51.0



Return-Path: <linux-renesas-soc+bounces-22255-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AE8B97E16
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 02:30:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B92551890C11
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 00:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6FB952F99;
	Wed, 24 Sep 2025 00:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="TUtEK0sZ";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ATXP4Oun"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6418347C7
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 00:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758673831; cv=none; b=VVprdZ7KtpE/teW4DqvO5YMVBihcxwUYCGWOv8WYs/FdYRkcOyxmQ/Zillvu+TOiJoi0ULXpV7yHyW3sJqG4MLBGrrwIn04xaKvtljX4OuBQo8FgTxjxQGis83QzCcw+qAf8QTcTDmsPCfXZePf5/EmcdMtfaCgAhw0hxAXwD4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758673831; c=relaxed/simple;
	bh=S7khJFjZSy9YoYwRkrUu7pEdxiMIZf0obKj36TGq680=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oo5Muh0hZ8ijVdHUAf4eyJn3g27tFaPROIWYM/stRXjHZO3mqAm1i9eX09e8rUl88b3QCQ2kkPiKdPmgPbQnWLgfqTqxjLt++q6AmntTILkoIWIGixzduDGDMPKlJA2W8jqi+sLsO6ECYYM9ORN/p7JBtYhT7eu9TVNhDBiPam0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=TUtEK0sZ; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ATXP4Oun; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cWd6W4fbdz9tNJ;
	Wed, 24 Sep 2025 02:30:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758673827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vxjnweRNruDzC+RQOF5nGziF2pEdgIA+EOZqGLtVGXs=;
	b=TUtEK0sZ/WGtunj374dVxZbBPy9AdZrIoPlff7cEMmIF4GncyZFrRDjnpx51Z3rwN1rMcr
	yBBRfnU1EvQSK02/BR0rYu4vGUYJgbKUcLJUHA/ACeO8pu6NfuHGTNnWnk6t1IsxhzYc5A
	t7uen/N3O4UwxEJwNeKe4yUjdJDqto+Z/x+zaTY58yJw1LXYW2Dm9Q11x/aMZwspRPVBsF
	pCcsJQk8zMwuSNoVxbmFYi0tDoxCfQl6Gr5uak9BlBESH5rF5CR+jgPlgooSfSG7x2ZQzL
	Qn42RQ8wq8vuX8IXA/RMy/fHoEai/P5ORE46RR9fVTSvIu4d9JdDL5zSSYBuow==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758673825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vxjnweRNruDzC+RQOF5nGziF2pEdgIA+EOZqGLtVGXs=;
	b=ATXP4OundDP2eyMa5bmBcO0yqeZ2KRswvFvAJXOsS/iBGDxCNb/xTLBc9pq6C3U6I0aWkh
	WOBwSw9/NRLoLKz618AvYfGgsjG4TlpEZeMN6lqjLqLhMOs94Cxb/K8dVRgJn2whlcXuVg
	HDPyzrCxVSjTPE0s5K4kQH5qA4/6L7hM9Vr0iFEkPnR90oaYAPPcdvOwqJC3GciA863Itt
	JS9j0CGGhjrEJGYCONDQPTzNuTZSXvSrs33detqdO+oRWcN+uj+3ooixLiKSiC5Rk5Lf52
	hSPWxMkwnlg6m5aRRiZxf0IPuat8800QNxTz2QS5kDZAvTCmvuobuaC2Ph52sQ==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	David Airlie <airlied@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 01/10] drm/rcar-du: dsi: Fix missing parameter in RXSETR_...EN macros
Date: Wed, 24 Sep 2025 02:28:18 +0200
Message-ID: <20250924003003.91039-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250924003003.91039-1-marek.vasut+renesas@mailbox.org>
References: <20250924003003.91039-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: seot48wwcpbwwsed8kdtu4xfn57mm9xw
X-MBO-RS-ID: 390ac710e118c2cc8bc

The RXSETR_CRCEN(n) and RXSETR_ECCEN(n) macros both take parameter (n),
add the missing macro parameter. Neither of those macros is used by the
driver, so for now the bug is harmless.

Fixes: 685e8dae19df ("drm/rcar-du: dsi: Implement DSI command support")
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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
V2: Add RB from Laurent
---
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
index 76521276e2af8..dd871e17dcf53 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
@@ -50,8 +50,8 @@
 #define TXCMPPD3R			0x16c
 
 #define RXSETR				0x200
-#define RXSETR_CRCEN			(((n) & 0xf) << 24)
-#define RXSETR_ECCEN			(((n) & 0xf) << 16)
+#define RXSETR_CRCEN(n)			(((n) & 0xf) << 24)
+#define RXSETR_ECCEN(n)			(((n) & 0xf) << 16)
 #define RXPSETR				0x210
 #define RXPSETR_LPPDACC			(1 << 0)
 #define RXPSR				0x220
-- 
2.51.0



Return-Path: <linux-renesas-soc+bounces-22653-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A52BB93D2
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 05 Oct 2025 05:14:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7978A1896A3E
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  5 Oct 2025 03:14:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83B4234BA3E;
	Sun,  5 Oct 2025 03:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ZE7v0wRn";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="pddUqOzi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8074D1990D9
	for <linux-renesas-soc@vger.kernel.org>; Sun,  5 Oct 2025 03:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759634071; cv=none; b=TfqPXlRLO3pEtreJj5CWO2+op4RGWd0OOSux96JOwT4HL2MKwCQcmdhlBtYQ4iBtz8sYD09rzze15HsW0T7cYbV+nSdfPhVB/rJ+U8/ME++YHYvawiLS+9aVXcQG3ryOD+pahTm25tiigta7u1S/NIFHwPjjonPfsg7SCLJgNQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759634071; c=relaxed/simple;
	bh=SLaFGcx/EsyFmBpB94zd29XwYmv6NQyOf/3DBwoJMiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HRq9GtOz9CPnv3yRBvz3LX892Zkfyr3DJwMR5t9ODbdSazpPYu8rz3n91pd/Ox96BBuSjK+koeOFaeet8vOWKPqQLXHLaUIwqIH6MZJb7TuFbZO11gYcieM5p6NiR1yE4jv7+0Ai8dho3NdGcY8X2nW/lzOdLWgbXLDIKk01oeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ZE7v0wRn; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=pddUqOzi; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cfS1N5BgLz9v6B;
	Sun,  5 Oct 2025 05:04:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1759633480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=67x1CIHhavqrzJj/Vqki0DrNDwBF1J99M2pAhmdmqV0=;
	b=ZE7v0wRn8yq67u2zM2k+rEYHxjmj5/3QnEauWzjjEstcPzw7oICV5S347QjIvntQgmQKdW
	Cpk7SwhPLehLsrPmZv5Ic55hJ5tHIAl19IWZ0kBgsmqrmYXq+IK2JUqLm8pidgJFM7LiTA
	LWdk7PNStBz7BUPqqttdmbt2i9ZieUd9ifMyjNhx8h7+C1uH6/jRpAHyFz0LWd/QU2dn4s
	riGmQO/v8fZ6c3IDNcm3khYQJDLbQdCKwEL/QQ2PscH/UUK+e0Az4ZBqTC4+zHGMBcJ+vN
	0t+JYGStikB6sFoXTRORlzdfQhNLF2rbjuW9E5pTCm3e/jv5L8aP/yesquZcMQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=pddUqOzi;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1759633478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=67x1CIHhavqrzJj/Vqki0DrNDwBF1J99M2pAhmdmqV0=;
	b=pddUqOziflBPmoQ57KCxyfPUKUMGVl+rMojnCGzDfKFAHQCjaQnZchUMHjym4AZEWAF2rN
	tCzC9xsO4w2WXjXgiiUhS1TI2r3EKf33sCwQvyaw6jkMPgbOGQo14/+N+2/N29hJXW9HUy
	iFB8AQShP/NFZ2asUtz2SfeBbumoWLukOXwJaXfoihBB8onLZGMnqOhpSIVtVUmZ1b9UF8
	2WZeKkvZRJXNIqMMSXEiX8F5h+MGydyxTL56hSVgH0uo3IIVK+K/tvAJdWmpdVG5tqLAoJ
	oaIeS43KzAf67KVhtO4WkpEqNDtj0yghsvLPSxMvovcNCYeoLtd+gJvbccMLQw==
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
Subject: [PATCH v3 07/11] drm/rcar-du: dsi: Clean up TXVMPSPHSETR DT macros
Date: Sun,  5 Oct 2025 05:02:54 +0200
Message-ID: <20251005030355.202242-8-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251005030355.202242-1-marek.vasut+renesas@mailbox.org>
References: <20251005030355.202242-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 2055f914e60bfd01c71
X-MBO-RS-META: 98jmib3fhri3m5memsugufe5ntdedu4q
X-Rspamd-Queue-Id: 4cfS1N5BgLz9v6B

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
V3: No change
---
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
index 7f74d597f4542..f0f4c78bf47c0 100644
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



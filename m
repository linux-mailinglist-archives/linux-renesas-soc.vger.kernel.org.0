Return-Path: <linux-renesas-soc+bounces-18141-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 442BFAD6400
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 01:49:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B2E8189268F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jun 2025 23:49:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5737F1EE7BE;
	Wed, 11 Jun 2025 23:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="rvGeDmRj";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="oE8eFusl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3975820EB
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Jun 2025 23:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749685779; cv=none; b=r/WmZ4jGtCrVanbpztU1ydmoHUKipGfj42MibAmg1XUj4LRdXHB4FwqfFZIGQ0ce4GGUcXSqxzF3gbmtZBDOzJd/tafdsuQyGCgxxG1DKvYkETcSI5JbYL0RyJnG0LcfTqYSFBEKDcLpPZeO2S4m/TTbt2SOV5cgQdxNW8e4nik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749685779; c=relaxed/simple;
	bh=XtSKtmZw/XDyoQptryCXjMIMVt006C/da/b0x+3pB90=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rQHhsv2QbLrydJL7oibxBDE7knYu1nSEWSlxsEamNFoMhRkT0IpeMVee42Lmvpj2OqY0hSar7Qm1pbU5QgXQ65bPHaSksWNoTC+nm8hFSHYegZNQUpLvFPFo6JrzpfgQLRDka8kRxJEWQj/FIX3lR0Ir9lx9HCMj1hihzNNKPgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=rvGeDmRj; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=oE8eFusl; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4bHj7F02x1z9thZ;
	Thu, 12 Jun 2025 01:49:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1749685769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gal4hXabFurfA9QGeEXIKzO4wZ6zbjpSU652c76bN8g=;
	b=rvGeDmRjPLP92DzzWR2xRKoaLoYF1YuDm5IPB9CS4rLgyz9YzsUfIjc1iIk3zH2hCIIxj5
	C1N0vLEUnFam35WsEySY1KFi0qc+Dae468g4nI1OaA9eJbuRuk9kKUEvRbB0lahrnaxMWW
	O2TsJcCmdAmR5qdqEqq0gvvU0PlxGh67KSgpePxm6aWBmBlDfnfkcMbts9b20N/BU5ApLV
	62BzeAuel5KzT0PFWX6AKh9weEBFIIlUHSbAfCYhfDtAyecOs/ZoRKfLBSCs870KWMbhkm
	thd7wfvX/5cno3WhVZwNBwelXIzgNVi3csZS0dhC0xKw2D9TfkVH3heXNeg8TQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1749685767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gal4hXabFurfA9QGeEXIKzO4wZ6zbjpSU652c76bN8g=;
	b=oE8eFuslJkbVukzvUK4II+FelmU2AFX+vtDbd+9qdIfT7nExfRsigOpbu6n1bVexuodlNh
	GGMH+6jp3ITKu5qkV2SDUEew2TfSgtQqwaCBZ1UEIyQUlnOzSyppMChV2ymlJn80YmnKmD
	m1xgeRpDxULW7t1OO+oGapnlsn8gnUijZheFHxQNj3BBvx+1yNU+mK3sBjcXVSRuaXOjwj
	2oXgCRj3mmi8xI85YChVY8FCelKhyq3wSTFV42gf1PAgNUE/15v+1Q52iq2iffGTRrWeKl
	A7h0G3rXUIsWf6esMW4PW6C+ZDMFRbIV5vi7gEGBAPhuT1RIFJ2iJUUG2djTGg==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	David Airlie <airlied@gmail.com>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] drm/panel: ilitek-ili9881c: Use u8 for lane count
Date: Thu, 12 Jun 2025 01:49:01 +0200
Message-ID: <20250611234913.161861-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: krmt9hucpdm55z3fm6ypp5963sxt7dyt
X-MBO-RS-ID: 1f6924fa28fca0224f8

Use u8 to hold lane count in struct ili9881c_desc {} to avoid
alignment gap between default_address_mode and lanes members.
The ili9881c controller can only operate up to 4 DSI lanes, so
there is no chance this value can ever be larger than 4. No
functional change.

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: David Airlie <airlied@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
index ac433345a179..84927302957a 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
@@ -43,7 +43,7 @@ struct ili9881c_desc {
 	const struct drm_display_mode *mode;
 	const unsigned long mode_flags;
 	u8 default_address_mode;
-	unsigned int lanes;
+	u8 lanes;
 };
 
 struct ili9881c {
-- 
2.47.2



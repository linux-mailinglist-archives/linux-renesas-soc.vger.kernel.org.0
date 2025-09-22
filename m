Return-Path: <linux-renesas-soc+bounces-22176-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA4FB92AF5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 20:58:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E86543B8F58
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 18:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EC6431A54A;
	Mon, 22 Sep 2025 18:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="rl/E4Fec";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="gEgV47wt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81C82D94A2
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 18:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758567505; cv=none; b=H+9Xx1KBROqTmDQbXHBDJBdze9lKkaUtyGsZxJQVl1yAswT50VCAWK7GASJAtgzvmiiM2h/HAjWFSKd5fl5pjLmhMctQyh1ir+qsjbATA3hPPIMNiYflbNe1vB/rGGlnb6E68KBvWTcetsEdCTG3heW+ucWju6C0/bQpg1F4f4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758567505; c=relaxed/simple;
	bh=MJRMLV+Djd3PFEqLMVXlfTflwkh4QeNyQ/Al8H+98Uw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P0KVFoTr7/4tVXYHKO+wY9JxlbZuSBhXvJMKCIdEE1nLRyPIxv5e5hxaxILLVhIZy/PNMeobY+LigmgbkP1YdfYbh50tR8ZqMuhwyG7N2yFMSiKV8S3bd8adN5XOv7M/wM4THyiIEuAGT67+3N5V4IHqDJo+KcYzJ10mpHviE3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=rl/E4Fec; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=gEgV47wt; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cVsng0t9Dz9scD;
	Mon, 22 Sep 2025 20:58:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758567495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Hcu5k5ai10lzphumbKNHNQxaBPSc+Si1GFipX97Y+TI=;
	b=rl/E4FecMc5RmdbqrGfBlydRlahqKrel3hij38nP8/v8kHARJBF0I9B/pvw/HvCodkD7q0
	mtU8MBvvf4NyXtztMREN9G8dSKaQX/udb3a3Uqj39NDg2OqQLlBsJj1DE+Dwu1/y1u4Pp/
	iTPb791Bnoyi/1L/wXe9fVY/AdoPR2duREHS2G6wd65d1q44Oot1u1w8rNk9kZTsskfP2f
	HN4NAKjSF3tgE1OlD4Bs0S/CTglozONCW8Roas0PkmxYnP6zBLkri0pedzFg5dHQ2oyBUW
	FVK7ujXva7L4EP9mxy1X9/1T/OdFieg3w5VRBf3rWmoFqJjJSwpoPXl7jIwWIQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758567493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Hcu5k5ai10lzphumbKNHNQxaBPSc+Si1GFipX97Y+TI=;
	b=gEgV47wtKqPFiVL18vOSp83PIrx6k2RgvxU9rpBUcSVi2+v1nA0cq0AZO+OErbSF7Ey02Y
	bM/Gvm2aKCWJWOPVFDVle439w+1TnsWFxiodFNdUuDDnsL+ZLg+Ixu/qLDvUeqWncmMJWf
	AgeqMQyPMEF1LO7AXfbKxcldXM5Fsol4itBZiGfAKQQAMEw+E6ltZ/cuhivYPUsMWavh11
	ukd+g0/xr3OZKt0jC2+DYaLaAk+R0JbM93ad36OqZFnLnQkUea0ZL35nW+x2HP85oI7+se
	8Od0piSu47UAsIOG7DY4Lygt4DX0/Z/SOYQrkViy2CDxmWP8O9yMrgsi5GBmDA==
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
Subject: [PATCH 0/9] drm/rcar-du: dsi: Convert register bits to BIT()/GENMASK() macros
Date: Mon, 22 Sep 2025 20:54:56 +0200
Message-ID: <20250922185740.153759-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 9b07ed5262dbc42a4cd
X-MBO-RS-META: bnm9bqd3z9fttiyzsymdm4eq8p6sya9e

Convert register bits to BIT() macro and bitfields to GENMASK()/FIELD_PREP() macros.
Most of this patchset is boring mechanical conversion.

Noteworthy patches are 6 and 7 , those introduce handling of DSI mode flags
and convert use of DRM_MODE_FLAG_P.SYNC into DRM_MODE_FLAG_N.SYNC, but that
should not have any adverse effect on existing hardware.

Marek Vasut (9):
  drm/rcar-du: dsi: Fix missing parameter in RXSETR_...EN macros
  drm/rcar-du: dsi: Deduplicate mipi_dsi_pixel_format_to_bpp() usage
  drm/rcar-du: dsi: Clean up VCLKSET register macros
  drm/rcar-du: dsi: Clean up CLOCKSET1 CLKINSEL macros
  drm/rcar-du: dsi: Clean up TXVMPSPHSETR DT macros
  drm/rcar-du: dsi: Respect DSI mode flags
  drm/rcar-du: dsi: Clean up handling of DRM mode flags
  drm/rcar-du: dsi: Convert register bits to BIT() macro
  drm/rcar-du: dsi: Convert register bitfields to GENMASK() macro

 .../gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c   | 101 +++--
 .../drm/renesas/rcar-du/rcar_mipi_dsi_regs.h  | 362 +++++++++---------
 2 files changed, 237 insertions(+), 226 deletions(-)

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

-- 
2.51.0



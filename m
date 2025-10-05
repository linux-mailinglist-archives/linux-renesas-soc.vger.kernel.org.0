Return-Path: <linux-renesas-soc+bounces-22642-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A21BB9390
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 05 Oct 2025 05:04:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BF53A4E05F8
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  5 Oct 2025 03:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A368A189B84;
	Sun,  5 Oct 2025 03:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="gH65xBKn";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="yVd5azXF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2045DCA4B
	for <linux-renesas-soc@vger.kernel.org>; Sun,  5 Oct 2025 03:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759633467; cv=none; b=nAqTj79gApocUaGJikaI1Tark8ZAe2LNvLSctNv714qC3GfcjsEeZYuksxNnQcN5Vg0Hbd+PSLenPXC2WNU8L0YugF65zWbj9LvPRx4Xh5xPJp/96Cd9WMHu+chjADkcpuwLZZEaboKXs2YCwnCoKR1Y/A331eQxOBMGqaLgvGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759633467; c=relaxed/simple;
	bh=HXvjoqH053Pv5ITmLi6wQvFEe9r6lploZ+hxLh+w1gg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lyISew2qvBl3fvCy4+gN+Sb58fJ9FHVGj6q5xcxvv1/J7mi3KC2aGgnvWdXAZRTRLnSp2/2C5rYAa4q4kcvGuSJ3odx2D0ziwiRfo+A+kMjV0ApBQ1ZN4/Qj1VpJ9sHs7ee9gDr5tuifOrJBbapYH7GF1mJVhc/XtDsDtBbpIno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=gH65xBKn; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=yVd5azXF; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cfS124qxpz9svm;
	Sun,  5 Oct 2025 05:04:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1759633462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MnqZ7gdNGXjD0CLqH5Zyd8pfzI37ICi49VhUV/Gv0Wk=;
	b=gH65xBKnOKmSuM11Se2os1i7dSx1mK9x2Yrwlvno9RDgV5JfLXVnXhFEv4Igqu6EKPjRTN
	r4pTj6BO00/N2zn1bvwP1rvCd1jrP8IZhbcTYOIm5+PUYIaw/MhbaRvy5HZ0aiYZ6oBgOE
	WiCu3f8kYRqZY+7TtY7Z6ZW5VEJzzQrVpfA7eMQuyj2yUR4+uxN3ovJD64wWL/cNw5QudC
	e51jw6GtkdaGE6MzsQYKJ+N+pZvDGtc0rMvZ0H3OqBVSli5zvgH1I3D7YLmANqRuZosjJG
	qzMwsvEHs+ZPspghmhUijZcTe6AqNp62N1BMloWY6q/siLLtdpwMC4SLxhWtMQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1759633460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MnqZ7gdNGXjD0CLqH5Zyd8pfzI37ICi49VhUV/Gv0Wk=;
	b=yVd5azXFBEQ+zyHf3ymCLch4nVwmkFSc+4RGSdbkr2mEPfpOOhXGm0PFiVRSNBeJsaQnFa
	qNQqP8T3y0cWfnUnkKdLCKNdQncw64Rc47h6K2KI06+/L9IQYalqgPbh741zxl8iYRLFX+
	x7dJRhbNuMwppTkNooodRWw5hypBoZJ03IsOJo5zpLh3XAGIe4rb75K4XIxWHC4Kzvs/E/
	XWTsIrx3Th+zvko+8A2wSlgCAKusu97nGqThLYXZo+FyFF8r0ZgpiepTWpmwHc3VpNLAKb
	qw85GnUntLb3sQphBc+DrHlPZQN63yr8sbhNz82dSaihdRf+t6hyhf9//LhFLg==
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
Subject: [PATCH v3 00/11] drm/rcar-du: dsi: Convert register bits to BIT()/GENMASK() macros
Date: Sun,  5 Oct 2025 05:02:47 +0200
Message-ID: <20251005030355.202242-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ktqnpc1ub98ipe4xirfje8f79b4fqnmf
X-MBO-RS-ID: b5cc5bb6c2042bb8f9d

Convert register bits to BIT() macro and bitfields to GENMASK()/FIELD_PREP() macros.
Most of this patchset is boring mechanical conversion.

Noteworthy patches are 6 and 7 , those introduce handling of DSI mode flags
and convert use of DRM_MODE_FLAG_P.SYNC into DRM_MODE_FLAG_N.SYNC, but that
should not have any adverse effect on existing hardware.

Marek Vasut (11):
  drm/rcar-du: dsi: Fix missing parameter in RXSETR_...EN macros
  drm/rcar-du: dsi: Document TXVMSETR PIXWDTH as bitfield
  drm/rcar-du: dsi: Document PHTR TESTDOUT as bitfield
  drm/rcar-du: dsi: Deduplicate mipi_dsi_pixel_format_to_bpp() usage
  drm/rcar-du: dsi: Clean up VCLKSET register macros
  drm/rcar-du: dsi: Clean up CLOCKSET1 CLKINSEL macros
  drm/rcar-du: dsi: Clean up TXVMPSPHSETR DT macros
  drm/rcar-du: dsi: Respect DSI mode flags
  drm/rcar-du: dsi: Clean up handling of DRM mode flags
  drm/rcar-du: dsi: Convert register bits to BIT() macro
  drm/rcar-du: dsi: Convert register bitfields to GENMASK() macro

 .../gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c   |  50 ++-
 .../drm/renesas/rcar-du/rcar_mipi_dsi_regs.h  | 387 +++++++++---------
 2 files changed, 237 insertions(+), 200 deletions(-)

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



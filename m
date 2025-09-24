Return-Path: <linux-renesas-soc+bounces-22254-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E030FB97E12
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 02:30:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7FD6188F1AF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 00:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E354F18B0A;
	Wed, 24 Sep 2025 00:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="H9ocnDvO";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="L/vv/1gj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECC02AD00
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 00:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758673828; cv=none; b=oS/q49wXoKvbYP7MwpCRp3FsYIcQZktC4AE18fdCl27uPcIHm+GiEI/D70MUCbYobWAS7wRCf7hmOsqFnfRJJswGjSKgWe+DU7lgmaRRrtZsTt4WDj3h8o9SkS4XUd1xRC6D6gD8WQ6uIs/2PDCCzJZoSmB5YLF5UOs1QkNIbX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758673828; c=relaxed/simple;
	bh=IHFc0y6DSuSsUbZEXE2xLcXXglqXMvDUXh/lPthsn8k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G30ov9QKO/KxOWqKhttL2/TdRhgI5s0bvCqc12vp2w7Bxbu9F1qkT/0ucZX316W5Bl+byKM5beMGFPyQ8NBGSIsY8Pm9DRzxLx8Ov5oax0sNjdBC2QBakdEK/hFpSiL7qX9/dnXge3dzWUcxaMgYQJflm1x9Orrc84DPXN0hwWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=H9ocnDvO; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=L/vv/1gj; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cWd6T1SPQz9v4j;
	Wed, 24 Sep 2025 02:30:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758673825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=X6VxG/kJ43ATyVWbxbsgmf3xhmgUEuW7w9KwzYA3zdk=;
	b=H9ocnDvOdoerxNMdY8KDJI8LsFlYFjH6r3T7EgrOtQTrITXI+ZWV21o+AdUHXckHShe/7b
	ZTXzCVWlZI6jAeMSQUNWxhQCAf0X8yGF8FLwXwoh/oi/V1FPQPEGz0UGJEXsyqN7EsXwdA
	/t1AbShYsghArA3uXKl5H5MISyeVRbCCKdnGNRtdS6RFerAOldspqeL40kHj6qWtuwZRoT
	JvJeTSXWermPbgL5ieJpxBZ+ExAU8wIZx2van9JJ4lLTFODmspKQ7o7UjRzmRiuWNG9eGI
	3eL0sHax5MrVlBKNExXK/6s8JSMBXhXuV4Fy5KyoVyPo/4/5td3UM2RVMt7FSA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="L/vv/1gj";
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758673823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=X6VxG/kJ43ATyVWbxbsgmf3xhmgUEuW7w9KwzYA3zdk=;
	b=L/vv/1gjBbXehz9ge9t0lFWAkH1yBZ9BbGlHLq8hSsNO53BsB34oCkIpnQKTx94T9jp2Wr
	oAvq5wPJeUtfEHKfxo5CBzA9Dk5f9UYueURVBumnj0Te2b5H1caaelcrQ26bz1npszygPG
	B3+knJxZrpCpmQVVCrFvZPFiN4t+icCO8Rlln2Rt+Tq2OtyjI8R/WJAI7ANkryz7Faum5l
	ZeAdKNcMhVspITF8rhz90o9mzgi3PUwlKk0nEuJ+EO6xV66JuAOg1LIDypqwwRq/ZJwd/3
	optwbW6nE7prOFY6wdvgUdDQVsKESgJa1HtRKGm6SLjG0BzoQwE5SGiNEKD2gg==
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
Subject: [PATCH v2 00/10] drm/rcar-du: dsi: Convert register bits to BIT()/GENMASK() macros
Date: Wed, 24 Sep 2025 02:28:17 +0200
Message-ID: <20250924003003.91039-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 64c41aa1d380a547297
X-MBO-RS-META: g1nrycrnqoy4jb6crd4e73fpmwnm6c6c
X-Rspamd-Queue-Id: 4cWd6T1SPQz9v4j

Convert register bits to BIT() macro and bitfields to GENMASK()/FIELD_PREP() macros.
Most of this patchset is boring mechanical conversion.

Noteworthy patches are 6 and 7 , those introduce handling of DSI mode flags
and convert use of DRM_MODE_FLAG_P.SYNC into DRM_MODE_FLAG_N.SYNC, but that
should not have any adverse effect on existing hardware.

Marek Vasut (10):
  drm/rcar-du: dsi: Fix missing parameter in RXSETR_...EN macros
  drm/rcar-du: dsi: Document TXVMSETR PIXWDTH as bitfield
  drm/rcar-du: dsi: Deduplicate mipi_dsi_pixel_format_to_bpp() usage
  drm/rcar-du: dsi: Clean up VCLKSET register macros
  drm/rcar-du: dsi: Clean up CLOCKSET1 CLKINSEL macros
  drm/rcar-du: dsi: Clean up TXVMPSPHSETR DT macros
  drm/rcar-du: dsi: Respect DSI mode flags
  drm/rcar-du: dsi: Clean up handling of DRM mode flags
  drm/rcar-du: dsi: Convert register bits to BIT() macro
  drm/rcar-du: dsi: Convert register bitfields to GENMASK() macro

 .../gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c   |  89 +++--
 .../drm/renesas/rcar-du/rcar_mipi_dsi_regs.h  | 363 +++++++++---------
 2 files changed, 232 insertions(+), 220 deletions(-)

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



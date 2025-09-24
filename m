Return-Path: <linux-renesas-soc+bounces-22256-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1662AB97E1B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 02:30:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D32AF16A84E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 00:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BA492AD00;
	Wed, 24 Sep 2025 00:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Rh48T4zG";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="FAboYhBg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B793175BF
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 00:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758673834; cv=none; b=a2UGitpPhHmuXZijQh9HTFPMI1WUQaj2RcabcYfaAOJFX+hdpwlrgV/zMIDvTYM9kvwMwNjg6dIPyc+aOw4EWWrOTt3a3VSjw3gxbA8xrhhH+qVWKkD9sLHBlkvIWtzVU0mngh5jGwwbdolQkNPDddwBRKhFmf+iAhOZzTIJs70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758673834; c=relaxed/simple;
	bh=UZSCu/Tuq/e1LfBAtbNunEjgwXwl/ZLhDj8oCame/ZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cp/e3xkMwR9eJPIHfCLjkou7p6sxG+oLxay+FEvXdiTE6XQ1vcK3AYUYbiHjpR80dpGp4/GhkdZg2j8Yf6ZXHeA7iyMbskO4qSwVlBowywJFYtDa3kHqDSxaNUn5/s35qVW1PAKOrR3mVJMumPFFTJJ5WRbJbcat4/Wf8I70VTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Rh48T4zG; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=FAboYhBg; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cWd6Y4dPmz9v4j;
	Wed, 24 Sep 2025 02:30:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758673829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JmVFN47DwARmnLYvZ+rKM/tY4O4wE0Hv5VPnyYTDKpI=;
	b=Rh48T4zG7GEtv9AIxQgsO3yxn4Irf8M72MdgounWcNJ1Vz3Px+LUg62jJOkWHxk0FnyRfw
	hg4P5R+GTbmARG9BGv0cPIx4rLl26Ts891FkG5TxrcaGzJh+o5Mv8q0nfXhd+KmoF5eo5v
	/6/PzhWfUdRnRFKv/glQffNGDB4NtuHNLE81keknb1TiFsIC2TvzgWmYZqbY0KULSBf/NV
	tUi/1WmICP8Q510tC1B1zKAH3dXs6gtoZzf+LBEgBpgIlQgWSAIVP8q/c2YPP9GmbmkxH9
	T6DW8KWfh2UDgktsEcbiXwf8kfbuPPy46M3jxfCTt9e0y5PCzxHGWY9Sw6v0LQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=FAboYhBg;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758673827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JmVFN47DwARmnLYvZ+rKM/tY4O4wE0Hv5VPnyYTDKpI=;
	b=FAboYhBgZla2XalNk8MjUKShmPY+izQnwlWBGZEVIbNRs4cGDo9O/yZxxPB6PxK8060OKQ
	U2yf1tXXwl9aG2NWmrfFEndr5BM4JG2QS+Yt4FRJFOhOpufqm42k75KyXavRQEFWFKMuGr
	n8lqwDuT+frdgSTdI8wpB+xkvKpOQ9GjtiodHUBuBsDNJm9QM8QCdr9yKzNg2irqzeK5u6
	kJQpvAlbvYojPZ4zKP+aqvLt4oDobqFSSXRuP+DMxms1LXUod+wbZT89GtDufcHq11D8ZG
	laEaNah9A5D0eyccbnVfd4ALacDEQ6n6mwUALfnWGN32pQ8u5ahoo15QEDI0bg==
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
Subject: [PATCH v2 02/10] drm/rcar-du: dsi: Document TXVMSETR PIXWDTH as bitfield
Date: Wed, 24 Sep 2025 02:28:19 +0200
Message-ID: <20250924003003.91039-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250924003003.91039-1-marek.vasut+renesas@mailbox.org>
References: <20250924003003.91039-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: dd16d6306ea9359dfa7
X-MBO-RS-META: d687hpkiozo663xc3tws8p8kofwe5ney
X-Rspamd-Queue-Id: 4cWd6Y4dPmz9v4j

The register TXVMSETR bitfield PIXWDTH is not a single bit, but a
bitfield. Add a MASK macro and document that the only allowed value
that can ever be written into the bitfield is the current value, 1.
No functional change.

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
V2: New patch
---
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
index dd871e17dcf53..b8a719a13c006 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
@@ -143,7 +143,8 @@
 #define TXVMSETR_SYNSEQ_PULSES		(0 << 16)
 #define TXVMSETR_SYNSEQ_EVENTS		(1 << 16)
 #define TXVMSETR_VSTPM			(1 << 15)
-#define TXVMSETR_PIXWDTH		(1 << 8)
+#define TXVMSETR_PIXWDTH_MASK		(7 << 8)
+#define TXVMSETR_PIXWDTH		(1 << 8) /* Only allowed value */
 #define TXVMSETR_VSEN_EN		(1 << 4)
 #define TXVMSETR_VSEN_DIS		(0 << 4)
 #define TXVMSETR_HFPBPEN_EN		(1 << 2)
-- 
2.51.0



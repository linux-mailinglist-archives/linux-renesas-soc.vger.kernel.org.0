Return-Path: <linux-renesas-soc+bounces-23815-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A8BC175A9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 00:30:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18AD71B28271
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 23:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 259CF2DE70C;
	Tue, 28 Oct 2025 23:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Xl1qIVJ1";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="qytnizTl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E367C2D5C74
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Oct 2025 23:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761694230; cv=none; b=dz5IsLR6xhG3mBXKONuFp7ZVP5YTiX3lRQlQrHEC1SAQUWexBdN2em4uLHPOVnjZCLcm4LIRrzapgmpLSa52baVnuFf8ddshxYaxQeSOZVX2GafQbc5oVzuBzrdYMuWnu2X5W/fzU3fmxmchP7kTL/k/BEaOi6E4GkbyR/6yHl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761694230; c=relaxed/simple;
	bh=JFRmpvqhec9H6th2Dac3jl787iyWLmAn1V/NyENeww8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xr7imm8APISJTOdVypA66SWFaPemZWQf6HVFQT3tVfeE1RU/59vidTCSxhbtA3BzT3C2dxiBUfX2SFbsaBauBkbcIyeUAylbyOBiAaQhgiNksFV4tP8PyeRs/8F9OSj92y475aQt2EeYiWWI5kCwqV2G6rSt92PGChxIMb4l/ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Xl1qIVJ1; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=qytnizTl; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cx6701X3jz9sc0;
	Wed, 29 Oct 2025 00:30:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761694220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HfVmQ90gNhRemdaHSje6xJRsgjJJP/0BOjtGq0HPL+8=;
	b=Xl1qIVJ16WKu57K4bVR3bJFBmqCzjdXpVwp2YatXX8aYxPL2Tr3vUS398z9YD+ucZEJvb8
	/zSfl1x+e8joVGwFn+54Qo+eLPvzpjTsUNbKyS+lkzMTLJIalazfYKmzoW5cVitdjidx0W
	bHR35NsWg2Qgnuod+T93a9TPd6zNTNy8sla9l3WuXDERMeakM/Wf7ucKG6uZUNnny5J3+V
	E54qpIk3LFzVoJRxS0UHtavYuBtjiMW+B4c51mWGuNVxIdYWvu/1R5W7HrpkP2FsVxbUUg
	12LRowM3HyauaTLCWp7IXucYG6cfQtxMKOEKNXTas0iv9p7UM06ml3WpU7P4Ug==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761694218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HfVmQ90gNhRemdaHSje6xJRsgjJJP/0BOjtGq0HPL+8=;
	b=qytnizTlJKo01oJj1w86GwS6WTuJQqZ+snXKXjCAZ+RY0TQuxHEZkzUs2HmHzGxH/OJjEV
	6rPmOtAW7eEkHdS405l5tbG5bcdWsfMnYMIHRuB/CGTxC8Y6N6RUSVvjuoFxeKuIc919zJ
	rGSRQWrBTwm6PFejkLzTEuUVpre3SzXW8RSPEpW8T6kEAOuBA+9Ft2w5wktSQ5C/eOy7+u
	+z9Ka+PYGY16TRi6aYk66Z+HIPgZ+obgVl2bikjcyJ5t1Wh7lIM/iJgd+aas4gCrxHOxf3
	q9NX0AVNwLM6u1hbVTNmErj+h2A6CuuwKSqFJqJxq7ffNQ+PK5TPsuthG5z9Xw==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	David Airlie <airlied@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 03/11] drm/rcar-du: dsi: Document PHTR TESTDOUT as bitfield
Date: Wed, 29 Oct 2025 00:28:13 +0100
Message-ID: <20251028232959.109936-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251028232959.109936-1-marek.vasut+renesas@mailbox.org>
References: <20251028232959.109936-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: bc8c91ec6f5fd814907
X-MBO-RS-META: xfzf4zrro6thwn57xabzejm4wrkjw4jq

The register PHTR bitfield TESTDOUT is not a single bit, but a
bitfield. Add a MASK macro and a _TEST bitfield value, which is
used by the driver to poll for completion. No functional change.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
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
V3: New patch
V4: Fix PHTW_TESTDOUT -> PHTR_TESTDOUT
    Add RB from Tomi
---
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c      | 4 ++--
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
index 5c73a513f678e..c24721a1eddf2 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
@@ -316,8 +316,8 @@ rcar_mipi_dsi_post_init_phtw_v4h(struct rcar_mipi_dsi *dsi,
 		WRITE_PHTW(0x01020100, 0x00000180);
 
 		ret = read_poll_timeout(rcar_mipi_dsi_read, status,
-					status & PHTR_TEST, 2000, 10000, false,
-					dsi, PHTR);
+					status & PHTR_TESTDOUT_TEST,
+					2000, 10000, false, dsi, PHTR);
 		if (ret < 0) {
 			dev_err(dsi->dev, "failed to test PHTR\n");
 			return ret;
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
index b8a719a13c006..62341416ac6e9 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
@@ -293,7 +293,8 @@
 #define PHTW_TESTDIN_CODE(x)		(((x) & 0xff) << 0)
 
 #define PHTR				0x1038
-#define PHTR_TEST			(1 << 16)
+#define PHTR_TESTDOUT			(0xff << 16)
+#define PHTR_TESTDOUT_TEST		(1 << 16)
 
 #define PHTC				0x103c
 #define PHTC_TESTCLR			(1 << 0)
-- 
2.51.0



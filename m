Return-Path: <linux-renesas-soc+bounces-23813-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F3180C175AA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 00:30:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 17F234E7E01
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 23:30:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D985306B00;
	Tue, 28 Oct 2025 23:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="eX7gB1kW";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="rx8IdQaJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C438F2D5C74
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Oct 2025 23:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761694227; cv=none; b=scaEs/Qfkjp2MTyZKEFA8nAc5LvULiSGD4Fyw+jAYR0bnuEmA+YxRPk+y6g8sw92AFx1LMyG4uvSgbcwMBH9NsLzTfOVRIIdbKyVVtPxfdAfOWbw0aDgwFRCqpvlkooREu7dDD2Du7ft8J+VPeauykY7jFDPO0dui5FcpXsdxoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761694227; c=relaxed/simple;
	bh=n0W/zsMBNcPPkbqEHwog+gKp2O47s3zO/wvMHzA3uVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jOvEPSEEGz8eFwh35YDylPmVJ6RyFAjTJVwmCGe0DLJr5lB/AaLBnKMl8EaUyuTCigPK6ikPnQWg8pYk4L1VgXy9n4yfdAHdMFnbIQFi6m+NDXXTeZTUYXThrNa2PAD5ePi5WIlpIA7hYjHziF6zGjsAFNVAFhZUQSj1GOC75aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=eX7gB1kW; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=rx8IdQaJ; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cx66x5lJ9z9v3Z;
	Wed, 29 Oct 2025 00:30:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761694217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YN/3NLfKNY/fRQpjIzaqTEQT1B3FCZiGzxEDgUBESXU=;
	b=eX7gB1kWHZpD15uYxFlVFTAswWUatQcrH/qXBGRGoW4WFapBhx9w/9Y0eqB0+cnBNwIkz1
	zl0Wip9Wcc9s+JmBKUB3voLIKcFMO8aj7+cOUeT4MF3W41hl35x4FwvPiBXNzcMUPJwrYY
	QeUFzIk2EOVwMoxcHegJL2HNS/e188uvovmPpiWM5aTRUPZvon6NdFwcqvvGQP9oU9jm7w
	vVi1GfcASwXLvxNQ8DVB+dCM9rXU9vl6oQTObpeAtwqCJ3zwnckFf3hyIklgyrxdotx5F5
	BVqnQM3UVnohGV05oIdJHnYp5VxqdeNf9ikdP9aYx6+qPF4yPFU7QU1zUyb9Ng==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761694215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YN/3NLfKNY/fRQpjIzaqTEQT1B3FCZiGzxEDgUBESXU=;
	b=rx8IdQaJVnwQxYJ6Pir1OV8bw2Er39HokXsBNXbRONLEaJ03/3mu8+x6xItnhZ1fCk9SRF
	zqtNNxoAvyWJnOxl2l2V44ERQ3o8tiVc8aUwdXJIC9jmFXL2rYF2Bc7L1pmv3hKv4Wt/qU
	YP5dIuGhNv90WLBG125CNs4Fsh8kGyouG5EgD9MSuiR1xypFIplPva+EEfngTjPzc2YTNC
	2hmNTZEOh3N8Zj9H8U1GRcY08NsEhFxqMBVYxuidA09qSuB9dYWp5mQQY7HOGh+0enqbUA
	vtpdgh2h7ksEhVo0rSTKRMl4OZsnwTZYL5X/rRplADrtPT8cz2CZo4fjJs3pEg==
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
Subject: [PATCH v4 02/11] drm/rcar-du: dsi: Document TXVMSETR PIXWDTH as bitfield
Date: Wed, 29 Oct 2025 00:28:12 +0100
Message-ID: <20251028232959.109936-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251028232959.109936-1-marek.vasut+renesas@mailbox.org>
References: <20251028232959.109936-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: c3f1c8733010aa4548f
X-MBO-RS-META: fxifkp3x6q4nqxhypx4qriwq38rrut74

The register TXVMSETR bitfield PIXWDTH is not a single bit, but a
bitfield. Add a MASK macro and document that the only allowed value
that can ever be written into the bitfield is the current value, 1.
No functional change.

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
V2: New patch
V3: No change
V4: Add RB from Tomi
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



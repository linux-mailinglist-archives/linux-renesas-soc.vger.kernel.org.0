Return-Path: <linux-renesas-soc+bounces-23811-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B88D3C175A3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 00:30:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 94B184E229C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 23:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E4242D879F;
	Tue, 28 Oct 2025 23:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="HwYQN4J/";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="m4rSyYMH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C8B216E24
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Oct 2025 23:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761694225; cv=none; b=axuL6wAzDrq0Eop29SNilldDS5twOy4WKHVWDi7wAGPyt0zgKjh9yFEZXzZqSDKuO6Ua/u8ddoK27Y8fGeEFYKSO5auZHsb24FoBYyaPnuduMMcYw4TEiDstLXv3qjTTIeN+m0TA2HWKoddTtPIQ7/18JVLShPxy6093wQimo3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761694225; c=relaxed/simple;
	bh=P0S9L30n5Qh27Der5rV3DT0IWDC0wONJzbMzn4Gv22I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KHDxCrjqDwi8BEjm6mymiH1+ScVFzRV9qC4aq8Bx/HWOjK80z98Idnjl8MS+mBX7WIYBefuhr3QjUjWSOgA9/UEfn0kmGg+W46jP1/uExoMLII7+1RWxrKJrhzhHRgDJcDvOklgL9a9Vq07yT3xYYpLO1lSUZ7efNllS/SLAjk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=HwYQN4J/; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=m4rSyYMH; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cx66v1fVwz9tQr;
	Wed, 29 Oct 2025 00:30:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761694215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mAbwK7Q2HinPATBiXxg8SGPb+FOJdhY/KzzDIEF4H94=;
	b=HwYQN4J/EfPi4mk6WKzFVpQO7eCVLE9MFYKFMg/iT/oEydXgC+rmwx2TXH7cgY4g5E4XKN
	Jh2W4bfA0VdJOjsUvZjhzIVRAWyxDL1K9/LbF25wwaTtdHNB/z4Rj9YPnuQrke004zN5Bf
	Vnn9l3xUTlGObaXYT4PGKxjoA+AzVD2LtxGfrRon11q7HH1KOurAk3rL5ZZR+7CMjNg7U5
	59zDD5oPTV8Q7Ywk4lFdkerOLflWfAOWbeXR2hEiATJZ82FJa5S5WWzNYUxSdQZVLFUGXO
	F5PZqwoHd+sKk3liGSYT1GziGLh1M/bIjB0VYTRxkduhWeO442+2XFTjPwKfXw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=m4rSyYMH;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761694213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mAbwK7Q2HinPATBiXxg8SGPb+FOJdhY/KzzDIEF4H94=;
	b=m4rSyYMHusHLdmWi+HQTp+gak4oVZ5q1aPKIVOXrVRMM1TN/HOhGau0px2z6sTlCoI3PQO
	o9WD7lcAVlXkR2Oe2ccq54BLGH4XebBwqm+P7sQ6wbxNf4RqN4hHMn4bgdyBJ5mA0dfr6z
	U+iHOkmL9121JzoUswmQL+mZzErduzk/Idg3hIMuCz5a3AAm+DPntH3IcLXsCNEK5/llNs
	npQhTW8q9pR0dCh/0S0BWeGmt90VuhA7MVdDeGly/B+GgRWfLmSXQGzXmzIKdPQLs29VK2
	kN466wv7LAGvXbU5K5pWHVfe7tghs0V0rL3uEOOLVxq207mTf4jzFzPIEhg2Jw==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	David Airlie <airlied@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 01/11] drm/rcar-du: dsi: Fix missing parameter in RXSETR_...EN macros
Date: Wed, 29 Oct 2025 00:28:11 +0100
Message-ID: <20251028232959.109936-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251028232959.109936-1-marek.vasut+renesas@mailbox.org>
References: <20251028232959.109936-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 6s5abxewwyb8to7h31pnjxpp9h1yime6
X-MBO-RS-ID: 0c87285623d8c4a7625
X-Rspamd-Queue-Id: 4cx66v1fVwz9tQr

The RXSETR_CRCEN(n) and RXSETR_ECCEN(n) macros both take parameter (n),
add the missing macro parameter. Neither of those macros is used by the
driver, so for now the bug is harmless.

Fixes: 685e8dae19df ("drm/rcar-du: dsi: Implement DSI command support")
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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
V2: Add RB from Laurent
V3: No change
V4: Add RB from Tomi
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



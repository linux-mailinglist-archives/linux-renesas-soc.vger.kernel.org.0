Return-Path: <linux-renesas-soc+bounces-22652-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED81BB93CF
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 05 Oct 2025 05:14:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62C8518968BD
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  5 Oct 2025 03:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6076D1991C9;
	Sun,  5 Oct 2025 03:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="g2EQqQZN";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="PIn7AHXg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A7E34BA3E
	for <linux-renesas-soc@vger.kernel.org>; Sun,  5 Oct 2025 03:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759634071; cv=none; b=GqduEpfkOnRqYyF8NFN3Zkqiq2rKDg3OFi2nM3BbFtO+72dkwKCJIyoKsDVfKnY57568DiIySXHvHZ1zqxhI7HguZi82J4hJOGMQUrVFVULvc2o2P+fjzvtGA/HHYTHueNc/JCipk7FYrOqNFeBZnWWuzHa9zkkDIIAuqfV73LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759634071; c=relaxed/simple;
	bh=Vi0uLJd8u7/lr0JcSbHWChGBrTyUqbBRZp8x+YLBtxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CBSrQwzBmbn7nAygMGAspczqNEcRXTfZEW4KcNk4oUm6KwPYXZJeawaC5T/7nk2fRgU8cXD7PKALjmEyhKIL65VoZQFSWeEenXDd7hS/U5CSuhbcCNv479lfHZpvt0SVELdvPp5eELIy6KpUKs7JdZrAmCEPDiCFohV9+PW40tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=g2EQqQZN; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=PIn7AHXg; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cfS1L16Tmz9v69;
	Sun,  5 Oct 2025 05:04:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1759633478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O/6HP2LMj8JCAqJOVED8UCY8qVCk/4Lg+7VAMfO1+zY=;
	b=g2EQqQZNha4pPK84mzxTIdoaHij5J7JMwX22Jnw6a/Lzei5N78jcSv+4Gux1N3ph17+9Mt
	drZJ2EnhcgExgXIFuH8TORYDbf1CVMB6pykVqfin9Fq+ABFkiCcyovH4AXYWKmj6S0M1G5
	xuLcJWUzutMkdV3y/MjcnvfLCl0e6sy8Z9hAl4iMinulvCVIurrVSwipXqTj+tJDbGwIbj
	WaJ9rTblliRbgts1HVf6bmlercfz32l29rd16pc7RmBVp7Qd2JI0/kjk4LUG1Couxho7r7
	J1HT/y6o9LGh9dwPvfoCT2dPe5F5n1p1vRe+B3NtPcTJ8zIceqPbtb6RbPFWFQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1759633476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O/6HP2LMj8JCAqJOVED8UCY8qVCk/4Lg+7VAMfO1+zY=;
	b=PIn7AHXgtMVJWkZAWbuh7bJxq+I4TifFZ/JflkkCp7hZXzSJn2A0o9iCVSrLDFnrO3sRRH
	k1QEP/FsUKiMtCr1jkXwt2pa0H5SVW886fxB6Q90vrPh46zZhfkibvFUJxHHaTQbRoObNV
	K5XJdHMYomHpJy068b7+74XzfMqaEgCRD44+oijbOe7I6aBjx/cVPW9DUfFoEHdYkWZu/7
	bQ/w4YVf/deQ8LFn///Q19+fjQkEpTLywc3fBPyupsEHage44HDs46R6yFPc66ilRSWuOf
	dChK/k3WTzAm8bPKkScNYHwm6RosegVJ0mv28hrrpz1/riwepJT6KrMnOtMr+g==
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
Subject: [PATCH v3 06/11] drm/rcar-du: dsi: Clean up CLOCKSET1 CLKINSEL macros
Date: Sun,  5 Oct 2025 05:02:53 +0200
Message-ID: <20251005030355.202242-7-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251005030355.202242-1-marek.vasut+renesas@mailbox.org>
References: <20251005030355.202242-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: bf64a829cd71ee82fb0
X-MBO-RS-META: cib8fk77dg7sxabpiqn9nsgyfx911its

Introduce CLOCKSET1_CLKINSEL_MASK macro and remove bitshift from
values to make this bitfield usable with FIELD_PREP(). There are
no users of this bitfield, hence no updates to the DSI driver.

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
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
index 468f84cd1325e..7f74d597f4542 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
@@ -269,9 +269,10 @@
 #define CLOCKSET1			0x101c
 #define CLOCKSET1_LOCK_PHY		(1 << 17)
 #define CLOCKSET1_CLKSEL		(1 << 8)
-#define CLOCKSET1_CLKINSEL_EXTAL	(0 << 2)
-#define CLOCKSET1_CLKINSEL_DIG		(1 << 2)
-#define CLOCKSET1_CLKINSEL_DU		(1 << 3)
+#define CLOCKSET1_CLKINSEL_MASK		(3 << 2)
+#define CLOCKSET1_CLKINSEL_EXTAL	FIELD_PREP(CLOCKSET1_CLKINSEL_MASK, 0)
+#define CLOCKSET1_CLKINSEL_DIG		FIELD_PREP(CLOCKSET1_CLKINSEL_MASK, 1)
+#define CLOCKSET1_CLKINSEL_DU		FIELD_PREP(CLOCKSET1_CLKINSEL_MASK, 2)
 #define CLOCKSET1_SHADOW_CLEAR		(1 << 1)
 #define CLOCKSET1_UPDATEPLL		(1 << 0)
 
-- 
2.51.0



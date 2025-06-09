Return-Path: <linux-renesas-soc+bounces-18005-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 023C9AD2A21
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jun 2025 00:58:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AE84171947
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 22:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E255422B8B8;
	Mon,  9 Jun 2025 22:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jqSrgc8e"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2645E22AE68;
	Mon,  9 Jun 2025 22:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749509816; cv=none; b=cu2dTZcCKlhGVhjW5pW2zuy+FxOy0DWPNColxiLlD2qC5CMsaab723k1mHFx9SxsXHSba9aBq702JVuav6DRg1ehYpEOoH8zZpMaYArm4uFIAup+KoL0MAPiAFwqOybq2pM2g3qDd948yKUAgVBKJLuLLwpA0I8m49CgKreiX6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749509816; c=relaxed/simple;
	bh=pgu0m9z5JmutWmpTOlIUe5W7ajHeEF9fAzvHVtrmpRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DV/N7lsxmx1xQEZjzzqoFsb4H+UtOutPTE44/mTYeEdUCAQPuQIzGm8yp29hG9MTSr1Ix7N4OsPrhrZJduxoIvtZEEyL18xT0lXSNp9XzsivsRqlR2m+K/nC4j/seSSt5N5b49MtxX2vZB2UI85J3G9PbMkhRskdmVLcPIdJj5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jqSrgc8e; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a35c894313so4331273f8f.2;
        Mon, 09 Jun 2025 15:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749509813; x=1750114613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b9sNPDbvHJtRK/qnSfFYq3EhOhxCEQnSTNwZ9t7XS7g=;
        b=jqSrgc8eQ7pFtNIWhFNiZ6CcozU/zaRm13Z/0eR4fyeQ6qzQqMO9V+VgDQYVMLyGv3
         6LQJzcYalwEGlyGtfn3siGKhuLhETXCEqJQikRjGdIS1hBan8ItVwW23HqCyuNrWZQEt
         jEIL5076MpbG3n//OCYQ5FuDqkLoom7zGUY8aQqZ8nCUwpEMjPZLXbVT19GGNmcu89wh
         JzOT72Shkoxs/CIyzv2FevDiSPrP4yKyeS/rDUdDzOi/n3HHsU3O2pcPIIUVYtkkOYmP
         1n8BdQAns8z285U6U9nGZTHdW3mNTi8eT9Lg8sRIl0vDIRAYtmuxWCHfd0qzsWU0mJRz
         HsFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749509813; x=1750114613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b9sNPDbvHJtRK/qnSfFYq3EhOhxCEQnSTNwZ9t7XS7g=;
        b=llyvvN9NLazI6kI+DD9MUxVF6UgUYcdXxlxezA3ky7tAqnYgd27+cah59FXySpSwc8
         qXvr1OQgPkijkSNXqfBt11AaUex9a29C0Zyt1WML1t4OC4bbV7hJg9Tkdf72mTy0zdq/
         MaD0OCyMdWk+Xacghgm/7AlowaIHF0tSh58r037/JWko9fG2SQRGtvtV6xjczwiejTqk
         nMZInfRG8V2FTfnev4BCqTDfJpg2RwnAQdYZc4Ythoi4oul0+CTMnEfqJNLR/RXA/TuI
         dxRd4aWIE/KJS680vYAJzblOUq/3+w+AondGTWv3hzwfKeIq/HnAaw4/imrIu3m2L4WR
         A/2w==
X-Forwarded-Encrypted: i=1; AJvYcCW1pGO4EjPHy1PXcCzaeEspDcUckUOYbavmYLew1LnP85U30BY6EIlnWcEUvdo96iY5Bpx4hGWqUTbuNPc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUZVsgVKSHVvjwtmlNiHXoObPDJLhbhaq12dvgXlkTxh8X74HQ
	RYSYyjzS+9F9ccMP0b7osPL9xjbKbB369LSZQ2l4Ntp5C6t86AvcYHy7
X-Gm-Gg: ASbGncvpwQ+Y365UPfEFOO9SikwevXcZr0KPEndA302hCZ/KQtCJQsqGjy0p503v23L
	gZBM3SH3HZQemga23+d7fDSt1dQVdL3hX+hLLdvApiOG0e7mXauFqI5ahzX3+JQtOQsYOO7vnoo
	8nI2N/ZJV5D9Jcubz8W0CQ4/vPRbobmYz84p3NWZ0UwDBplzq5XF+bT8CxL9Xpr6Tv/J2Q4GTfM
	Em1MdX2nn5voaEGkcSOz7Lwhye6lcM7/7+JKqcySxY+W9bIxF3CEFSMGHn53Enn43ep1xcmA/4m
	Snn4P82S7OwmpSaqJAoyM9c4H5dHMhT8O+zcN2k/8hODgQUhlgvhoHNiZFAFHKOwJ/BBqS86BAL
	LXN/Kea9riMTsIWKaN/A=
X-Google-Smtp-Source: AGHT+IEizz7C/hBJTgzy36g5sjG+Z7oBuPSSAy3tfoHcrQ0Z3A14k8MfwRyhBwae678JZOqvfLUNxQ==
X-Received: by 2002:a05:6000:2503:b0:3a4:ec23:dba5 with SMTP id ffacd0b85a97d-3a5319b17c0mr12730358f8f.5.1749509813415;
        Mon, 09 Jun 2025 15:56:53 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3c26:913e:81d:9d46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5324364c9sm10824574f8f.51.2025.06.09.15.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 15:56:52 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v7 7/9] drm: renesas: rz-du: mipi_dsi: Add feature flag for 16BPP support
Date: Mon,  9 Jun 2025 23:56:28 +0100
Message-ID: <20250609225630.502888-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609225630.502888-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250609225630.502888-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Introduce the `RZ_MIPI_DSI_FEATURE_16BPP` flag in `rzg2l_mipi_dsi_hw_info`
to indicate support for 16BPP pixel formats. The RZ/V2H(P) SoC supports
16BPP, whereas this feature is missing on the RZ/G2L SoC.

Update the `mipi_dsi_host_attach()` function to check this flag before
allowing 16BPP formats. If the SoC does not support 16BPP, return an error
to prevent incorrect format selection.

This change enables finer-grained format support control for different
SoC variants.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v6->v7:
- No changes

v5->v6:
- Added Reviewed-by tag from Laurent

v4->v5:
- Updated RZ_MIPI_DSI_FEATURE_16BPP macro to use BIT(0)
- Added Reviewed tag from Biju

v3->v4:
- No changes

v2->v3:
- No changes

v1->v2:
- Renamed RZ_MIPI_DSI_FEATURE_16BPP
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 004911240cef..afb427e678bd 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -34,6 +34,8 @@
 
 #define RZG2L_DCS_BUF_SIZE	128 /* Maximum DCS buffer size in external memory. */
 
+#define RZ_MIPI_DSI_FEATURE_16BPP	BIT(0)
+
 struct rzg2l_mipi_dsi;
 
 struct rzg2l_mipi_dsi_hw_info {
@@ -43,6 +45,7 @@ struct rzg2l_mipi_dsi_hw_info {
 	u32 link_reg_offset;
 	unsigned long min_dclk;
 	unsigned long max_dclk;
+	u8 features;
 };
 
 struct rzg2l_mipi_dsi {
@@ -672,8 +675,16 @@ static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 
 	switch (mipi_dsi_pixel_format_to_bpp(device->format)) {
 	case 24:
+		break;
 	case 18:
 		break;
+	case 16:
+		if (!(dsi->info->features & RZ_MIPI_DSI_FEATURE_16BPP)) {
+			dev_err(dsi->dev, "Unsupported format 0x%04x\n",
+				device->format);
+			return -EINVAL;
+		}
+		break;
 	default:
 		dev_err(dsi->dev, "Unsupported format 0x%04x\n", device->format);
 		return -EINVAL;
-- 
2.49.0



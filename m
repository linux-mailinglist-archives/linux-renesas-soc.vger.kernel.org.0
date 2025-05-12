Return-Path: <linux-renesas-soc+bounces-16999-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C658DAB439B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 20:37:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 507128E0F28
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 18:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 431D629CB47;
	Mon, 12 May 2025 18:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YFdlSAHn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D4629C353;
	Mon, 12 May 2025 18:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747074242; cv=none; b=dwaCITt31uB6NCkcwzeYoRcnh7WpdN4D0VnUGhFJ8s3op5c8Pk5AzpuRAYVUtqBttkmYhIcPaz0nJoJPEeBYG1fXNdSMdoBwU0eGp7bBAgvKRJfMTO9zCTnMV8PPpvUEQosZI3/ivbWQ0lg7kqWcl1Ij1SSEB1GLEk/A6/2zYAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747074242; c=relaxed/simple;
	bh=eLrksj6/rNzRxoGHnwNmkAlJmhxX3ouV0PBp/bPWzAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jgI78CPzlsx8Q/L4NXwC4HYEnoLReb1eFZPJ2L5XWt0Odv6oZ9llSwEwojP9LtjA33w79Bi3aalHSAR1tP56nXAW+j5I1OfZJq2Ik4PMVide3kJbVMWTQIOLyTP+33UecLnukw1f2m7HzaoUjT1aO0EiubuInR8m8Ew9NHDDLeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YFdlSAHn; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-442ea341570so2893855e9.1;
        Mon, 12 May 2025 11:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747074239; x=1747679039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZ+vU1UoobYMIUNcnHOC7DBBxsyxbdR3mTKec7LYTd4=;
        b=YFdlSAHnZV6z/8HHNFc7ETvouqEtkjKo/NG+EBKdsuMIgKwpOqAWQIMKU17lifgnys
         4IUM/RccSPFuBfviqYT5YsWkR4nFE2hPr30XhqsCTvgGliYuA0PPgIdRVdMl2rhkBJxX
         suSB6eziWduyanpzR/NMv1W5uNsBeiG9XvS+4vGEN+vJUX7a7FXu5FnZom0NcDif2r5H
         07WuZklwrnCRzDy3halgJq/SNIfb6FF2JvFttiC/lxMWO2RRiNKR2YfKhRuL5WZ60qjA
         fq+TIFae/3xNgENi2pnXMRKTpp+ogZ458+Tx4S7hB1TrLiUDU5LyOupyu3ab9M+lgl0N
         zo8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747074239; x=1747679039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XZ+vU1UoobYMIUNcnHOC7DBBxsyxbdR3mTKec7LYTd4=;
        b=kztgh6g6WqaM+Df8pLMH8oLG2kE/7eKgH3XCIyRT1uSktYvXqzANS6Qe8ZzGIVlhbP
         vUd87GQ4zsZr/e2WgA4xdJBunkuRBQxPur5PRHKKVAjjeRRUGeP6KFNsBtEgwkwfyaNB
         Kmu16pu0ETemAgxMK0veX31DzNI9R+iYVPtZjtvqfOnuXr5kHK9QxqAPHRqBlx9FoJtI
         X6QLprSZE2gdYzc3nJSYZXkQ29f6XmLoZbs2J2QsujjE2wgud/UOhMNaIxUDGPGR4tps
         Z6D8nDVdCsq5I6+wjoL+ypWyaGxonOAhqHI22am/EnPXUB55ND4j8H+/u+8b8+Lm6Mdm
         XGJw==
X-Forwarded-Encrypted: i=1; AJvYcCU/rK+bohbPRhHu3IJz8JNyDgIPxLRO+Sb2N8o2lPtdMkncCmEwJsjfSTLjO4Ut0/zFVx/wa3qUpBO0fr//@vger.kernel.org, AJvYcCXS4Mq7PQZPe56wYym0YIOemQ1aH35nF4lKZP7Khp5DCLBl7EKSlxaUIA4w0cJ/KMMF2rVyd0NLmjy4@vger.kernel.org
X-Gm-Message-State: AOJu0YweUFLnyaCR8PYgDayS3OOWEKzRVBg951eqM2OatJRScOaoO1DZ
	+97i+NyJd8WLO3k8yHuay1hdRDoqRldZxmatc9KG69/Ybb3f2825
X-Gm-Gg: ASbGncvayLpAFS7IWn1gK33sjPASHJE+7+SDvV4v/H2ckjacTQ28WmWzRSlhZt86ax1
	dQfylJ4aR7cBmjtkXneQfdQTl84PHzgvVAWp6679DJWU/r1WhUxw4lAVg+MGUgb/faTZ2dZ6Gmy
	naxriOIxwYHLmRp1yAB6chz2teZMhZD0yCVEiOq2Hqs+bMWSkost5RwwvTs2sL6LADAT6vzcC1l
	5JKPg2/EAd+HTLaWO9mznB/6s7wug6SQGbtbnE0CUYHgRR/ZzjuYNI2PlLyCsY8c3SAGxKuJ71g
	mIwI0CK7LhdNKzBiqWuYUiN3ougJctSfcWaRQWgdjuaXbKk5ZFj0HbPle4g2NSMOmRUeRhTdWhk
	3
X-Google-Smtp-Source: AGHT+IGavDLVMIPNMOKz9zNl0lm18Doe2+KmtMGHo9AttZImonrNlkjLDy7R/9fBkR7zQOUWmYdW+A==
X-Received: by 2002:a05:6000:2902:b0:3a0:7a7c:2648 with SMTP id ffacd0b85a97d-3a1f643cb8dmr12403626f8f.27.1747074238563;
        Mon, 12 May 2025 11:23:58 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:581b:951a:bc46:a124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c5f6sm13175497f8f.86.2025.05.12.11.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:23:57 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 09/12] drm: renesas: rz-du: mipi_dsi: Add feature flag for 16BPP support
Date: Mon, 12 May 2025 19:23:27 +0100
Message-ID: <20250512182330.238259-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
---
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
index f93519613662..55a1c1b043c8 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -28,6 +28,8 @@
 
 #include "rzg2l_mipi_dsi_regs.h"
 
+#define RZ_MIPI_DSI_FEATURE_16BPP	BIT(0)
+
 struct rzg2l_mipi_dsi;
 
 struct rzg2l_mipi_dsi_hw_info {
@@ -37,6 +39,7 @@ struct rzg2l_mipi_dsi_hw_info {
 	u32 link_reg_offset;
 	unsigned long max_dclk;
 	unsigned long min_dclk;
+	u8 features;
 };
 
 struct rzg2l_mipi_dsi {
@@ -643,8 +646,16 @@ static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 
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



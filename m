Return-Path: <linux-renesas-soc+bounces-16994-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E32EFAB435C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 20:33:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C34FC18844D7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 18:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7152829824F;
	Mon, 12 May 2025 18:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BZmroR30"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852912980AF;
	Mon, 12 May 2025 18:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747074235; cv=none; b=eEH+o24TuD1Qfjv2UpgHxJkMgBD5osBcICSzFSEaYXIJrWV92yPHHoFedio2SGO6mVfM0G53jUoDmNlynnJrXlitoDdaeGtb/AsPNBFpc5jmgyBkrNRkHq2HW1q3PNZlg2J/t0eVEIMojv/oQ2y/+RB7gewca8S4b2+ZMkXAY3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747074235; c=relaxed/simple;
	bh=tE56LnIJk2HtDfRPRKyu8oembxCXMJ0GJkYtE9SZb9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EVPbSRjOKJOJ/jPpR5h6zJfp5E3OeUKKW4ull/n4KPxkoE55aglHhCue+7j/i2Ja1nstz+IR37fOLSRhiUzXsUVPzKFWWu/k99sNQKDHzttguR7TuvWESRehvw2Om81fUnTHUiiRF/Q8XamwSgAWGCzO9FkZi+M6xWLcidNXQnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BZmroR30; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-442ea95f738so1842845e9.3;
        Mon, 12 May 2025 11:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747074232; x=1747679032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VRiPYE4cajKFiVaaSWX6xevQKkWMu8hQmnI0vIhOWns=;
        b=BZmroR305p6HNK7RRaoqYd36fj67KrjrI12mvwka6CAXNaCw/YS9ytVh2En71z54xq
         TEvrmfcUZpPhwICj+/6sYzCLiiS/XvvITnlcs6fpGhc73h4j76eMaj8DeXmvNaryI3JX
         OXXOa9vKpN0h8n7CeRB7SlCemC51n90F6xnEDc/PXi6qFxa7ACg+gnUR7j7VFnchnr/C
         0KyVJKTAzFMSeU7OyQE1hTC3EhXfh63IQO5CYcOy/XqA8syky2TKHqEaU+cIFRYjcgoa
         sCN0qB7IEYvdw/kHlBSr05R05qNHvtikc0XnO+AJpIkq3E2aUDXZfhtYVHL1JsQvZ/2c
         Jr4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747074232; x=1747679032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VRiPYE4cajKFiVaaSWX6xevQKkWMu8hQmnI0vIhOWns=;
        b=KRK3xqJKQ36BNYOeSsk4FZfS0+ovrmrFeM8XQ3p8uVvcQifejGRVbXKkatjouh7Bju
         8pzGAfY8SPVJCBda7n0Iasdxd2PeMowlehSd3eWrOqHBdBrmQPtzZGIJEtFXEd8/4Efh
         OSufkyvz1jazdadpAmvZ6KUKJRruWeTLENdCnf5MST17chOiQAU81ClxnKc17xCPsHwD
         98axhj9JoMQZtdhL24Cn5gfx/ATfCXJrcezV1NIv0b/fXVA43rWTrl9oYmv3w3HVKhT+
         WHieWpQr5D5tmUlMuOM7mpw1GHlyO3BPD/bJ46o7wg4ZKdAAyp66JZAcwF1ZZDOronlB
         4Mug==
X-Forwarded-Encrypted: i=1; AJvYcCUmHJnxg4sm2prDLQ/HI2+anr5jstT9NG+G4Vac2gEU+EehlMk04Ls37qqwHKeXgi00U2HcFl4s4iHd9l9P@vger.kernel.org, AJvYcCX86WwIh1NPcSUp0p9J6M93pEk+Atj8DIdnoNI9l2IcEKMljKLiW61AczbZsPF7cRzL1WoAt2eaYprr@vger.kernel.org
X-Gm-Message-State: AOJu0YwfOu8Z506TANaxil0JNWsKLhzkgl7qTAKDeEAphChXLclsNdNL
	VUosQV41F/FCcdemcCnTfgxp4HA5cEb4sAnuXfgkOEozk+8R1Ia7
X-Gm-Gg: ASbGncuPCBqF5e2xB1dhuky8hW65b23WtN/S9ftxtI15ru6W8/LPTI9EPI9mfvN3p1K
	VsFaEXxM14Bbq4a01oYPeKqBJMATiPXA4oVW/beo1RukJsYfvMGy1Fb9zdRtO4Z6RXf/U2gcLW3
	bLxlneYmHSHdRs/H5REfsdDht0GEDXc2dkBGPxuUwAzBFAdtuhoh5KrmwhnJEX+QRHRFd/7jyDI
	/nc0t1dU4ga72aZopVokfq7PGQ4s745LPf05uEYsBM+5jqRkrYOlQLZYJtIUMGD10GlDcyO4d4b
	oe9LVCd3hrojJ+569bPBlnx5E/sb6oI80skV46xvcUwMGHkiIDw57peGIwf8fERCILWX0Qyu0tw
	U/a1OWYhAd/4=
X-Google-Smtp-Source: AGHT+IFTz7S/GODM8ebO5jM+vzxvaYfeCC090Lxfk1Y/Zmr1vAfTxu/ojKiBqCGjlSPxDzu56yqJug==
X-Received: by 2002:a5d:584b:0:b0:3a0:9dc2:5e0e with SMTP id ffacd0b85a97d-3a1f6422323mr10602000f8f.11.1747074231666;
        Mon, 12 May 2025 11:23:51 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:581b:951a:bc46:a124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c5f6sm13175497f8f.86.2025.05.12.11.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:23:50 -0700 (PDT)
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
Subject: [PATCH v5 04/12] drm: renesas: rz-du: mipi_dsi: Simplify HSFREQ calculation
Date: Mon, 12 May 2025 19:23:22 +0100
Message-ID: <20250512182330.238259-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Simplify the high-speed clock frequency (HSFREQ) calculation by removing
the redundant multiplication and division by 8. The updated equation:

    hsfreq = (mode->clock * bpp) / (dsi->lanes);

produces the same result while improving readability and clarity.

Additionally, update the comment to clarify the relationship between HS
clock bit frequency, HS byte clock frequency, and HSFREQ.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
- No changes

v3->v4:
- No changes

v2->v3:
- No changes

v1->v2:
- Added Reviewed-by tag from Biju
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index ec8baecb9ba5..c5f698cd74f1 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -277,10 +277,10 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	 *       hsclk: DSI HS Byte clock frequency (Hz)
 	 *       lanes: number of data lanes
 	 *
-	 * hsclk(bit) = hsclk(byte) * 8
+	 * hsclk(bit) = hsclk(byte) * 8 = hsfreq
 	 */
 	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
-	hsfreq = (mode->clock * bpp * 8) / (8 * dsi->lanes);
+	hsfreq = (mode->clock * bpp) / dsi->lanes;
 
 	ret = pm_runtime_resume_and_get(dsi->dev);
 	if (ret < 0)
-- 
2.49.0



Return-Path: <linux-renesas-soc+bounces-17724-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEF6AC9435
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 May 2025 19:00:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA2841C2186E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 May 2025 17:00:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88A1C238C1B;
	Fri, 30 May 2025 16:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U5P0Zyfw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB8D235065;
	Fri, 30 May 2025 16:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748624363; cv=none; b=JPja+SpssBDZdZGe6H6mxsYdwT7cwHIClbLRzOpmskCuQAnp1gGg6Irl/XlqTqRxsSFoyUpLbN+jlOlC+7soFeWZcM5U+h/6JMSTA4a65ELrgYjN/IZnAWKUBCMZr0bed2mamo95ocyexHTMgCQSXqk8sZ5ccSxa83qybBp8qzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748624363; c=relaxed/simple;
	bh=jOmlA6rEKUgJLq2imiJhu/5ROzaDjvRVl7WGWDvkaxk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wx9614rHfkCleCHO5mhBNJojPdU0P/IDXxtd50LjtRm2wkBFC5VmIq3UkkM+KN4sTDMGo1GXTQ47q+A9o24z6EJp+WPLHb/k+TJkT+wwo6qXOCxkt69y5yNx+8pnft7kMUTvivgs02DemF2HoxKrvB2vZTcRV5TJocs/EqIU7Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U5P0Zyfw; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-450dd065828so3298565e9.2;
        Fri, 30 May 2025 09:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748624360; x=1749229160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bVJsgqR8jeq1tLgPX7Ahyib5AR8x8wp1hOOblNNYTTI=;
        b=U5P0ZyfwzoJpFwmjy0Vl8Ugq4spIgDr+KtD3sb0JdD+zreDW19x8w7SNx6ZOweK2NG
         xtDK6Rgx9BCGlIysLi2NZUpZvAWsBd69DhBmMismrF8PS/4RdIGCDgU5y2LoS88XWyaF
         /GiDdeqCYCo7NzwHQLCCF38FOB4eGshZoEydqLkybZxk6qQj8Am1ptTpXe3N1Azy8SFn
         YTO5vV+liIWVPWg5J0tVPCdz9cDr+RVp/CHIAbrCNb9K54FYWe5ztiAePMn18SLpLYHH
         mJx8hy0yPE0aRO3jDL4zpdVoIXXy7FS4pPY5FI1cRpPY3x73phUVll+xN5VNLosrR06z
         ZluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748624360; x=1749229160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bVJsgqR8jeq1tLgPX7Ahyib5AR8x8wp1hOOblNNYTTI=;
        b=WIik2CbPCqZbI7e6kggtsYhTCVe254/Ly9LIl8eYXey+wVUbfflPgDj6uIM4UvFQu/
         zc3P5d5m8CUTYTjSvCtyMpaBMAQOQx3UUgU+eQQlGpSOml92NjSfnPeZy0salomLswjD
         FX4XVPIaPq0DXhHHwFMVwK1yyxqj2MhxrKfve76pK7CI5oa6rrZPtpuCN3jhaqWuDuVQ
         n+B5rNA0Pakgt+xORCaml7bzcBJYvQGIKVwCZx1H154o12SaNuthCOTrcNFVs1KH3DyX
         11ob8AoYKIHl+Ft0TuOHoEmLwHnQ5p/8Yj1hrdCftFoAEvUucfPIaTq/I5yBBpDPtslJ
         mkgw==
X-Forwarded-Encrypted: i=1; AJvYcCVn0pFWXSwZAXgO8fyEp43ndk9Uw5p7keBUQ4J+edjESOYjn2Xu1oXAMmw7p6WFn+5RyExnIWoz+8nPJnI5KFqg5J8=@vger.kernel.org, AJvYcCX0WX0hGOFX6YkpFEtdY8jW01uIg+AlZw+DoR1fKf0mXGvDPWQaelPFGtfJPboCVj5By9Euo1WESOKcsWiw@vger.kernel.org, AJvYcCX79WgH/d7+qZoNY/Cu4BaQPou5DxePIk4RZXsSzQtJo7vIsnk3mFCHNRQCggricl3OtUmltu4Srwpi@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdlr3BsKwdoi17qAcoLETTlNQ8WbNfkfAWGZa7Ap+6+AsUvoEp
	HcS9UmmgiHNH7YIkIU2/eFdbIArwbsmuwRs6a1A0nZSePFa9iW/srw5j
X-Gm-Gg: ASbGncsPO0JYx+j02/BCNhF7IkCyY8YIry/UsagH7WhO5Xl2Fa5lTBkwW93+/u/IsgW
	ihlVSHYfkGMV4/0G6ObjjEKUibACAHx7mttZshcJ+XulVet7/bNwl0ANnnce8qOgBcJf+P2JxQC
	eTBrwZWB5MsxAIxfF6XuTRr33O1iq25Oag0qSRgay/2GZWchZYxKVISqu7opd0KMtCo+4E9iUA+
	dnUcHvj6XshNtgvbjlRBGLyI0j2XYaMdhNeJz0Dw3eMvKOgULWbSr2rgu0x3zhBD9BlAZYvb249
	usHBrnVbnNEjYXJvZ+U/CHP5SMu525KnipDJzvbZOE0JeE9g0DydvaM9dAKprSZS/uUQPrjNgBO
	BdmJAxve3JQ==
X-Google-Smtp-Source: AGHT+IHUpzj7UNyPaAj/DrVWUSbBAQLC84krhHBGh8wrBgJHz7oS0WJRv5LI2/bixWhWKyONOKHTCw==
X-Received: by 2002:a05:600c:3b0f:b0:440:6a37:be0d with SMTP id 5b1f17b1804b1-450d884c411mr30637185e9.15.1748624359595;
        Fri, 30 May 2025 09:59:19 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:bcab:7ec7:2377:13b0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f9efa3sm22733455e9.9.2025.05.30.09.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 09:59:18 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 07/12] drm: renesas: rz-du: mipi_dsi: Make "rst" reset control optional for RZ/V2H(P)
Date: Fri, 30 May 2025 17:59:01 +0100
Message-ID: <20250530165906.411144-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530165906.411144-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250530165906.411144-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

In preparation for adding support for the Renesas RZ/V2H(P) SoC, make the
"rst" reset control optional in the MIPI DSI driver. The RZ/V2H(P) SoC
does not provide this reset line, and attempting to acquire it using the
mandatory API causes probe failure.

Switching to devm_reset_control_get_optional_exclusive() ensures
compatibility with both SoCs that provide this reset line and those that
do not, such as RZ/V2H(P).

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v5->v6:
- Added reviewed tag from Biju and Laurent

v4->v5:
- New patch
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 2c03cad66711..0e0659dfe5a5 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -749,7 +749,7 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->vclk))
 		return PTR_ERR(dsi->vclk);
 
-	dsi->rstc = devm_reset_control_get_exclusive(dsi->dev, "rst");
+	dsi->rstc = devm_reset_control_get_optional_exclusive(dsi->dev, "rst");
 	if (IS_ERR(dsi->rstc))
 		return dev_err_probe(dsi->dev, PTR_ERR(dsi->rstc),
 				     "failed to get rst\n");
-- 
2.49.0



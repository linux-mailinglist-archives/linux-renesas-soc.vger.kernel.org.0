Return-Path: <linux-renesas-soc+bounces-18003-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAF7AD2A18
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jun 2025 00:58:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F176C188F03A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 22:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 776EB22A802;
	Mon,  9 Jun 2025 22:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k/dRg7Ch"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FCC22A80E;
	Mon,  9 Jun 2025 22:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749509815; cv=none; b=FOJtu9Xgv7kr0hw9/p6iV8XZynlceUi4GhZtRCAD7P30dXK2d/kjY5HUyT/L0kiA9w5cUJYZZ2RCZo/IBmGBjO62iRJjhw6nC+HIvuQUY37hdpVk9IEu7lKyHBDuvUoPwJ+GsLDZuTrqslmaEB45gRvTPqtNATq727HcGZ2TlbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749509815; c=relaxed/simple;
	bh=gCP6Mmnkw9pbdrY4Ks59zf9m9tJFA7J0ZYgdwNVqaC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DbrrK2zQAyL6Gxuj+AO8hlz/az4RBEFL8GR6WFkpnk5Nm56kOc4Lns0YH3K1RZjZoaYEM+nMj2wRL04TEU473soixexDJV85A+egFw0D4Bk7rpUb3nlBPYeGqvp3ZRQs09qBd93Z7HEj+O62kl5WLh+SyJr/wQaLcdprILVrPnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k/dRg7Ch; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a53ee6fcd5so1322526f8f.1;
        Mon, 09 Jun 2025 15:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749509812; x=1750114612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vUIYYrKTPk+CVvS6EMCl15Pl5q/Omqp4NNMhKg0oVDo=;
        b=k/dRg7ChOCOAe9GC1sUKCjgqe5amF3UVLWz1iyaSWJfG7tWgzeGrN7NUu+y9NUCFVf
         E+2GK3ttouTrUEvydmuwboJs44QAn17QJ8AzDEEqUYLZ9ShkRZKZT2zF1hoPGAEIHgsf
         AGFtPVyubaZp/aS6q5RPxdQvfyiR9UFaPGqDnwYK4yvYic+ax/YVmSP2dgvHQlGyj7rv
         fy2KtYI9Uhe2wnBQSXTLMvP4HhsPqwzbmt6uXs4UIS5ghzIUjAf03HZOPK27p22DVzwO
         HKn2qzZUq5evNMN/Tbxy5yAYrxUc9pZgMom+TujT0ADHOXdpTyzBsSDhN3CWrsKcJSIa
         ADWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749509812; x=1750114612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vUIYYrKTPk+CVvS6EMCl15Pl5q/Omqp4NNMhKg0oVDo=;
        b=mHH85chnHvH68U26dFOC/AFLUpaRAjMA4x0NfW1A9AAuID4ZyAkOeIXVcIq6CBg6J4
         8yENoqwcTLcO9ixaJWMRcyDehJOneGR/6S1bHmvKT1BuKosfEHQwD1lcybQDeWKBxdjz
         i8es8DhVz7eUB9M6zs7fgScB+NZfiwvc4rGeZUECtuxWdCTpE9OM9qJKaisUEABNOsTi
         nKKbltTv2/Rh6BVtK7mzwa3gubChI/ljHB5HNJa71yN1YAQkvCosOD3ZdrhzzPcKjpsm
         Uh2FF+S0Wyf53KRbC/LTmIEvbkmTJF2BPR6HDY1M0DVU3EBfRCL2DFJAG/iW/8Sndm/J
         yrcA==
X-Forwarded-Encrypted: i=1; AJvYcCXBAqvGhoaMUuQ5l9pyD9PP9A2CN/om0uijNl5+Xpl9Pn0D5vo/kJESdREjGUQGYDDGl+a2rdphnug6en8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1FOMeyozcDBQ2TfnOGxfMfCGPY3UerYNylQGmeKBbmnUUZCzY
	2ynW8isPHMorKh+zjnRutGFNfOX9IFLFRoQ2yJZquLCq4CKfcXlxkFRErjFPoxeVvEU=
X-Gm-Gg: ASbGncuvkL7MDD1rweal+/KRNdc4vh8VGjLTU7Gs1rlvN0UAcak+LiBND+bY+sVKW6Y
	Q0I8Gz77kd2uG/gxBEKHJ5N1N7wX+Ee2mJCfbf6PckkCaXErhwS4Pe2i76uF9HKLRdB6k1x6VfZ
	zrs6hODEH9Dm8HfEa+rqWXzEH/EuTqryUPtYUFxqg6LbqxeZcwMzJK+Gtj8PipaAI/jhpNFVA+R
	ZE1wtVL/e+mmCV8O2QLl5RaMuqcgLPbtVu7AypWUw3DAG5hmFxwR5sHqf+GY2RooAVDtYyqmd59
	SAwP+GD6XE3GfnGHf6swdrWq60Zex8frsgd5XlzH5+INjvj0/LxkrwAGBAAsuHZ2d1Dht4EGUrp
	veg0i5YyLPJ3uEyiRtHM=
X-Google-Smtp-Source: AGHT+IGDaEoGkJ2Kkdd4CcQFgeCFfgVI+u70H9xdbs2LqYNB70EAO5hwTCA7LzgK9IfblrfKUwkBbw==
X-Received: by 2002:a05:6000:4284:b0:3a4:f510:fa77 with SMTP id ffacd0b85a97d-3a531cb7e8cmr11188121f8f.29.1749509811605;
        Mon, 09 Jun 2025 15:56:51 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3c26:913e:81d:9d46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5324364c9sm10824574f8f.51.2025.06.09.15.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 15:56:50 -0700 (PDT)
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
Subject: [PATCH v7 5/9] drm: renesas: rz-du: mipi_dsi: Make "rst" reset control optional for RZ/V2H(P)
Date: Mon,  9 Jun 2025 23:56:26 +0100
Message-ID: <20250609225630.502888-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v6->v7:
- No changes

v5->v6:
- Added reviewed tag from Biju and Laurent

v4->v5:
- New patch
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 85074e0c3cc4..d4f2867e0c5f 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -937,7 +937,7 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->vclk))
 		return PTR_ERR(dsi->vclk);
 
-	dsi->rstc = devm_reset_control_get_exclusive(dsi->dev, "rst");
+	dsi->rstc = devm_reset_control_get_optional_exclusive(dsi->dev, "rst");
 	if (IS_ERR(dsi->rstc))
 		return dev_err_probe(dsi->dev, PTR_ERR(dsi->rstc),
 				     "failed to get rst\n");
-- 
2.49.0



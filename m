Return-Path: <linux-renesas-soc+bounces-17999-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 317C3AD2A14
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jun 2025 00:57:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C85518897A7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 22:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B025226173;
	Mon,  9 Jun 2025 22:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XaeUZi5B"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C216F225765;
	Mon,  9 Jun 2025 22:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749509810; cv=none; b=ryYOg8iyV4QiA9Qeig2OKkFHeCiRR+KMBgB6ZE4+UBKzBOkO+cIFakmyJ05YnWbgPfuYNp9wTOvTdlIuwUyK0bJ2LgARxAUqHkNcOdB8oSFP+ccSzzDpmIQCjaq4jbStWzGiP7acdqVLGMSqwcGva/Tn1m4BIlykOBjQDWrIZXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749509810; c=relaxed/simple;
	bh=mfxMyefCzHjeesQdMWLbrA7VTrQsoSyG5nNC2+zL6fM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sAPwtQvaQm/6hOvN6ALvtRiNUrUmxzt6NKKyShbhGl5lWC50W2IKgH3r5N8GLr2Klf/S+EszZdH2aJGSERlbJXcJaFfdCGHt/l1R4F1w33AcNGZNOiM4vGQ+BSVkMwRod3Y184O+svEWGe1+4cfsi7REuZx3q6ETO2hDVjBdXb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XaeUZi5B; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a525eee2e3so3621552f8f.2;
        Mon, 09 Jun 2025 15:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749509807; x=1750114607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qVMaFqwVaRe3BMRqoXxDwP87qg6xzDVFlY1zLEQXXs4=;
        b=XaeUZi5B1MdZRpr3ra9A+09nKQatfHlIGcJso3J6+zQqOr++UAPPl+QCfgNVcTS9aP
         hRWPhh4jKHnjLH8vwHNDefIQxKZ6drBNB5ZoWCXPvupHO7n4UKpZLQCjwdLl2wSVqOKe
         E347BiY7D063Zkx6ra+fzMWfDoquShGCZL39k7nd5m3BnMpalOe11KRfNR0P5pzbR7Xf
         U+rINA19tegbM2HE8bs+qsPMjs0i7YbXB8+8EgjDkPHWzu1Whb/ogfU3SIg+MVFxyidW
         9FytzPlARXgn8t9WOEZ8rlKFrzfWahi3oUc31v+mPSD+49KOWvOt6AFUTRtp3zwdUrzI
         V63A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749509807; x=1750114607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qVMaFqwVaRe3BMRqoXxDwP87qg6xzDVFlY1zLEQXXs4=;
        b=lBQo7fak6ZKIwZnnYEpFQP5bARm/6y2jlhjppKzK6X3ECkdCyw35caAkctJcFKu8kO
         jsSkcaSeg3/w02wrQTL0IUYUsHiqruf45jgjJGm50WQYB94pde08LQgNoofw0zged7NL
         sAbFFfxHDxwIdARYlLeFml8nqdFHFqn6m6ADu/L4REUjw8BMpKwCPQybZSS1xfTzxb8r
         SLhcp4Z0NYEmXU+VFg/sUgf52PIfR1PqGCv0tLFUGlHz6WQggd9zrzxI1aJ0Dk6lzceO
         7/+nIft9Z5EHRyxWHOUm/cS6e0pMCzbb7LgFu7e9hNU0amXOkBCEMf4lvMDxwNKVJNvv
         S3Gw==
X-Forwarded-Encrypted: i=1; AJvYcCWj0d5zcjExQp7Pke5IZVaKcPVZwxZS1VydJnBseQEeyBoR5hcL078tImjsXmUqGM9xR9Ulfq0dDc1FdCc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXTBQ8mjtErKUs8oFoA7K6lFt4zciUmdzRFeh8HuYfoAjj4+7W
	PzvnoM6wdAHyVdK41SJqXfXxCs58TyR8BhE7iKttQpmSchDIiUivLFCs
X-Gm-Gg: ASbGncuHxDWO9lOwWrvVX/Gs1bAcUEn8ZdwPe4tZzoqulFVjEyFHIsBH28opHR+nRt/
	FbVGezajyuEXVpNTdc02FO2P1/Y3dcXeY7qshRifIJ5pk19RG1ueNwLiWXHwg33CffrH0CAmLw4
	m/YZUZRu+z7dIVbRnu15WK88q7IOoIseQ5sxDI1zg7g85sp20ubHp/auxojNgD5r1K+3Wvss4gr
	uREQh7pYhUWJxcBP5xe67C3RUmkk/57NQJHg1DLbmYQmdn945KbSu/6kunAK3Xlvqyg2zxeotnb
	6Su8RBlbZcVd/1+boweby8FIfzFwc20FEGBvC/AYZ3IPbjFus4dvlNtQC1gudtNCTPw///vQqbF
	j96OM+etkeHrz7fgd/YE=
X-Google-Smtp-Source: AGHT+IHxxNlgUy3KDa90RrzDaQQzT1GEnR6VT89mwWmkm6FsyMGOhxxM4/dRAw+O+U6Dfouuc1yhxQ==
X-Received: by 2002:a5d:64e9:0:b0:3a3:6991:dcbb with SMTP id ffacd0b85a97d-3a531784911mr11147277f8f.12.1749509806938;
        Mon, 09 Jun 2025 15:56:46 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3c26:913e:81d:9d46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5324364c9sm10824574f8f.51.2025.06.09.15.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 15:56:46 -0700 (PDT)
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
Subject: [PATCH v7 1/9] drm: renesas: rz-du: mipi_dsi: Add min check for VCLK range
Date: Mon,  9 Jun 2025 23:56:22 +0100
Message-ID: <20250609225630.502888-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The VCLK range for Renesas RZ/G2L SoC is 5.803 MHz to 148.5 MHz. Add a
minimum clock check in the mode_valid callback to ensure that the clock
value does not fall below the valid range.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v6->v7:
- No changes

v5->v6:
- Updated commit message
- Added reviewed tag from Laurent

v4->v5:
- No changes

v3->v4:
- No changes

v2->v3:
- No changes

v1->v2:
- Added reviewed tag from Biju 
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 50ec109aa6ed..70f36258db63 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -612,6 +612,9 @@ rzg2l_mipi_dsi_bridge_mode_valid(struct drm_bridge *bridge,
 	if (mode->clock > 148500)
 		return MODE_CLOCK_HIGH;
 
+	if (mode->clock < 5803)
+		return MODE_CLOCK_LOW;
+
 	return MODE_OK;
 }
 
-- 
2.49.0



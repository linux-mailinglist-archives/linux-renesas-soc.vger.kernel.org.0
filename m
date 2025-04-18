Return-Path: <linux-renesas-soc+bounces-16168-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EFDA93DDF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Apr 2025 20:49:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FD5F16B4D2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Apr 2025 18:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2567253F0C;
	Fri, 18 Apr 2025 18:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="diTWwIXW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11549253340;
	Fri, 18 Apr 2025 18:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745002045; cv=none; b=c9mYmcxemHWwMSiSG+bcacscWN4YQn8zG3X2D2GuigoBT1RVHq8+hs7K596jqrejVmZHZMFm2PwcApGtiQ2/ccg34WUgR/aexNQapmU8oO72OJULQyc4wQsZh4Xoe6WOSERVFYLK+GEyL/i5yjLdNiA2LgaMP9ELVg8PBhIkr6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745002045; c=relaxed/simple;
	bh=Cq2RGg5MVWodOhLxzmL3F7QZJz34BnZiVrrq100HIhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iQ+pjgiXs2OcCr6+9BeJckLQ2u9rbpzENpwLmNdVYfjI7ILzToYJpVYMzN8EbN4oXp1ZqMA7CJH+qOMBn/iVtI4NSgAmgj3QBWxJm/5NRwQo9c/4IXxY9YnDmWbHH15qTU+gcm1+dAl+u30Z50fPXuNMOV8WrDY6RZ9WwY66YDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=diTWwIXW; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43ed8d32a95so17293825e9.3;
        Fri, 18 Apr 2025 11:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745002042; x=1745606842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a0NMewUxZovXfHeQUZMOSswfntk9w8TolModhDZLmWs=;
        b=diTWwIXWLRx5RjweNqQXqMHG525bqbmq5KJJKUsKF/pZJingdtyJQajKQK0Cvd1U/n
         dV5LDumN//djzwPDEfE96UBhxftmNe2yGEAezIfERJ2UCdxSVfZtARmhhNgKmbnReV+7
         EpfkvB+B4CCr4pKJJ7pb0dXBBq+1YPV5dCBgr+EjjC1jCvI8PHj5IZcoa4nfsAmYQA1a
         LeLVTnxIWfOqLbwe1obsgmlAKycJzP+5s0oO/q93TtRUAnWo/8Rvyb6361re6lCME520
         02v2vE3qT45OOzf1UXQnlBSlNydS6iR+x8+DjFL7CPJrLJvrmBssRQHnq3HnkbYxGSeR
         IseA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745002042; x=1745606842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a0NMewUxZovXfHeQUZMOSswfntk9w8TolModhDZLmWs=;
        b=FaPKlZBRDWJ3Sh6w+ngxO0XE5gVneGhU6sC+CATQG5eDFwMYkZOfvKIuePTn6hJhLr
         aKOo68TIMfPXzhwmQ9Ur+wdvK4a8jGOYBLZMMnTaEkNitkMo32zhLmQpSsSlwz+4O7N7
         lP4OH4IvArJZdKCDxPLj/T/ko+hX6HEHu2AwJfomvN5+tORX1wbxrtkvWbSU+iC/JMsn
         r/37lB/42qEp046MkFnkACFzaFWMMW1hnBfRm8+PTdEMWHxbiFWsOV/Ke5zmzlgSZdk4
         87Q7orN/Tn6jsv5A2qzbjydKc5gNoF8jDSOs7XqFN0LHwGz1NX0BhGzLqxMTZnGYUkek
         V3Sw==
X-Forwarded-Encrypted: i=1; AJvYcCU5gFgKyHLKNBvWwN30Or4tnd3OKFT1oPYkbuopT4LZzkM7h2OX5OKzTq3Gflpd2gRFhodvtYA/e9Pn7uC2@vger.kernel.org, AJvYcCULpRRb0PnS+iL1l3k1LFREYaAmHK/sRk589M2PlcyD9Oisn6BXhyhBVYg5mnFljvi2xtu/cRKFH2+1@vger.kernel.org, AJvYcCWJWhFvtbExXDDTKrB6lBvjXIHM4/J7y/TyeubhDmHLrwMgo5G2WtM6/uxAkoh5OP4bHfpagXVsMUrhDuqZS/wdTP0=@vger.kernel.org, AJvYcCXC/odIyV9s9n0ZkbLLrFx+c+7fynWf+UmIHTgWlF83jOHIwn79sE2DtKgQY69YYhwQ6s0oZLK+mH51@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj1loXbX6Asy9fadcxZpAAebbmLn8CvUM5O2oIl0rj1mLjOhlA
	c2ZuPIyNjHcr0QHPNRheXBPlYT0Q+/4moZGoLkYvDRari/nb8x6g
X-Gm-Gg: ASbGncvHu8IjdLLmcLGhfwaJlkVXb+cYStlSq837xLqTCNSpgtLTIYyHgD56033jhLa
	+4bGRmk5Z89Wg1luAoIXb1ltnVNsRFZHrc4Ls9j3K1YkeKSIisEmjXHE16BanLwMQcmekfFO3BJ
	FdaBXAdgIt5MFWBrW2zO9aBuX1nt1iR8D5Xj2u4xhh65oe86YY9d7gH+B47lDihEgbG9M5kT1Wr
	pSPpCFFaCuycNBThsMKl0BcWjgd0bEkJ0egy0l2/nLc5lGKpb7r0WNJCexWOeYR0XLwUOJySXdT
	LCUwOQ5W87Z58sLq+L9hBPFKNlCEHp48iR7Mjqp4Ppqe4rdGHcyfK4YoiCnTb/8odw==
X-Google-Smtp-Source: AGHT+IHX9ZtNmNTyHB23rvzYHFaUftoJqAQ5DLhySdmI3cD51IST32BGJ0akFwZxFx5sCUh5HU5+hw==
X-Received: by 2002:a5d:47c9:0:b0:391:6fd:bb65 with SMTP id ffacd0b85a97d-39efba38482mr2681144f8f.9.1745002042363;
        Fri, 18 Apr 2025 11:47:22 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:36cb:c641:13d7:bd3d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4931b8sm3404336f8f.80.2025.04.18.11.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 11:47:21 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 11/15] drm: renesas: rz-du: mipi_dsi: Add feature flag for 16BPP support
Date: Fri, 18 Apr 2025 19:46:54 +0100
Message-ID: <20250418184658.456398-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418184658.456398-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250418184658.456398-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
---
v2->v3:
- No changes

v1->v2:
- Renamed RZ_MIPI_DSI_FEATURE_16BPP
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 0204af85fc64..36b8ef95f20b 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -29,6 +29,7 @@
 #include "rzg2l_mipi_dsi_regs.h"
 
 #define RZ_MIPI_DSI_FEATURE_DPHY_RST	BIT(0)
+#define RZ_MIPI_DSI_FEATURE_16BPP	BIT(1)
 
 struct rzg2l_mipi_dsi;
 
@@ -643,8 +644,16 @@ static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 
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



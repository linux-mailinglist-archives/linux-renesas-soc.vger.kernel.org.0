Return-Path: <linux-renesas-soc+bounces-23110-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D76EBBE068A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 21:30:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DD9284FF358
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 19:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7151230F54D;
	Wed, 15 Oct 2025 19:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R7b9BiaC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F6830F546
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Oct 2025 19:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760556397; cv=none; b=Si68e+TPwHSyCPw6Fz3T8wdmQhnPlTiI5kXM2O1KL7d1MqBR/eiJoUiotQ/cSsNC9u3a8o/nWddbDXAK4rIcj3NxlRyL+RzRMO3T0A7wDeRlPAOSGJ2twGlvRWdcOWNrDnQz7C58Kk3d7b0BDZaE8olqA1Ksy8fIxrXWETXKECY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760556397; c=relaxed/simple;
	bh=BdsJ2sEqN6rODDSWveW3Do2KQsZ9ykXTS6FV9Hcz5/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OOky+XfYx1zizkrVMx0Zi646MfaI9KbSWJj7hhPuc9soIyL5fp5NHY/NIAagzvNzAiz5jp9x1fnRc2Z+LKV8o6S5v6g+hTEGFNn+z4TIjWh0zqmQwzrAhNowy3sFDhzr/tKqKosnGjJW5noAKE493aVR85T9TldFqxmNaifbpAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R7b9BiaC; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b555ab7fabaso6414328a12.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Oct 2025 12:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760556395; x=1761161195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DzeiqeSx2hP+uCSg6LMRTweWgMxjeUkFjtP3zeTP43k=;
        b=R7b9BiaCRAXucLHJvD8ePybVAtvtYJLNXS+XRzmBe6aGxnkdHATgjNq1KyecQ0OGvn
         3mGKXSpS5cMt12MSVBywXMwatbUXubKXWIBfPUY4VI7LPW7r3hscu4Nhkofq6SJ4scSi
         5tsewx/KiCxUS93W/6T8mUeeNQfK0eMKsXITU7tA+j/aYv6i5EwFbB13SwdJgrFMgRTp
         BgLdCy72Yz426AbXl7X/CvhwSsbV5m0GiPQl/qAaV8ybn7NBnZs9+0P7XuoneanW+Zmp
         6cNOYc2AYg7/W9pHu1KQ0MEmG9yHnXlMMoAnYVWIuR8+xDaI/AyoErmm4saTPRuj4VZi
         jfRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760556395; x=1761161195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DzeiqeSx2hP+uCSg6LMRTweWgMxjeUkFjtP3zeTP43k=;
        b=YIF6klR8K12a1C+bBmTi9nncdJfHex4pPsxK3bvNEg6Jiug08v3mmLyMjBcnRsYU6j
         c8/jTP869yjTBawmTdmDvDSJGvrtG9/YPA+6FqzBwQT2EdqrtCkBJnt3krkEgY3aXKvT
         KH3mFS9wtjirulaFSbNi1HPPN/l685HkRIVI4aAnHMleHwtqBdBegWYDg5OsxJBmJEis
         nFNWpU0iP7hES2RQ6500fu5Gv3zX0NhI+f5Qs+cVxGbgofJVPi+XOqccpkDq69S0B6p8
         vW9mLVuRiEr28MllG3DpNUtmt7Kq+YJ5nZ9uFR/KJOvo1BEKFZxlbTiX7Lj7pxJihC/W
         8D5w==
X-Forwarded-Encrypted: i=1; AJvYcCWcC8gaAabvMIMuIHuQHgVDaWj/Ma8vxkz8WpKmF+ZAdHs4N/kanUNFUaXwBPosrhjD1YLwsCM4FzP1gyYZb3OdiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzaz8W+MYG2omCn7uYoNEdJnY63U5qkq8JC/t5A2k63oBrvu6xG
	DdXsaptBAWMPuA4eRdXgjUocrp8GqFKB++opQDelw0NeQIK3QKLM6gqY
X-Gm-Gg: ASbGnctImZLd8po3R9vxuyrlxauijxSPv+GJIB1g0xd8oxaeyxips8o3enzSfKrXd+d
	/erwAzgAr0EMRF2ieYF7e5goZ9bVn77QvfCj2uwlxomdBWf0uSUR8YECmv8a6Ue1ba0mx8MTzF3
	LGWz3Q6N+a0seIyTL95iYXvy/5HPNpzOy0wnd7ZEug5Lz9PR80K7Ek0EDTxDkrRaV2u3zUd8gFp
	TMCeIjzMDykCNWAOQsV+RMFD7F6cSL94Z5puuCu7cfU/ItzV4NdB0sXgI+5Ty08geyMiYK52ueM
	BUXv0vi9KrXi5Yr8PaHoXA6a3aOmSKu9SrgIAoamENGPowki9lNnJxjpXP46SwNCxRF720d26Se
	Yf2fH+5CEEdy8uj4VFm7t1YRJyfVlf7HwcjsjbAKHKxOZZXzp53ROkLuAYBe21H3CFEOqfF3J5Z
	/iEHESs2eBcIdm+tSpQjBJhQ==
X-Google-Smtp-Source: AGHT+IF40uLj5O1VNn/1ilvror5cZrwViGxizn9s293CQe+Duobh8kb93icrEIO0yMNIwwVc30gkmg==
X-Received: by 2002:a17:903:3c6e:b0:26b:3aab:f6b8 with SMTP id d9443c01a7336-2902741ce06mr353175745ad.58.1760556395165;
        Wed, 15 Oct 2025 12:26:35 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:c7d3:f449:63fb:7005:808e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-290993102c9sm4427005ad.24.2025.10.15.12.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 12:26:34 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v11 1/7] clk: renesas: rzv2h-cpg: Add instance field to struct pll
Date: Wed, 15 Oct 2025 20:26:05 +0100
Message-ID: <20251015192611.241920-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251015192611.241920-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251015192611.241920-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add a two-bit "instance" member to struct pll and extend the PLL_PACK()
macro to accept an instance parameter.  Initialize all existing PLL
definitions with instance 0 to preserve legacy behavior. This change
enables support for SoCs with multiple PLL instances (for example,
RZ/G3E we have two PLL DSIs).

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v10->v11:
- No changes.

v9->v10:
- No changes.

v8->v9:
- No changes.

v7->v8:
- Added reviewed-by tags from Geert and Biju

v6->v7:
- New patch
---
 drivers/clk/renesas/rzv2h-cpg.h | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index e020d9624dfd..fe6ab8e3cc6e 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -16,20 +16,23 @@
  *
  * @offset: STBY register offset
  * @has_clkn: Flag to indicate if CLK1/2 are accessible or not
+ * @instance: PLL instance number
  */
 struct pll {
 	unsigned int offset:9;
 	unsigned int has_clkn:1;
+	unsigned int instance:2;
 };
 
-#define PLL_PACK(_offset, _has_clkn) \
+#define PLL_PACK(_offset, _has_clkn, _instance) \
 	((struct pll){ \
 		.offset = _offset, \
-		.has_clkn = _has_clkn \
+		.has_clkn = _has_clkn, \
+		.instance = _instance \
 	})
 
-#define PLLCA55		PLL_PACK(0x60, 1)
-#define PLLGPU		PLL_PACK(0x120, 1)
+#define PLLCA55		PLL_PACK(0x60, 1, 0)
+#define PLLGPU		PLL_PACK(0x120, 1, 0)
 
 /**
  * struct ddiv - Structure for dynamic switching divider
-- 
2.43.0



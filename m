Return-Path: <linux-renesas-soc+bounces-17000-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F21CAAB4377
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 20:34:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56D131B6308B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 18:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9188A29DB65;
	Mon, 12 May 2025 18:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V3BTQtqh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D55429CB37;
	Mon, 12 May 2025 18:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747074243; cv=none; b=oXj8GnTATcxZARVHqroDFuDOrnmCzd+W0Ev73q86Vx/VCaHZ0yplPvsFWjfTI+r8sOqELOtIRvjpBdpJy8KccquDV0QIJxdzOCPAyPpo0+e5cmX0ite/WiVrASCFJv2IxkNCVks3CQDg9jwCPfP40Iyxnz8/mdvCVxSJh0BEG0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747074243; c=relaxed/simple;
	bh=OhEi8UPTUj3nUoYmylVfe7OpN2Z0zcM2ynZ+bA0yB0I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tzca1+UTWu0tKqKgWjELcJg1Dk/77OUnUVqNsOIIUXC7FucE8d6TnU4fOGzfW7LAL0BfnmFPsjjQtlUevVHamIbvSHez9yPrOSAx98RhSHEPHLTDcm2Y/JszL5JbTxbXUNS7O54fxM0Y29AItMIdC6oPO8WLq8LYtXgDJtQAPag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V3BTQtqh; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a1fb17a9beso1923371f8f.3;
        Mon, 12 May 2025 11:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747074240; x=1747679040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sygs6rXinrn6JFsLIiWPRpbWxK0eAR/tbOy5QGMjFQ4=;
        b=V3BTQtqhsrCF3jkrnqZfR0+a967Lh9R+gqL8VGnou9gGXnJoyqWgNZvRq5Y0znZJCa
         IcryoUdu5Zzrrcq70DkvfBPUxH+r4b9xmN8LDyx1uYq+SpSjVPoHI2bfGuTuTg/TxBUF
         AwySeyDPnJGtPI3hGwY2dTDW98BS8T00igBeNufSRTdqGDuBvmUWxVUqLlHh5EQfIeMn
         pgrib5Vzefc15hH42kFNZ0m2/NYMOWnG/caygK3m0yPrXCoCLX0u03UKmHUYUsKm1pvH
         UWxNOYv8MrYZDE9x63CGfBDiG9tZiDKX+gGFGQK5PksC/B8NTgIpDJkjWwCQ2N4PWneO
         ywzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747074240; x=1747679040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sygs6rXinrn6JFsLIiWPRpbWxK0eAR/tbOy5QGMjFQ4=;
        b=Mnphh7W84RFvdyslLQtcfVpomU17Y2FsqlE+ARCbnRp3cOyd2oIkMZalcSsy2r0Jjf
         quVzqpsJCwXrvQBL4NfcFc5TLQmTyVmCWtnYB22vw+WoiBdm79FJM9Eve6+kvuh+ePCs
         hNWeK7G1hRf0P2UoiqAWmdgpd74+ZnfW4CMZlPOTu8ystUyG1OQQf35tOEdmMkV5CmmM
         lpw1jv39TJCrVs7zwsnisqmTPYkJck8vR/b5cOpPnbbbOVIQwpinsX1VRnj9bibSWXBy
         qc4+3LO7GlHgh2hEgLxd4I7FYPkT0bG3AVSm3aCtp0bZvsY3PSNV+F8sVMKEdCEfaI6y
         ODGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUyreUvd4pZ4M4I7+EPjsNO+SuezAlCm8CHhvCqErYgblc2HUTG2uFfoclrx9aVnFBO1TOPleABzYk@vger.kernel.org, AJvYcCWuj8LXTPIJkefoXmScA3hAn3dlGTaMJwAZ2j+9LMkQFzN+XycGEx8vlQKPCeKxdcs6SLVhWy1AtzZAofFG@vger.kernel.org
X-Gm-Message-State: AOJu0YwiQcsH1wLg9jl0wb0yaZUD+FlYeozVsiwR1/ZrO81+GhIDSMGN
	0Uw6NN8GhPrOQj1SbS9ae95neGuogbyYfvdspP6EeEsj+uT5iPlu
X-Gm-Gg: ASbGncsephw6/WveArJa+spCJ5ENRn9kjR31vs2whO9q3zNFIbm9fdX82wz8YsX4Mip
	CMQQ1RZicS72la1/LGtB4aIXkrQZMjK/N6T/mBWQC8zlTx9wWsOkc+FtLZ9uohnlDHRHHXrOL7n
	m3CN3YEZzRd560EM6NBPxRrGQMVwlzdl+icjZv0rYHyw1zQQYgN0Pj/n/D7O0FkcQ6MvgFbhdO+
	MX3kyNdT2jgQyp0TA0v4wEmaF0BA5zP3hZmkPE+tWGLpNpndAHS2LHFmDJWy4UOkRQCJ1STOKHm
	FDb/ovwJ7e1EWFoMef9uHJEtkYoyPD5uZ4bO6XYZ7lKmNM0L+0LmfBT+bWwmZrL3GdMlWOs1Zxs
	l
X-Google-Smtp-Source: AGHT+IEKq2s1lTml5I+MWT4Yibe0cSTyEEgxKG/nTu6BI1H7TNQy4tXVB24MrorJFRRcajmsTbZWvA==
X-Received: by 2002:a5d:598e:0:b0:3a0:8033:1e3a with SMTP id ffacd0b85a97d-3a1f642763fmr12244022f8f.2.1747074239682;
        Mon, 12 May 2025 11:23:59 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:581b:951a:bc46:a124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c5f6sm13175497f8f.86.2025.05.12.11.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:23:58 -0700 (PDT)
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
Subject: [PATCH v5 10/12] drm: renesas: rz-du: mipi_dsi: Add dphy_late_init() callback for RZ/V2H(P)
Date: Mon, 12 May 2025 19:23:28 +0100
Message-ID: <20250512182330.238259-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Introduce the `dphy_late_init` callback in `rzg2l_mipi_dsi_hw_info` to
allow additional D-PHY register configurations after enabling data and
clock lanes. This is required for the RZ/V2H(P) SoC but not for the
RZ/G2L SoC.

Modify `rzg2l_mipi_dsi_startup()` to invoke `dphy_late_init` if defined,
ensuring SoC-specific initialization is performed only when necessary.

This change prepares for RZ/V2H(P) SoC support while maintaining
compatibility with existing platforms.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
- Added Reviewed tag from Biju

v3->v4:
- No changes

v2->v3:
- No changes

v1->v2:
- No changes
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 55a1c1b043c8..e1ce21a9ddb3 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -34,6 +34,7 @@ struct rzg2l_mipi_dsi;
 
 struct rzg2l_mipi_dsi_hw_info {
 	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, u64 hsfreq_millihz);
+	void (*dphy_late_init)(struct rzg2l_mipi_dsi *dsi);
 	void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
 	u32 phy_reg_offset;
 	u32 link_reg_offset;
@@ -320,6 +321,9 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	txsetr = TXSETR_DLEN | TXSETR_NUMLANEUSE(dsi->lanes - 1) | TXSETR_CLEN;
 	rzg2l_mipi_dsi_link_write(dsi, TXSETR, txsetr);
 
+	if (dsi->info->dphy_late_init)
+		dsi->info->dphy_late_init(dsi);
+
 	hsfreq = DIV_ROUND_CLOSEST_ULL(hsfreq_millihz, MILLI);
 	/*
 	 * Global timings characteristic depends on high speed Clock Frequency
-- 
2.49.0



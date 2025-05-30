Return-Path: <linux-renesas-soc+bounces-17720-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3D9AC9429
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 May 2025 18:59:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7EC0169B51
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 May 2025 16:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54E60236A8B;
	Fri, 30 May 2025 16:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UeukLbUu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7723723645F;
	Fri, 30 May 2025 16:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748624359; cv=none; b=YvzHC3X/d602nYUIFnsWhoecesJTbZBlVsl15A1qcl5OBh7E4+9JudlTBvyHPTbYlRaf8U9KyEm3aeTmEyhokYmWWYGlCwoX67TD7P+16p2QDokMDksXMAH60H4/d4Tu+QYqHsgjqLm/km4bYZjGKbdEysFuhk4w065I3l9SfGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748624359; c=relaxed/simple;
	bh=Krzz3zsdevxix2diODTZqd5SPoP9yFJa4nvP/+4ruHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LA7uCL1ncx8oCSoDSkOzPc0dPgZLHoUjCUEi0sXktSsgXINvFiAqMFVQT0Ymz2WY9NuU6+5UIfVEYXFFT0tJViMg/HK57fxrKWvJ7EYRcH4H8HS/oojprT1bRnRId/xrrQgmzq5hcnW8UZgZh1byYyeTOe7Z3MBKnoJVQT858HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UeukLbUu; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf257158fso17047685e9.2;
        Fri, 30 May 2025 09:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748624355; x=1749229155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v1FsGuKo8A34tONAxrY715sZ5lprEztwlbt/0ZyKX0A=;
        b=UeukLbUuAV193zz5LNZgvYijcu8w9B9UY26WDbGldP6wEsfkucX0xmn67VKbe3dx1E
         TbDNokmca9f0u6y1kOradU+93DF+z+ecCfwIDuGjBkTSLNPCuLm1N/E4rEA70nGxlhOS
         7PttTQBs4Y+v6CAwjkpx3e0GeF09cdaMZDMNnherFyzVjgVA/6RP0wMNqIynCT2rRYkm
         rUSlEtjU2soBoiKfNCXrxCaaaGqMJRNJiojAR89zo5dQx6BDZP6SIIdVoTKBIpKTFFIS
         hIZsC/PHPxRPGoUoHo7uzXKpssePfDmJ2MQ5lnNC5b+BviJGUeQQOuXz/LDh12Yg8Iwy
         iDdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748624355; x=1749229155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v1FsGuKo8A34tONAxrY715sZ5lprEztwlbt/0ZyKX0A=;
        b=Zi7zRAIwPq9r/e/jWGoNuEIjU11Y9YdWlTFX41c4TTTShy4+8sVF0o2QV9lPJvmbOg
         9+jGaDF72TakPxqsdzN46SNORUWsQSPBnTxKfwU02DYWvMLeYiRgM/bKqObVqS3zFd2D
         rWBTeMsrRAgYd9djPHcP75G+bU3N8iOq5guQ7QEVVIcchbvUsdbLCv57Blnl3t63Cig8
         9oSLzOcCD21QX2MR+RC+DxmdExM7rBdTbql8CP/f08nuMFrf4qWkOcTXTczwUVBXB7OX
         /yH2sqzJ53jujWisoaUUGdPFoJZDcfJ7WbqQYj4PY60SvXgT7IxSZHIy/WPLbpJ7U/S6
         y4Mg==
X-Forwarded-Encrypted: i=1; AJvYcCUIbGOMF9YKIcVxngZnLaeio7jVibIP1foGTSJGEVLdEmB8I6HoSY87h+ZZ4Yp/FflczUUJfEP67FE2@vger.kernel.org, AJvYcCVRktiONmmLlFSbxk4v31Kwg8MC0buVciJjr434L2mq42fmAHV5THFcwwfQ18DPvq+XiumbRaQHZmXZ3BsDHDGb6xE=@vger.kernel.org, AJvYcCX8WuqFyGApik3ye0q+3zsNNeXkZHWYZ1PjXWnpprEnOXRnK2gYREizhYy7HCrSA+aov/eUiOIdinoDaC+3@vger.kernel.org
X-Gm-Message-State: AOJu0Yx59qOl4bmB5aqhORHmpQVftTrZ3KT8MtYrhLZst1gDbCJBeVci
	enz9wo2btu7spyTPOCYBgL5AawR/MOBOlaptoLDCetFyTCcgf/BAv29U
X-Gm-Gg: ASbGncvai4+ajcnFIOD2ba9mBBjFbJ2ou8y0V9Jrju3iZ9FbQkimGNt5Ao5rdZuyAxN
	cZumkZevA+2514A0gGLBkN+/P92uFlcvTNKcvIsmfmcrP7F/NUdrI0rkJDyGv2vxpWQY1PLzKYE
	7bk55Br17uJniXI6Hc57GxJQji9kK4DCNX6uSWNdWlEpyvMfL9RelVF7UKvxSWaOS9GJNN0i3i3
	w1aHvi0L2OBGvuNYfNqQUQhWzBdSwzZxvOMYPmdD1tfMrpsNwQAu8wfPCRVlWhBzOqSkxbZenah
	H1w6sBIX38LO53+Et91ZfHzzxdEL6fs5BRDcuK60dtemf/ViO4rFKuJTyqeRtBxSohzF96StOtE
	NwshOAAJEjg==
X-Google-Smtp-Source: AGHT+IEpj0CipGG3bDQgM3jXnJkIIdRrH6Y84XyBvr7Pg8ex1kKxt7Ij8cYeA/TKswgMUHF0SrV5sw==
X-Received: by 2002:a05:600c:4fce:b0:450:d4a6:79ad with SMTP id 5b1f17b1804b1-450d887a68bmr27452775e9.23.1748624354623;
        Fri, 30 May 2025 09:59:14 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:bcab:7ec7:2377:13b0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f9efa3sm22733455e9.9.2025.05.30.09.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 09:59:13 -0700 (PDT)
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
Subject: [PATCH v6 03/12] drm: renesas: rz-du: mipi_dsi: Add min check for VCLK range
Date: Fri, 30 May 2025 17:58:57 +0100
Message-ID: <20250530165906.411144-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The VCLK range for Renesas RZ/G2L SoC is 5.803 MHz to 148.5 MHz. Add a
minimum clock check in the mode_valid callback to ensure that the clock
value does not fall below the valid range.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
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
index dc6ab012cdb6..6aca10920c8e 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -585,6 +585,9 @@ rzg2l_mipi_dsi_bridge_mode_valid(struct drm_bridge *bridge,
 	if (mode->clock > 148500)
 		return MODE_CLOCK_HIGH;
 
+	if (mode->clock < 5803)
+		return MODE_CLOCK_LOW;
+
 	return MODE_OK;
 }
 
-- 
2.49.0



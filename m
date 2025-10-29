Return-Path: <linux-renesas-soc+bounces-23849-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7C1C1B741
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 15:56:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48AEC568476
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 13:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E01D3563DA;
	Wed, 29 Oct 2025 13:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="KjsO/YA9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D163343D6C
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 13:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761745055; cv=none; b=UAiOFWrtvi5/+dmFTXyt6skj1JsCgB8foQQ4XIOzVTz5bZ28MA3d2iqmCKYAZIOZtgnI8bON1/Pd2F9xMTGbZ5hfkbAMP3t74yxBOU2pi1AciCm2ZAXKeyXBq2jFiTjiHPzl+eaG3/P8GumSoN8Lr53ncXNRIFsgTCOw3dGNySQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761745055; c=relaxed/simple;
	bh=t7G8Jycuz8+wzAu2xCWQPBZrSzG9Z8VIdsvKbiXuUuk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cH8Z271tuYsQ9LSB0VvYo8uoxyb7AxdJRGYhZHKa+s36BHYPGaG3pYpaphdK3Zz2CSZfKMhTIOK8pfkjKeMxSkfBTzgV79PKT3iiyUpgG6GhSvwhXCic1e8b1Yxru5LW9OnUGVP1aZv4GX8IpHkpK0VZ+3PBY2wFhd/L392CZuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=KjsO/YA9; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47117f92e32so67340645e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 06:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1761745052; x=1762349852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ri5sAKlO3KnC2SWKs6OABcUyoM7Qv96rgwkPvQx4cuk=;
        b=KjsO/YA9MG6WQzHJwhKGsQsWI9xGrV7ICzsWm+5fSdiGt8oPOl0CiMP+cOruXtMPMc
         mr3ygzSxIsSia9E932EHbkwS2fRzksawDCgFJCQZmV75NRY1Ld4ZTlg4fbRTJrKMoqde
         OSFURz8CKUdWaOL0Euf3jjfSayOGnG2q7pLF6k8Mhn9d5e6vx8RBm0r5o3ayDo8N5Xjx
         CQLlC/ZXE9nnE+hAiYkthbt6wt35c37hNwA1I1egDnIKuuE8thHQV0LfDetp+EeKI5Pv
         6f5HrsUnOg+xp+MC/zmvKTCDuxj6s79frWmyNWLyGBDBhTbG8/bYhe2O/86uHbhi8lDC
         7Uag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761745052; x=1762349852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ri5sAKlO3KnC2SWKs6OABcUyoM7Qv96rgwkPvQx4cuk=;
        b=MbiOyxN7LkCM/dJKdyeTC2bC+mDVQyneabUERWkCKWYg45psUK3pJ1lEpv8gOHIWxn
         7dpIAQcnmz8/7W0wdhcatVhyd2XV3Be6Pphrn0VNB9S4gxCy4ncO1LnhGg09qIHR21tS
         mGgwBMF04No6ERaALIb7xU6kZFRsYUcZMIJdSK6HEriPi+akSyndQbaYSRsH5Fj4PsAv
         73cH5nqpTcNz+sqr3Sfb/s62BxPkWzxF+EGeE6hRu+7S56bIou66pDjj/dT/6S72vI/h
         h2/x8evmyCWZFY9Vm3TWS7rx9eF6pAi0p6lzKwIAw/odQoSAjCWuGDyPY4DqqQojL5Em
         V2Cw==
X-Forwarded-Encrypted: i=1; AJvYcCXf279xREdDv0aM76HXB6BqS3Eprv6ghxVQQdOieHZ10OLnwYh7nzZdxM55fS+u5IYpYRkWWC8WFfm7mJL82LYP5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFi3/emXzyjCobvFoINw0ydoiKeXiWVY9fkosZ9g1WzqI67kHh
	RME2gK7FxDVlVoZa++HsugY2tRuuKGyg+Pt3rzhuXE2zuPPcINgqNGPEPSpMluipDx4=
X-Gm-Gg: ASbGnctwUGaGfjpJB4Ccp94FpbDyEvKjM6Y4gRzW8ZFkV4zCUbEz2wxZSfRtlcQ1kiz
	NUJfbXvfOn+Ve3hmcaFKa0ExDyIN3RTyspuTpn7E50paFvW52PoMY/wl61ap3ahThLKe9eURMZW
	oDTD9r2lKAMsbDsCgJwjvyc4NbDOfDhnWg1a8PRrfw3NJ8B/3FSPOhYcMHjAYFQOvJRHHYm4vl3
	3wtiFDF4T3rOlOqSXvMpxKJD+LPk4iXKCYuhkfai4BNM3KO5DuK/RYLwTasVXvbCUkx6bTy6qOu
	5IzqJtTsEM36Erd/3nDb0WSMlZWdqEHZ0wt/1x8jzhRQBtk7X/jwD5GerFBSZozYfBsWSTR/oy0
	Cf+fHmDkQgExru5oSsNDNogrjD2KO1WHcAQ5Jx6+269VA4PNbGnTNtqFW1AVGXm8nDahGbI5XQP
	mV/xiW93/t3uLIWcaQNi5y/rLNNx5d0fHMgyhy3Wu3hwGT8V6RB5vCBfOEzQJT
X-Google-Smtp-Source: AGHT+IEJDplrheJ48QLqfg/pR+eu4ZCGROUq/p3ZBNkawUoNXH7zM1oOgMgH4Xfw2VwWuaEypaznsQ==
X-Received: by 2002:a05:600c:3506:b0:46e:345d:dfde with SMTP id 5b1f17b1804b1-4771e333bbbmr23167265e9.16.1761745051964;
        Wed, 29 Oct 2025 06:37:31 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6302:7900:aafe:5712:6974:4a42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e22280fsm49774795e9.14.2025.10.29.06.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 06:37:31 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v6 6/6] arm64: defconfig: Enable PCIe for the Renesas RZ/G3S SoC
Date: Wed, 29 Oct 2025 15:36:53 +0200
Message-ID: <20251029133653.2437024-7-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029133653.2437024-1-claudiu.beznea.uj@bp.renesas.com>
References: <20251029133653.2437024-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable PCIe for the Renesas RZ/G3S SoC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v6:
- collected tags

Changes in v5:
- dropped Tb tag

Changes in v4:
- made it builtin

Changes in v3:
- collected tags

Changes in v2:
- none

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 1d2d1458bef0..ad314b82423b 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -232,6 +232,7 @@ CONFIG_PCIE_MEDIATEK_GEN3=m
 CONFIG_PCI_TEGRA=y
 CONFIG_PCIE_RCAR_HOST=y
 CONFIG_PCIE_RCAR_EP=y
+CONFIG_PCIE_RENESAS_RZG3S_HOST=y
 CONFIG_PCIE_ROCKCHIP_HOST=m
 CONFIG_PCI_XGENE=y
 CONFIG_PCIE_XILINX=y
-- 
2.43.0



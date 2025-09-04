Return-Path: <linux-renesas-soc+bounces-21392-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCBBB4477F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 22:40:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77A64189282F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 20:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1113283FD8;
	Thu,  4 Sep 2025 20:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bczAFqoN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024BE27FD6E;
	Thu,  4 Sep 2025 20:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757018397; cv=none; b=JaH92LOCrZsPJx0mfuJHzL12DMfIOqu/rczK8jrdtY/LMqEyJWfRrhJA/3wiJWS7LxjRerzZQDTAAPtADmF5map0zIbD/A133e2Nb08oBMm+KKp1Kuig3NA9RRyDcs7hJZoaYYJ7lHEkEm9FFhdFPsBHleQ6p1Jl7wOntgt9hu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757018397; c=relaxed/simple;
	bh=qBbf84qbpYfIyRKI09kYibrU0/vN+cNMLuXKeL47YPI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uubuj5ySsfA14d+DKDaH1iofMXi69I74bvWEeTp5dZpHnLQw/IW6qYrD+GU+SWUeZQNTxW+ZL/rQQpuc08/WTkTPodf+f3QowfOj/G5p4hI17QaWDNeg2ML91j4K2XtHJn9Qn/0mzMqL5Yqbwo6vqHReU2D7PO3mKfjxGsCHCvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bczAFqoN; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45b84367affso13422825e9.3;
        Thu, 04 Sep 2025 13:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757018394; x=1757623194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VHuZOG1JpG+6j+YJABc/R/0AWg29WXqcswDzV+63td8=;
        b=bczAFqoN7cJ04bI9GRCXZTh9sHBGz/31Y8m50dHoXRETZVwXJw+hA/Gxa8AJtoImKL
         kLojaNJXKAr/QTKfd8NwcJO75Gsd+8rI9Jd2BZXJ7wu7Wa5OmXvh7ELzna8JS0a3lSEX
         OE40ord84rw0MQ7sYBSqkP2Wxk6DjosKcEAlzL91YkFv+JhI0SOUck2YLkBv9IVuu5YA
         NL1W5iJIBQyM3NTlwVtsb8QPeOHLAr92aLGKdgTUb8g2Dr5HXTNkyTfgrVExyxnPxQc+
         A6+sTPfxOkTXkcQSD93i4c60JGgpaReDaw5DowKAgGXycelbDeim8cvcMG7dZ4imUPav
         2tTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757018394; x=1757623194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VHuZOG1JpG+6j+YJABc/R/0AWg29WXqcswDzV+63td8=;
        b=wPVkFsfy85xJwkhyZc4mw87WOa+Ka2YVxDaCAzUUm9wtnlDiUz7tolyS9ShSuulwVK
         baqvHCm7TtSCs5WyYbtHlHHqwZm2Uh9FZD6MQO9lVedbaBs3QmsG/Zf9gNSwovaUaBsf
         6ITNBkux2QAY68rtgGy952TnEcsDDgBoG+bQTramr6ge09aq0o/wguomrWSZ+ZPzJKUo
         YnRe74UfoHFdIbG8DdiOSNsongoGTun297ktksXNsejkkbaGWjHmAWVKp4uDWIwLhAtM
         dWdDNXVx9kxAZm11KA7g52F75AN7ndUE5RlVt4r5oFlsNyppYHI47Cy9UGy4YmGUygEo
         HUOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCktta14knRQR8ugK0dfI7Vwo5KOYoKPtYycgejJU8LYBRzD8SsbpGflZwst2eyBAmiIyxqFiquSWuanXn@vger.kernel.org, AJvYcCWDFueXyTPpjnYzALxrCWDnU4mlCq6H5yw1LVv9+o8LEa3pS+eiJ0STgmNLRjj5rXGRuRLZ7IDGlRgRtqSfSrTvF2E=@vger.kernel.org, AJvYcCXAqRjdUVv2t1UGGnsJVBOX1Zq8rZXyUlgLuBBZUo20T7WqTOmr6jJHCR+UKt+lSRdvvkUIUDbXq9VI@vger.kernel.org
X-Gm-Message-State: AOJu0YwU9iz+koSZU+1t66IsBcffkPxST8EX0my/PXLqVBlU+xL+uRqN
	O2dbEznFp8Ccw0kZHJznZp1MHKbPuLv/ql2MRd3s2yXE2mJ4WYB5WLgG
X-Gm-Gg: ASbGncsHVdPANmtuaheoxCrzsQEc+7QU3mUdYV5M6AhzeVgZ9zv2+mHY68F3RyJkp1j
	cjRFn+OLauLmgp6gL2DFtMmSr92UYpuiI8zQlewmzsyfjEsZCDMVqlI2cVRrYQQvByof92ytlpV
	rehFCJXG2g/lQ/JyzvgjuxnrgwRcb9pTHh22UcB/lMr/UTGUOV7SpnwA7DYVZ9lkibzbQWY8hqS
	mhpiFaLUU0gnnTHBZDyOYbRHIIkGcjGRwUiwydi8GUm+8qzBWRPhfthYV32dHKzUQl9XlJqamLI
	j6x6tc5eT/7feaVnz7yxZtMFDLeZtGM1K09Nz01RCYMdm1klGu4d7Cmm+H21nnIc5McHby4repB
	9quHOyXm5qH1IjPYhKcAguJLNFdkd4dEV/f9A0IkA+fRhLwkBvwgTQKNtaw==
X-Google-Smtp-Source: AGHT+IHlvUXFtdZ6T+mhP6WxjKgMVUGGmx3Q9V4gCTiNFzGUlsXnsJbQjfN4KMrRuKQgbFoPLcI9rg==
X-Received: by 2002:a05:600c:4f81:b0:45d:d1fe:804d with SMTP id 5b1f17b1804b1-45dd1fe8388mr28814195e9.35.1757018393660;
        Thu, 04 Sep 2025 13:39:53 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:904e:70c8:edf3:59a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f306c93sm385528165e9.14.2025.09.04.13.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 13:39:53 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v2 0/3] Add GMAC support for Renesas RZ/{T2H, N2H} SoCs
Date: Thu,  4 Sep 2025 21:39:46 +0100
Message-ID: <20250904203949.292066-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This series adds support for the Ethernet MAC (GMAC) IP present on
the Renesas RZ/T2H and RZ/N2H SoCs.

While these SoCs use the same Synopsys DesignWare MAC IP (version 5.20) as
the existing RZ/V2H(P), the hardware is synthesized with different options
that require driver and binding updates:
- 8 RX/TX queue pairs instead of 4 (requiring 19 interrupts vs 11)
- Different clock requirements (3 clocks vs 7)
- Different reset handling (2 named resets vs 1 unnamed)
- Split header feature enabled
- GMAC connected through a MIIC PCS on RZ/T2H

The series first updates the generic dwmac binding to accommodate the
higher interrupt count, then extends the Renesas-specific binding with
a to document both SoCs.

The driver changes prepare for multi-SoC support by introducing OF match data
for per-SoC configuration, then add RZ/T2H support including PCS integration
through the existing RZN1 MIIC driver.

Note this patch series is dependent on the PCS driver [0] (not a build dependency).
[0] https://lore.kernel.org/all/20250904114204.4148520-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

v1->v2:
- Squshed incerasing interrupt count changes to snps,dwmac.yaml into this patch.
- Dropped un-necessary blank lines.
- Switched using "renesas,r9a09g077-gbeth" compatible string for RZ/T2H
  instead of "renesas,rzt2h-gbeth" and used it as a fallback for RZ/N2H.
- Updated description for reset property.
- Added pcs-handle property required for RZ/T2H.
- Updated commit message to reflect changes for patch 1/3.

Cheers,
Prabhakar

Lad Prabhakar (3):
  dt-bindings: net: renesas,rzv2h-gbeth: Document Renesas RZ/T2H and
    RZ/N2H SoCs
  net: stmmac: dwmac-renesas-gbeth: Use OF data for configuration
  net: stmmac: dwmac-renesas-gbeth: Add support for RZ/T2H SoC

 .../bindings/net/renesas,rzv2h-gbeth.yaml     | 178 ++++++++++++++----
 .../devicetree/bindings/net/snps,dwmac.yaml   |   9 +-
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |   1 +
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 109 ++++++++++-
 4 files changed, 243 insertions(+), 54 deletions(-)

-- 
2.51.0



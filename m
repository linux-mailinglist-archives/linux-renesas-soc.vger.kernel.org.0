Return-Path: <linux-renesas-soc+bounces-14606-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 424DFA67E5B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 21:57:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86730189FF0C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 20:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28677212F9F;
	Tue, 18 Mar 2025 20:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YhIXgqnh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B5A1CC8B0;
	Tue, 18 Mar 2025 20:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742331474; cv=none; b=JRAIbes8nLHLs8Fk7LOBcsoXz1jyw8SWFrQjvzXHAPPeEP/EJYoNA0nmAubEEB8evz1Z44iWRn8K7D1wB7ruj5L4UORD9ZW6+N0mzO1L0BBMQC6TRPZqy0HvUqftZq4IO6A1iDdHmKcUPpyAztge3HizjyD+KoD65T88CkloYd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742331474; c=relaxed/simple;
	bh=+QF/4Y17DE/+jHGS5sYMSyHmkRCgI8UFAzLvZbgN/ww=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WKF0suGEdqhjhZbj7c7yphRV8C2pZ1PA7UxgZscLkbbDl+9Uw2Ky9O6MbjhX3SpxxIoW1EedDNn4Mo3cygfuP8SIgUD8RnXdG3ru8qJNh3H6yuQALR362o/+XHVwtJi+yms4gAwdB0iyLgrSgDQJPXNA7bEFXvQ5Ztw90JZ4mVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YhIXgqnh; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-391342fc148so3948974f8f.2;
        Tue, 18 Mar 2025 13:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742331470; x=1742936270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qK6WDmO+Tjf1RVbHis9ZC57Gu1PIwiwGXpHUB+ON45M=;
        b=YhIXgqnhSYNFq/K4mR4d0rp3XpDwrEbHf5aU/JUt2OPalQp+UAuDJewyGEA+lUM+hc
         E9avZ6p6WSHyW49oX/dk1aQN0Qxr3pRJOrIkmBpfDGL52cB94O3l3ssYawKndEp3gslJ
         muYZJj84dOOM9WZ6IDLLLlf3Iz/U2bJl4gY0beSLTtA3NVhB875+QAFPZM0hfDufRn0S
         YMk8yrNQ9o0cXIpdvvy/sockmfRCHrX342VvZ+i/6YwBnv+z3r4/oGEgpGq2uYm/1hAM
         7Ntc5XefwRHbIMnjCdvjc7jr9SK5RNcn2Shd87m6sAaz/pG7k1bV2tn26h8YVvhfvpcE
         aeMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742331470; x=1742936270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qK6WDmO+Tjf1RVbHis9ZC57Gu1PIwiwGXpHUB+ON45M=;
        b=JCN0llS/JQSNYsWabR2ijsTRVnqnTR+Uo3IzxPzLK9Rp4zWzGa98FDY97yh0ek57L3
         BQ+RDnOF20MIia48Ne8SoLWRP2/O2yJ3eW4Kw3R/BNTUJ/VTPQikkg1jEBlWj106UP+5
         Emd/sL75SdAbIsXMgEjbVvmRrGC//wKF/YyqZQFo6NYCbFq213l0xwAOmkH1QK47nxdn
         zeuXgV0/yZvSEZyEM90jKWp3gfZycouFgbNnIg6Z9hfs2ioH2BVXtWWMwExmwVsziPm2
         ZY7J0f9hq4wi7tsQOsQ856C2IsoQm+/ScRTo7mawaf0vymHW//5g68bdHFqnEu9dZDH2
         /+uw==
X-Forwarded-Encrypted: i=1; AJvYcCVMtlo/2tT+jUxhOnvsp0CFgOHEIyl9eEPBXNF/gbH5btqJ+ZNDBcR13WsJ31XEfsBsiIV2Ogt7@vger.kernel.org, AJvYcCWR7MxvmbAHWxVHpyFjdljVo0lZqcn7btpVpFE6xweqf9WVHfCpUCFFgJ73Q8ejwaw/u8H+CxOllvVBgibApLQ0lec=@vger.kernel.org, AJvYcCWx0QtAxq8VRgO87BJZ8d6W5aS7g06dTK+MrdIuUFGNARbWSBTbfVqKr9AL/eIk4yXKrP8qh6l6gC/gxsQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YySJl9HF7pwo6ES24tA1iuBjEtOvjtRpi81WoXOx9dimVJIrCm/
	jPVO4RH95flb4X/DWC38B4+DCNiYd+6NnJnuEIh9JSAoTNlpYF8C
X-Gm-Gg: ASbGnctOUfeSJET1Wfi8Nwml9mFfdhaTMRwG84CvOCO79yxyExtp767XqTKZ8Vlf+IM
	tSeQrpWFdPcQJ7/Xr0LbhR2zAUea0vRyCQWTWh0GgpO8pWYQayhFXlmG+Bjgl7vWErZ3pzQxEuI
	2Pwzin4+iChwf0gKnKAoooMSaM/mBM+j3QzF+RexCJfBcr2jMzev27uHk2J05Tvszi6ESumIBr/
	6u3Cg9JA3VVVHJWtACUrw0h32hdxMBvtS/4ALJSQ2yAm38nlHeZ2cwWt/TuUaBP1UZIyL7UOaUd
	clSi6nz6stPNYNDqc7njEZVGQElLGCVFVbkwk+VJkGLXLHaHE501tL5qveH0Nk4c+nx9ug==
X-Google-Smtp-Source: AGHT+IF1MO8CJGLDOJKdce4PEDIO8LKdl11+YaVQAXuzhO1IA9G0bNro4xRgm7hSoMpdpH7wnalr4A==
X-Received: by 2002:a05:6000:1564:b0:390:e535:8770 with SMTP id ffacd0b85a97d-399739bca2emr240275f8f.14.1742331470532;
        Tue, 18 Mar 2025 13:57:50 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:9ebf:9797:69d8:2d33])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c7df3537sm19212864f8f.8.2025.03.18.13.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 13:57:50 -0700 (PDT)
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
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	netdev@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v4 0/3] Add GBETH glue layer driver for Renesas RZ/V2H(P) SoC
Date: Tue, 18 Mar 2025 20:57:31 +0000
Message-ID: <20250318205735.122590-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series adds support for the GBETH (Gigabit Ethernet) interface
on the Renesas RZ/V2H(P) SoC. The changes include updating the device tree
bindings, documenting the GBETH bindings, and adding the DWMAC glue layer
for the Renesas GBETH.

Note, this patch series depends on [0].

[0] https://lore.kernel.org/all/Z82tWYZulV12Pjir@shell.armlinux.org.uk/

v3->v4
- Fixed maxItems for interrupt-names property
- Maintained reverse christmas tree order in renesas_gbeth_clks_config
- Returned err in case of success in renesas_gbeth_probe()

v2->v3
- Fixed review comments from Rob and Russell

v1->v2
- Updated commit description for patch 2/3
- Updated tx/rx queue completion interrupt names
- Added clks_config callback

v1:
https://lore.kernel.org/all/20250302181808.728734-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (3):
  dt-bindings: net: dwmac: Increase 'maxItems' for 'interrupts' and
    'interrupt-names'
  dt-bindings: net: Document support for Renesas RZ/V2H(P) GBETH
  net: stmmac: Add DWMAC glue layer for Renesas GBETH

 .../bindings/net/renesas,r9a09g057-gbeth.yaml | 201 ++++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |  25 ++-
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 165 ++++++++++++++
 5 files changed, 394 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c

-- 
2.43.0



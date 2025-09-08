Return-Path: <linux-renesas-soc+bounces-21556-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF998B48ACA
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Sep 2025 12:59:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 901421896562
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Sep 2025 10:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 052652248AF;
	Mon,  8 Sep 2025 10:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FhPm/EQp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F86189;
	Mon,  8 Sep 2025 10:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757329155; cv=none; b=SPmqSo/33mbWkgJGgz5YSvI/u5bT9+OGGvum1nKB9UfkX9hebffAKpKwslO2Snd+20Xmw8Rzb5a3LVdH7tKfJnYG0rvzHZK0AtyhwwV7Z+GJGRboyB3lBGvEkmF4UwsqWv1n2NbtVw22PgGZMtLeUSiZ5GMzBwEWQ8Np5teRn4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757329155; c=relaxed/simple;
	bh=CNhxILeWIROJtkzjuwOixsLIs5eaP6mYdGrzHbxJbXM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eqYCSVw+TggHc2hMPDrQABHRjpjwAW1jCOFSuzQ1wb7+InPqPkc6mjREg4mp4SQblOEGZUtMBto1XX6zOWpytCeug1Zxm2t3zenMUudFKQOriRO+NUkm4aN3znc1/3xV/rSHCQoELlT+4crn8DkxzyY9gXuT6gWmcgzp/vu6LEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FhPm/EQp; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45ddc7d5731so14333795e9.1;
        Mon, 08 Sep 2025 03:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757329152; x=1757933952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M/o3gVX4A+pC8uV/C9zqtdbM1sj81BgITs/nnRizczU=;
        b=FhPm/EQpfyq9zEdoGKJx3Jb9D8/l//dqtbJaskajRNM9+WhTOPTUhH3ttFqbMDOvwN
         WDdh3mKnTLaN6o2XsVwvBx6GUzRxjGwgY5lpLCXJUmTTclZxDgBaKK91MNgnQoTYTbU1
         eKqs3M6pUAlobXjB+QVg0pKK8ahgMP8x9QxJzPhRc3ZrOyWZbvibBD0RtLKjozZ5OrOG
         tiS0Y4YtEhbohlIwNE7nQmD1jdrUzldwNvKxHX/DdEbNzqZ/m19BfxQH+e8OnIist8DS
         fZZnF9AnDLELa8bbSfYDscZvCmbfJ61L234yJgW3+63hASFRDKKrLNK9jYgyjAzo5HCE
         qrag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757329152; x=1757933952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M/o3gVX4A+pC8uV/C9zqtdbM1sj81BgITs/nnRizczU=;
        b=n5pQQ8g40FfKLP1KYNMhuCnhfiwttOrouhQvItjMqJF5VtQtbVSq06JBZTDy9N2hKv
         MwYZVnJ9QQ4CY/bb/9R5XSzUmFAzVdifYhUhlAhZ4NeI0/3DHiMwaBoQwX3DJyZlwYY0
         fopGLPxPwwsYjCHgIAwwQ/h+x3zWch1hB9OLTgCX9xtQ/KaHMft1M6tpcwU0yj7VCMYl
         6iaNa7fuj5U1QS0KCtwcAuMY1kyVBnxhWtMHEql19sutU1sHS6QBn18cwq/T07WLGTLv
         QJ4zHJ2tk+Blkx4mPqDCVwFNqFA2I/CRb0UMvKS5nihMfpBr/bW+4AwM+ub4TBODMaqi
         IDUw==
X-Forwarded-Encrypted: i=1; AJvYcCVH48vXUPtud+cbCJK2fUhyv+4/W24zoEc2LXnqhGu18x37ZVyiimHjDfuoZzLQso4KjsGhty0Z0OwgvLIlL2PMtJw=@vger.kernel.org, AJvYcCVJKDGXb9gPX4v8RiXnEAkMUjXS1VZvRt8V4d+HzfsIWdpcyM0Bus+soyquvMGA7VKVnRWrs3zj9q8V9wix@vger.kernel.org, AJvYcCVwll05yxQ+dn3uPDWM7amEKimunz2UNgctToqWzy5KlXz7f/Kp0aWsm5sH9kllMI2bEkaxoyB1AwsN@vger.kernel.org
X-Gm-Message-State: AOJu0YxOf7Z0M02DpdnJ6NqrjZKBzIvcWNJ+klaIuQ1cJe8md5PzyvlJ
	NNZg2GLiR1dkD7+7p9Sbc+qIyPaC+zU03UJ4+rtGJnA/0aqtdRMto3JO
X-Gm-Gg: ASbGncsgb4DA10+VRJdcrguTV+it2FyRJ0SesHg1HcdzbSFgUXnkr42HyLNRqCitjiu
	Bw/Is5Uk/pCIK+tdSQVOwdq1W6x5X1pPLNirgf4r2eaLlHWyPALKeup/EkmUNu4XfSRVrom+A6D
	2JWK8VGROYJHzqTJMA9bVz4A6GOdMmv+Y9fKtFbke5xe7Zu0jsmIPhs50yUqL/zGRJ1LlvNrcn6
	eNijHCTjaw3jBKUqr2JGBEEN8MErktaasZvv0qcJ6eIsMLXX19IM/r6LhB+UO7jslj1lojsH7ui
	3z0ok48SET2spBhsrjj24kKA7Ha8+ZM/ScGKKUYVav7/cU/H35j4+7QXeRA89i50IYqZgXjIjOw
	+omBrt9wyljdgDwPbEUv1YC5llIq6RoUE3wAha/Cbv/lgFj01PFvlbrAKVA==
X-Google-Smtp-Source: AGHT+IG6IGAiVacXOQNaZCh79TsdsAnmzFtfGBHM8HXzbwbzvmmNbEzbLXTJmKcec+tTtlvN5FexMg==
X-Received: by 2002:a05:600c:468f:b0:45d:dbf4:888a with SMTP id 5b1f17b1804b1-45de6da472cmr20141115e9.25.1757329151701;
        Mon, 08 Sep 2025 03:59:11 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:393b:4605:1f6c:eea1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45ddfe0b654sm91063195e9.3.2025.09.08.03.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 03:59:11 -0700 (PDT)
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
	Vladimir Oltean <vladimir.oltean@nxp.com>,
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
Subject: [PATCH net-next v3 0/3] Add GMAC support for Renesas RZ/{T2H, N2H} SoCs
Date: Mon,  8 Sep 2025 11:58:58 +0100
Message-ID: <20250908105901.3198975-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The driver changes prepare for multi-SoC support by introducing OF match
data for per-SoC configuration, then add RZ/T2H support including PCS
integration through the existing RZN1 MIIC driver.

Note this patch series is dependent on the PCS driver [0]
(not a build dependency).
[0] https://lore.kernel.org/all/20250904114204.4148520-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

v2->v3:
- Rebased on top next-20250908.
- Made sure STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP flag is
  always set for all the SoCs.
- Updated Kconfig to include RZ/T2H and RZ/N2H.

- Fixed commit message typos.
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
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +-
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 108 ++++++++++-
 4 files changed, 248 insertions(+), 59 deletions(-)

-- 
2.51.0



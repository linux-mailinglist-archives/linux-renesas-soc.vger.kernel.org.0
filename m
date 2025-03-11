Return-Path: <linux-renesas-soc+bounces-14298-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA8BA5D26D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Mar 2025 23:17:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC444189CF76
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Mar 2025 22:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BD72264A60;
	Tue, 11 Mar 2025 22:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dhlfRA1k"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9ACC2F28;
	Tue, 11 Mar 2025 22:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741731470; cv=none; b=hrVnN/M5ZwmwuE1SC4FwAMTkLgP8860heGCUuEUQlYG5KMg8yzS1jEceRpOs+R6vtRw+dutPSEDkQPRPYbP8ITTbgMa00ZK9odzd+Sc1qeDXMQVsrm8hf9LkmnH0R/JgHtjad3b19TT3w9lZZIkVPCHq8CROWYwEz9u5+LjR5vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741731470; c=relaxed/simple;
	bh=8LL3+meWsyaz8OjSS5WaTy496hES2f9x6cLcBpXYFc8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Glm2CW37p3QT71+bxNS9BlvG0YXJpbRY5JJi6jENYzys9WqVOrLNVy2OBTTrHiDwCy92aA25Zf6B1/XwmBQjgHrI6LLzaxqLzGz8Xc2EKyHDiZ2gTNBtUemjf2NivM7Bexconjca30loVley4civeEtp5S85a4Z431gyq5rsCWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dhlfRA1k; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39130ee05b0so3805492f8f.3;
        Tue, 11 Mar 2025 15:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741731467; x=1742336267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tYXyyWFY0xL5p51r6iPMqU5AKKX+dTA4cwoGj0qINBE=;
        b=dhlfRA1kWvG5XcBSS0xaJ6ftEfwyXK7jLGwZBKQNMYyD8PJOVE9EfM+0+1+jdeFGg9
         sLtHYN70vOPNuM3z/+t02RWaT2oDNebdtYellPWHxMXBHEPSXhBu2qCvu+g7nKtX0/sr
         MWDP0UDBlarohH401ubbmRI6gYZHk3cBa5ZAkHhfJ8YOoie34SFuSzIRAoKv6yYdnf0u
         mML6Fw4EFk2PsGz40qMqbPn+3k29k4dNmX1UJpASmBNBQnNCKuYDM0vV/BAbgRSuFTOT
         0GmgSXNqJBCLH+npRkhGD0l0zZqccFT0rFBsEOlwa6/7p6kpbRC+w+27ty5G9y7p65SM
         OfUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741731467; x=1742336267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tYXyyWFY0xL5p51r6iPMqU5AKKX+dTA4cwoGj0qINBE=;
        b=C2HTEK6Jb93MTYqGZVGODkVXFL946HP4jYA0DVtFnOBFK07a6i+2/BgzcDcehmibiG
         Rt3JALSXRvXFNy9uMYvLuSFZKBasJgWc4yU2MVnL7nU30lMM2X8Q+SGao5FaRRgWh2Jd
         vavKpCuljwufjjwEbkxGLROTF2N3oLbDi9k0Jcx4fhga9wiNaTE3MwyztNxV7y8Ms4TL
         b49mS0oHIoGYlrkkiKgjXgPx8DyI8JrYVBxEhoZ9AY8tCqY9uAh3kn5+Kn5iF7qXeb62
         GiE2O+GeCw1rKZ/G1u1361CBNd9W6mAjDRDv6uOIENMpMBC63SNKh+meyJHbdF0wCcnU
         mF9A==
X-Forwarded-Encrypted: i=1; AJvYcCUwcsnL6GvEL/5uH0sCYhacehGns7UHdVYo68DPD6amVtTregFfI5wnpmK8d2GtAgU9fXrF4TO9v9HB@vger.kernel.org, AJvYcCV95c5L72/xiKMNYHMybzd+rVk6oV/ZiSs2Fck/KixPWoxPVbXeNIan3LhrkCWLVR2rrUOMUDF9HKYknAQh@vger.kernel.org, AJvYcCXcuv8pS7RbwO7/0R7M38/A+R2TQBxaiPSu9n6Mp1mM4l5+oDTt/rnIDKOr0zAjp7Vx6PimrdazkXOKssdmI5NzyFE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7z+Pb0LvZBFtEC1+Q0Xe9RuFYEMMiGmQVepv2BnLhhSsXUqnU
	lkIMVGeWilCaz3sENo609fyoqy1wGeglL4pq9ioSLfKKlkzzMM+l
X-Gm-Gg: ASbGncsay6RrgNN/VAJf7BmgQ3lxMF0XvK2GYue5cWYjGL9F+7sxE2Xw4/mNFzJ9qRy
	GFFr7xoCRAnIBbq7XM4vo4Un1IrkurSY23mh5zWDZ9PlfFBJ5i3PQ6TzBjVYQYPpGmoKZv8deR9
	d3yOuxPi2M5ahfdah80SVvH8zgkpppmKBlVeCeEAdMn4rb+FhMvsO9WbNMw3R2JZ92t4iXKebZU
	gjWM0pdBVO67QzVi2IdEvxTjCfZON49rugBxWvM4vkUvIQDAzfpAOyqEo0/i8T0ywWQUQNIGPul
	/ws81KT3fzFnqZPnO7QxXen+28peC40A9GC0vOqDzBtTk+wBedyR57jRKpL5ftRYIEv9mqpO
X-Google-Smtp-Source: AGHT+IE8y9zrSdQ2In+aKboLoe8r8Woa597e/Us3RmOHAyWTftnN3p7pI/T2/AqUEZCVki5un0P0cA==
X-Received: by 2002:adf:a398:0:b0:391:3fa7:bf77 with SMTP id ffacd0b85a97d-3913fa7c21dmr8814388f8f.31.1741731466709;
        Tue, 11 Mar 2025 15:17:46 -0700 (PDT)
Received: from prasmi.Home ([2a06:5906:61b:2d00:a6ad:9216:2ab5:120])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfdfcfbsm18782252f8f.28.2025.03.11.15.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 15:17:45 -0700 (PDT)
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
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v3 0/3] Add GBETH glue layer driver for Renesas RZ/V2H(P) SoC
Date: Tue, 11 Mar 2025 22:17:27 +0000
Message-ID: <20250311221730.40720-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 166 +++++++++++++++
 5 files changed, 395 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c

-- 
2.43.0



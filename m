Return-Path: <linux-renesas-soc+bounces-24929-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CD4C78DBF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 12:40:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 76D814ED40D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 11:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF6FB34AB1E;
	Fri, 21 Nov 2025 11:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dV6TiyO6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76680346785
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 11:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763724967; cv=none; b=AREIl62IilasGh06o7tN30UzotS9J2vUP2nMxXJ7nxSk18IUUUMw6Qp6967PBH3jJhxyzrE09jEhkZal2p3tqinjgr+taImZjm4hkGEqojZmgfa0g6ASGpGiSmUZe7ZK8BOXCZ8Va0Z9F7+Ml86g4M+uggTXYfF7F/lkZPKWPyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763724967; c=relaxed/simple;
	bh=ftRTYtj+MIdNdrTL102wop7nvVmtJJk9dP87Q3JUdCo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aXAWIKeaGGmDRbpXzu4G4iqeqrCdWhZiTlVIqbgu5rN4hO9I01vtzXg5MbBpn/YYCNg7ei4fTVVdypGVybBou3c8lzMkZUwWmDhreCSXZwIklFmJIUXYMaWiERizQ+k8AXiYD3IdrkEFpCmjv1H0v2j7ypQFcXtLvWDGr/qyBUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dV6TiyO6; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477632d9326so12186565e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 03:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763724964; x=1764329764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L1iu1X2rkalrqKSnE+I8dJ8h9QZAQz7+DuxtVRZln6A=;
        b=dV6TiyO6yeyYY0Zt5haoYB/ex7ipCl4ini7vVhbp1BNMcHOlxaxQMVEGEMNkWLbZZJ
         x7iGB/2y1cfecRyA1/Y4MVvDGQA6Q73aDUk0JPQc29LIv+Q6eviUX5flNG7PjU1ymGD9
         UYB4c3jdMzuwbVYEI9raDzTb/60Dn4ByKAXkgi4luHtYkLj8eC0pFgxwfeu5FVElOZVK
         nL2QCmcItRxP1Lk9GCozzPbZiIsARMi2HEfqKHEMzfZG0cTDQhFGLApd/N+JGzb2wXxJ
         k5R+hFlUQM85c9upG81eaY4uIbl5bw58dP1ACsCcUf51fah2NxZ0APS2S0yLlW5VYUgD
         gxDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763724964; x=1764329764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L1iu1X2rkalrqKSnE+I8dJ8h9QZAQz7+DuxtVRZln6A=;
        b=Fa4/4Q696LibuTQ2ZiAxCGcRcgsD4bgD4CiUbKBTiPbpdE7tdmIqKdMndPJXJ7DGk5
         umLsFwVWoo8u2uLUbRF37OrCDe99M/y/p8Gz4CJEtbfxBRxY9wO2rafu/mFO99atBC+j
         rVHGcLFc0+s48CetjONr2ahLYjeyqB6da7h2xjbZonNgrOw9QvegCIoOhLd20+dfwlaV
         F3w+qoNQZs4nrYbo8Hh/Tx8cXfiV58PLKqvzOQ3T2rv1DQhv++wqjVIXOGKwyO3hFjJy
         foCarRIIgqYYJUzcFRFNrMjM3zCihDqOTs7XyWr4S7gldt+u4WTO9+/JnoswY679YNUw
         Zpvg==
X-Gm-Message-State: AOJu0YyowbWjpvEjz8+2hxc0wfo4or+0KUdO1jx6blFHXZG7ltqEgexg
	+iw/+Xmy5QQzEV+h6t5ebIJsaDjvCWEccCRDZQTQjvpVpku9SsLGjsdV
X-Gm-Gg: ASbGncutXW11tEtD5jblNLyCJKBfIZt7VSV9V/22A51QRWOhXAeGvbNg3uzpxg8W5C4
	7nYwojpUFfDQ4YGa64qzxl60rLFQy5Wps06J6fQZzHB7Ehlo5bMBZPnfdagNmwjKc9kKREcXxfh
	rOU7fhyKKJ5IrfPJ1axqwn+bTVpdTBZh3OFv6S3pveG/rXribcsx71R5Nt6wsH2AFYMwmGPznBT
	QMai61n1In5kq7ocQJD9NSihtzeylEArYjQkG2NjosIytqQpiselbrPAWI8MhkU7/Aln/rIdJCG
	ZNt1ctGPmLFIadvbDf3L27AeanhUga8wnKZ8/RCSq7SOJ/Y2H/T4YIzz+EkL0+ljmZLCBBNAckr
	kXoclbE7oIzGWO4LK332oNTxf52rswXfF4kAlw7RahF5ghKMI8hpk7olvMEidlPrbpItT5aPwCL
	WOhp+ZCS8b/PMb6AKwFYe4E7oxtVtKs3N0fK8=
X-Google-Smtp-Source: AGHT+IENbIixTtlLAm9EX+vhw2xhihNg0J8d0rCtdFjldUByc3WPIQ755fW/IkVXGwQuhSLkmIA/DQ==
X-Received: by 2002:a05:600c:354b:b0:46f:b327:ecfb with SMTP id 5b1f17b1804b1-477c0184c45mr19858395e9.9.1763724963551;
        Fri, 21 Nov 2025 03:36:03 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:9cce:8ab9:bc72:76cd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf3558d5sm38732465e9.1.2025.11.21.03.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 03:36:03 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next 00/11] Add ETHSW support for Renesas RZ/T2H and RZ/N2H SoCs
Date: Fri, 21 Nov 2025 11:35:26 +0000
Message-ID: <20251121113553.2955854-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This series of patches adds support for the Renesas RZ/T2H and RZ/N2H SoCs
which integrate an Ethernet switch IP variant called ETHSW. The ETHSW is
largely compatible with the A5PSW switch found on RZ/N1 SoCs, but has
several key differences in register layout and hardware configuration. The
series includes updates to the DSA driver, device tree bindings, and
Kconfig to enable support for these SoCs.

Cheers,
Prabhakar

Lad Prabhakar (11):
  net: dsa: tag_rzn1_a5psw: Drop redundant ETH_P_DSA_A5PSW definition
  net: dsa: tag_rzn1_a5psw: Add RZ/T2H ETHSW tag protocol and register
    ethsw tag driver
  net: dsa: Kconfig: Expand config description to cover RZ/T2H and
    RZ/N2H ETHSW
  dt-bindings: net: dsa: renesas,rzn1-a5psw: Add RZ/T2H and RZ/N2H ETHSW
    support
  net: dsa: rzn1-a5psw: Add support for optional reset control
  net: dsa: rzn1-a5psw: Add support for optional timestamp clock
  net: dsa: rzn1-a5psw: Make switch topology configurable via OF data
  net: dsa: rzn1-a5psw: Make DSA tag protocol configurable via OF data
  net: dsa: rzn1-a5psw: Add support for management port frame length
    adjustment
  net: dsa: rzn1-a5psw: Add support for RZ/T2H Ethernet switch
  net: dsa: Kconfig: Enable support for RZ/T2H and RZ/N2H SoCs

 .../bindings/net/dsa/renesas,rzn1-a5psw.yaml  | 154 +++++++++++++++---
 drivers/net/dsa/Kconfig                       |   9 +-
 drivers/net/dsa/rzn1_a5psw.c                  |  58 +++++--
 drivers/net/dsa/rzn1_a5psw.h                  |  25 ++-
 include/net/dsa.h                             |   2 +
 include/uapi/linux/if_ether.h                 |   2 +-
 net/dsa/Kconfig                               |   6 +-
 net/dsa/tag_rzn1_a5psw.c                      |  22 ++-
 8 files changed, 230 insertions(+), 48 deletions(-)

-- 
2.52.0



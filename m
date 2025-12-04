Return-Path: <linux-renesas-soc+bounces-25566-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3E8CA4957
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Dec 2025 17:49:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1EDD83029C5F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Dec 2025 16:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3577D346E50;
	Thu,  4 Dec 2025 16:41:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19D6B2F9DAF;
	Thu,  4 Dec 2025 16:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764866500; cv=none; b=ijjPTJ9UmAwt5EcE7Lz9N6lv+Rl6gJ76uFxUSV+eB/8ZAmIWJreAk93p5aRIzp4HG5gZzP5b3iBTQs1U1kc+cPFpJ5ycaz8if5zvTn+cY9Q2H5OUJKGJ0LIYNbbOKZRHv2dD5cnkGK3aJsLltOvcxvl6zIYMRgt974OdeEzxCfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764866500; c=relaxed/simple;
	bh=WpIiSH4GxU7onEE+2ezX9gvDAfdCzI+wz8TInd5GTu0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iCYJOz3cihjSIBbhtYN/R6bmp8TwIK1g14+5CrNoKplHyJlegw13BRBGM5BUQnbMn8xfSFzcL+fqbwLYwGp7ZXepCO4T35boarz3vV3r/UBt+Eb0rdtFqWUgzc1mKSNexeWKiT+AWBoatRPQlFT6rjm4pcUTsjfGDhatqaQXfPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 8QOh0mHRT0y97pJTnA6SsQ==
X-CSE-MsgGUID: Ntu3Mc7SRgSmVLr3OOObTw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 05 Dec 2025 01:41:31 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.26])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 699E0402398D;
	Fri,  5 Dec 2025 01:41:24 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: prabhakar.mahadev-lad.rj@bp.renesas.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be
Cc: biju.das.jz@bp.renesas.com,
	claudiu.beznea@tuxon.dev,
	linux@armlinux.org.uk,
	magnus.damm@gmail.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH net-next 0/3]  net: stmmac: add physical port identification support
Date: Thu,  4 Dec 2025 17:40:25 +0100
Message-ID: <20251204164028.7321-1-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds physical port identification support to the stmmac driver,
enabling userspace to query hardware-stable identifiers for network interfaces
via ndo_get_phys_port_id() and ndo_get_phys_port_name().

On systems with multiple ethernet controllers sharing the same driver,
physical port identification provides stable identifiers that persist
across reboots and are independent of interface enumeration order.
This is particularly useful for predictable network interface naming
and for correlating interfaces with physical connectors.

The implementation follows a two-tier approach:

1. Generic stmmac support: Default implementations use the permanent MAC
   address as port ID and bus_id for port naming. This provides immediate
   benefit for all stmmac-based platforms.

2. Glue driver override: Platform drivers can provide custom callbacks
   for hardware-specific identification schemes. The Renesas GBETH driver
   implements this to support device tree-based port identification,
   addressing cases where hardware lacks unique identification registers.

The Renesas implementation constructs an 8-byte port identifier from:
- Permanent MAC address (if available) or Renesas OUI (74:90:50) as fallback
- Port index from device tree property or ethernet alias


John Madieu (3):
  net: stmmac: add physical port identification support
  dt-bindings: net: renesas-gbeth: Add port-id property
  net: stmmac: dwmac-renesas-gbeth: add physical port identification

 .../bindings/net/renesas,rzv2h-gbeth.yaml     | 19 +++++++
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 56 +++++++++++++++++++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 54 ++++++++++++++++++
 include/linux/stmmac.h                        |  5 ++
 4 files changed, 134 insertions(+)

-- 
2.25.1



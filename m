Return-Path: <linux-renesas-soc+bounces-30493-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCejBzzkxmmjPwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30493-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 21:10:36 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 768C134A993
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 21:10:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 821053012253
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 20:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6165138F928;
	Fri, 27 Mar 2026 20:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="idtjumX3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFC538E126;
	Fri, 27 Mar 2026 20:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774642226; cv=none; b=NXfY6IHTgPBmA7MqMPVzEoCbNnHSzYG6dTwvrVAiB8vQvbwOtuZHh840Zb/taUUEq5YOSQGn0IfKAQorTvzGHpjFQYbBPHWbbyIbfsHLdWlpAtOWVZbo902RX/GX6LxT62e4wfmv5X1dlPC3kEbx/H2D+Vd9K+HrZUfaULE1iT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774642226; c=relaxed/simple;
	bh=85MXpOpj6RSdKZ3x8OwGzEhLk72dNQDdaoUsy5d801g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ihMMthAyL1DNbrmYcNRV+jjlsd89BvBQBaiQx0hlQpqqprtJkEVdYWi2dbtAW1dbry9U+C3D8NKfjvt1mTvd3gC3Tjn8N5L9DZGHYKIWnoGKL6b2FW1o/bnzD8+u3BqrpN/aE/vz/yq356McCCuaU1YigDPUTSW0a5ikXL1RTP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=idtjumX3; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 98FD71A302C;
	Fri, 27 Mar 2026 20:10:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 639E960268;
	Fri, 27 Mar 2026 20:10:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5A95C10451AF7;
	Fri, 27 Mar 2026 21:10:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774642220; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=bIF1JM1V9WjeIpsAeYPNhtxBVFUAIahSL4+PQQ6GA8Q=;
	b=idtjumX3N7aL5zh0U7AcOqrLvWNM+8wlPe7LjyhJBxmkInWzWdX/AT6Uhn0fXaqOSSZZIT
	5XFgknSuIVE78+a/cIBq9PkB/ELxa4CFAP0g1DWCGytB3hI419L6E8MDmpF/h8c6p8757l
	Pm+MMPUDr8qrygTFhnhf7QqLSuJV6oY5J/Km/Yge3BMszcuYxHjQ3IUcKiwI4Bj+MLwKmj
	5fjtQksbvWTYwg/aJGmVQz3zoIor73mQshrQkEFoFu4C2fpNG2eZFERp/mjLDPKYDW+I4n
	qBCLQEpj+L3ePYiAb1v8+IUfpsOkRXqastQOVymUBweYsMXRMuMksRoY3Wh8QA==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Subject: [PATCH 00/16] Add support for Inside-Secure EIP-150 crypto block
Date: Fri, 27 Mar 2026 21:09:22 +0100
Message-Id: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MPQ6DMAxA4asgz1hKwl/Uq6AOYJviJSCnQkWIu
 zdi/Ib3LshiKhle1QUmh2bdUoGvK6B1Sh9B5WIILvSuCQNmWpMoi+ExoEMjj2Tn/t2wi8Sx7Zn
 n6KH0u8miv+c9vu/7D8kS3VJrAAAA
X-Change-ID: 20260327-schneider-v7-0-rc1-crypto-58cd846ddb81
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Jayesh Choudhary <j-choudhary@ti.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Antoine Tenart <atenart@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Pascal EBERHARD <pascal.eberhard@se.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-crypto@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30493-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[baylibre.com,kernel.org,selenic.com,gondor.apana.org.au,ti.com,davemloft.net,gmail.com,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-0.910];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:email,bootlin.com:mid]
X-Rspamd-Queue-Id: 768C134A993
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

This is a series adding support for the EIP-150, which is a crypto block
containing:
- a public key accelerator
- a random number generator
- an interrupt controller

The series is a bit long but every subsystem may take its own share
independently. I might want to split it into several chunks in the
future if it expands but at as for now, here is the full picture.

For instance, the clock part has grown due to the inputs From Stephan
Boyd (addition of Kunit tests + a couple of misc preliminary changes).
Link: https://lore.kernel.org/linux-clk/20260129201003.288605-1-miquel.raynal@bootlin.com/

Regarding the big engine, the EIP-28 Public Key Accelerator, it
currently only supports RSA, but more algorithms might be added
later. The hardware supports (EC)DSA and (EC)DH. It also requires a
firmware.

The very last patch adds the block in the Renesas RZ/N1D DTSI, as this
is the platform I am using this hardware one.

Thanks,
Miquèl

Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
---
Miquel Raynal (Schneider Electric) (16):
      dt-bindings: clock: Introduce nexus nodes
      dt-bindings: interrupt-controller: Describe EIP-201 AIC
      dt-bindings: rng: Rename the title of the EIP-76 file
      dt-bindings: crypto: eip28: Describe EIP-28 PKA
      dt-bindings: bus: eip150: Describe the EIP-150 container node
      clk: tests: Add clk_parse_clkspec() Kunit testing
      clk: tests: Add Kunit testing for of_clk_get_parent_name()
      clk: Improve a couple of comments
      clk: Use the generic OF phandle parsing in only one place
      clk: Add support for clock nexus dt bindings
      clk: tests: Add Kunit testing for nexus nodes
      irqchip/eip201-aic: Add support for Safexcel EIP-201 AIC
      hwrng: omap: Enable on Renesas RZ/N1D
      crypto: Group Inside-Secure IPs together and align the titles
      crypto: eip28: Add support for SafeXcel EIP-28 Public Key Accelerator
      ARM: dts: renesas: r9a06g032: Describe the EIP-150 block

 .../bus/inside-secure,safexcel-eip150.yaml         |  58 ++
 .../bindings/clock/clock-nexus-node.yaml           |  39 ++
 .../crypto/inside-secure,safexcel-eip28.yaml       |  31 +
 .../inside-secure,safexcel-eip201.yaml             |  41 ++
 .../bindings/rng/inside-secure,safexcel-eip76.yaml |   2 +-
 arch/arm/boot/dts/renesas/r9a06g032.dtsi           |  42 ++
 drivers/char/hw_random/Kconfig                     |   2 +-
 drivers/clk/Makefile                               |   1 +
 drivers/clk/clk.c                                  |  12 +-
 drivers/clk/clk_test.c                             | 154 +++++
 drivers/clk/kunit_clk_parse_clkspec.dtso           |  31 +
 drivers/crypto/Kconfig                             |  55 +-
 drivers/crypto/inside-secure/Makefile              |   1 +
 drivers/crypto/inside-secure/eip28.c               | 760 +++++++++++++++++++++
 drivers/crypto/inside-secure/eip93/Kconfig         |   2 +-
 drivers/irqchip/Kconfig                            |   8 +
 drivers/irqchip/Makefile                           |   1 +
 drivers/irqchip/irq-eip201-aic.c                   | 221 ++++++
 .../inside-secure,safexcel-eip201.h                |  14 +
 19 files changed, 1444 insertions(+), 31 deletions(-)
---
base-commit: f6ad621bcf627fe4719cbf97c1d3c9366cc49eff
change-id: 20260327-schneider-v7-0-rc1-crypto-58cd846ddb81

Best regards,
-- 
Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>



Return-Path: <linux-renesas-soc+bounces-30786-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCEHGuebzmnfowYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30786-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 18:40:07 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A6938C0B5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 18:40:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C9FDE30EF6F0
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2026 16:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B3873F0774;
	Thu,  2 Apr 2026 16:32:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D76073E5EF8;
	Thu,  2 Apr 2026 16:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775147546; cv=none; b=Ag01ekfb5SQlA3oDQp9kzOBX0U4tBTnxdxeOBiANiyoWvLUPkjRipkjiFtiuJgW3sma9rjUm70Bkw+KTuxeATyXYr46tIKhp40MwAkHOT0NRusz62HEf20Olc1DoZ65AZQd/mqLCo7U64oYkb9FzroT8y3PHJN9fI92V2aC0aJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775147546; c=relaxed/simple;
	bh=JfPELk6GvBo8vHl8pZaX95JevV2WAcPS3fc+/aivuE4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J/cdfwf1K9mDD4AdNjGlDGqFNF+FGMEmN5FS5Ei/NhAQsD24PuxpT+g6V5Yzt+F9QnY8kJR7+KdwkFfqrN9z8Qb3BIHthjXcVzBwcib93D5lB60kk8gL2RdDmzAiUImLXZSfy/0HbPv0BUYrRKoXZ4WoWjpSt50wdPwx1Mvl6S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: BvnOBxnCR1C7zq3SipcGGw==
X-CSE-MsgGUID: 8rPdQcn7Tz2Cqg/vyAUT4w==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 03 Apr 2026 01:32:24 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.38])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2BBF94009A30;
	Fri,  3 Apr 2026 01:32:19 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	john.madieu@gmail.com,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCh v3 0/8] arm64: dts: renesas: Add RZ/G3E audio enablement
Date: Thu,  2 Apr 2026 18:31:18 +0200
Message-ID: <20260402163126.12135-1-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.14 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-30786-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,bp.renesas.com,gmail.com,vger.kernel.org];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.734];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 28A6938C0B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add device tree support and board enablement for audio on the
RZ/G3E SMARC EVK with a Dialog DA7212 codec.

This series includes:
  - CPG clock binding update for optional audio clock inputs
  - CPG driver support for RZ/G3E audio clocks and resets
  - Audio clock input nodes for RZ/V2H family DTSIs
  - R-Car Sound node for RZ/G3E SoC DTSI
  - Board-level enablement: I2C1, Versa3 clock generator, audio
    pinmux, and DA7212 codec on SMARC EVK

Audio configuration on SMARC EVK:
  - Codec: Dialog DA7212 on I2C1
  - Playback: SSI3
  - Capture: SSI4 -> SRC0 -> DVC0
  - MCLK: 12.288MHz from Versa3 clock generator
  - Format: I2S, R-Car Sound as clock master
  - SSI4 shares clock pins with SSI3 (shared-pin)

Changes:

v3:
 - Splitout from v2 [1]
 - No code changes

v2:
 - Fix Rob's comment on  maxItems not needed with items lists.
 - Drop DMA ACK second cell from DT specifier

[1]: https://lore.kernel.org/all/20260402090524.9137-1-john.madieu.xa@bp.renesas.com/

John Madieu (8):
  dt-bindings: clock: renesas: Add audio clock inputs for RZ/V2H family
  clk: renesas: r9a09g047: Add audio clock and reset support
  arm64: dts: renesas: rzv2h: Add audio clock inputs
  arm64: dts: renesas: r9a09g047: Add RZ/G3E Sound support
  arm64: dts: renesas: rzg3e-smarc-som: Add Versa3 clock generator
  arm64: dts: renesas: rzg3e-smarc-som: Add I2C1 support
  arm64: dts: renesas: rzg3e-smarc-som: add audio pinmux definitions
  arm64: dts: renesas: r9a09g047e57-smarc: add DA7212 audio codec
    support

 .../bindings/clock/renesas,rzv2h-cpg.yaml     |   8 +
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    | 529 +++++++++++++++++-
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   | 114 ++++
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi    |  27 +-
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    |  27 +-
 .../boot/dts/renesas/rzg3e-smarc-som.dtsi     |  44 ++
 drivers/clk/renesas/r9a09g047-cpg.c           | 129 ++++-
 7 files changed, 871 insertions(+), 7 deletions(-)

-- 
2.25.1



Return-Path: <linux-renesas-soc+bounces-31951-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BKGIqey+GkdzAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31951-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 16:52:23 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 421AB4C01DF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 16:52:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 95D0D302F03B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 May 2026 14:47:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 613503DFC7B;
	Mon,  4 May 2026 14:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="gZydUKKJ";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="izKQTwOs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C753DE42C;
	Mon,  4 May 2026 14:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777905954; cv=none; b=a4mzSPlobpkXQ+VmOEIv9vc9FiTzQ1BnTCHKBRmUwGs2HS4/ahVY+gr5VXjMCpcmP0IAgk28S7EPhAkwNuKqlsGsrznCsO0iY3502EDF170fm9lcCId1WfHTSzE1/rVXi48V2pZOT0wx5Tdis1lxMTEYlOee0qjlU2J4Ps2ph3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777905954; c=relaxed/simple;
	bh=Nfqv5uxx7EBcjwdgdKF+jqYsQ0J6nz03vDE/GxZcC4c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c58phQCnskifqxha5hlE5So715tCz+pxu1MwIMtvDaZXWg2/0jObA8+ymxkUNZirpDFjQFnIO1Zoqs955mHRgNeaavS9XTGsxERaPwft6xIDYqufXky6Ozk+ewjA5/CM6Q6QbZ0HudY9kUZ/Kku0RLJY2HGTXmtTaUoYw55Jp34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=gZydUKKJ; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=izKQTwOs; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4g8Pb246f5z9scQ;
	Mon,  4 May 2026 16:45:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777905950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cYYAh5UCl+y7lrHPwfOHemfwVIweJ/p4wEN7zniKp1Q=;
	b=gZydUKKJeQfGWT6E9CrCKkxUPNhZ5FqAUCliv4alubwDoRcsAVANUD87jniG8URKQNfYdu
	NMfl1RujBt4iC5z3UHztTSczr18I8iTyYWDeczHJxPkeCuQfnZKMmN24V0W2RTsMRfu7or
	9JI2PlJCfsXs56AgO/mJYfQ2w/m13cVOqR0CCGJT40ckiwocIfPrQ4405dTFTM7oGDI4z3
	LKzw+njp/qJv81sDJu3qhT5D3FmXAeZP2rhM8yBZ4ieZQVywgXJmOdZlWqieiPCiGmxJjN
	ECx+QcdoPcLGFglOmzN6p4PmjvlZKV+D2eDRBMW0pFyqVXXjLQBepySDE/jaJA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=izKQTwOs;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777905948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cYYAh5UCl+y7lrHPwfOHemfwVIweJ/p4wEN7zniKp1Q=;
	b=izKQTwOsbrpz2J9+xHigUa6Prty6ca8Ao+2CBJi7050qGZTsCvZLza/h5mtv4BuiZUGS2z
	tMpNQe/QY7AUnEl0PbOGI2mRIYLxTsWwoUuvW6Zrty1nl+l9n++k7jD2w+icD4VVM3U77H
	3s8j8c7d3mbP62IusEYcDYk/xUx8fRztYLFngfs0rUrbcLwvaUGDqNYvaXl95KaKbOSIuc
	/Z7bAIzY0tEyBpQn+8t40Q9w1TeWIVnvIfPC0/pvNvNkwQ6nyMVDuRWHjGAYrhSn4sSYIR
	OnLbHDFFx31wQzzRI6HicuKOFpyRbCkjsdraTJEHZSVCZGQkGv+h4E4T5aqmng==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Brian Masney <bmasney@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 0/7] arm64: dts: renesas: r8a779md: Add support for R-Car M3Le R8A779MD SoC and Geist board
Date: Mon,  4 May 2026 16:43:22 +0200
Message-ID: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: kpbj889koap7puwmoxoz8u9st4n53md5
X-MBO-RS-ID: ab31f21b33fd55f0820
X-Rspamd-Queue-Id: 421AB4C01DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31951-lists,linux-renesas-soc=lfdr.de,renesas];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[mailbox.org,redhat.com,kernel.org,glider.be,renesas.com,gmail.com,baylibre.com,sang-engineering.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

Add support for the Renesas R-Car M3Le (R8A779MD) SoC, a register-compatible
variant of the R8A77965 (M3-N) with reduced set of peripherals. Add support
for the Geist board based on the Renesas R-Car R8A779MD (M3Le).

The DU part is currently removed until it can be tested.
VIN is also untested due to no remote hardware access.

Marek Vasut (5):
  dt-bindings: mmc: renesas,sdhi: Document R-Car M3Le support
  mmc: renesas_sdhi: add R-Car M3Le compatibility string
  dt-bindings: clock: cs2000-cp: document CS2500
  dt-bindings: soc: renesas: Document Renesas R-Car R8A779MD Geist
  soc: renesas: Identify Renesas R-Car R8A779MD M3Le SoC

Nguyen Tran (2):
  arm64: dts: renesas: r8a779md: Add Renesas R-Car R8A779MD M3Le DTs
  arm64: dts: renesas: r8a779md: Add support for R-Car M3Le R8A779MD
    Geist

 .../bindings/clock/cirrus,cs2000-cp.yaml      |  11 +-
 .../devicetree/bindings/mmc/renesas,sdhi.yaml |   1 +
 .../bindings/soc/renesas/renesas.yaml         |   6 +
 arch/arm64/boot/dts/renesas/Makefile          |   1 +
 .../arm64/boot/dts/renesas/r8a779md-geist.dts | 732 ++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779md.dtsi     |  59 ++
 drivers/mmc/host/renesas_sdhi_internal_dmac.c |   1 +
 drivers/soc/renesas/renesas-soc.c             |   1 +
 8 files changed, 809 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779md-geist.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779md.dtsi

---
Cc: Brian Masney <bmasney@redhat.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org

-- 
2.53.0



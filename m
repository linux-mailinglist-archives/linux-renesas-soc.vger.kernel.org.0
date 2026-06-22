Return-Path: <linux-renesas-soc+bounces-34350-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Z1HKDhV2OWqEtgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34350-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 19:51:17 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 970626B19AA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 19:51:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=RUFTBQhK;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34350-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34350-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56130306260F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 17:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35A2B315D33;
	Mon, 22 Jun 2026 17:48:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E543403EF
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 17:48:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782150508; cv=none; b=CKx1RoIwQoSqf42+M/PlSD2OM8uuOKy7iW71otAoH7tbS5Eyqu5iq7gkhEW1NTt5+b4N+Ha6RqdCZBIDVFVdADKCUVaycmjrMr1GwZbDdK/Qjs9P2pYo0pS+XcAd4f7b8uuLBgHBgTKvgsyTdNwuexCyrhGSkQmMc1toriLhtg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782150508; c=relaxed/simple;
	bh=jXVsZuyj61Xum1pl6F+8ziCMpi8CAqVuvIzMazUAvgs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qdeQCFMaypzi02CCt+NQpLbMuSu0Bj0dmctpoz5YItHCpeEKKqFg3JdHoXUKpNJhokevo3kcFDC/rqc9kbw/I7uXIbnky/ghlHNzJG3qfNkwf6/hLnnbYM+I4YqG4bkAIdYioVC6kBpOdDgG+H/wR9gzoZooFkBGw1DCovFffRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=RUFTBQhK; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=98fOnd/8/9eYZd
	Fwvzqrt9LM1h6d4a2PxT5360o7h74=; b=RUFTBQhKSp2E3XtpClNF4krNIrY4HT
	ha1Va9iKAlr3r/RMXZErY/9UuPzvVTzYhsq9CJEIPhjzS4fqA9RNk5HIonlhKGHL
	DnmGA2eYSQKEOwMdXHuKdlgHuw8l85mRujspUsPABjaOt8gywwtRk/XWkkH7l7lG
	ww3DfMOhQGs8Kec+z2bp8zleVE4HX4ullE7xG0yXyJeqH97x4dTi8nyGM73mWk8O
	NsKLRMGYDpztPVM2QjlGIhJiOWqZ0sifxc4BNF4EivyBFDrLXU4WePgeQ0Lay/uT
	YbEhYSPltifHPoX2/O1W5JNNXbSJA3cBf9rxbBgd1tSJPe2xF6KDVJ1g==
Received: (qmail 2061352 invoked from network); 22 Jun 2026 19:48:20 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Jun 2026 19:48:20 +0200
X-UD-Smtp-Session: l3s3148p1@jnp9P9tUeKQujnum
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-spi@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 0/3] ARM: dts: renesas: r9a06g032-rzn1d400-eb: Enable SPI and FRAM
Date: Mon, 22 Jun 2026 19:48:06 +0200
Message-ID: <20260622174806.74450-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-renesas-soc@vger.kernel.org,m:wsa+renesas@sang-engineering.com,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:linux-spi@vger.kernel.org,m:magnus.damm@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:wsa@sang-engineering.com,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-34350-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2600:3c0a:e001:db::12fc:5321:from];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[sang-engineering.com,kernel.org,vger.kernel.org,glider.be,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[100.90.174.1:received,194.117.254.33:received];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sang-engineering.com:dkim,sang-engineering.com:mid,sang-engineering.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 970626B19AA

Here are the patches to enable the SPI-FRAM with FIFO (no DMA yet, needs
more work) on the RZ/N1D Extension board.

Changes since v2 in the individual patches.

A branch is here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/n1d/enablement


Wolfram Sang (3):
  spi: dt-bindings: snps,dw-apb-ssi: add 'power-domains' property
  ARM: dts: renesas: r9a06g032: Describe SPI controllers
  ARM: dts: renesas: r9a06g032-rzn1d400-eb: Enable SPI-FRAM

 .../bindings/spi/snps,dw-apb-ssi.yaml         |  3 +
 .../dts/renesas/r9a06g032-rzn1d400-eb.dts     | 25 ++++++
 arch/arm/boot/dts/renesas/r9a06g032.dtsi      | 84 +++++++++++++++++++
 3 files changed, 112 insertions(+)

-- 
2.47.3



Return-Path: <linux-renesas-soc+bounces-31381-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPYrJAkv5WlxfAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31381-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 19 Apr 2026 21:37:45 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DF129425433
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 19 Apr 2026 21:37:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E684300C92B
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 19 Apr 2026 19:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E00C52E7F25;
	Sun, 19 Apr 2026 19:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="v8VjAsMT";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="w7GRN8/2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DF91A683B;
	Sun, 19 Apr 2026 19:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776627461; cv=none; b=myBrJLP3Md379I9KAbyiNKt3LYeH3eWnpfG1XrHciNS/XmCVFm2bVennN7ah52GAqcjVhgtzq7ozeeq9em7slBTZOgcbIMa4kIzEGzfQeyGLTEMr3fieZN8UAiE7whNqu6Hun+NQqNb1QNKPlJa1wDiLsZIrXMNCZ+t8C1FCwF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776627461; c=relaxed/simple;
	bh=hM0Ot1BC4msAiqEYhZKOQrZ+8uTcEmNfpDHaO7fqTQc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b7Xg3v8LQwZTDtqTMJnJlxeXgDxK925ewX1Ae4cHy6WAeIhUyVgLwHIrRwiFgkmV+HFXEpoVXMD4ZP1qsw7Wtg/HonaJKAURpK+vwyPEYffHU/MwnzU94XsrNwQI7oU7Le1KJKt1O1HKtVNO8bSX+m5R6OjcTM6oBWfMzTzasRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=v8VjAsMT; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=w7GRN8/2; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4fzJmf1flBz9tsS;
	Sun, 19 Apr 2026 21:37:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776627458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Cp83c5BG9ViMtdfEgKoWZ8ShkaQqJKSJjfZOv6vUN3o=;
	b=v8VjAsMTkpzoEgpLAGLJka0n0hkuT+J4/aAih96YxvIhze7hRaT2bRHPGOrCKGXH7XfmHK
	3iNy+AY7iSdHHwSv/0DSjS2ZG9/5mNnkp9xlZyQlCl5bE1rHFXOi2xka+PdRQwBCrv/wrr
	aWzf3NXQrGFjMG4dbkcSRimV0KbPs/ekYqIP2PrdYEbMQ3NNCINQGHkJw3LxWdE135LMJe
	e4teUBvCZ9HkSTpvC+svz/3Kx565KNSOOX1hDc0A5Rw0qWp0SEfGhPFnMBPdZUuYQog0hy
	kPYWjQliwlWsZKjiNfys7duvYSsilQnOJ7Y7DbtPIIGs0i3mk84lE9SH4nIhTQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776627456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Cp83c5BG9ViMtdfEgKoWZ8ShkaQqJKSJjfZOv6vUN3o=;
	b=w7GRN8/2Wm3MAQ88k5My5vMrNKZQ2uwHq5wr52dUbj5Ozpm+IaYuqnG3BgrunF2eTfLPaQ
	y1wpGgo/Q7PQ0fqdgnw1LeWJuGySITl89u2NiCqS4eI9QjKarroA/3q8J1/TogsFRruFrE
	UDP3Yh0dqvWEjEZOYs0k9WILOpGpe9honc/LcCQ6Pt/MrnJlsvRG8pbYTanW1+CpzDk5pV
	IzgyvhVR/SQbCrgRe8QOIdL1iuSPynAJ56XvJQBOoilnmxzslzfRgGqXANeOV8OatvVqrf
	0HI4uCCHOkRsPsqhEFv13XXNBN3vcEC2xl1Qs2Jq71rIGDcR20T2jx0llnuSzQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Stephen Boyd <sboyd@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/7] arm64: dts: renesas: r8a779md: Add support for R-Car M3Le R8A779MD SoC and Geist board
Date: Sun, 19 Apr 2026 21:35:31 +0200
Message-ID: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 5b7ad3aa5645162c028
X-MBO-RS-META: s1wnqocyhj9w55px7iozj8ixtw9k5sg4
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31381-lists,linux-renesas-soc=lfdr.de,renesas];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[mailbox.org,kernel.org,gmail.com,glider.be,ideasonboard.com,renesas.com,baylibre.com,ffwll.ch,suse.de,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,lists.freedesktop.org:email,baylibre.com:email,ffwll.ch:email,mailbox.org:dkim,mailbox.org:mid,suse.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email]
X-Rspamd-Queue-Id: DF129425433
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the Renesas R-Car M3Le (R8A779MD) SoC, a register-compatible
variant of the R8A77965 (M3-N) with reduced set of peripherals. Add support
for the Geist board based on the Renesas R-Car R8A779MD (M3Le).

The DU part does probe, and to the best of my knowledge, should correctly
describe the hardware, but is otherwise untested due to no remote display
access. Note that the DU uses ports 0 and 2, which is unusual.

VIN is also untested due to no remote hardware access.

Marek Vasut (5):
  dt-bindings: display: renesas,du: Document Renesas R-Car R8A779MD M3Le
  drm/rcar-du: Add support for Renesas R-Car R8A779MD M3Le
  dt-bindings: clock: cs2000-cp: document CS2500
  dt-bindings: soc: renesas: Document Renesas R-Car R8A779MD Geist
  soc: renesas: Identify Renesas R-Car R8A779MD M3Le SoC

Nguyen Tran (2):
  arm64: dts: renesas: r8a779md: Add Renesas R-Car R8A779MD M3Le DTs
  arm64: dts: renesas: r8a779md: Add support for R-Car M3Le R8A779MD
    Geist

 .../bindings/clock/cirrus,cs2000-cp.yaml      |  10 +-
 .../bindings/display/renesas,du.yaml          |  70 ++
 .../bindings/soc/renesas/renesas.yaml         |   6 +
 arch/arm64/boot/dts/renesas/Makefile          |   3 +
 .../dts/renesas/geist-panel-aa104xd12.dtso    |  17 +
 .../arm64/boot/dts/renesas/r8a779md-geist.dts | 832 ++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779md.dtsi     |  48 +
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c |  25 +
 drivers/soc/renesas/renesas-soc.c             |   1 +
 9 files changed, 1009 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/geist-panel-aa104xd12.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779md-geist.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779md.dtsi

---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org

-- 
2.53.0



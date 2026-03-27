Return-Path: <linux-renesas-soc+bounces-30520-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAbUJDgax2mXSwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30520-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 01:00:56 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8755D34C9A7
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 01:00:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 688A3300A594
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 00:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B16CE2494F0;
	Sat, 28 Mar 2026 00:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="LzNm66yl";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="eQMABPFX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218471DDC3F;
	Sat, 28 Mar 2026 00:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774656050; cv=none; b=FG3PHweBo1IncxlrbTFyy1NiVZ7bvlt9s/v3YO0Gm/bj71Yhu/3NSyL1Lkk3PjZZZWK/6HVEBS96JKwhkV8GYK7D6edr1jBMnXnT3JVeNH6u9XyIw70WW5CiXzequ4EaJLU/CuA6A93WLCahcR8gKJlKadZ1BjQbmA9MmfFcATY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774656050; c=relaxed/simple;
	bh=Ma7qf4Ghg3Xy7ksMo/aJRgD6oQ1rf2LXAK6c4WP0ghU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rbolzn2jvVA1c7LQozLrL+DEDZYKMxCZEcdKnmXZclYK0igQjFRsOJy2V2XjKHjIpYRyA0pRkBWGej/AHhzqhbVuPu4Up6ugOkQ1vtNXhN0QFpiCr4CUFBeDy6KLuCbwD+73hEKvDqzsleJli8VlT5kMyupEZYolUFO3GamlbSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=LzNm66yl; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=eQMABPFX; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4fjHht0Prlz9tRh;
	Sat, 28 Mar 2026 01:00:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774656046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uxIhcQz+uY8xYqeubQmy4zBk41bpC9NrLZw4sfycZOY=;
	b=LzNm66ylRz4LcX64+RAFF0FHI2UPUtxR/N47b5zpZuBoGznrWTYNCqMRaa4PaLZTUsxUkZ
	wBrSZ4jf5RrdH52gHBuEhVpzzTC0AtfuRfBsxnEWQdvkB/TZsTu32eNvx4p0yygGwvXtEM
	U3x/j5zSJoDBLgO+aobn5OOl7VAzZWofC/CtaYF0s7j4Pdavl9X7Jc8ZOwtSwVUMk0Mtux
	Vn8mDPto9JElZiYS5OvTm735TVWL91VymMNrvU/iLc/ATZKW9W9TMmoOjue5JVNCh38YnE
	vhX5Lrd8GvsY50AX6Jq8D5t3DCB4XYs4yYW2l4En/nJswsOwObT/QHXSCpS5IA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774656044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uxIhcQz+uY8xYqeubQmy4zBk41bpC9NrLZw4sfycZOY=;
	b=eQMABPFXIdFolBWrjZe5+adNdsZNjOLepTSQBJu1X8Ui+6OJLSG+YGVqxPsbYoBK7or8Vs
	hCO+AWJq+UNVKbEdIiDDAWtUe9KPFt2mTGpQ5s6QQOMum4XAgrQLbO+rTf8QfhBcLS55Vv
	J+qWGlxJ8lJRtCSkXubDtWx4EZsXzFuTihmmjGTzhdHi4IgFrmzT4+xWDqMc/IRKtIUTaW
	O5RgKbYz15SIYRxZ+XyHeRW4I+NBE12bEzKtANYkmFDKprWw3h2gGDVWzK4W9iCbuw9yjZ
	+bF+9zg/57yEHhVtdLUxNgcfHkyIqF4jxy2kX+Ekc+dX36sIgWhtrbujc+DtQg==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [RFC][PATCH 0/4] Describe coresight on R-Mobile A1
Date: Sat, 28 Mar 2026 00:58:17 +0100
Message-ID: <20260328000031.94645-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: rn6667sx9porg5ch1mgt7kwc9376sh86
X-MBO-RS-ID: d6eb57af618263a1f46
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30520-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[mailbox.org,kernel.org,glider.be,gmail.com,baylibre.com,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 8755D34C9A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Implement support for ZT trace bus and ZTR trace clock on R-Mobile A1.
Describe coresight topology on R-Mobile A1. Extend the current PTM node
with connection funnel, TPIU, ETB and replicator. The coresight on this
hardware is clocked from the ZT/ZTR trace clock.

Please note that this is written according to R-Mobile A1 User's Manual:
Hardware , Rev.2.00 Sep. 2013 . I currently do not have access to this
hardware, therefore I am sending this as an RFC patchset.

Marek Vasut (4):
  dt-bindings: clock: renesas,cpg-clocks: Document ZT/ZTR trace clock on
    R-Mobile A1
  clk: renesas: r8a7740: Implement ZT/ZTR trace clock on R-Mobile A1
  ARM: dts: renesas: r8a7740: Add ZT/ZTR trace clock on R-Mobile A1
  ARM: dts: renesas: r8a7740: Describe coresight on R-Mobile A1

 .../bindings/clock/renesas,cpg-clocks.yaml    |   8 +-
 arch/arm/boot/dts/renesas/r8a7740.dtsi        | 120 +++++++++++++++++-
 drivers/clk/renesas/clk-r8a7740.c             |   2 +
 include/dt-bindings/clock/r8a7740-clock.h     |   2 +
 4 files changed, 123 insertions(+), 9 deletions(-)

---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org

-- 
2.53.0



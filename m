Return-Path: <linux-renesas-soc+bounces-33052-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLhDKXf/EWo3tQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33052-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 23 May 2026 21:26:47 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C115C0715
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 23 May 2026 21:26:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 672CC30142AC
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 23 May 2026 19:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DF223502A3;
	Sat, 23 May 2026 19:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="uMn2NwSN";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="kFYN628S"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3592C21F8;
	Sat, 23 May 2026 19:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779564401; cv=none; b=X6oQMWDGRjKn2Z8/PzHMzJNNooK4ipSPTvXW13oT7QqKBP8XzDo3iggnulzX6fAmSew7AgxbtOGR7ShNvZnvMF3YgKN5DEgAy4R2e9Z7sz59DHLaHAOAAvLsVWJFF20JfqQDCiJx8iY0p6hVXnJZX3UagDbOdJv5xeRYWrl7gOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779564401; c=relaxed/simple;
	bh=2z5387J4X5I8dDW3H4EgMIEtqFtGFEoG2ZhgN/QA0QM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jNV325+oMoboQ0j54jJOYcBjGDacSfnb5CUzg9n9BgDh1pX9JoDg7B9fyMD24ykNqYbVQZJNIE27wJroCLjixkg53PfJ5AF4nIHH5a2p2RaWpEEfKtiNbqRsheDWouh43cFMBOxoogU0elWtc2ouwboa2TEqVFl0jmI20y7RjM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=uMn2NwSN; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=kFYN628S; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gNBw53XDGz9vHt;
	Sat, 23 May 2026 21:26:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779564389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bPp4+8gHs4KpY1yto9ukbd7UUiJ/HBW0qlJB2gqUZvQ=;
	b=uMn2NwSNknqvca1BbRdF9T6wfxuzG4y+HdxEQ12zRSZf74YECw5iOMXbX4CNKmPZGrc+0K
	+tmuEA471MA02xuMnc/H2oPB7GaOCvB+IZBd02WNgmM+h+tIw1c2wQyR0GgSife4XfcIFg
	rq48EJcgw5pMxW5vnVqO16roC/RmtoOkVct7TbCLYc/P93LvAe3Val8mEZk9ccplMrOQ/7
	smrsa6/yJqrbH4mqQj1n3/ZVF+1GSYwWR3ntbaniqrxaBVKqoT0DN5dUOlknGzOCngdD5v
	KZQSwzHkqD1c+CEIGef0iKy4G/S8bwD6BDuxBhcliF3B2oMr6ksI2tXOCxHE9g==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=kFYN628S;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779564387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bPp4+8gHs4KpY1yto9ukbd7UUiJ/HBW0qlJB2gqUZvQ=;
	b=kFYN628SgsQVc+pzlMc99z4bfbKyZFgZyNUGV5Wib3gvPvvEjNXPd08DK5fCX0DOEFLkeZ
	b36nhGUWMThr5oxvi+bP6nY7hrZxWfdEniDFq8ihAwNyDIExREUJvKCsc9+LHY471FpzA3
	om5vvn7b+HRYps+61LwYr1vDSFjw33bNOdVK/RlMY1rpUg8RyPmreckQIvDWi0MiuLW7cv
	TKB+6QczcHXtiznCY+Nx10/lbd2SZ1Vpa2/2Qpe5mt46K1qEKLD75TQOTDfxtOM/GcwH8V
	G5F/oJqLVqprPyhP1Jiz9olrkEFLROL/kAZ1RcTsNCcnYmzVsVLj0vpkKtc5sQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Brian Masney <bmasney@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] dt-bindings: clock: renesas: div6: Use ZT/ZTR trace clock in R-Mobile APE6 example
Date: Sat, 23 May 2026 21:25:50 +0200
Message-ID: <20260523192622.56605-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: gwsnr17ru6mwaek5f7ba9qnu37miwujp
X-MBO-RS-ID: bc1d52ac7fda85522ee
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33052-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,e615007c:email]
X-Rspamd-Queue-Id: 50C115C0715
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Since commit 2abdc3dcf978 ("dt-bindings: clock: renesas,cpg-clocks:
Document ZT/ZTR trace clock on R-Mobile APE6"), the APE6 clock node
expects two additional "clock-output-names" entries, "zt" and "ztr".
Update the example accordingly.

Fixes: 2abdc3dcf978 ("dt-bindings: clock: renesas,cpg-clocks: Document ZT/ZTR trace clock on R-Mobile APE6")
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Brian Masney <bmasney@redhat.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 .../devicetree/bindings/clock/renesas,cpg-div6-clock.yaml       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-div6-clock.yaml b/Documentation/devicetree/bindings/clock/renesas,cpg-div6-clock.yaml
index 2197c952e21df..b6ee8c8efd46d 100644
--- a/Documentation/devicetree/bindings/clock/renesas,cpg-div6-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,cpg-div6-clock.yaml
@@ -60,7 +60,7 @@ examples:
             clock-output-names = "main", "pll0", "pll1", "pll2",
                                   "pll2s", "pll2h", "z", "z2",
                                   "i", "m3", "b", "m1", "m2",
-                                  "zx", "zs", "hp";
+                                  "zx", "zs", "hp", "ztr", "zt";
     };
 
     sdhi2_clk: sdhi2_clk@e615007c {
-- 
2.53.0



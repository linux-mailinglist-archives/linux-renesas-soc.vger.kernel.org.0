Return-Path: <linux-renesas-soc+bounces-31956-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHToFjO2+Gn1zAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31956-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 17:07:31 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0804C06B8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 17:07:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 109E730B435B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 May 2026 14:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 722DF3E1D1F;
	Mon,  4 May 2026 14:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ShiwKXMP";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="xvaZ95XE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53CA3E4C96;
	Mon,  4 May 2026 14:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777905976; cv=none; b=b6TcTDoSxlNMjNlpHyuKKSqRFyM3casu9frpEtSwlQFZqk/EfdjwNMULqr570e4r7U9lmdapCiFkb84toLtOyJ7etIAHIqfdn3OfC1cunAsIPHV8qZk83l1bXkd7NzfX2vH5ij591D6+tGz5jpllvpf2KzMNB+j/zTVF6m5K9PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777905976; c=relaxed/simple;
	bh=U/yxXsxT1rzJja263x000kOD4XgCau6pW2XVzaunyM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z8mi0K86W+zoMcoXvCF37PKUEaTHzGkkyeAC7ejeepr7G4UU53Q1YhmNz50aCAs5aaatHICHFI66wGTrD1Dod/mPpsldnx4QzbFGgRxhl8XHeWGaN1ZZX1aViEkpUucNN6t/bbxpmaTqwD4yR8M6uYzLqiBbwjd50TDPTN/tA6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ShiwKXMP; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=xvaZ95XE; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4g8PbS6mjGz9tmY;
	Mon,  4 May 2026 16:46:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777905973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=shQ/eL2qxQz2BRj4gWIICBknwkCLqyf7KygYF9bKWHw=;
	b=ShiwKXMPfsuNmwWG5g0o+NnRXHGf3slSPYpsezrbZem8xM+L71wi9narwSHJph8vt3sCak
	DA856+B3t0eJ1gRScw2cmpNIW24zOOfJlMFLmErciKqDW82KaLUy+pbLL+pbdwBx6hXPVP
	DPq/OjRgTJQvQwmn6UYRQ4ohtaZYHEjS7VvN0J+38G8AMIWj1r+LVA4DBv5V91U5xXS8sJ
	Y6vp2QoMeukzxQW1a1V03dE3Xi4GMlWYbZdHvH4lLqk7Y+fNc9QgZiVfaDj/jF2jWNTjY5
	z1hAVl0mfpKMa7DRGb+dNJMFIZNB6xqz6T6TvbxFUJm0t9mUX8ruYsknRiV0Bw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=xvaZ95XE;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777905971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=shQ/eL2qxQz2BRj4gWIICBknwkCLqyf7KygYF9bKWHw=;
	b=xvaZ95XE88t9HIaXqhjsGt1ucaCNkmqKuJH2MWDiRYAxIRJ/0UYoXsOp8iYp1M1aN+2tBa
	W4GFifUWw89OOg7Sxq9UzJkYKWPd3FL9j3w3WnYRzTlmW4Bx0S8zdnEvkVGsh3wRBFGGWY
	qsViBVx+9DHTY4S5XezzjeTlQU7HulXnZPWOzfN6TSe/3aZMgwtSbWKQn4VTN1xHG2uylj
	/SM3yN9c08B+eVbTWDnX9tlQPLEEw9Mdq/JtW5/iX5PobvFSNgTBSaS9DJrNw4KzVxwolx
	CFOr7ZfeQvCkrmd/bH7an+n0Wh7yMypOLvMnROLldD6pQsPuTqLlWacDOsGLgQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Brian Masney <bmasney@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
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
Subject: [PATCH v2 5/7] soc: renesas: Identify Renesas R-Car R8A779MD M3Le SoC
Date: Mon,  4 May 2026 16:43:27 +0200
Message-ID: <20260504144534.43745-6-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org>
References: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: gbowz8rnb3xnaqfryekujdys5seeip8b
X-MBO-RS-ID: 35ef8a64b290b1dee0a
X-Rspamd-Queue-Id: 4C0804C06B8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-31956-lists,linux-renesas-soc=lfdr.de,renesas];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[mailbox.org,glider.be,redhat.com,kernel.org,renesas.com,gmail.com,baylibre.com,sang-engineering.com,vger.kernel.org];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

Add support for identifying the R-Car M3Le (R8A779MD) SoC.

The Renesas R-Car R8A779MD M3Le SoC is a variant of the
already supported R-Car M3-N SoC with reduced peripherals.
Enable support for the M3Le SoC through already existing
ARCH_R8A77965 configuration symbol. PRR reads 0x67c05501 .

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
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
---
V2: Add RB from Geert
---
 drivers/soc/renesas/renesas-soc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index 38ff0b823bdaf..c82835cf6d8e9 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -361,6 +361,7 @@ static const struct of_device_id renesas_socs[] __initconst __maybe_unused = {
 	{ .compatible = "renesas,r8a77965",	.data = &soc_rcar_m3_n },
 	{ .compatible = "renesas,r8a779m4",	.data = &soc_rcar_m3_n },
 	{ .compatible = "renesas,r8a779m5",	.data = &soc_rcar_m3_n },
+	{ .compatible = "renesas,r8a779md",	.data = &soc_rcar_m3_n },
 #endif
 #ifdef CONFIG_ARCH_R8A77970
 	{ .compatible = "renesas,r8a77970",	.data = &soc_rcar_v3m },
-- 
2.53.0



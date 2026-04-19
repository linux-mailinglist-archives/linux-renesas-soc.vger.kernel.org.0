Return-Path: <linux-renesas-soc+bounces-31386-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGH7FYwv5WlxfAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31386-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 19 Apr 2026 21:39:56 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B34E1425508
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 19 Apr 2026 21:39:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 27E1B3059FEF
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 19 Apr 2026 19:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF5E4305047;
	Sun, 19 Apr 2026 19:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="SN/ysULC";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="NStd01G/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF4A3019A9;
	Sun, 19 Apr 2026 19:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776627488; cv=none; b=u8A4mr50wQtvzz8TNRQNjdeSHu2UYP00KTcgOr3wo6NLNTrsBA/8HFSHfUnOICnje6La+FlmwcML2OlWQSziqdr/5lliN2xu9QUn3LnIcjAtnTVVao0jqd5W2GtzHQB1MMcHHpOq8CVfG+Lzm6zeagAjqFtg2wF3bhu0H3XsdMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776627488; c=relaxed/simple;
	bh=g4qfYKW1NnWJZ945fCoxTXOX9qLyrjmzBQLDEvtD5xA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q2zeWNAuLvwHQR9GBkjACdlhxToEyTWrlYLf1J1xUJb584aFc8Y472y+g1mySCG7aHfHz4SWwvkkuej2vf60a+ub+6QmhKc5dk+tdF7EXu3LinxRz+MbdlZK3ke2qjVyh0FVNlfhguScZ0ZNeuHn4mIfZp1C75EnBw3QgrTTbAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=SN/ysULC; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=NStd01G/; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4fzJn86M0pz9tsW;
	Sun, 19 Apr 2026 21:38:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776627484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=we5xyIHs0NFWcvYDbi577e9O31rX0Xej1rSPQzWrHfo=;
	b=SN/ysULCvLb/0n0ZmFal+NPz5SKWYgcMbk4fG9AJQVSyqdJSi0IZT2hmuwTMM767lLOUSJ
	T2YuZoa8F7RvztKZRjBUpxTqcPc3bIYYi4Afr3AgJlhtp2Q359PlcS//D4oP2sYkwRCuug
	g3qtLlqiDlXjbhZqtvWoZ67lZsnIFhzwEDOHKxuFvoMKK4nZGsh1OH+Z3rg6prLr/Kkdj5
	2RKdCTsAzm8MAY82l1PC/7oHOCuvGWVHjpDj8I10BAfv8aEUQn2rRc7mib/waQ8W+JttN8
	qW8pn7RWA4ZMfVTKiVrYqnipbvi03MI0EDkw3Xp3/nAQxX85jhJky7LpFNtj9w==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="NStd01G/";
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776627482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=we5xyIHs0NFWcvYDbi577e9O31rX0Xej1rSPQzWrHfo=;
	b=NStd01G/EbLl/qePHAnC2ZYPTFzRaYKmE9Ye/jnrEPYC1t0aPEf8HBfsh0G1Nnbyb5uwjU
	dZG3Sxzwb3Flt77gH8hSayLMB3SLLPT7tDSRk0w0eR5jMD1KVcYyEP41C51JRfHl9FXzbN
	DuxI12UNjqFDh9dbRthX8Us6H77dBCe5hmrAsnH0mCzDldS0nFojeh1mihtNNI18TUvsKH
	5+UECiT+8Qw1d2AFQmbBHdyb7UC7hj/riBL1YRn2AdkvnWfnWKbeSUOt9g4aeGv+WHwdSD
	KGpkVoE8utKFDo7ZAkeVtxWq06H7SiUOVDMBr96pg7VCyfIO6/4vUG0rPcVlig==
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
Subject: [PATCH 5/7] soc: renesas: Identify Renesas R-Car R8A779MD M3Le SoC
Date: Sun, 19 Apr 2026 21:35:36 +0200
Message-ID: <20260419193718.133174-6-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org>
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 6k9pyw1bts61ocsepbripihpw48mfryf
X-MBO-RS-ID: cba69b7caed497c583b
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
	TAGGED_FROM(0.00)[bounces-31386-lists,linux-renesas-soc=lfdr.de,renesas];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,baylibre.com:email,glider.be:email,ffwll.ch:email,suse.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,lists.freedesktop.org:email,mailbox.org:email,mailbox.org:dkim,mailbox.org:mid]
X-Rspamd-Queue-Id: B34E1425508
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for identifying the R-Car M3Le (R8A779MD) SoC.

The Renesas R-Car R8A779MD M3Le SoC is a variant of the
already supported R-Car M3-N SoC with reduced peripherals.
Enable support for the M3Le SoC through already existing
ARCH_R8A77965 configuration symbol. PRR reads 0x67c05501 .

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
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



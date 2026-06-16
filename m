Return-Path: <linux-renesas-soc+bounces-34097-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TxM1OOSNMWo6mgUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34097-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 19:54:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A186939FA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 19:54:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ragnatech.se header.s=fm3 header.b=GFSpkuGc;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b=OxkAnLD7;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34097-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34097-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ragnatech.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4A92301467C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 17:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 499AD477982;
	Tue, 16 Jun 2026 17:53:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798BC3C76AF;
	Tue, 16 Jun 2026 17:53:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781632389; cv=none; b=JH3Eg5SwgThYfccsjK/CmPXMtkyFy54cUzNG0Ar9ynYko51XlbmnfG4JoWA5v6wvRlCmYWVRB21C9WjBBA4K+cyL6WqeoJtI9kRg+0tBhukIgS0RAoObaqxvuGx/o4gEoQULSqUi477kDV1W7Ulspgoig8ylrFWQkk44DL/eMFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781632389; c=relaxed/simple;
	bh=Oy0RRk5QulwyIm+ZmmfOFXncoE5odDngKfJlDCAOesw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hs2b2EEBzgzYJIWvrM8cQ+IILdqGf3xfnGq65cNlj25qZ3EpQBQbtOVf5OaQVAAAcY4xze5D8F+qlTxhdnrbeLmZWUX4K+gp6FzKk7hvzUfBJIEHplA+SV+LOv6OK20rGC37LvuiSXVz/LuDiqVQPHM/N1XcpKcBq9t8LbMZhg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=GFSpkuGc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OxkAnLD7; arc=none smtp.client-ip=202.12.124.158
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 512D37A00D8;
	Tue, 16 Jun 2026 13:53:04 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Tue, 16 Jun 2026 13:53:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1781632384; x=1781718784; bh=2s
	ZyD20FMg/PCHT8+2P9zYIMVsHDFqtcWDSPeckFTvQ=; b=GFSpkuGc/Pe0VsyfNA
	GWp2tqdzHISRw3EOGaodpLgyvbGb262dEOiODNmC48z1eOrVEFftXnv37BoLjm/4
	64XXzxZp4xPCEA5i+stNXWfij1rqfyzQCYTQomb7Bd0uInG/4KIu12sDhKBCkRVC
	uxAMnSaeky32kJ29P3LT4Khl8NtKwooDxF2B5gTZR77/g5ZvxfvgE2HZPWf9J0SV
	PwudQGBQC1Fut6HMddBHZZ1uqvHW+JWTDoRQtmiQ+ltLQ/hYsfLzwWltE7WXpxVc
	iOounrYzvLrxxvzfs56R0dYoXCH4lqqIi6HAJLRZNE6zu7SRjqKYFH82dnTtE/uW
	aZ9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1781632384; x=1781718784; bh=2sZyD20FMg/PCHT8+2P9zYIMVsHD
	FqtcWDSPeckFTvQ=; b=OxkAnLD7t8l36oVunpiSIS6gMUwtZqrh4X7JJrF/8IS8
	MLYn9q+mO+6O1oEWKNs38m0PtJSYmkgnyfWvYPcoK+StxHKMJUs+5sT4e3LLGh5e
	CNOV4n6W/Ed/j1kqnTWnNT3ZXApCQBIZTI8kjWSpq+rBXaLFcZJLWiQ/Rih7xbQk
	JrEHr/AUlOWtztg+gOmtYIuosxWa9R2jZHNHodHobCKMtA4WGtV4eMCuZg1IZvPR
	dZIag8qcgrRtIGvXd6CYHCb/VGKRXsWZBUJjTwuv9FHSu/MlhGsW6s/jFAUPEUj6
	Wd2oSnRtG1tNk7WPorxk3N0eu0KCayBaUNYAZp3VrQ==
X-ME-Sender: <xms:f40xaj0BjLsUwHRZ0If51hpwDLRaCgW4a2l1jthzX7NsLt5Fue6LTA>
    <xme:f40xarbE4pHcY4A8-711tRpFN-IqApuGXKXokUrS-iPyAM9En6dUTQh-6pwOR2w0z
    9Ee-AfV5ZGlBLe9xi7WDelOA5aNuvBIU-schn2JnfMRCgSAHueHKfE>
X-ME-Received: <xmr:f40xarIUh2z01MVfwgb3qk9uEZm7DuzE1VP4ilHD1vSBHOcCntLFj0IE6wSmeqDyjZsTNnfBmoWFNNj5d1co8d3wfW63>
X-ME-Proxy-Cause: dmFkZTGZTgHPcy+1uLKRgSbbX+eU8C/CaT+cP3r9EzK9Ri7Jzpcqequ0QD1lsYGSBKZh8p
    UHCkWJe0J7az2+tVSLJLK8d9zGJJixlSyuWtuCe+UrgJmtkEz2gOHoGSY9MPbCOkKhIqSW
    jw24GYx7r4vlZkOPUJdhwxAp+4kX/9rloKwQ1h8YYKpi9TQPbaWdA75Htd0+mM46H1akvH
    QD8/ajRRfMKKuu7G1NEUFyXJcTZuB9HHCVPLUazKMKZikQ+n4dsnHgEOa5TCH8M2wrXfph
    4WDYeNZaxkGd0GO3mcpGCyIzqkT8V7Q1ryD1nCSYC2R9IG8vnq2t4n2d4bS3+5f3MaSSVx
    GYjfyYkXLJXrRChrZl5BGjg5PhwydErjCEuW7uemr3Newkd1rjTYoy3sv/l3otoo0Uxd4r
    wlELcEwJcFIAr6YWdhkPf3TrLLnXfGahAPB9913n/HcGXSlIcuZyCI/N2Af5IKAgnMdTF8
    OuevEIT4+oZDVsNgs47DRn+3sjejajQkm2Uxx3hGLO0mB+tjMQH6JTb5BInyEVoTOMQslA
    0ne31EDLz4u0HDH9hcb6DFgU+KUENfLNMY1LZRjCCGeqd/POghHh8pNrCjxdP+G+AjqJn5
    miXDe7ER7n8PvjhC6nPb47TZFQW3tAyEfZazjVNwr8rkUMeZ9Er4uicuyssw
X-ME-Proxy: <xmx:f40xaqHaY5FUg444xFfYro1PftcN_uE4uGFiLXqvs0fOSu4pueAhug>
    <xmx:f40xaiszZdZtcu2y90qTMcvpkth8DHqcpSVYvUbtCBnNXgTiTydx0A>
    <xmx:f40xaptvgalIC1dEsoK71Qo2DRgkPnjGLYKvX3B61mEj3lufp6bsLg>
    <xmx:f40xagCjia6glzXOR85wa1x6Odch49_1RjaRo20rrlG7wNNwWwqUEQ>
    <xmx:gI0xaqQKbyMNOX5_yGcPq0OLE58k4bzBXkK7mjRCFAL4D8KXgw4BKZ4g>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Jun 2026 13:53:03 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2] clk: renesas: r8a77995: Add ZG and 3DGE support
Date: Tue, 16 Jun 2026 19:52:47 +0200
Message-ID: <20260616175247.2104891-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm3,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34097-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:niklas.soderlund+renesas@ragnatech.se,m:geert@glider.be,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ragnatech.se:dkim,ragnatech.se:email,ragnatech.se:mid,ragnatech.se:from_mime,messagingengine.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 50A186939FA

Describe the ZG and 3DGE clocks needed to operate the PowerVR GPU.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- Fix the ZG parent and clock divider are not fixed, but configurable
  through the FRQCRB.ZGFC register bit field
---
 drivers/clk/renesas/r8a77995-cpg-mssr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/r8a77995-cpg-mssr.c b/drivers/clk/renesas/r8a77995-cpg-mssr.c
index 162fa86c81ff..315f0cb026ad 100644
--- a/drivers/clk/renesas/r8a77995-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77995-cpg-mssr.c
@@ -80,6 +80,7 @@ static const struct cpg_core_clk r8a77995_core_clks[] __initconst = {
 	/* Core Clock Outputs */
 	DEF_FIXED("za2",       R8A77995_CLK_ZA2,   CLK_PLL0D3,     2, 1),
 	DEF_FIXED("z2",        R8A77995_CLK_Z2,    CLK_PLL0D3,     1, 1),
+	DEF_GEN3_Z("zg",       R8A77995_CLK_ZG,    CLK_TYPE_GEN3_ZG, CLK_PLL0D3, 1, 24),
 	DEF_FIXED("ztr",       R8A77995_CLK_ZTR,   CLK_PLL1,       6, 1),
 	DEF_FIXED("zt",        R8A77995_CLK_ZT,    CLK_PLL1,       4, 1),
 	DEF_FIXED("zx",        R8A77995_CLK_ZX,    CLK_PLL1,       3, 1),
@@ -119,6 +120,7 @@ static const struct cpg_core_clk r8a77995_core_clks[] __initconst = {
 };
 
 static const struct mssr_mod_clk r8a77995_mod_clks[] __initconst = {
+	DEF_MOD("3dge",			 112,	R8A77995_CLK_ZG),
 	DEF_MOD("tmu4",			 121,	R8A77995_CLK_S1D4C),
 	DEF_MOD("tmu3",			 122,	R8A77995_CLK_S3D2C),
 	DEF_MOD("tmu2",			 123,	R8A77995_CLK_S3D2C),
-- 
2.54.0



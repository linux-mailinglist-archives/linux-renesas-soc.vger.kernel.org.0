Return-Path: <linux-renesas-soc+bounces-30586-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBxBLuZ5ymnk9AUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30586-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 15:25:58 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F40FD35BE94
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 15:25:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2B5533019FC6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 13:24:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A3003D564D;
	Mon, 30 Mar 2026 13:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XY/M0nAH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A653D413B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 13:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774877037; cv=none; b=kdL4nGWRZcJeAopHwzn8Nud8Ymmv7c2TafhV26pGPBNVqWdeWw9dB3PjQzqxiKyahD/XiQcfhjOQCgxF12+uvWilbBnHJqPkb66TSWJAM8rTBwnql47vk38SNMR6oqLZzjc1DfxVy/TLgH4QB0oNyGXNO96VyZPEBBJF0CDPN18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774877037; c=relaxed/simple;
	bh=go74QWu+iFgVsqmWU0G/IsVCO0weIN+J6ho4FS1p4EY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mV2gq426p4Bw0xp/C3OtzaTT1au9UueyLfgH+2iaZF/UgqT70EplIZ8+P0yYXfVv6Bkmh73aQ8mr3034T0S/FtvnDjxD5K+9SVy0Wb8e63KM5/3ZvU4rDP3/mZu0Faja8YA9OPVkHJy37dR5LPiXcS1cCsxnEkCuR4Kqr4/PJ1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XY/M0nAH; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-439c56e822eso4915876f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 06:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774877034; x=1775481834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fhXFPJKJGd0bXOpzHVgD/0nUk4ZFzTqAFRwOROjJVjI=;
        b=XY/M0nAHrN/aLuz3DbY4g8zAgoCD+pg4OW3U8USKQ0vuOdhy5RWNgAut8ahXVQJNzr
         DZp/sn2VNcHoRkA6wrCi3w1W1W3BP6BYi7H255925xFHGIzNmoEWPDKIS3SUReg4Hp+c
         qE4hbo1Ev0izWfL4WjL7utpLFTLHQ8qtSRzb+O003stOfwX00koA4PqwV45HATmYAPKa
         Mw9N3Rw5yxMgKVT1tEm6BGdXB3YHuNaws0bMYTVl4i/sXFfqcFZ0cMg4JWSA/PVxx5Ab
         IvZv7f5kZfX2u0mWQV8b2HDWDqRrbwddkUD+Eb0J/+0kMu+4Rj4g6mCBCEtcR/58QEKP
         hsPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774877034; x=1775481834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fhXFPJKJGd0bXOpzHVgD/0nUk4ZFzTqAFRwOROjJVjI=;
        b=FCGgDgHKxrOBCx/8uC5XGbgghGWM/nmWK7pqhijZIldhLaxMttXrXk+3tH+pcD6WLa
         cdpM3yPU0XLr89UGNUMvedms68/tv7LgJ6I53FDi9KX2Gz4g4VRZtGw+3g6SYx9kVWw5
         Vo9Ga/YD5Vtlp2+kk+ZNUSIoMCeRE09L6Kt+zFKnA8vNmK9txLLU8oW6WmO4ulQiBGpR
         0P7BozcwtiCtMWwILWRsxVtDPTGVA1f5S3Z30UR/RKg+Z0FnNDVDNtSMwgJeX7DJlvP3
         8qIf0bV09k/zanxzC7TS1kLjdy3fgXp6MxzT5rLJJ9xIYijs6Cdw5smyq4+aQF/sGHIL
         uv0Q==
X-Forwarded-Encrypted: i=1; AJvYcCV109O/z8tMCVpwXGy5diw/oQrsVeT2IWLX+hJruUjhUFPbAVf0BzK7rEMS1cJHP+Ytp94X6C+PaiFl01VKrTz6sA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwULcaFTXE7fjgSR4vBaDXbuv1OmVk5Y1vZG1z4pL0MlYb7T9mX
	WWN0Vv6AhT6j4G3cyzZ8FeD7DIg0G7tWTLNkG7fjbDh2XgJdJFc2PIII
X-Gm-Gg: ATEYQzwQ/wASr08nWX3L2zNVyyD5xcgFjq0r4WM8DI4v1maHEGtoqFQ41vxl9i737Uz
	/PN3WAGeN6NaRtODw7uPPzE9KNQgWrYP43AiF2cLFsdmbXVBxxnuBbCb3MHQ3C+p9dDqOrxvp9Q
	kzJRi3ip6iavwMUVRmm3MoMZ9b6hTgpCinhX/s5jqIsDyR196UbADWJQLpSlJukWFb6CPPeeAf1
	PhKxW55/ugt5TOfYtMC/AuCSasB7rtD1GkRF4DK5/S2K00LAb+Mqi6f+89/v0A8octBLcQxzRWh
	os4Y6/KVSaDerBRBoJMvm9LvVa8Ef9j5v+f+a2w+eup8HuQvKsBgW/wL24HXYLg6lCxKsoxlJze
	R1epMEEnx0ASCfJUhGPzkPeH5rzHN3Y2mk2ZmPY9Gvlfhn0CSoLPKnGW8i6RB6ASXQM1r0Bga91
	aPwDSXELC7+my7E+Qz2YezioXAYZG1SQ==
X-Received: by 2002:a05:6000:430b:b0:43c:fe7a:491e with SMTP id ffacd0b85a97d-43cfe7a4b9amr6697096f8f.32.1774877033717;
        Mon, 30 Mar 2026 06:23:53 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:e60:2c8a:54bb:d692])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e2628sm20825906f8f.6.2026.03.30.06.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 06:23:53 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 3/5] clk: renesas: r9a08g046: Add WDT clocks/reset
Date: Mon, 30 Mar 2026 14:23:40 +0100
Message-ID: <20260330132349.149391-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330132349.149391-1-biju.das.jz@bp.renesas.com>
References: <20260330132349.149391-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-30586-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F40FD35BE94
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Add WDT clock and reset entries.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g046-cpg.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index 4618c4d1d503..28d035613272 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -219,6 +219,10 @@ static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
 					MSTOP(BUS_REG1, BIT(2))),
 	DEF_MOD("dmac_pclk",		R9A08G046_DMAC_PCLK, R9A08G046_CLK_P3, 0x52c, 1,
 					MSTOP(BUS_REG1, BIT(3))),
+	DEF_MOD("wdt0_pclk",		R9A08G046_WDT0_PCLK, R9A08G046_CLK_P0, 0x548, 0,
+					MSTOP(BUS_REG0, BIT(0))),
+	DEF_MOD("wdt0_clk",		R9A08G046_WDT0_CLK, R9A08G046_OSCCLK, 0x548, 1,
+					MSTOP(BUS_REG0, BIT(0))),
 	DEF_MOD("eth0_clk_axi",		R9A08G046_ETH0_CLK_AXI, R9A08G046_CLK_P1, 0x57c, 0,
 					MSTOP(BUS_PERI_COM, BIT(2))),
 	DEF_MOD("eth1_clk_axi",		R9A08G046_ETH1_CLK_AXI, R9A08G046_CLK_P1, 0x57c, 1,
@@ -275,6 +279,7 @@ static const struct rzg2l_reset r9a08g046_resets[] = {
 	DEF_RST(R9A08G046_IA55_RESETN, 0x818, 0),
 	DEF_RST(R9A08G046_DMAC_ARESETN, 0x82c, 0),
 	DEF_RST(R9A08G046_DMAC_RST_ASYNC, 0x82c, 1),
+	DEF_RST(R9A08G046_WDT0_PRESETN, 0x848, 0),
 	DEF_RST(R9A08G046_ETH0_ARESET_N, 0x87c, 0),
 	DEF_RST(R9A08G046_ETH1_ARESET_N, 0x87c, 1),
 	DEF_RST(R9A08G046_SCIF0_RST_SYSTEM_N, 0x884, 0),
-- 
2.43.0



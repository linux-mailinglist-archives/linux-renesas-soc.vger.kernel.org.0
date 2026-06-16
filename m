Return-Path: <linux-renesas-soc+bounces-34066-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Na8SO50pMWricwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34066-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 12:46:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0B868E6F2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 12:46:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=On1uQfK4;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34066-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34066-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4EA253131A0E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 10:45:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F26AA438FEE;
	Tue, 16 Jun 2026 10:45:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC65436344
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Jun 2026 10:45:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781606713; cv=none; b=mnR2XMuz7CAOvp4TjLVzPF4M0n6PbBxMxVQefykRDivq02GaYCJHckrzxLS1ApmgkT/HmAcsCayjIiCP9+/MUmBqnxZFGno46NOA7XX6RKd8a+Ebo+BSfkUiyWCa/Z6julUu3VBFA79jVU70pgZ++haP5iOTTJJY5kMM4+1WhkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781606713; c=relaxed/simple;
	bh=TYiIgFrPD6Ex09yYScNeYAsRnxuNwm3Tf9OTaxyfK44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PiP+idnxL6Z12Qug0mTecXStAMBsc5P37Vxr4j1gb5zBW1ne2n/xlbbnc3xxuFH/glsEUB+Ro0JVI6rbSkP/FT647QZPHuvW6ibeno7B+Rt+jQ6lktfI80u64lyDI+rPqLtv3H94GHbZ0Pqm75bKmf8Zr88c9SSaytRNMfA0iYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=On1uQfK4; arc=none smtp.client-ip=209.85.128.46
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490b211ee6aso32920655e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Jun 2026 03:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781606706; x=1782211506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eRdQ0mB8T22sJy61YojBzvNldoyOxyXfa5OzvwUaJnU=;
        b=On1uQfK4rERpKO8wAWysRH6HjsW88QMhk9dkf7Mf7OP4PXbyOnuFaq6iiLTYa2wOyy
         0FyQVUwq63uYva6BNokNsjFcCbZpwSicc7SqU45N3whe8oPPPoWjWITkd3LKMoX7NdTQ
         p/eJ1A0bACIyY8dUZeJOnuSrMoR7rxgs1XCQ9hpdkkcV9YTmE/mywTguqIdvO1shM+Vi
         kLuDLOa8p0JyfHYJJGbcYeeP17OUnffshM1DzhaHpMaQcJRSUkQo6zinw9qd7fHqH4/G
         UFnSUPZiuowr1xC6kR3jGYJ8ut4q1i7CseLzk4KunQMMqpbM398oOQx1np21tk9P8B5k
         kKpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781606706; x=1782211506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eRdQ0mB8T22sJy61YojBzvNldoyOxyXfa5OzvwUaJnU=;
        b=Sd0JbDCdmym22tNR94u+smbQIflVuyl1Jgps8a1uiV97t0F52qEn2tcAcMRnE9OVdK
         471OkpE++KcG+l9ZogGz/AsDGI4O473rdWgUD8o8TkWtYA0nE6ChDLy/i/QTIy4NUtHM
         N/bJzFon7Vl9Q8EgbEhd2LIp41TdCbSsgLQwa45JvfJJH1nVp5/N8w5Yz9P2kdTJdUsb
         VSwfM4v3CMAXyzTM8gsDsyCYPY3DvgyXN2hD3EE30lwNY97AWkM5b17mP699RvcEsO3y
         i6mNhfoW/WgsdTdBcC01j2od4ELu8c6mdnkRtptLFYM7BrVVXsBMJC3tDvpDSaiQuYpN
         090A==
X-Forwarded-Encrypted: i=1; AFNElJ+pqHsrWrwFDcc6YN1+8ZfMj0QNIcycILvXkUDUsDoxo0MRuRf9w+bbRJ2FsqU/mZVucm3ZxumJ8lxqOu8nQCCGYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrKy6ZYgryDmR8MO8vOj0HlFBU7/zlHGSVhrbL4uvZoVZM1ybS
	HBI5DEOsuW72bFWcHgWske1LbYCdidQ4pI7sgLiDDNz9Z+5/UcyiFkiB
X-Gm-Gg: Acq92OFq2Cmgs2vbWIfrjWNEmLLTeJOb2hKgPkmjIRxUbgyrJJKKlN6qsnloZp7ctkL
	1smww5OT99waMuis32FYDWPY5dAf4crGlG1AyQ4yNGzcyTOUPPOg4wZKGC+E2F59b57uxvtLvoc
	Fm/VU0p5plGwInPYEqe/lvxc5mVexbLzigyErRxdJ3chgSe4xEypA9+SgSayMeX4ttGrfigwbEq
	meIdqjToeeyQAHrF+xsrnFih5548EkJulTLWJoa1Mg5grLLsEdkzieavDX633oJYU6Yb3btmXxS
	PmN8Vm2sdDS4snYORHXDKvRvbCGko5W+Tf5ju9qAyq5ZZmgL97ZvTuHmnzPU6hQ5c4yrO8Q1+hR
	Pu6LWT79NuCrNDG6rGuRXzHcV/N7dCNHSG+WDCtkjO/neA8TcOx2vnltd6ZZI6uIYZOVhm7yMkT
	KSmYvgUd9y/WbPk4mTcc4amVtmYAXlUIruzUM8Dnow4Bmmvbxl
X-Received: by 2002:a05:600c:574d:b0:492:2e58:666c with SMTP id 5b1f17b1804b1-4922ffa6323mr30917895e9.37.1781606705902;
        Tue, 16 Jun 2026 03:45:05 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:7499:34c3:598b:e20c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa47da9sm82458485e9.5.2026.06.16.03.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 03:45:05 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Brian Masney <bmasney@redhat.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 03/10] clk: renesas: r9a08g046: Add USB2.0 clock and reset entries
Date: Tue, 16 Jun 2026 11:44:45 +0100
Message-ID: <20260616104459.410743-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616104459.410743-1-biju.das.jz@bp.renesas.com>
References: <20260616104459.410743-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,redhat.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-34066-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:biju.das.jz@bp.renesas.com,m:bmasney@redhat.com,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:geert@glider.be,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4D0B868E6F2

From: Biju Das <biju.das.jz@bp.renesas.com>

Add module clock and reset definitions for the USB2.0 interfaces on the
RZ/G3L (r9a08g046) SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 drivers/clk/renesas/r9a08g046-cpg.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index edc83a4104b2..4488bd1988e8 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -416,6 +416,16 @@ static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
 					MSTOP(BUS_MCPU1, BIT(13))),
 	DEF_MOD("ssi3_pclk_sfr",	R9A08G046_SSI3_PCLK_SFR, R9A08G046_CLK_P0, 0x570, 7,
 					MSTOP(BUS_MCPU1, BIT(13))),
+	DEF_MOD("usb_u2h0_hclk",	R9A08G046_USB_U2H0_HCLK, R9A08G046_CLK_P1, 0x578, 0,
+					MSTOP(BUS_PERI_COM, BIT(5))),
+	DEF_MOD("usb_u2h1_hclk",	R9A08G046_USB_U2H1_HCLK, R9A08G046_CLK_P1, 0x578, 1,
+					MSTOP(BUS_PERI_COM, BIT(7))),
+	DEF_MOD("usb_u2p0_exr_cpuclk",	R9A08G046_USB_U2P0_EXR_CPUCLK, R9A08G046_CLK_P1, 0x578, 2,
+					MSTOP(BUS_PERI_COM, BIT(6))),
+	DEF_MOD("usb_pclk",		R9A08G046_USB_PCLK, R9A08G046_CLK_P1, 0x578, 3,
+					MSTOP(BUS_PERI_COM, BIT(4))),
+	DEF_MOD("usb_u2p1_exr_cpuclk",	R9A08G046_USB_U2P1_EXR_CPUCLK, R9A08G046_CLK_P1, 0x578, 4,
+					MSTOP(BUS_PERI_COM, BIT(13))),
 	DEF_MOD("eth0_clk_axi",		R9A08G046_ETH0_CLK_AXI, R9A08G046_CLK_P1, 0x57c, 0,
 					MSTOP(BUS_PERI_COM, BIT(2))),
 	DEF_MOD("eth1_clk_axi",		R9A08G046_ETH1_CLK_AXI, R9A08G046_CLK_P1, 0x57c, 1,
@@ -531,6 +541,11 @@ static const struct rzg2l_reset r9a08g046_resets[] = {
 	DEF_RST(R9A08G046_SSI1_RST_M2_REG, 0x870, 1),
 	DEF_RST(R9A08G046_SSI2_RST_M2_REG, 0x870, 2),
 	DEF_RST(R9A08G046_SSI3_RST_M2_REG, 0x870, 3),
+	DEF_RST(R9A08G046_USB_U2H0_HRESETN, 0x878, 0),
+	DEF_RST(R9A08G046_USB_U2H1_HRESETN, 0x878, 1),
+	DEF_RST(R9A08G046_USB_U2P0_EXL_SYSRST, 0x878, 2),
+	DEF_RST(R9A08G046_USB_PRESETN, 0x878, 3),
+	DEF_RST(R9A08G046_USB_U2P1_EXL_SYSRST, 0x878, 4),
 	DEF_RST(R9A08G046_ETH0_ARESET_N, 0x87c, 0),
 	DEF_RST(R9A08G046_ETH1_ARESET_N, 0x87c, 1),
 	DEF_RST(R9A08G046_I2C0_MRST, 0x880, 0),
-- 
2.43.0



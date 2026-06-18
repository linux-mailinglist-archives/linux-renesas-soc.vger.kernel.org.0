Return-Path: <linux-renesas-soc+bounces-34210-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id j+VcO842NGrcRgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34210-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 20:19:58 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C946A2174
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 20:19:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=RrHlSvKn;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34210-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34210-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 16E44303E134
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 18:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FBDC35E925;
	Thu, 18 Jun 2026 18:19:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085682D0615
	for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jun 2026 18:19:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781806796; cv=none; b=SshzS98wrpHWZqYm1967rdtuVX3M+spFzO2cZyfPThbiK/2bJpLPLH0bDrikrdFTHtOYXJcE/ZMP5rUgz79MY/fBpL+S4LuRdlLGbrbaMPr+4jA2iCEUqZNrSfFzXjJGwh72mHwF/307NrEeGoOjXefHF8WabdTgsYOb1fKBLWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781806796; c=relaxed/simple;
	bh=wyus6jMf6L/ne+kZpMNuO/ZqYEE/vAChmJZBV21nv+k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T9QGgVt8K1/SPKGrBnUJw4MdXM5aaDQTQqZxUi8AuRRl19gFK4T1vED8jkzxkXf/cFB88Fp545qQzjt/LdhEnQVq88SW3iQuhrf5hK6DMT2KhauXCu3ZKjMGOVpk4wFWqMX/0O4R2Ix/z4f40fVAoj8DCHABMdhx8oWW0CcBIZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RrHlSvKn; arc=none smtp.client-ip=209.85.128.48
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490be29c1c5so10865345e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jun 2026 11:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781806792; x=1782411592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hDx2KOMtLHoOAsbWqrbmN2XtpZ4cl5riM/ynIeqZ12E=;
        b=RrHlSvKnZ00IwZD0KFKd1d1lz+8jIQ2ze2pPz/xTLrCzQSuKBdJ5OElN+IPqxq13ND
         KERS3B+5mpqyj+CMLWW2Ooc1ifV3s3WBGBFfU2Q2IlsM/pC7uSOpQ5wl8X8MsPZIstEE
         Q3/MvyFRwzqii2PU8oRqMPkDMyFDk0b4prvFbmsbtPcBtUs4onNXdIDfUzS9kzG5K9Hv
         /MMIwhGPBUe/OeiFuGdtRoNGbgsB/jTYfg/WsaztTOEOK3D+M/n4S52jaEv0KQqXSqsa
         qVRNxqS80bwYQR5S6mgaL4DeLOd5qknNj9bYNZbo6gOkTkOduQjtqQBjtkaIAcGfPgdM
         cnGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781806792; x=1782411592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hDx2KOMtLHoOAsbWqrbmN2XtpZ4cl5riM/ynIeqZ12E=;
        b=dW0d68lplCkrnpnHKrpmB7E+bI0vDGceE3DcfGujbcJKLnpDK/SpYmGntuhU72cVxi
         crtc2HBqKQiV7UkhVRUgyLKER9SDnU5yGIh3D3jMYVyXMyzz99BiImznLyRG0s07vXP9
         qPAWijVWwUNh8VZHoIxkWdJlVJ4fW6xdn/Boxesz/FHtZ1uVLSNpCmtHi1PBQXrrAEhC
         9TmlSy1vib46+qpj9uyDKzOSmVWb2yEeAIK76/mhBnBdMIsJQhdGwJQJtkeWScG3vG4/
         vXG0fyrRpcuUa+AyaJZOLyeDD5izUgJ7efEFTCAT9SVyOGvEBvlhKQkGzny8Rh2pSgPI
         v0zg==
X-Forwarded-Encrypted: i=1; AFNElJ/ciF02i4XLBDzKMbtbBY1u1Cw3odvcwYPszMdmZxaMklLh7NEtVPgdPYQbvfKbfYfeqZ3grwG5RZKw2xPTJLz/Wg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5b5atPLipbSHX3cJ4vH99SGGXYuHj7eQMyVmnK2LC2MRVRfsd
	JHhCjEmIRwrXfagijK2jDEcRgmbCGEHYmXuat213dl9zq97w8JduWGEZ
X-Gm-Gg: AfdE7cmLsdkusKakmIcKU8yXgGXS7s7GAQd4T4GrAMW7VX/UwQeXOle1BKlcNYGrAEK
	TzNSxR4QBW1QGPDKbi9aiZMQd23Pg00DrMc2PbtwN4fxYrhyOrpdT1mH1LEk/ZIs5/TuTumTR8N
	poWrNpycY/JvReXrw4qyVDblDiYgEBK3aWPGOyovGMlWZTgMwS5WtS0q9ylGXN81UQvDbxtXyGC
	Bh/o8sUytbJ8eoexeZ9uVG5c2+p709YSWRNT/j6t9GtEFb3CpYCGB0xmiji2spid4Cs1FUkHRe2
	c0e5kTjk/h0Gmres5am7qc4jBhi0o8U5YCfXX0o+sU1uMcSQn9AKBGtaLta329dkaczne83nT1Z
	rG0qCHpaqPT05TTJ+y/IIlrBnVOPoLd8+Rojirpd+kyo/1WmNKQ2I2RaX/huCryJ4mAPiLp7Vvm
	XTXp2VTAGW5M/HKtyVGsIkqQ0SU+x4mxLqWlwDLyDr+SmMWF+sCH1WJsgBWyEbxo3XDVMJkcyuR
	pbWNuGIEJ/Nj3XVEAtfq0UbLA0=
X-Received: by 2002:a05:600c:1f92:b0:490:c2a3:1781 with SMTP id 5b1f17b1804b1-49240eb1519mr96105e9.34.1781806792275;
        Thu, 18 Jun 2026 11:19:52 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3bf7:d534:a488:f67d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-465090c42e1sm869435f8f.11.2026.06.18.11.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 11:19:51 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 0/5] Add PLL3 and LCDC_CLKD support for RZ/T2H and RZ/N2H
Date: Thu, 18 Jun 2026 19:19:44 +0100
Message-ID: <20260618181949.3036280-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34210-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,redhat.com,gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 52C946A2174

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This series adds support for the PLL3 and LCDC_CLKD clocks on Renesas
RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs. These clocks are essential
for the display pipeline, specifically feeding the LCD controller.

Key Changes:
  - PLL Reference Flexibility in  the RZ/V2H(P) CPG driver
  - MSTP Dummy-Read Mechanism
  - LCDC implementation in the RZ/T2H CPG driver.

v3-v4:
- Fixed MHz to Hz for input_fref in the doc comment for
  struct rzv2h_pll_limits.
- Added macros for rzv2h_get_pll_pars and rzv2h_get_pll_divs_pars
- Added RB tags from Geert.

v2->v3:
https://lore.kernel.org/all/20260615104845.4122868-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
- Added export.h include in rzv2h-cpg-lib.c.
- In r9a09g077_cpg_lcdc_div_determine_rate() made use of 
  clk_hw_get_parent_by_index() to ensure we retrieve pll3 as the parent.

v1->v2:
https://lore.kernel.org/all/20260609105924.962573-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
- Dropped RZ_V2H_OSC_CLK_IN_MEGA macro in favor of direct use of the
  input_fref field with a fallback.
- Updated the doc to specify the default value of input_freq when it is 0.
- Updated commit message for patch 1 and 2 to reflect the new approach.
- Dropped using table based approach in favor of direct conditional checks
  on the clock index.
- Added Acked-by and Reviewed-by tags
- Added new patch#4
- Switched to use the new library
- Kconfig now selects CLK_RZV2H_CPG_LIB
- Renamed CPG_PLLEN to CPG_PLL_EN_EN
- Renamed LCDCDIV to LCDC_CLKD
- Changed ctr0/1 in r9a09g077_cpg_pll3_clk_recalc_rate() to use u32

v1: https://lore.kernel.org/all/20260511191910.1945705-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (5):
  clk: renesas: rzv2h-cpg: Use per-SoC PLL reference frequency for
    calculations
  clk: renesas: cpg-mssr: Implement dedicated MSTP delay logic for
    RZ/T2H LCDC and RTC
  dt-bindings: clock: renesas,r9a09g077/87: Add LCDC_CLKD clock ID
  clk: renesas: Extract RZ/V2H PLL calculation helpers into shared
    library
  clk: renesas: r9a09g077: Add LCDC and PLL3 clock support for RZ/T2H
    display pipeline

 drivers/clk/renesas/Kconfig                   |   6 +
 drivers/clk/renesas/Makefile                  |   1 +
 drivers/clk/renesas/r9a09g077-cpg.c           | 373 +++++++++++++++++-
 drivers/clk/renesas/renesas-cpg-mssr.c        |  20 +-
 drivers/clk/renesas/rzv2h-cpg-lib.c           | 217 ++++++++++
 drivers/clk/renesas/rzv2h-cpg.c               | 203 ----------
 .../clock/renesas,r9a09g077-cpg-mssr.h        |   1 +
 .../clock/renesas,r9a09g087-cpg-mssr.h        |   1 +
 include/linux/clk/renesas.h                   |  34 +-
 9 files changed, 637 insertions(+), 219 deletions(-)
 create mode 100644 drivers/clk/renesas/rzv2h-cpg-lib.c

-- 
2.54.0



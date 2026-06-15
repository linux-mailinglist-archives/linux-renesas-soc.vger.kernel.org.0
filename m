Return-Path: <linux-renesas-soc+bounces-34001-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PcBMNjvZL2qPHwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34001-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 12:51:39 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7282C6857B5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 12:51:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=jbJQi97Z;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34001-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34001-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8EE6D3061527
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 10:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0680A309DB1;
	Mon, 15 Jun 2026 10:48:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E7528725B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 10:48:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781520532; cv=none; b=iBPeH56veye4BAJ6fLrCN+/dW3uNJ5bK7Nr4/TLBrZ2ni3eIDYoIDaPRzv4S/6Px53ajiyNjgQfn94G8UTsb555deEBUfs8dBQEj1lcNOH/bPYy4nG7bItrGV324Ijqnm4zd/B7nWxPZ5qdvil1cSrGwI/c3goZX/A4msJ45ATk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781520532; c=relaxed/simple;
	bh=7HEj4WEED0R5EEGbwYYG+JQUNMtKiAap8Cf8DhjhpFI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nfbpm4CA0jaojgLQUvV5VTDSdhmHhpN6GMk5Oyih5Da3afWy3/LHd3sRW7B7PNShloJRXF5BK2WM9QZX8D05QBLL4i0OxDY/jkSNlVOFfI8zQNghx/aM07Uur4y1Nj6v4zR6VhOnHsQl9+NTWUbuBKvSCI8ddO1api6f9vMpj9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jbJQi97Z; arc=none smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso23664685e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 03:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781520529; x=1782125329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7w9hPguA1bshK09M+ZUaGXEUslA7wzRau8OxxMknDPw=;
        b=jbJQi97Z/wF8cdoApZulzSOAU4gKSLTpGWYc1bShnxlsv5zvratsuz7CAYsJRjxkkR
         aljX8iHBJGBAPov9ITFwn9UqJoMhvrlSkxY7pj7CZB7vusgwErt+UX3FJMCChUsXJyQ4
         ISJbna554hm66Kp8ta/njguHbloYRfko2Ujz4t76lGlXVV+zLihIICNNeOE12+xzrs/N
         mplDga3nhzPhkcbvbu2kfCVQbRGt8be8YTUS0LGfy6VvO0sfJWCb/BIed4zBedbYEvsD
         HdjXkrICWxUxIzkSSX5uLT4xgIlXCK05dMYx6fU1hsfVNmJxwKQ0je9mRbzo1UVR0hZM
         Ljxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781520529; x=1782125329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7w9hPguA1bshK09M+ZUaGXEUslA7wzRau8OxxMknDPw=;
        b=jxg8PK8S2fjrNUT7FmPyoBC7+RoX0DdjoSNslJfqajNZ6V6l6lTlhL9k2ZglmUvV3I
         BWBZz62YgVkh3sA82i2yx6VmKCULPilNd/NGjBGpi7ZQoLN1lvnek+HKsdDhc2BiNU3Z
         RHOVd3Hn4IMivvW+6FU/xFF23tGyAwrGFdi7zVJ/yfjul2/19PdQGiutXXJDjq9K4SpY
         4jNCC0p7r7Bb3/ZMwTLO9EkZgQcFuYRgIq0UbI5Iqb3zJh4IYyWbmLWkK1ouHjnD3d8j
         2ad6fP5umfLJJopHQGl7TtmbYIh60pD4mI6Xk0ERwlg3VXTWLh31EP+3ZUAP77xRI9Qe
         cL5g==
X-Forwarded-Encrypted: i=1; AFNElJ/z4UySWZe0SDc5TUnTdTgNssG2vFIB06Vs1K5Vnst66YDYxj4JFp5TWMXDay5ZXMCtmDlKjHCl0gN2G6b9Usi4PQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGlPH7IYvrUJ/RpGqcpgEkgk2nP/UV/BClNwRnD9s2AWDqawIN
	GiBHdc4NoNJUEDiAzB3NQ5KpbvJkF0612Jt5itHT6m1hC3wMG+k75IJq
X-Gm-Gg: Acq92OHD+fTkHYrhGfpKnx5gQB5i9/PYvb7DFR5Ja6wz87v7gAH4a5jDsm2VsRCYLs4
	SHcMaNsWiIpYb1h+e4yZQ9MV/0N+GEATxAFkQU6ydVo3rNPA54nHTiGAx//6SY2O4ODr4gWza+G
	SsrTi58PGc5570E8EJaCdnzXs1tKabE+l8SYg4B+GSQProbwOsEiRfIj4AXyQLQgzGV5KVi9T2D
	tU3zYLDS8yZSjvhdyrRzExikA2ESfz0GDWPBZwhcrvLQXMEMZYTLhFFt+XiYAQ1+vwpbH2A8C9e
	VWTXcckXidy0iuOKw/9sdUk/R+mDcCQPFFaxGHx/oGILUR1w8IxQI3FoId9cZFwiONlPlL2nsQt
	eYPHl735CfzzVcZZklwwBqGXgT7dFiSMqboPPyO5hA4RBUzm6TjEheVjd544CJpvoyuJltlD0K3
	ySbmccyIEk+RmCaUKNF3Oam9V0ctR/GtG/7KldWOqDGY+K01ZXzdwm+nntzgWdPQ/TRk25aWB3K
	xVWzbd+75cJo7+Aqrp1+ucuX9Q6/1RS/hIb71XiaeFcDuI=
X-Received: by 2002:a05:600c:820c:b0:490:e913:6564 with SMTP id 5b1f17b1804b1-490ec4cc6d8mr177591485e9.3.1781520528560;
        Mon, 15 Jun 2026 03:48:48 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f1cdsm34812464f8f.11.2026.06.15.03.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 03:48:48 -0700 (PDT)
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
Subject: [PATCH v3 0/5] Add PLL3 and LCDC_CLKD support for RZ/T2H and RZ/N2H
Date: Mon, 15 Jun 2026 11:48:40 +0100
Message-ID: <20260615104845.4122868-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34001-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7282C6857B5

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This series adds support for the PLL3 and LCDC_CLKD clocks on Renesas
RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs. These clocks are essential
for the display pipeline, specifically feeding the LCD controller.

Key Changes:
  - PLL Reference Flexibility in  the RZ/V2H(P) CPG driver
  - MSTP Dummy-Read Mechanism
  - LCDC implementation in the RZ/T2H CPG driver.

v2->v3:
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
  clk: renesas: rzv2h-cpg: Extract PLL calculation math into a library
  clk: renesas: r9a09g077: Add LCDC and PLL3 clock support for RZ/T2H
    display pipeline

 drivers/clk/renesas/Kconfig                   |   6 +
 drivers/clk/renesas/Makefile                  |   1 +
 drivers/clk/renesas/r9a09g077-cpg.c           | 373 +++++++++++++++++-
 drivers/clk/renesas/renesas-cpg-mssr.c        |  20 +-
 drivers/clk/renesas/rzv2h-cpg-lib.c           | 217 ++++++++++
 drivers/clk/renesas/rzv2h-cpg.c               | 186 +--------
 .../clock/renesas,r9a09g077-cpg-mssr.h        |   1 +
 .../clock/renesas,r9a09g087-cpg-mssr.h        |   1 +
 include/linux/clk/renesas.h                   |  28 ++
 9 files changed, 650 insertions(+), 183 deletions(-)
 create mode 100644 drivers/clk/renesas/rzv2h-cpg-lib.c

-- 
2.54.0



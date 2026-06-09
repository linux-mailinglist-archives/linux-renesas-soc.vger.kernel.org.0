Return-Path: <linux-renesas-soc+bounces-33742-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GVX+A2n2J2qa6QIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33742-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 13:18:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E656365F6A4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 13:17:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=fLkPF3Ok;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33742-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33742-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F34CD307D8F0
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 11:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB4973F8EA1;
	Tue,  9 Jun 2026 10:59:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1805E3F58EB
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jun 2026 10:59:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781002774; cv=none; b=TM2+QBg5GA7HfMhC3PkdHineKUaiHhfCtEmygjLC4YkGD/367gElbCWjWA1ZLzyjx+CPRiCdMpG0Djl5p65t1Ichps3YY4SPaKamKIx+INgX6LkNotFNgRFk0v7FaGCAVIy+553Nj/ssIR4R4JpPme6HG035baiO7NHakgxnss8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781002774; c=relaxed/simple;
	bh=n87GT43w3DdRTkTnhNUWVAKarzjSVs0P2+42rKxMlLw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pYmIHX7pLU6/XheN4VO1BEUO7jCMM9k/gd8UO7Shsk3xRCNnj90uRJnwS7W3XAPpdr0hK5KEuKsuJAwddU/omvrXpIv1TL3uZ0RqnmzFaAKoqHtfhUutP+2mf2WpNulL1PprZ5S9ztSNpkyba7GNz1+7acJ63YThAW1YD+xFS1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fLkPF3Ok; arc=none smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490b211ee6aso41695295e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Jun 2026 03:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781002770; x=1781607570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Awp9o+G4t/KB8Nuw9M9eoFnlOxMqCJMqbpEUDuh8Jz4=;
        b=fLkPF3OkYbZc9tpACZedzC/B77KDwpmd40jvpMIIdp+1VWCX4wcHYF9Np6S1rYZ7qz
         8fg3nFsWI4MqWkc4OWbWmiCUwEC4jHbnmTjw8SVWn4bkkioiiuMgrEMjz/3HwM1i6O6q
         gxV2s9jscKeAaMrNdAJ/w5SuqJSJJu83lGo05+s3qEtDHmIsmCKFqHBv5hO+a+n9mzOg
         qJhaBxsysD37WhY+AfKcPs65IrSfIECQvkTOzDuvZOngxDmBbrSS/8BNHdXFv55eguSW
         XklSldjrMMLlfdLMvPKgXQvhX/6xu8CSrv4Eb5Kj57lE5Ye8WVRMDWWX/n8HDqvMnzho
         orxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781002770; x=1781607570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Awp9o+G4t/KB8Nuw9M9eoFnlOxMqCJMqbpEUDuh8Jz4=;
        b=asntLARL7c/sD0JCCuyttzo2PZE7fAF8P1omhgy5JrhOF3dQZtN8oAQA7Xs7XaXoIt
         cLRrK8Sr3DMa5/telvP/HJ3u00aAoHpPlASueBrrj7OHorfuezoaIMEqyRGbDSYurc1h
         3tXkCNU1+m/867e1jXbTGsZvRrAkN98N9w/gYB3LqhF5ouMNY3mUjL1ma0UhLoWxG/qd
         v5T8TAiJRwCByL37lMXuzY8ELW3gUflq5f9eny5o1u/TqDyw8TN4V5XRi+99QrIxp0Lq
         UAJ/uAfyqLyet5GFJrzaPL8tv6znaGMWfUBIUTuDCXXkxvJCODd2PZ4BePV/H4hkNWSu
         XATA==
X-Forwarded-Encrypted: i=1; AFNElJ9qW8+glPBBy57rybIUXtI9saD2j7JaDXeV8lbrpURDQ2bvqiKhf9oj8p/5FbIpgLFVBbUcfW26VX0/u3RlVxmLLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLd0uXcayrbkUX3ECFpK8Uu6OeHV0YeAWYQtejt9xbb3rF8dOJ
	UD66QKzQowws9ixnERsE9iZJyir1+HRJ5a6o5lleJFppjFbj1r7176qv
X-Gm-Gg: Acq92OGlsDzu3ykwcIeU6eNd8sWp2I9fUULunO1aDoGBtdeULszGjlnDkJbn++FFRWu
	0ZZ9YRlYbECNMvZO1it/HJCuNHIDguWiu1p26fEjiLdCG3oXDmgx7DpbD+eLAb4RgvDsbEPnUlY
	3CLIBPmrgybvoTg188ZuGfe1Iv7tiGGUunnFivJA4dU9YTCxTriwyieE3EvmW6FDobxJRJBqOGw
	Z5ONoPZWML4X7TPlzCoK5TQOcag1nZLhcqdc01/KiafMPwnpiM4KpETTcw40QCl2i0OJTEdZBk1
	qXlIq9ipjJw749TvGze+BcADbni41WBIwD51+MJcTX/xOTcdV9QFT7LK57CCNRSSn0SFKlMZLHY
	t4lBQky6HoT3nV8dWt1y9PrkxmJ8FgjZoPgUzlCCGw05a867ccIPG2/fvkJJSqt5wbQnp64yMaa
	P80wj9G+G70vrsjjHdUM4GARFWSYDct4fW0wh7+/jFOhNxWiRIS9tyXIrcY/qBqcWFWWLFy1U83
	r3eytaLGqlXisJmHWVezbvSoW4glLAweRaAOhvM/GyGW+8Y7mEsvJFojQ==
X-Received: by 2002:a05:600c:620b:b0:48a:53ea:140b with SMTP id 5b1f17b1804b1-490c25cf45bmr337771525e9.28.1781002770128;
        Tue, 09 Jun 2026 03:59:30 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:2b2d:6009:3bbe:fb84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3d663csm524250635e9.11.2026.06.09.03.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:59:29 -0700 (PDT)
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
Subject: [PATCH v2 0/5] Add PLL3 and LCDC_CLKD support for RZ/T2H and RZ/N2H
Date: Tue,  9 Jun 2026 11:59:19 +0100
Message-ID: <20260609105924.962573-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33742-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E656365F6A4

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This series adds support for the PLL3 and LCDC_CLKD clocks on Renesas
RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs. These clocks are essential
for the display pipeline, specifically feeding the LCD controller.

Key Changes:
  - PLL Reference Flexibility in  the RZ/V2H(P) CPG driver
  - MSTP Dummy-Read Mechanism
  - LCDC implementation in the RZ/T2H CPG driver.

v1->v2:
- Dropped RZ_V2H_OSC_CLK_IN_MEGA macro in favor of direct use of the
  input_fref field with a fallback.
- Updated the doc to specify the default value of input_freq when it is 0.
- Updated commit message for patch 1 and 2 to reflect the new approach.
- Dropped using table based approach in favor of direct conditional checks on the clock index.
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
 drivers/clk/renesas/r9a09g077-cpg.c           | 369 +++++++++++++++++-
 drivers/clk/renesas/renesas-cpg-mssr.c        |  20 +-
 drivers/clk/renesas/rzv2h-cpg-lib.c           | 216 ++++++++++
 drivers/clk/renesas/rzv2h-cpg.c               | 186 +--------
 .../clock/renesas,r9a09g077-cpg-mssr.h        |   1 +
 .../clock/renesas,r9a09g087-cpg-mssr.h        |   1 +
 include/linux/clk/renesas.h                   |  28 ++
 9 files changed, 645 insertions(+), 183 deletions(-)
 create mode 100644 drivers/clk/renesas/rzv2h-cpg-lib.c

-- 
2.54.0



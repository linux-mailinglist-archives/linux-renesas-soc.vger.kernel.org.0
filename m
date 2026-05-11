Return-Path: <linux-renesas-soc+bounces-32397-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CL0eOiIlAmpooQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32397-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 20:51:14 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8735149D4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 20:51:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2FF9C3003819
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 18:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 309904C900B;
	Mon, 11 May 2026 18:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CoN7uiUm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853704C6F16
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 18:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778525468; cv=none; b=n9HhlOCP/mkNrKYVcDJUYsH3Hg/pBiNpCjqoYMOB/QWXf5+r9KKcjG6s9QqrAjs+DwpzSY4RKTP7GsZvR49yYmeF76OcbeJhes2HzPRNPOIaiL3PGSrOD3lLOF3wRX8Gdci204fAXsFskbSXeJQjjorRKFa1UcUgk0iAL1pSDko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778525468; c=relaxed/simple;
	bh=DT00nk2LP9Il6r5Jw/XCnU4nDevdgeglfjX5CCyi9ms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CiqSxHLIpzNCTduvcKWtOXAv8n6DbBZgvU8S9HFSdcHpgVmjnYp3rWr5b1sB5BPUdWeXg2bp7fY7BSwwSvjOR8RHx/Ho92IWchtcrSDJMGrLfC1BBJ4Wfe7tuPaYbfNEaE+x6jvtHqrX1qYCInyvgCxVMgAk/F65xtVUj25czMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CoN7uiUm; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48e82c23840so12022235e9.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 11:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778525465; x=1779130265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=789XEeQ4I50MnaW2OnqahHH0vEgS0bTPRF2lefmkIno=;
        b=CoN7uiUmhC1IwDUitqX6Df+HS49PlSE7ASxWpNFZu/2e/ATuZPC06AWqKRZ23FLOGG
         Q+HD86ULr3lWgTdrTTElPjO/3L/7pafYMgBFFaWngwXK0UNwdqA2HspRAAycGgth06qz
         +4g4rJAYwRJq/YtLKjX80jK2dFVZIXTE6ICncM4vnjIn4YoJhn3sWdA0ejCnvLuUO/58
         pd/JfgQmcw07GUGrND3vEkjMrM6xiJ5W8FiAc9fBpYOxstDwQrpcXa6a6+Dm6+L1Dywu
         5+aT98Yku0lQ7BV66PhYXtpxS5eqjdFZMVIANmQZp1bJX2zhNaOKBcMQPYhl0PM8GgHw
         ZgOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778525465; x=1779130265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=789XEeQ4I50MnaW2OnqahHH0vEgS0bTPRF2lefmkIno=;
        b=SZMcBC9MsMctVG4zTWHoINTwN0n4PzDWrHl5Q4k16rsEe12uyVzRre44qtsA0si5W9
         y1y+DHRFOoWA0GFdaZAAoMj0I6O3Tw71nZy4rHE/19mVn1PBj+5Hk81S+gu/XcLgqVJj
         snDlT4T9cBaWUlripgoLjxEYaY9hjpJVh7iAMsnaHDBEu/OzA6PqUqCXQXqj5vbHzh8I
         U7v/kSQYZyQF6rf3uVAVFjnY5zA4deFOJy+4HsBxAM3WI34obRHJ4Dg33FZRwdGqn7w6
         HWQfDlM1xF4bUY8t7NsDUcdS371CAjBX1nUul6K6h+I9KkmnsWVEZMxVk1iCcoyZoBfG
         0KXw==
X-Gm-Message-State: AOJu0Yynj1Iy19TYpYP1YcWCWDH4KYSHdG3MvWbpEapcbZGmH1AsM0AA
	cWPkYrDbNZJAXCyMBvEc9vDl/kHJD/NzFkQbFJ9ZgnYrFcIu+86x5SM9
X-Gm-Gg: Acq92OG/BNjlPeE9UPy+GalKuMJm8lpP/OeXjTMFLJX/jySRH34Jlnt+uHq3ZMLDYxB
	PnWMf+jEopteBOcg80fBITStQfCnHyXrX3QqFxzPK+RIbtEgGEPPGgQBDsP6U8SSvBosKRzKHm7
	t1ud1t0SoNv51AAGDhcSBRROiN9TiGHQFmJamHZk4UWlmexVvj9FL2hBL7T1N/9mf+hJYLDdeiE
	hOozYU//jFObGnqngWw4GyEIelE3Vc3x/8swCYx3w5IlIRV8ZSBIePr6wn6u2gzGhCaYl7kbOYY
	I6jgUS6Q2s06z7Em5uAFGHNTAzqNcH2PUPyLq6A36t+2+lVe/11D1HNRyeNizLN+PREA0aj54ov
	l0zoN8c+0pgcxgr8TqrHX9ictyilEJ6YpHo88QjHRM/q5th6ruYDBZvrfeEufOsP/QDjDNo1kiL
	zCvqjwGwm2xoDN0QtbpGusjW4roJ9NIGzMVSRKVtJ5C7xQo/v6lN+pJefcYrtz3eTe+7wj0yO2C
	LlCCNALSxTlmEUsKPKJY8seoudC9FhQANE94w==
X-Received: by 2002:a05:600c:c166:b0:48e:6f39:f7be with SMTP id 5b1f17b1804b1-48e6f39f7d2mr194207385e9.10.1778525464608;
        Mon, 11 May 2026 11:51:04 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e687:6094:b849:9886])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f3cf0cdsm854775e9.2.2026.05.11.11.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 11:51:04 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 0/9] Add System Controller support for RZ/T2H and RZ/N2H SoCs
Date: Mon, 11 May 2026 19:50:49 +0100
Message-ID: <20260511185058.1926869-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3C8735149D4
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-32397-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,redhat.com,linux-watchdog.org,roeck-us.net,gmail.com,pengutronix.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-0.974];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This series adds support for the System Controller (SYSC) blocks found on
the Renesas RZ/T2H and RZ/N2H SoCs. These blocks handle critical low-power
management and access control functions.

Hardware Architecture & Dependency Challenges:
----------------------------------------------
The SYSC in these SoCs is a multi-functional block responsible for:
    - Clock & Reset Control
    - Low Power Management
    - Clock Monitor (CLMA)
    - Access Control

A key architectural detail is that these SYSC blocks are physically located
within the CPG/MSSR (Clock Pulse Generator / Module Standby Software Reset)
address space. While the CPG/MSSR driver is already implemented and
functional for these SoCs, the integration of SYSC adds a layer of
complexity due to a cyclic dependency:
    - SYSC requires CPG: The system controller needs a clock to operate.
    - CPG requires SYSC: Access control registers within the SYSC contain
      bits necessary to control the PLLs managed by the CPG.

If implemented as a completely separate top-level system controller node, we
would face a cyclic dependency between the CPG and SYSC drivers during the
boot process.

Proposed Implementation
----------------------------
To resolve this, the SYSC blocks are represented as child nodes of the
CPG/MSSR controller in the device tree. The SYSC regmap is registered
directly against the CPG device node. This hierarchy correctly models the
hardware address space while allowing the drivers to share resources
without deadlock.

I am sending this as an RFC specifically to get feedback on the
implementation of the SYSC as child nodes of the CPG to resolve the
dependency cycle.

I have also included patches which updates the WDT driver to use
the SYS syscon for register access.

Cheers,
Prabhakar

Lad Prabhakar (9):
  dt-bindings: clock: renesas,cpg-mssr: Support RZ/T2H system
    controllers
  clk: renesas: r9a09g077: Add SYSC regmap support
  arm64: dts: renesas: r9a09g077: Add system controller child nodes
  arm64: dts: renesas: r9a09g087: Add system controller child nodes
  dt-bindings: watchdog: renesas,r9a09g057-wdt: Add SYS syscon support
  watchdog: rzv2h: Refactor WDTDCR start/stop handling
  watchdog: rzv2h: Add syscon support for RZ/T2H and RZ/N2H WDT control
    register
  arm64: dts: renesas: r9a09g077: Use SYS syscon for WDTDCR access
  arm64: dts: renesas: r9a09g087: Use SYS syscon for WDTDCR access

 .../bindings/clock/renesas,cpg-mssr.yaml      |  39 ++++
 .../watchdog/renesas,r9a09g057-wdt.yaml       |  29 ++-
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi    |  38 ++--
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi    |  38 ++--
 drivers/clk/renesas/Kconfig                   |   2 +
 drivers/clk/renesas/r9a09g077-cpg.c           | 180 ++++++++++++++++++
 drivers/clk/renesas/renesas-cpg-mssr.c        |   6 +
 drivers/clk/renesas/renesas-cpg-mssr.h        |   1 +
 drivers/watchdog/Kconfig                      |   1 +
 drivers/watchdog/rzv2h_wdt.c                  | 104 ++++++++--
 10 files changed, 394 insertions(+), 44 deletions(-)

-- 
2.54.0



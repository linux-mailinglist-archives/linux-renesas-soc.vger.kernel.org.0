Return-Path: <linux-renesas-soc+bounces-34644-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G8PMAUtdRmokRwsAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34644-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Jul 2026 14:44:59 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 216146F7D1F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Jul 2026 14:44:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=HUNdG64N;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34644-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34644-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B66E2300A25B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jul 2026 12:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20F6F48124C;
	Thu,  2 Jul 2026 12:31:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472B847F2D0
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Jul 2026 12:31:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782995490; cv=none; b=R4PznDImfoP4dBZg2O41kQEMr+nfhm0BjsGhCtDG8h1SgsuBu06fzAc5EuGRQOgdN/FcRvNcY9ZeyO0JDuDqQOPWbD2IYDkhGOkP5ogxiRtJb2JFESntIgkel7bAcczRPiC0KB71oeOgKKQpEO1e9ZWsXvorasIdEj6uIwBb/DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782995490; c=relaxed/simple;
	bh=PBsL63385RAQASu6cjiwEI5QAXcF98UXE3vaEk4luIs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gpwvNhUsKcIIDqhnCOPYpFu+pxmUHYsC07kg7nwEjUHJZkIHYcB4FbLVeZAylsluHmlN1eWLXLv0tjbFzg9OUoefV6WG85MMdg9xwmyzC12mM9A+3syLGXEDibxv4fr2DvWLKNfaPlTYKQb6XxsEeQ/rtVjBAYalslApB7BHzgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HUNdG64N; arc=none smtp.client-ip=209.85.208.41
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-697cee2eb6dso1648605a12.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Jul 2026 05:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782995485; x=1783600285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hSvByosXnUK2EIuN834ipW7Za/9pwuwT5oGO+dAubwY=;
        b=HUNdG64ND2FTccFt5Vsb8lA3B4C3voUDeM1w9S+r5PT7TTQho7ti3C5BcZ09mXoKQg
         AogwvIzvY6+6r4JAWVrQuNEsV3n3Vhay62VXmkAGN3ADT8qsQWzlom+CWoqecvDmXaHz
         Wtx/xxMfJdJPCDzJclOmzprpGljhBvtHsypLzGKYPcpQjKcY4AGE1JPBC4AAJ+xPzi8v
         h/byTwendsDBXmb8CRhElc/hYQDNkPiNJuq+gP77mIymxOfgA9crRbzTsZ+gFQ4aI1fJ
         P1n/U5omtHa2heXofXlxIdh5tI4jujQeoIoykrNdvBU/pXVOK7tIJ4hlgyEMAujSFLAY
         29Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782995485; x=1783600285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hSvByosXnUK2EIuN834ipW7Za/9pwuwT5oGO+dAubwY=;
        b=SKzyKB0Lf2ApUnCn8jxIxYi0/aVDmp5Mym6m3jUEJOIy3sKFeBGk9H+BojDQ7A6yps
         GEBK7Ue1M0UNkZ8k69YI/TWyVZyz1L923a37s/tg8ncidg9Q1ZnM2yMKUC/SnanuTDLU
         3kb1uLdyku8FmA+YVXfID+foPo4U64Rh1ul3MumNo2mfhcjBeSi6yo/4QA5kjDpp6m3B
         lQf1tdkZEpU5X/YWdVpEjHu9A7XFbQvGr9NzMbmeNmhvJfxbFmpmV5g59bmP4IIkySfT
         07u3ExzRiipZYH4w3oJYMRtFhRaBq0dRR/HLzVvNykPkfd65ngY66cVlI47UOip5J9Wk
         zu0A==
X-Gm-Message-State: AOJu0YyvvBDXJyhfmwcRJ/gcuFcxsj/zl2tRE1WnlfipFweFyg2hKFQj
	Fs/7MjKfSTXonMenm0nW2tkY4Js1zPx23FvBsTpSLrZAI+r7Q4jzuOrj
X-Gm-Gg: AfdE7cnJEdm5QbOyFl61mvr0vrSp6C1NvnLtWPvU3DjVoIkys32lB1BSXsCaY3G6tD5
	nrwY8Zy3fRwrP0nyr72m8+QREda0VcFzdl3EDJ1Rp6lpJ2hNC5fuzsBnZBQW0qvv5N6TuNh33b2
	0ae/ljglMZul9XyN/kzyjzESgCq2M8e2al+/DgaLnuN6MTSSVvA+7UKAZFQvj9+0VhJ0E2rDgyo
	cA2qKXr3CEn/umZ3yer/jGBAiBMFi1w328TeFnPHpT0rENWK8qIbXOvXyTXL7EIXY28XzWKUs2u
	m1a/weQiz3kDkrtPc2ZNNneyZANOWw8LoFBEI4C1SZqLYRbu5yO1j3KEPrAdrTW4mUOBh4MUvQX
	0DqzTnqBWs0hfjV85RNuLCw18q4CstwGsYoFF+wIs5xftJxDh25R4L+Kz6/YXMlnYy4Dd5M5cDW
	7JHKzFE+iOuGUhYY72tRTi8x5n6JmeIk3dpZxfTaqXgCa2yv4VPQ/3tmIzKUsxvOUrV+ofWiuvf
	092HcY6RT+mHAcwa9h/yy0oCU8=
X-Received: by 2002:a17:907:a03:b0:c12:b2dc:4834 with SMTP id a640c23a62f3a-c12b2dc4a59mr204811966b.57.1782995484944;
        Thu, 02 Jul 2026 05:31:24 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:7a4b:58b4:175e:8c2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477ddf0f433sm9772923f8f.32.2026.07.02.05.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 05:31:24 -0700 (PDT)
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
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH RFC v2 0/9] Add System Controller support for RZ/T2H and RZ/N2H SoCs
Date: Thu,  2 Jul 2026 13:31:03 +0100
Message-ID: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34644-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:wim@linux-watchdog.org,m:linux@roeck-us.net,m:magnus.damm@gmail.com,m:p.zabel@pengutronix.de,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-watchdog@vger.kernel.org,m:prabhakar.csengg+renesas@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,redhat.com,linux-watchdog.org,roeck-us.net,gmail.com,pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 216146F7D1F

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

Patches have been rebased on top of next-20260701.

v1->v2:
- Updated commit message for patch #1
- Made use of for_each_child_of_node_scoped
- Moved sysc_init() to the end of the probe function

v1: https://lore.kernel.org/all/20260511185058.1926869-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

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

 .../bindings/clock/renesas,cpg-mssr.yaml      |  39 +++++
 .../watchdog/renesas,r9a09g057-wdt.yaml       |  29 +++-
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi    |  38 ++--
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi    |  38 ++--
 drivers/clk/renesas/Kconfig                   |   2 +
 drivers/clk/renesas/r9a09g077-cpg.c           | 164 ++++++++++++++++++
 drivers/clk/renesas/renesas-cpg-mssr.c        |   3 +
 drivers/clk/renesas/renesas-cpg-mssr.h        |   1 +
 drivers/watchdog/Kconfig                      |   1 +
 drivers/watchdog/rzv2h_wdt.c                  | 104 +++++++++--
 10 files changed, 375 insertions(+), 44 deletions(-)

-- 
2.54.0



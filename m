Return-Path: <linux-renesas-soc+bounces-29994-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDqUJF4mvWmr6wIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29994-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 11:50:06 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBE92D9072
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 11:50:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9D39F300DCF1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 10:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3FA8396D10;
	Fri, 20 Mar 2026 10:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mCHMwjzq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE8537C91F
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 10:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774003797; cv=none; b=WoYBOo8NBiGoTASosZg6ylEAIMHP4dXB+KAnllGrxjnqmNfjizOYlyU7C5xXHYbGX4s3Jy98YzJuAG18bGZVOjCMbIPOrmuFEbbT55Ka1HPJEytFGS6G343RC0YEQfYOCrtFBBnHygBpjMxooG1r6laT3hy0da+hwIpC8uvT72w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774003797; c=relaxed/simple;
	bh=bFhpjaMlHtIwRd+pLEuA6Ly4V31lpFcx75blc6pjvGU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FixCEXlgUwGjowbpDGSF/JEJ2RsMJNWBjy2lI5L56RCDqJyXL4SV0NOGZVoe6kbqUWLI/YDrYQ8rEErap9zg3TLXq54J5fCGgobq66K3F622gXMBfgz0csG4Tw5eU5Ak24AdyUbYTsRQkhxvP2g4T/047sWhJoFwojJyOM8v3pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mCHMwjzq; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso4316125e9.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 03:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774003792; x=1774608592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=THjFPouQg437NJaoPLF8FkFVaZQR1muEEDowlf3lcBw=;
        b=mCHMwjzqvvAeeIPHQNIyJ+JI01GePx2Rq29p6g/4ujcaSgqNqWQ+FjU+N+XyxUGUZM
         1YwpbShuEckVonDkSNdCqPhuGHLS+rhdCdw6O8tAbzkQvmOcK5KHie2VA9Z4cLjg2Vht
         PSyz31QrUdYeb9uidUGZqTgqfG40uPE+ysYX1/c1oK85VT4ILiMZ2skp+VVATBJaEN2J
         3DRs9H2agNNQagulZ39J372SbJ3e4ML+fkUucuffZIp2RmpSZJgujnz3nNHP5tIYb4zL
         yEGLUPVgoPGH7nzYY3AWmB9uXjBlFTibc4ty20Tcoph3yQ4aqUgEynZx5WEWdOAS4x48
         uS7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774003792; x=1774608592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=THjFPouQg437NJaoPLF8FkFVaZQR1muEEDowlf3lcBw=;
        b=INTiJyiScJBFC81n3ZD3gn+mLnHr+q0sEZoY0+LsdtAWAYEvxDfpRJ7WR8d2cdeIkd
         xARby2u25Jl1vgNdVdN9+aheVX944at3/FcYBlTtVKWbfiRFzAHOSEVtkNc5zyqIXwrV
         eB2/VxDcGyCM/WRcpsCCycM/9rQlzPp792/KBrPwlxVxdxgM4miMCQUJpPEv/2UcxGC3
         6EzVZ5dPpGbeiv4L4oiB683gTVOaAO2p/c4HOMraeAB4Fq8i8LOf/v/wGgC13y1cgABp
         ew8g/kUVQz4xwWHsimC88cUWX7cWfHb+9FMqnGS+n2TFtYczIWZCVbj8LEztROu2eqft
         29jA==
X-Forwarded-Encrypted: i=1; AJvYcCXB0FU4GBqN0MeH3d1muOgunkoc1SyI6/ZFOIQnopKtXdQ7hNyrTeXd9u9eyH9bFcRZVR8lEo468WwjH8Cn9DSZDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxF4po7HocP2YK9eGts+/+dSG4oYts204lFjw4EAGuz7OfLTWv
	ksBbRRv/ATKs27KjTjteNSWp3bYQ+7eZPOcYqQO5pVIdBjFExt9B0z7q
X-Gm-Gg: ATEYQzwygBtVgxdo/pZUEVDskM8kth2dGeiKXzeWQLqOffgvjMg7gYdovS1VM/V/RFo
	Lo0Sqk7O8HS2J4IDGGqrkqUz+E3SLWOU7GizaM7/JC9HjbpI5cVnWFt1R0utgvY37t1qHmn3qkv
	0iNowg6vrBlAa0XynY5hamJ2PYgRs6Ms5fxC7+cpebAMHEcm1a3KW7oGbdYgsm9gskmkb/Usj27
	ZYTH0INEjGtdtqTmHMWlsQQEf06wlGzZzbvpvoaAZXlTEDObqudFMYYWm4Lxh2wdcKcX+755SrT
	5GyvkErgz72uXESXGcXfmsgl5q23L5j7DfOUy/bdmNn9UO7GM0b6A4Y7LKkSSoNAfNJnKg2vacp
	JEiA9o2iL9WwCqm6Hq0M5KS55l98QFVoZFVAikPNnU7/8lwG2YakP8JHk2zJGruJK1I6QDo5Vw4
	QZJ5eyOIni+B8gzyyxwAXuaZsIfwW/QQdsqm1Ke8HPXQ==
X-Received: by 2002:a05:600c:1f86:b0:485:ae14:8191 with SMTP id 5b1f17b1804b1-486fedab44amr38008475e9.5.1774003792180;
        Fri, 20 Mar 2026 03:49:52 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:5b93:d2b1:bc5c:9231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644ae619sm6203062f8f.5.2026.03.20.03.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 03:49:51 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v7 00/10] Add support for Renesas RZ/G3L SoC and SMARC-EVK platform
Date: Fri, 20 Mar 2026 10:49:34 +0000
Message-ID: <20260320104950.42220-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29994-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,baylibre.com,glider.be,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.670];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 3FBE92D9072
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Hi all,

This patch series adds initial support for the Renesas RZ/G3L SoC and
RZ/G3L SMARC EVK platform. The RZ/G3L device is a general-purpose
microprocessor with a quad-core CA-55, single core CM-33, Mali-G31
3-D Graphics and other peripherals.

Support for the below list of blocks is added in the SoC DTSI (r9a08g046.dtsi):

 - EXT CLK
 - 4X CA55
 - SCIF
 - CPG
 - GIC
 - ARMv8 Timer

This series also adds SCIF support for the RZ/G3L SMARC EVK board (r9a08g046l48-smarc.dts).

v6->v7:
 * Collected tag
 * Updated r9a07g043_cpg_info by inserting a blank line before
  .has_clk_mon_regs
 * Replaced r9a07g044_critical_resets->r9a07g044_crit_resets,
   r9a08g045_critical_resets->r9a08g045_crit_resets and
   r9a08g046_critical_resets->r9a08g046_crit_resets for consistency
 * RZ/V2M has critical clocks but no mstop, so move the mstop check after
   enabling critical clocks. After this, we need to restore only mstop for
   module clocks, so remove the inverted logic and continue statement and
   directly call rzg2l_mod_clock_init_mstop_helper() if the clock has
   mstop.
v5->v6:
 * Collected tags
 * Moved loop variable declaration inside for loops in
   __rzg2l_cpg_assert() and rzg2l_cpg_deassert_crit_resets()
 * Replaced r9a07g043_critical_resets[] -> r9a07g043_crit_resets[] for
   consistency
 * Introduced rzg2l_mod_clock_init_mstop_helper() for code reuse
   in probe() and resume().
 * Dropped the list implementation.
 * Replaced  rzg2l_mod_clock_init_mstop->rzg2l_mod_enable_crit_clock_init_mstop()
   for enabling critical clks and restoring mstop state during resume.
 * Dropped dma-ranges, bus-range and comment from the pcie device node
v4->v5:
 * Rebased to next-20260317.
v3->v4:
 * Dropped SoC identification patches as it is accepted for renesas-devel.
 * Updated commit description related to core clocks section in the
    hardware manual
 * Dropped CLK_P4_DIV2 from core clocks
 * Added MIPI_DSI_PLLCLK and USB_SCLK to core clocks
 * Dropped LVDS_PCLK  module clock
 * Added BSC_X_PRESET_BSC reset
 * Moved the patch series from [1] to here as it is boot-dependent.
 * Updated commit description
 * Updated LAST_DT_CORE_CLK with R9A08G046_USB_SCLK
 * Fixed typo 2->8 in dtable_4_128[].
 * Added critical reset table r9a08g046_critical_resets[]
 * Updated num_resets
 * Added crit_resets and num_crit_resets to r9a08g046_cpg_info.
 * Fixed typo R0A08G046L->R9A08G046L in commit description
 * Dropped R9A08G046L46 from commit description
 * Dropped unused audio_clk{1,2} andcan_clk device nodes
 * Reordered i2c device node and updated reg entries by using lower-case
   hexadecimal number
 * Added placeholder in pinctrl node
 * Dropped unused DMAC device node
 * Added pcie node with placeholder
 * Collected the tags.
 * Updated commit description for patch#8

[1] https://lore.kernel.org/all/20260306134228.871815-1-biju.das.jz@bp.renesas.com/
v2->v3:
 * Added macros R9A08G046_ETH{0,1}_CLK_{TX,RX}_I_RMII in r9a08g046-cpg.h.
 * Keep the tag from Conor as it is trivial change for just adding macros.
v1->v2:
 * Dropped scif bindings patch as it is accepted.
 * Collected tags.
 * Squashed the patch#3 and #4
 * Documented GE3D/VCP for all SoC variants
 * Documented external ethernet clocks as it is a clock source for MUX
   inside CPG
 * Updated commit description for bindings.
 * Keep the tag from Conor as it is trivial change for adding more
   clks.
 * Added CLK_ETH{0,1}_TXC_TX_CLK_IN and CLK_ETH{0,1}_RXC_RX_CLK_IN clocks
   in clk table.
 * Dropped R9A08G046_IA55_PCLK from critical clock list.
 * Added external clocks eth{0,1}_txc_tx_clk and eth{0,1}_rxc_rx_clk
   in soc dtsi as it needed for cpg as it is a clock source for mux.
 * Updated cpg node.
 * Dropped gpio.h header from SoM dtsi.
 * Dropped scif node as it is already included in common platform
   file.

Test logs:
/ #  uname -r
7.0.0-rc4-next-20260319-g870eaaba5d4a
/ # cat /proc/cpuinfo
processor       : 0
BogoMIPS        : 48.00
Features        : fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics fphp asimdhp cpuid asimdrdm lrcpc dcpop asimddp
CPU implementer : 0x41
CPU architecture: 8
CPU variant     : 0x2
CPU part        : 0xd05
CPU revision    : 0

processor       : 1
BogoMIPS        : 48.00
Features        : fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics fphp asimdhp cpuid asimdrdm lrcpc dcpop asimddp
CPU implementer : 0x41
CPU architecture: 8
CPU variant     : 0x2
CPU part        : 0xd05
CPU revision    : 0

processor       : 2
BogoMIPS        : 48.00
Features        : fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics fphp asimdhp cpuid asimdrdm lrcpc dcpop asimddp
CPU implementer : 0x41
CPU architecture: 8
CPU variant     : 0x2
CPU part        : 0xd05
CPU revision    : 0

processor       : 3
BogoMIPS        : 48.00
Features        : fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics fphp asimdhp cpuid asimdrdm lrcpc dcpop asimddp
CPU implementer : 0x41
CPU architecture: 8
CPU variant     : 0x2
CPU part        : 0xd05
CPU revision    : 0

/ # cat /proc/interrupts
           CPU0       CPU1       CPU2       CPU3
 11:        104        191        429         62    GICv3  27 Level     arch_timer
 14:          0          0          0          0    GICv3 418 Level     100ac000.serial:rx err
 15:          4          0          0          0    GICv3 420 Level     100ac000.serial:rx full
 16:        229          0          0          0    GICv3 421 Level     100ac000.serial:tx empty
 17:          0          0          0          0    GICv3 419 Level     100ac000.serial:break
 18:         17          0          0          0    GICv3 422 Level     100ac000.serial:rx ready
IPI0:         3         16         13         21       Rescheduling interrupts
IPI1:       315        240        180        217       Function call interrupts
IPI2:         0          0          0          0       CPU stop interrupts
IPI3:         0          0          0          0       CPU stop NMIs
IPI4:         0          0          0          0       Timer broadcast interrupts
IPI5:         0          0          0          0       IRQ work interrupts
IPI6:         0          0          0          0       CPU backtrace interrupts
IPI7:         0          0          0          0       KGDB roundup interrupts
Err:          0
/ # cat /proc/meminfo
MemTotal:        1887304 kB
MemFree:         1852164 kB
MemAvailable:    1819524 kB
/ # cat /sys/devices/soc0/family
RZ/G3L
/ # cat /sys/devices/soc0/machine
Renesas SMARC EVK version 2 based on r9a08g046l48
/ # cat /sys/devices/soc0/soc_id
r9a08g046
/ # cat /sys/devices/soc0/revision
0
dmesg | grep r9a
[    0.000000] Machine model: Renesas SMARC EVK version 2 based on r9a08g046l48
[    0.066480] renesas-rz-sysc 11020000.system-controller: Detected Renesas RZ/G3L r9a08g046 Rev 0

Biju Das (10):
  dt-bindings: clock: Document RZ/G3L SoC
  clk: renesas: rzg2l-cpg: Add support for critical resets
  clk: renesas: r9a07g04{3,4}/r9a08g045-cpg: Add critical reset entries
  clk: renesas: rzg2l-cpg: Add rzg2l_mod_clock_init_mstop_helper()
  clk: renesas: rzg2l-cpg: Re-enable critical module clocks during
    resume
  clk: renesas: Add support for RZ/G3L SoC
  arm64: dts: renesas: Add initial DTSI for RZ/G3L SoC
  arm64: dts: renesas: Add initial support for RZ/G3L SMARC SoM
  arm64: dts: renesas: renesas-smarc2: Move usb3 nodes to board DTS
  arm64: dts: renesas: Add initial device tree for RZ/G3L SMARC EVK
    board

 .../bindings/clock/renesas,rzg2l-cpg.yaml     |  40 +-
 arch/arm64/boot/dts/renesas/Makefile          |   2 +
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    | 212 +++++++++++
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   |  37 ++
 arch/arm64/boot/dts/renesas/r9a08g046l48.dtsi |  13 +
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   |   6 +
 .../boot/dts/renesas/renesas-smarc2.dtsi      |   8 -
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     |  20 +
 drivers/clk/renesas/Kconfig                   |   7 +-
 drivers/clk/renesas/Makefile                  |   1 +
 drivers/clk/renesas/r9a07g043-cpg.c           |   9 +
 drivers/clk/renesas/r9a07g044-cpg.c           |  13 +
 drivers/clk/renesas/r9a08g045-cpg.c           |   9 +
 drivers/clk/renesas/r9a08g046-cpg.c           | 153 ++++++++
 drivers/clk/renesas/rzg2l-cpg.c               |  77 +++-
 drivers/clk/renesas/rzg2l-cpg.h               |   8 +
 include/dt-bindings/clock/r9a08g046-cpg.h     | 342 ++++++++++++++++++
 17 files changed, 933 insertions(+), 24 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046l48.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
 create mode 100644 drivers/clk/renesas/r9a08g046-cpg.c
 create mode 100644 include/dt-bindings/clock/r9a08g046-cpg.h

-- 
2.43.0



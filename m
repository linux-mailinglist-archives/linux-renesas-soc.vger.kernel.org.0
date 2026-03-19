Return-Path: <linux-renesas-soc+bounces-29887-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DsiAmnxu2nkqQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29887-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 13:51:53 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8632CB5EE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 13:51:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D80963007B9D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 12:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1578B3D3CE6;
	Thu, 19 Mar 2026 12:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AJf+ysW8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9013AD536
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 12:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773924709; cv=none; b=aE1dhdRXcLkc036yhQvsFJ2zUji/5kg6VbBFlY0hn/dvuYtOq5TzJqD9GO1YdbS7BZPiv71ZpURxqidudvczJ3mS0KYs7pqnHdAW+XbYR/9OAhSxUHWPxicK4O1BFSLi9tf3xep14p45hpMHtB7QWIkrsrpmenTQqYt7bniivw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773924709; c=relaxed/simple;
	bh=/l1bnVkGem4MqEzfBQblyxg6B14I7jMa74xvB9xjGGk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CCaGLCx5vCofguo7saJIjG4FXQMb8/ZBxsSdRodOy77ayO7ZE40MkztUfVv81YeroetfcXC29LxuXdNw4v/KlZI9Ggwyp3/duCN3WwAM8R1mfQgo3fI4xJYa2Rdt3FDIh0ekKZB/wIElOtBfWqAMw/gYGY9uNoiRc0/Jb4JEyVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AJf+ysW8; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-486fba7ce4cso4719115e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 05:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773924706; x=1774529506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=foXJbJoB4vuNc/wW0ZQIJuxNe/SnQleGWDy81kgaI84=;
        b=AJf+ysW85VrNRFGlnHYFfxsHM4ZvN2Rl0qwxAUt6idxG78qrFqzJY3LC9CuEAvdMuH
         7NuAGDVttfSH+xqQADDdTt4805yGI9EJkrH+iMcnwRWAVxJWd+ki9VOJrfpqXsJMnOZ4
         P+1mO9nk2Rbepr4lFXy4Gfpoxh0sSov0kx64c9krB3Y1LoqfcuFK/5Tpu0o89m0VcWjR
         BWHmqXpy3ZKOvH5EuoEWhX4ALXrHXXC7bDFhyQ4fGsQziJ7eAVmMWwstf4yC6zRl1lHy
         O9H1HHHes2tYmYdUqSMzOY63EcWM56Zai2VBEYlx0FsGneGXp0WpxRCX7hfE9Dsb06MT
         rQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773924706; x=1774529506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=foXJbJoB4vuNc/wW0ZQIJuxNe/SnQleGWDy81kgaI84=;
        b=M07HQ+fN8TqIplWicawev28RPXYZC3Hl45QfnW+vt7K8s6veyzNhQxBNN+VJlmRm/G
         Yvtiz+Nn/acGM+sI0UzqOMhVkRyHkczdxmOW6+E+jnONS1avB/EM3T+ovGTokbxaomcV
         zWGSdIYDAvAoycdvWLBADKsZIvSxdrtMc+QNvJBBchukHjHruudK6rkvFqzjdXoltPVP
         b2o8mBFw0A/dYLr7bFQ9XOV0j3ustI8UitqjujIC1bJdI8B4ZMlmvhD7VRxBmTbJfQq2
         suK7eY8vc3Pj8n50B+r9l7egRF9i4iDh7GJT9HkZAkLW2+xT+JRjuPDqcAfOn1XJZNQt
         1D/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVrQG1NEAgoC+cfY4cJBMc2aalUUSLGLQDbuaqcJS5J0k9TDxj6BkqSoWvRSIbtO/3LVdZWA6ytOq8Ufg0MUtAd2w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3KpguHZheoj0yZRaQUUTAOvuhk71Wwn9YsoBR0S0dmPPl9cKr
	j62nlOW+EK8Rcr+Pl6CyBp5QjcahjYZbmuYp7IUtgDd6Yt7XnDM9EPd+
X-Gm-Gg: ATEYQzxN+nC+k1KwZefTCN+t2Z6SxRjNl+yXsSlX7Xa/a46A2Pf3WxWq0pYd3FrlW5W
	eL09aJ4n3LgRinRnin0M22fNigFDUV/bk1qk9i9AyFf2odm3X6tMllpeuLOy0Y4QisPoD4gXzYp
	kAFXVz1Rk3MCqLd6qD0OIExhOvwUeREAT0x5JjXKuwU5ltui5EmyQPpBD9bLekbCqayZnLzdfWl
	fMYmpeCPbePJTZlp2zBEosNnS/0T8J2+p6qZOtT5opzkzkOWglBfoBL3rb4dnjSwIz4xXSxYkUb
	AWb4KRWFAeeUFaXMkVHa4+cT8rBcLsonaAtt9HcgOWFLfC3SVbvvqMxztjnlM5nflgZIRvcyziq
	jRESG1Eb+uYg/ToOnwiQovZvQtxdgWXWqCFQi0SOcE7OiMrwvKqHNp6jbpVm5ex7zVpzTeffiXm
	pMQydvaAuVMA+XQF4CB3DnyQ+bD2k31aA=
X-Received: by 2002:a05:600c:1d0c:b0:485:4278:24f0 with SMTP id 5b1f17b1804b1-486f4581e2bmr123234545e9.30.1773924705784;
        Thu, 19 Mar 2026 05:51:45 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:8326:7b31:bf82:d2d0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4bc96c6sm72382035e9.5.2026.03.19.05.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 05:51:45 -0700 (PDT)
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
Subject: [PATCH v6 00/10] Add support for Renesas RZ/G3L SoC and SMARC-EVK platform
Date: Thu, 19 Mar 2026 12:51:24 +0000
Message-ID: <20260319125143.230377-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29887-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.572];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9D8632CB5EE
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
7.0.0-rc4-next-20260317-gb478da6183c1
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
 drivers/clk/renesas/r9a07g043-cpg.c           |   8 +
 drivers/clk/renesas/r9a07g044-cpg.c           |  13 +
 drivers/clk/renesas/r9a08g045-cpg.c           |   9 +
 drivers/clk/renesas/r9a08g046-cpg.c           | 153 ++++++++
 drivers/clk/renesas/rzg2l-cpg.c               |  79 +++-
 drivers/clk/renesas/rzg2l-cpg.h               |   8 +
 include/dt-bindings/clock/r9a08g046-cpg.h     | 342 ++++++++++++++++++
 17 files changed, 934 insertions(+), 24 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046l48.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
 create mode 100644 drivers/clk/renesas/r9a08g046-cpg.c
 create mode 100644 include/dt-bindings/clock/r9a08g046-cpg.h

-- 
2.43.0



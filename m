Return-Path: <linux-renesas-soc+bounces-27510-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKfoFgn2eWkE1QEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27510-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 12:42:01 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CD7A0AC5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 12:42:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C6CF1308DA8F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 11:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 580E334E755;
	Wed, 28 Jan 2026 11:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FAOAH5D3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA55B2EA171
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jan 2026 11:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769599840; cv=none; b=GADvsWmmwpiBqrXPHYjU5tlv6tdkzGvE2v4ZgD8+XVqWku/7U9uk6W3tI4YYkL2sAiOP/QBasg+zuDOvImayp02jltueuKjgBSLM4ePCg6wms/VnDpA18cXID6DJbJaYAK7SDmxgRL3EKLYcbfZorll2mZ0KzvJcqmkMOYaeH0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769599840; c=relaxed/simple;
	bh=vI51rqj9mAoro40GtyeFpfzb1a+5P7sekhLbaM63ohs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r8F6wzM8IcL1jNOWmbbWHi0LOR/5/67/T/XlNce9Gw5m1WsajojxSpiH7AEfRaRpUk+JrlQdkC6bBLa4yloiGzUG01DhhIOrFrZmkKtGeygj8Oa9ao/WCvkdUwA+zkJYJT9fhp7jhu9F3U642Q+CHtWLfDdJ4D5DQkXKRUTN2To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FAOAH5D3; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b884ad1026cso1094289766b.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jan 2026 03:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769599837; x=1770204637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s2xe46S9OXtff4ArewDBe+L9gYByram4wS3kF9ZEniM=;
        b=FAOAH5D3uuRRkhMejG7hEiwhl2lSIixw+htX5EObE1MNcD9z5cqxs3mg5M8u9Asrnx
         QQrwjtHrX6AbgE1QtOBkyEJj0yjuV3YtgDaD9x8LksJ05DEO3TGtB8YRXVl51mYfdKyp
         IyspFnn05DZXXZGNaueilJmpAUoNByVDc1D21F6MjwPfstfIRkrHr3LLwzvhpzD14aBM
         fYuT7e8TRYknfPBDVzgs4dwcllwar1TdFjgpUV3iUs1pH8lNKEkr00dJej0zaPSYPz3C
         iWZq+qU9Sk4CG6fS1odULBLpJZ9hDYov5RLeWNlAJAYkMNnJnnSNhzZJiMKBhXqe9pD0
         ChOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769599837; x=1770204637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s2xe46S9OXtff4ArewDBe+L9gYByram4wS3kF9ZEniM=;
        b=cUKehE0IoUHDANJO/nDs3tyYg1SJJ0qJoSCwPCCXG7KO1iRGhSWDS07tDEQq/fz3lS
         nN8hjXSb7m+BbYmVyhYGwcgbIrNQaVgiZA8fNu7mdBjeLbkiGu7uYQdKuPucNIXbyvVs
         iTRC+L+PEaA7xUAYoK4XwECB3wb1nOlhdLrpInoXBr9RRK7lcSn6cdfBsPNdPFNRvSRe
         fOfixEQWQzKEJFaZKOQ184Qz6oYoZ4S/IRhuviBmFwjkEW8ewyc50M9KelTMfIE/MYuH
         HXIPTo7DftWxijz4Ol1P/iPqz+jnCpA2+VXoSkKoz6dQKwssQu4VCYOZgQsvAotx4kMu
         l5mQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeKqeY7oqRrGal2ucvALmA/LiiNFpHrnKmdXeqKp9hf8ZBsJK0rxqC/xhKorrHAnTYA1BeIOsjJp5OounaEwotwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzD5TmuFlGM8KuI3Xf/N/xyvVrhjuKA6nFTPm1xHjE/7R1srXwz
	6EcGSMi2V1P3Z7EByWUAz8o+B53ufnZF1cMjPYXVZjasUdlH9hVMl7Za
X-Gm-Gg: AZuq6aII27YefNi1l2MlrGBwSFy7KejDhRB8xNJQGawk/cbJ+GbWoVNYPUPFefQtUq/
	pFXEGm0OTBs4L34+E8Nz2fzLRMYZeDLzdxb/kc24WHyNKxNDAsT+ykZXjDvecXm5ZKoCd0qxRgq
	IuukMhd1OsxojZyTH0536Fjs88SdmTOj9JdltTIPH7Ocan4YsRbXhBmXXmnx3aWBVY4WAHjiwc7
	jhwTkr4d0ZWhrtUS8GaG7wg+AF3GwJOVwK5UZSQaT0nJ2gdgGqb2aYrqkPCXoWeexzxrB7sLthZ
	QI/RJ5EQGNWjFRjNJhIPkkpsxE+lcV3xL3yo11kuR15IYKXwVeLaRFvFmMtrM3tpB0UpMsksw4l
	M+25GpKlur0dOip8uSidKRx3/xnq3h58nYpcenOtGmUcLX6u+KAxD/NU7GV+cpAiZMXaOcMjyZf
	PFoerr8HwyjjcDC1N69U1RPiGQCnUHpwZiii4=
X-Received: by 2002:a17:907:7fa9:b0:b87:7cb9:c3dc with SMTP id a640c23a62f3a-b8dab2fda90mr336737466b.32.1769599836732;
        Wed, 28 Jan 2026 03:30:36 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:e29d:6e0e:72c1:d15d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1baa42sm114400366b.46.2026.01.28.03.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 03:30:36 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
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
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 00/10] Add support for Renesas RZ/G3L SoC and SMARC-EVK platform
Date: Wed, 28 Jan 2026 11:30:19 +0000
Message-ID: <20260128113032.337231-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27510-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,baylibre.com,glider.be,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: E5CD7A0AC5
X-Rspamd-Action: no action

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
/ #uname -r
6.19.0-rc7-next-20260127-g6e9651049dd7
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
 11:        356       1051        444        127    GICv3  27 Level     arch_timer
 14:          0          0          0          0    GICv3 185 Edge      error
 15:          0          0          0          0    GICv3 186 Edge      11820000.dma-controller:0
 16:          0          0          0          0    GICv3 187 Edge      11820000.dma-controller:1
 17:          0          0          0          0    GICv3 188 Edge      11820000.dma-controller:2
 18:          0          0          0          0    GICv3 189 Edge      11820000.dma-controller:3
 19:          0          0          0          0    GICv3 190 Edge      11820000.dma-controller:4
 20:          0          0          0          0    GICv3 191 Edge      11820000.dma-controller:5
 21:          0          0          0          0    GICv3 192 Edge      11820000.dma-controller:6
 22:          0          0          0          0    GICv3 193 Edge      11820000.dma-controller:7
 23:          0          0          0          0    GICv3 194 Edge      11820000.dma-controller:8
 24:          0          0          0          0    GICv3 195 Edge      11820000.dma-controller:9
 25:          0          0          0          0    GICv3 196 Edge      11820000.dma-controller:10
 26:          0          0          0          0    GICv3 197 Edge      11820000.dma-controller:11
 27:          0          0          0          0    GICv3 198 Edge      11820000.dma-controller:12
 28:          0          0          0          0    GICv3 199 Edge      11820000.dma-controller:13
 29:          0          0          0          0    GICv3 200 Edge      11820000.dma-controller:14
 30:          0          0          0          0    GICv3 201 Edge      11820000.dma-controller:15
 31:          0          0          0          0    GICv3 418 Level     100ac000.serial:rx err
 32:          3          0          0          0    GICv3 420 Level     100ac000.serial:rx full
 33:        259          0          0          0    GICv3 421 Level     100ac000.serial:tx empty
 34:          0          0          0          0    GICv3 419 Level     100ac000.serial:break
 35:         26          0          0          0    GICv3 422 Level     100ac000.serial:rx ready
IPI0:        18         32         21         19       Rescheduling interrupts
IPI1:       269        367        204        122       Function call interrupts
IPI2:         0          0          0          0       CPU stop interrupts
IPI3:         0          0          0          0       CPU stop NMIs
IPI4:         0          0          0          0       Timer broadcast interrupts
IPI5:         0          0          0          0       IRQ work interrupts
IPI6:         0          0          0          0       CPU backtrace interrupts
IPI7:         0          0          0          0       KGDB roundup interrupts
Err:          0

/ # cat /proc/meminfo
MemTotal:        1887812 kB
MemFree:         1849032 kB
MemAvailable:    1816456 kB

/ # cat /sys/devices/soc0/family
RZ/G3L
/ # cat /sys/devices/soc0/machine
Renesas SMARC EVK version 2 based on r9a08g046l48
/ # cat /sys/devices/soc0/soc_id
r9a08g046
/ # cat /sys/devices/soc0/revision
0

Biju Das (10):
  dt-bindings: dma: rz-dmac: Document RZ/G3L SoC
  dt-bindings: soc: renesas: Document RZ/G3L SoC variants, SMARC SoM and
    Carrier-II EVK
  dt-bindings: soc: renesas: renesas,rzg2l-sysc: Document RZ/G3L SoC
  soc: renesas: rz-sysc: Add SoC identification for RZ/G3L SoC
  dt-bindings: clock: Document RZ/G3L SoC
  clk: renesas: Add support for RZ/G3L SoC
  arm64: dts: renesas: Add initial DTSI for RZ/G3L SoC
  arm64: dts: renesas: Add initial support for RZ/G3L SMARC SoM
  arm64: dts: renesas: renesas-smarc2: Move usb3 nodes to board DTS
  arm64: dts: renesas: Add initial device tree for RZ/G3L SMARC EVK
    board

 .../bindings/clock/renesas,rzg2l-cpg.yaml     |  40 ++-
 .../bindings/dma/renesas,rz-dmac.yaml         |   1 +
 .../soc/renesas/renesas,rzg2l-sysc.yaml       |   1 +
 .../bindings/soc/renesas/renesas.yaml         |  13 +
 arch/arm64/boot/dts/renesas/Makefile          |   2 +
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    | 251 +++++++++++++
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   |  37 ++
 arch/arm64/boot/dts/renesas/r9a08g046l48.dtsi |  13 +
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   |   6 +
 .../boot/dts/renesas/renesas-smarc2.dtsi      |   8 -
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     |  20 ++
 drivers/clk/renesas/Kconfig                   |   7 +-
 drivers/clk/renesas/Makefile                  |   1 +
 drivers/clk/renesas/r9a08g046-cpg.c           | 144 ++++++++
 drivers/clk/renesas/rzg2l-cpg.c               |   6 +
 drivers/clk/renesas/rzg2l-cpg.h               |   1 +
 drivers/soc/renesas/Kconfig                   |  12 +
 drivers/soc/renesas/Makefile                  |   1 +
 drivers/soc/renesas/r9a08g046-sysc.c          |  91 +++++
 drivers/soc/renesas/rz-sysc.c                 |   3 +
 drivers/soc/renesas/rz-sysc.h                 |   1 +
 include/dt-bindings/clock/r9a08g046-cpg.h     | 339 ++++++++++++++++++
 22 files changed, 984 insertions(+), 14 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046l48.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
 create mode 100644 drivers/clk/renesas/r9a08g046-cpg.c
 create mode 100644 drivers/soc/renesas/r9a08g046-sysc.c
 create mode 100644 include/dt-bindings/clock/r9a08g046-cpg.h

-- 
2.43.0



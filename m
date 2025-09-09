Return-Path: <linux-renesas-soc+bounces-21665-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AAEB504DC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 20:08:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE9F01C61672
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 18:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D18A352FFE;
	Tue,  9 Sep 2025 18:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RdVOS2x1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D6931D37B;
	Tue,  9 Sep 2025 18:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757441289; cv=none; b=OMs+Vneu4VKo12QS4V3HE6wOg1dUf2Lqw1G5dFqUwiup9NGakqDMlZK+f7DSBb4Rhsyb2f8tGKQ01RCEb0eaEG1vrkwOw1+B8djhU5kh0HHbYJkQIU0x1jBF8ykqQzqcwSnSovrwMRhT5FA5323DI5Z2jEmg5oa4Qvccb3PTCEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757441289; c=relaxed/simple;
	bh=1E/FEfgXbxlTyDOQEnGwwHybKyqopOrH/LUQEsD4bdY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=opzGf2J6X4GfYVAl7mWdZois3zBlP6+TFoo/embo70T3KYb8uOe/HSH/RvGlpx0JcyGoHUOBD9Eoj/K/HcQTjSD0X4CCEg3NI1841shxkv2IjsgP3drIee3EO2fCTDaryocIiq16/0yEEbzaObnWpSb0pDHIXmqqO+o9Cg2UGhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RdVOS2x1; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45dd5e24d16so42735355e9.3;
        Tue, 09 Sep 2025 11:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757441286; x=1758046086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pzISf5D7Sm/re0S/MlFezCf6LIeMNaY1mdeO+lXW9Lw=;
        b=RdVOS2x13d05QH7s06mD6PVBar/crYdXNBnpvI2/2d9ZHpwqSd+JgIYTh0IBblF77I
         JKORmagnx3Oznpwd5+RswAxDaBZXcSJy+AtZu4yWmUtPibCxSipd2JfuHsQSWUIb6D9z
         lPcZG4l+srJpHMz2LU2M+r331hBVxJeK6iDi8vA8ZeFdJZtIg1KMP0lvOrTPBXayw77b
         EJkScyLbxKJWltaBsrnqGdTyw1YDMJuxiZrqm+w8O7f0rJAc7o+oYSC8xm5uFR1wr9Dv
         KkLVAMumqJ0pOltw03QpG7fhFWH8gR94o7hfKLCiFCCRpRoN190aB0hReKqXB7Or/26f
         roHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757441286; x=1758046086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pzISf5D7Sm/re0S/MlFezCf6LIeMNaY1mdeO+lXW9Lw=;
        b=IjG2HW7sCOzddJZseD3vgMLvnzx6NUbLLZY+1+XqRu9aejOUFt7nj3XLCJaSvVbjFJ
         DbUVbbZJ/B7wdKt2LNAU2muSn9sYCZyg8Knxt85G9aNjIUvs16KQqJ1FaRGN4Ox4868R
         yi3g/6j1XjmCJmnURtmjSTOLlzyycCZE39XzNVORfBIo2uCzThvktgVj8UnQFVnWcb2j
         Ure9HKd770PCNtf7gczYQgWMNUVCU1W6BkSZJN7yTYBsXjOLFL2CJu9ULsm18qhX0iuc
         LwKTmVAVinss+0xlEeUyVaaiWJMqcSTX6DpvvFPLO/U3K5oDczcx3PMox+GZwSAF9oA2
         GjGA==
X-Forwarded-Encrypted: i=1; AJvYcCUwqLdVQlp6+3pYF1l6vKVsAXgx1XDSFtqZntohcN+LP92/vfpGtFJ6IA7xw74LfQ0vCadt8Z9teSojftuQbQAsgFA=@vger.kernel.org, AJvYcCVJMT+gNyIuM55cTaLMcGwcIT794eMe6NnwaoZ1/y15nFmU0a4SjvmmdtGDTeKPrztuTjolaeqFFA5N@vger.kernel.org, AJvYcCVocqrdigTCqtzqm11Lo/PjvYlwTnDQtQKEsYKJPFZgdQ1/4OQ3nCcJgc64XOUAQPpdCZZNedEWew9F2YIr@vger.kernel.org, AJvYcCWnxa2C8YhvVdXWH6BE1fMsHGiu8WDP1u/K5n+srDW/1+pf3w1CHzdhgaOUVWo+Ku9ypf6wc6W9+6gO@vger.kernel.org, AJvYcCXK5NVhaXEZmzPCYSesy71s43Ly+7RLrADMI1IcP3tDAoLCoRMrYP3s5JaviSlZR9iwjVNKzmJE5arv@vger.kernel.org
X-Gm-Message-State: AOJu0YzePGykLJ3CQDgomQNVHxkIoRtIBOhpOHJJYBgL9tjyq4vLE5d8
	2hLQpJW7sOOEMBmAaN2Yoh1w118OO2EP195JF3AczZc070P3QBkKKw2q
X-Gm-Gg: ASbGnctvLQzNWQ8PBjSfbzPCh7wVkLUKZwCpPljoUs3x0Fq94VgBA0B7DdyadGlhqVI
	X611OZccrY47V3Ctqp59gcswe+JWCQZpU7Tyj6wF+Nuzn0PsyvSpomNxswXWQzQKZCQeU2mjLwV
	DquzYZ8T5EH3Q7eBxLTKm0f1oOy7UeO1w+92WqK7fmwfgLfAwYH3ZtuTmw/L5JldAmRWjDiwYB0
	qoBYe2Ulg6gV5tKNBbYUoPARKq7w80FOuiyV4PeL0K+lBfyhIyMcfov3LXThCY9CFwPPrkLq/x0
	fKHNYjdVHuFHKcxAJxaGB+9Z/T0DvcVMHuI2ehRsBcf9FLjHQTY815admQQ6JiV8/qnPkXeyVHx
	afe+pKTSK22ppsidMq5rGs9ErtQoanI+G+TJmMzg3l02rSRGtViOz4O6YVboORw8rvFYl2H0JcG
	tIQb+GB1gRDyZn
X-Google-Smtp-Source: AGHT+IHU8RVQLjbJmIfVzd4tfEr5Aww1xmlwzaYanHEmYj2UDm4y3gZ47LxspBoB5NASAirXTwqtAA==
X-Received: by 2002:a05:600c:3596:b0:45d:d6fc:2509 with SMTP id 5b1f17b1804b1-45dddeb00bfmr133247045e9.6.1757441285524;
        Tue, 09 Sep 2025 11:08:05 -0700 (PDT)
Received: from biju.lan (host86-139-30-37.range86-139.btcentralplus.com. [86.139.30.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df679a4c9sm4174015e9.3.2025.09.09.11.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 11:08:05 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-clk@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 00/11] Add RZ/G3E USB3.2 Gen1 Host Controller support
Date: Tue,  9 Sep 2025 19:07:45 +0100
Message-ID: <20250909180803.140939-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add RZ/G3E USB3.2 Gen1 Host Controller and PHY support. The USB3HOST
is compliant with the Universal Serial Bus 3.2 Specification Revision 1.0.
 - Supports 1 downstream USB receptacles
     - Number of SSP Gen2 or SS ports: 1
     - Number of HS or FS or LS ports: 1
 - Supports Super Speed Plus Gen2x1 (10 Gbps), Super Speed (5 Gbps),
   High Speed (480 Mbps), Full Speed (12Mbps), and Low Speed (1.5 Mbps).
 - Supports all transfer-types: Control, Bulk, Interrupt, Isochronous, and
   these split-transactions.
 - Supports Power Control and Over Current Detection.

v1->v2:
 * Collected tags.
 * Replaced usb30->usb3_0 for clocks and resets.
 * Replaced magic numbers with macros iphy driver.
 * Added ref to usb-xhci.yaml in USB3 binding patch.
 
 Logs:
 root@smarc-rzg3e:/cip-test-scripts/py# cat /proc/interrupts | grep SLEEP
133:          0          0          0          0 rzv2h-icu   0 Edge      SLEEP
root@smarc-rzg3e:/cip-test-scripts/py# [  128.532806] PM: suspend entry (deep)
[  128.536700] Filesystems sync: 0.000 seconds
[  128.542466] Freezing user space processes
[  128.548296] Freezing user space processes completed (elapsed 0.001 seconds)
[  128.555283] OOM killer disabled.
[  128.558531] Freezing remaining freezable tasks
[  128.564240] Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
[  128.571649] printk: Suspending console(s) (use no_console_suspend to debug)
NOTICE:  BL2: v2.10.5(release):2.10.5/rz_soc_dev-169-g1410189b0
NOTICE:  BL2: Built : 12:53:12, Jul 15 2025
NOTICE:  BL2: SYS_LSI_MODE: 0x13e06
NOTICE:  BL2: SYS_LSI_DEVID: 0x8679447
NOTICE:  BL2: SYS_LSI_PRR: 0x0
NOTICE:  BL2: Booting BL31
[  128.604363] sd 0:0:0:0: [sda] Synchronizing SCSI cache
[  128.670116] renesas-gbeth 15c30000.ethernet end0: Link is Down
[  128.683550] Disabling non-boot CPUs ...
[  128.688394] psci: CPU3 killed (polled 4 ms)
[  128.695415] psci: CPU2 killed (polled 0 ms)
[  128.702070] psci: CPU1 killed (polled 0 ms)
[  128.704897] Enabling non-boot CPUs ...
[  128.705107] Detected VIPT I-cache on CPU1
[  128.705157] GICv3: CPU1: found redistributor 100 region 0:0x0000000014960000
[  128.705195] CPU1: Booted secondary processor 0x0000000100 [0x412fd050]
[  128.706006] CPU1 is up
[  128.706106] Detected VIPT I-cache on CPU2
[  128.706128] GICv3: CPU2: found redistributor 200 region 0:0x0000000014980000
[  128.706149] CPU2: Booted secondary processor 0x0000000200 [0x412fd050]
[  128.706732] CPU2 is up
[  128.706831] Detected VIPT I-cache on CPU3
[  128.706854] GICv3: CPU3: found redistributor 300 region 0:0x00000000149a0000
[  128.706876] CPU3: Booted secondary processor 0x0000000300 [0x412fd050]
[  128.707557] CPU3 is up
[  128.724000] dwmac4: Master AXI performs fixed burst length
[  128.724900] renesas-gbeth 15c30000.ethernet end0: No Safety Features support found
[  128.724920] renesas-gbeth 15c30000.ethernet end0: IEEE 1588-2008 Advanced Timestamp supported
[  128.728436] renesas-gbeth 15c30000.ethernet end0: configuring for phy/rgmii-id link mode
[  128.745766] dwmac4: Master AXI performs fixed burst length
[  128.746653] renesas-gbeth 15c40000.ethernet end1: No Safety Features support found
[  128.746668] renesas-gbeth 15c40000.ethernet end1: IEEE 1588-2008 Advanced Timestamp supported
[  128.750222] renesas-gbeth 15c40000.ethernet end1: configuring for phy/rgmii-id link mode
[  128.797030] usb usb1: root hub lost power or was reset
[  128.797038] usb usb2: root hub lost power or was reset
[  130.956146] usb 2-1: reset SuperSpeed Plus Gen 2x1 USB device number 2 using xhci-renesas-hcd
[  131.143425] OOM killer enabled.
[  131.146563] Restarting tasks: Starting
[  131.151382] Restarting tasks: Done
[  131.154877] random: crng reseeded on system resumption
[  131.160209] PM: suspend exit
[  131.494956] renesas-gbeth 15c30000.ethernet end0: Link is Up - 1Gbps/Full - flow control rx/tx

root@smarc-rzg3e:/cip-test-scripts/py# ./run_pytests.sh tests/test_xhci.py -k test_xhci_005
==================================================================== test session starts ====================================================================
INFO     root:spl2_test_helpers.py:2059 DD performance with bs=32M count=32 is
Write= 383 MB/s
Read= 555 MB/s

INFO     root:spl2_test_helpers.py:2099 fio performance with bs=32m for Sequential and bs=4m for random access are

INFO     root:spl2_test_helpers.py:2104 b'   READ: bw=562MiB/s (590MB/s), 562MiB/s-562MiB/s (590MB/s-590MB/s), io=5024MiB (5268MB), run=8936-8936msec'
INFO     root:spl2_test_helpers.py:2104 b'  WRITE: bw=555MiB/s (582MB/s), 555MiB/s-555MiB/s (582MB/s-582MB/s), io=5024MiB (5268MB), run=9058-9058msec'
INFO     root:spl2_test_helpers.py:2104 b'   READ: bw=373MiB/s (391MB/s), 373MiB/s-373MiB/s (391MB/s-391MB/s), io=5000MiB (5243MB), run=13394-13394msec'
INFO     root:spl2_test_helpers.py:2104 b'  WRITE: bw=387MiB/s (406MB/s), 387MiB/s-387MiB/s (406MB/s-406MB/s), io=5000MiB (5243MB), run=12920-12920msec'

Biju Das (11):
  dt-bindings: clock: renesas,r9a09g047-cpg: Add USB3.0 core clocks
  clk: renesas: r9a09g047: Add USB3.0 clocks/resets
  dt-bindings: phy: renesas: Document Renesas RZ/G3E USB3.0 PHY
  phy: renesas: Add Renesas RZ/G3E USB3.0 PHY driver
  usb: host: xhci-rcar: Move R-Car reg definitions
  dt-bindings: usb: Document Renesas RZ/G3E USB3HOST
  usb: host: xhci-plat: Add .post_resume_quirk for struct xhci_plat_priv
  usb: host: xhci-rcar: Add Renesas RZ/G3E USB3 Host driver support
  arm64: dts: renesas: r9a09g047: Add USB3 PHY/Host nodes
  arm64: dts: renesas: r9a09g047e57-smarc: Enable USB3HOST
  arm64: defconfig: Enable RZ/G3E USB3 PHY driver

 .../bindings/phy/renesas,rzg3e-usb3-phy.yaml  |  63 ++++
 .../bindings/usb/renesas,rzg3e-xhci.yaml      |  87 ++++++
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    |  30 ++
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   |  10 +
 .../boot/dts/renesas/renesas-smarc2.dtsi      |   8 +
 arch/arm64/configs/defconfig                  |   1 +
 drivers/clk/renesas/r9a09g047-cpg.c           |   9 +-
 drivers/phy/renesas/Kconfig                   |   7 +
 drivers/phy/renesas/Makefile                  |   1 +
 drivers/phy/renesas/phy-rzg3e-usb3.c          | 271 ++++++++++++++++++
 drivers/usb/host/Kconfig                      |   2 +-
 drivers/usb/host/xhci-plat.c                  |  14 +
 drivers/usb/host/xhci-plat.h                  |   1 +
 drivers/usb/host/xhci-rcar-regs.h             |  49 ++++
 drivers/usb/host/xhci-rcar.c                  | 100 ++++---
 drivers/usb/host/xhci-rzg3e-regs.h            |  12 +
 .../dt-bindings/clock/renesas,r9a09g047-cpg.h |   2 +
 17 files changed, 621 insertions(+), 46 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/renesas,rzg3e-usb3-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/renesas,rzg3e-xhci.yaml
 create mode 100644 drivers/phy/renesas/phy-rzg3e-usb3.c
 create mode 100644 drivers/usb/host/xhci-rcar-regs.h
 create mode 100644 drivers/usb/host/xhci-rzg3e-regs.h

-- 
2.43.0



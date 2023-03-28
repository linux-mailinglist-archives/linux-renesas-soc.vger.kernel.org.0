Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3E206CC24E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Mar 2023 16:42:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232719AbjC1OmO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 Mar 2023 10:42:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233009AbjC1OmI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Mar 2023 10:42:08 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB6A3CC36
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Mar 2023 07:42:01 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.187.55])
        by michel.telenet-ops.be with bizsmtp
        id dqhy2900Y1C8whw06qhyM2; Tue, 28 Mar 2023 16:41:59 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1phAVf-00F96I-4l;
        Tue, 28 Mar 2023 16:41:58 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1phAWM-006GAk-Kc;
        Tue, 28 Mar 2023 16:41:58 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 0/2] ARM: dts: r8a7779/marzen: Add PCIe support
Date:   Tue, 28 Mar 2023 16:41:55 +0200
Message-Id: <cover.1680012171.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.4 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

This patch series aims to enable PCI Express support for the Renesas
R-Car H1 SoC and the Marzen development board.

Unfortunately, it doesn't work completely: while an Intel E1000E network
card is detected properly:

    rcar-pcie fe000000.pcie: adding to PM domain always-on
    rcar-pcie fe000000.pcie: host bridge /pcie@fe000000 ranges:
    rcar-pcie fe000000.pcie:       IO 0x00fe100000..0x00fe1fffff -> 0x0000000000
    rcar-pcie fe000000.pcie:      MEM 0x00fe200000..0x00fe3fffff -> 0x00fe200000
    rcar-pcie fe000000.pcie:      MEM 0x0020000000..0x003fffffff -> 0x0020000000
    rcar-pcie fe000000.pcie:      MEM 0x00c0000000..0x00dfffffff -> 0x00c0000000
    rcar-pcie fe000000.pcie:   IB MEM 0x0040000000..0x00bfffffff -> 0x0040000000
    rcar-pcie fe000000.pcie: PCIe x1: link up
    rcar-pcie fe000000.pcie: PCI host bridge to bus 0000:00
    pci_bus 0000:00: root bus resource [bus 00-ff]
    pci_bus 0000:00: root bus resource [io  0x0000-0xfffff]
    pci_bus 0000:00: root bus resource [mem 0xfe200000-0xfe3fffff]
    pci_bus 0000:00: root bus resource [mem 0x20000000-0x3fffffff]
    pci_bus 0000:00: root bus resource [mem 0xc0000000-0xdfffffff pref]
    pci 0000:00:00.0: [1912:0018] type 01 class 0x060400
    pci 0000:00:00.0: enabling Extended Tags
    pci 0000:00:00.0: PME# supported from D0 D3hot D3cold
    PCI: bus0: Fast back to back transfers disabled
    pci 0000:01:00.0: [8086:10d3] type 00 class 0x020000
    pci 0000:01:00.0: reg 0x10: [mem 0x00000000-0x0001ffff]
    pci 0000:01:00.0: reg 0x14: [mem 0x00000000-0x0007ffff]
    pci 0000:01:00.0: reg 0x18: [io  0x0000-0x001f]
    pci 0000:01:00.0: reg 0x1c: [mem 0x00000000-0x00003fff]
    pci 0000:01:00.0: reg 0x30: [mem 0x00000000-0x0003ffff pref]
    pci 0000:01:00.0: PME# supported from D0 D3hot D3cold
    PCI: bus1: Fast back to back transfers disabled
    pci_bus 0000:01: busn_res: [bus 01-ff] end is updated to 01
    pci 0000:00:00.0: BAR 8: assigned [mem 0xfe200000-0xfe2fffff]
    pci 0000:00:00.0: BAR 9: assigned [mem 0xc0000000-0xc00fffff pref]
    pci 0000:00:00.0: BAR 7: assigned [io  0x1000-0x1fff]
    pci 0000:01:00.0: BAR 1: assigned [mem 0xfe200000-0xfe27ffff]
    pci 0000:01:00.0: BAR 6: assigned [mem 0xc0000000-0xc003ffff pref]
    pci 0000:01:00.0: BAR 0: assigned [mem 0xfe280000-0xfe29ffff]
    pci 0000:01:00.0: BAR 3: assigned [mem 0xfe2a0000-0xfe2a3fff]
    pci 0000:01:00.0: BAR 2: assigned [io  0x1000-0x101f]
    pci 0000:00:00.0: PCI bridge to [bus 01]
    pci 0000:00:00.0:   bridge window [io  0x1000-0x1fff]
    pci 0000:00:00.0:   bridge window [mem 0xfe200000-0xfe2fffff]
    pci 0000:00:00.0:   bridge window [mem 0xc0000000-0xc00fffff pref]

    e1000e: Intel(R) PRO/1000 Network Driver
    e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
    pci 0000:00:00.0: enabling device (0140 -> 0143)
    e1000e 0000:01:00.0: enabling device (0140 -> 0142)
    e1000e 0000:01:00.0: Interrupt Throttling Rate (ints/sec) set to dynamic conservative mode
    e1000e 0000:01:00.0 0000:01:00.0 (uninitialized): Failed to initialize MSI-X interrupts.  Falling back to MSI interrupts.
    e1000e 0000:01:00.0 eth0: (PCI Express:2.5GT/s:Width x1) 68:05:ca:c1:27:84
    e1000e 0000:01:00.0 eth0: Intel(R) PRO/1000 Network Connection
    e1000e 0000:01:00.0 eth0: MAC: 3, PHY: 8, PBA No: E46981-008

    e1000e 0000:01:00.0 eth0: NIC Link is Up 1000 Mbps Full Duplex, Flow Control: None

it does not work, saying:

    e1000e 0000:01:00.0 eth0: Detected Hardware Unit Hang:

I compared what happens with/without the E1000E card, and what happens on
Koelsch (R-Car M2-W), where the card does work: when the Ethernet
interface is opened, rcar_pcie_config_access() fails with a master
abort:
  - PCIEERRFR.SENDURCPL = 1 (a completion with the unsupported request
    status has been transmitted),
  - PCICONF1.RMA = 1 (Received Master Abort).

After that, any further accesses to the E1000E's config space fail, and
"lspci -x" returns all 0xffs for the affected device.

Note that the R-Car PCIe host controller driver was originally written
for R-Car H1, H2, and M2-W, but it was never fully enabled on R-Car H1.
The only documented differences between the PCIe controllers on R-Car H1
and Gen2 seem to be the various apertures, and the PHY initialization
sequence.

Thanks for your comments and suggestions!

Geert Uytterhoeven (2):
  [RFC] ARM: dts: r8a7779: Add PCIe nodes
  [RFC] ARM: dts: marzen: Add PCIe support

 arch/arm/boot/dts/r8a7779-marzen.dts |  8 +++++++
 arch/arm/boot/dts/r8a7779.dtsi       | 32 ++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

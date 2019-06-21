Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB6964E2FB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2019 11:16:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbfFUJQf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jun 2019 05:16:35 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:34736 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbfFUJQe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jun 2019 05:16:34 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id CD77F25AD85;
        Fri, 21 Jun 2019 19:16:31 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id D95519408C4; Fri, 21 Jun 2019 11:16:29 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     arm@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM64 Based SoC DT Updates for v5.3
Date:   Fri, 21 Jun 2019 11:16:27 +0200
Message-Id: <cover.1561107232.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM64 based SoC DT updates for v5.3.

I apologise that this pull request ended up somewhat larger than I
expected. It would have been better if I sent what was ready a
few weeks ago at that time. However, by the time I realised this
it was too late.


The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm64-dt-for-v5.3

for you to fetch changes up to f6130381e2a20b0503838477462a3f55f7672434:

  arm64: dts: renesas: hihope-common: Remove "label" from LEDs (2019-06-19 16:32:13 +0200)

----------------------------------------------------------------
Renesas ARM64 Based SoC DT Updates for v5.3

* Renesas SoCs
  - Revise usb2_phy nodes and phys properties according to updated bindings
  - Use ip=on for bootargs

* R-Car Gen 3 and RZ/G2M (r8a774a1) SoCs
  - Add dynamic power coefficient
  - Create thermal zone to support IPA

* R-Car E3 (r8a77990) and D3 (r8a77995) SoCs
  - Point LVDS0 to its companion LVDS1

* R-Car E3 (r8a77990) SoC
  - Corresct register range of DU

* R-Car E3 (r8a77990) based Ebisu board
  - Remove renesas, no-ether-link property

* R-Car D3 (r8a77995) based Draak board:
  - Remove unnecessary index from vin4 port

* RZ/G2M (r8a774a1) based HiHope main and sub-boards:
  - Initial support
  - Describe CPU capacity and topoligy
  - Enable CMT, HDMI, LEDs, PCIe RWDT, SCIF, SDHI, TMU, and USB 2.0 and 3.0

* RZ/G2E (r8a774c0) SoC based EK874 board:
  - Clean up CPU compatible strings
  - Enable: Bluetooth, HDMI audio and video, TPU, USB 3.0 and WLAN

----------------------------------------------------------------
Biju Das (22):
      arm64: dts: renesas: r8a774a1: Add VSP instances
      arm64: dts: renesas: r8a774a1: Add DU device to DT
      arm64: dts: renesas: r8a774a1: Add FDP1 instance
      arm64: dts: renesas: r8a774a1: Tie SYS-DMAC to IPMMU-DS0/1
      arm64: dts: renesas: r8a774a1: Tie Audio-DMAC to IPMMU-MP
      arm64: dts: renesas: r8a774a1: Connect Ethernet-AVB to IPMMU-DS0
      arm64: dts: renesas: cat874: Add WLAN support
      arm64: dts: renesas: cat874: Add BT support
      arm64: dts: renesas: Add HiHope RZ/G2M main board support
      arm64: dts: renesas: hihope-common: Add pincontrol support to scif2/scif clock
      arm64: dts: renesas: Add HiHope RZ/G2M sub board support
      arm64: dts: renesas: r8a774a1: Add PCIe device nodes
      arm64: dts: renesas: hihope-common: Declare pcie bus clock
      arm64: dts: renesas: hihope-rzg2-ex: Enable PCIe support
      arm64: dts: renesas: hihope-common: Add RWDT support
      arm64: dts: renesas: cat874: Enable USB3.0 host/peripheral device node
      arm64: dts: renesas: cat874: Enable usb role switch support
      arm64: dts: renesas: hihope-common: Enable USB3.0
      arm64: dts: renesas: r8a774a1: Add CPU topology on r8a774a1 SoC
      arm64: dts: renesas: r8a774a1: Add CPU capacity-dmips-mhz
      arm64: dts: renesas: r8a774a1: Create thermal zone to support IPA
      arm64: dts: renesas: r8a774a1: Add dynamic power coefficient

Cao Van Dong (3):
      arm64: dts: renesas: r8a7796: Add TPU support
      arm64: dts: renesas: r8a77965: Add TPU support
      arm64: dts: renesas: r8a7795: Add TPU support

Dien Pham (4):
      arm64: dts: renesas: r8a7795: Create thermal zone to support IPA
      arm64: dts: renesas: r8a7796: Create thermal zone to support IPA
      arm64: dts: renesas: r8a77965: Create thermal zone to support IPA
      arm64: dts: renesas: r8a77990: Create thermal zone to support IPA

Fabrizio Castro (12):
      arm64: dts: renesas: cat874: Add HDMI video support
      arm64: dts: renesas: cat874: Add HDMI audio
      arm64: dts: renesas: r8a774a1: Add operating points
      arm64: dts: renesas: hihope-common: Add uSD and eMMC
      arm64: dts: renesas: r8a774a1: Add CMT device nodes
      arm64: dts: renesas: r8a774a1: Add TMU device nodes
      arm64: dts: renesas: r8a774a1: Fix USB 2.0 clocks
      arm64: dts: renesas: hihope-common: Add USB 2.0 support
      arm64: dts: renesas: hihope-common: Add LEDs support
      arm64: dts: renesas: r8a774a1: Add HDMI encoder instance
      arm64: dts: renesas: hihope-common: Add HDMI support
      arm64: dts: renesas: hihope-common: Remove "label" from LEDs

Laurent Pinchart (1):
      arm64: dts: renesas: r8a7799[05]: Point LVDS0 to its companion LVDS1

Magnus Damm (1):
      arm64: dts: renesas: Use ip=on for bootargs

Robin Murphy (1):
      arm64: dts: renesas: r8a774c0: Clean up CPU compatibles

Simon Horman (5):
      arm64: dts: renesas: draak: Remove unnecessary index from vin4 port
      arm64: dts: renesas: r8a7795: Add dynamic power coefficient
      arm64: dts: renesas: r8a7796: Add dynamic power coefficient
      arm64: dts: renesas: r8a77965: Add dynamic power coefficient
      arm64: dts: renesas: r8a77990: Add dynamic power coefficient

Spyridon Papageorgiou (1):
      arm64: dts: renesas: ulcb-kf: Add support for TI WL1837

Takeshi Kihara (2):
      arm64: dts: renesas: ebisu: Remove renesas, no-ether-link property
      arm64: dts: renesas: r8a77990: Fix register range of display node

Yoshihiro Shimoda (1):
      arm64: dts: renesas: Revise usb2_phy nodes and phys properties

 arch/arm64/boot/dts/renesas/Makefile               |   2 +
 arch/arm64/boot/dts/renesas/hihope-common.dtsi     | 325 +++++++++++++
 arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi    |  63 +++
 .../boot/dts/renesas/r8a774a1-hihope-rzg2m-ex.dts  |  15 +
 .../boot/dts/renesas/r8a774a1-hihope-rzg2m.dts     |  26 +
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi          | 527 ++++++++++++++++++++-
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts    | 246 +++++++++-
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi          |  12 +-
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           |  93 ++--
 arch/arm64/boot/dts/renesas/r8a7796.dtsi           |  71 ++-
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |  45 +-
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts     |   2 +-
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts     |   3 +-
 arch/arm64/boot/dts/renesas/r8a77990.dtsi          |  32 +-
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts     |   9 +-
 arch/arm64/boot/dts/renesas/r8a77995.dtsi          |  10 +-
 arch/arm64/boot/dts/renesas/salvator-common.dtsi   |   2 +-
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi           |  49 ++
 arch/arm64/boot/dts/renesas/ulcb.dtsi              |   2 +-
 19 files changed, 1393 insertions(+), 141 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/hihope-common.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m.dts

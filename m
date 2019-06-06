Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABB453764A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2019 16:21:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728814AbfFFOVk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Jun 2019 10:21:40 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:35255 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727961AbfFFOVk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jun 2019 10:21:40 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id A19B820012;
        Thu,  6 Jun 2019 14:21:24 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 00/20] drm: rcar-du: Add Color Management Module (CMM)
Date:   Thu,  6 Jun 2019 16:22:00 +0200
Message-Id: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,
   this series add support for the Color Management Module (CMM) found on
the R-Car Display Unit output channels. CMM is present in most of the Gen3
SoCs (V3-H and V3-M excluded) and in Gen2 (which is not supported by the
series).

The CMM allows setting 1-D and 3-D gamma tables and generates histograms on
images before they are directed to the DU's output pads.

The current implementation only supports configuration of the 1-D gamma table,
by using the GAMMA_LUT KMS property. On top of this current version, more
advanced features such as 3-D LUT support and histogram generation can be
later implemented.

The series starts by adding the bindings definitions and by registering the
clock providers for the various SoCs that support the CMM. It then registers
CMMs in the SoC device tree sources and finally adds a driver for the CMM
itself and integrates it in the rcar-du driver infrastructure to register,
enable and update the CMM units.

Tested on M3-W Salvator-x on HDMI connector and on E3 Ebisu on VGA connector
by injecting a 'color inversion' gamma table using a patched version of
the KMS++ kmstest utility[1], and observing the CMM applies the correction
matrix properly.

Series based on Laurent's drm/du/next branch at
git://linuxtv.org/pinchartl/media.git

Thanks
   j

[1] https://github.com/tomba/kmsxx/

Jacopo Mondi (20):
  dt-bindings: display: renesas,cmm: Add R-Car CMM documentation
  dt-bindings: display, renesas,du: Document cmms property
  dt-bindings: display, renesas,du: Update 'vsps' in example
  clk: renesas: r8a7796: Add CMM clocks
  clk: renesas: r8a7795: Add CMM clocks
  clk: renesas: r8a77965: Add CMM clocks
  clk: renesas: r8a77990: Add CMM clocks
  clk: renesas: r8a77995: Add CMM clocks
  arm64: dts: renesas: r8a7796: Add CMM units
  arm64: dts: renesas: r8a7795: Add CMM units
  arm64: dts: renesas: r8a77965: Add CMM units
  arm64: dts: renesas: r8a77990: Add CMM units
  arm64: dts: renesas: r8a77995: Add CMM units
  drm: rcar-du: Add support for CMM
  drm: rcar-du: Claim CMM support for Gen3 SoCs
  drm: rcar-du: kms: Collect CMM instances
  drm: rcar-du: crtc: Enable and disable CMMs
  drm: rcar-du: group: Enable DU's CMM extension
  drm: rcar-du: crtc: Register GAMMA_LUT properties
  drm: rcar-du: kms: Update CMM in atomic commit tail

 .../bindings/display/renesas,cmm.txt          |  25 +++
 .../bindings/display/renesas,du.txt           |   7 +-
 arch/arm64/boot/dts/renesas/r8a7795.dtsi      |  36 +++-
 arch/arm64/boot/dts/renesas/r8a7796.dtsi      |  25 +++
 arch/arm64/boot/dts/renesas/r8a77965.dtsi     |  25 +++
 arch/arm64/boot/dts/renesas/r8a77990.dtsi     |  20 +-
 arch/arm64/boot/dts/renesas/r8a77995.dtsi     |  20 +-
 drivers/clk/renesas/r8a7795-cpg-mssr.c        |   4 +
 drivers/clk/renesas/r8a7796-cpg-mssr.c        |   3 +
 drivers/clk/renesas/r8a77965-cpg-mssr.c       |   3 +
 drivers/clk/renesas/r8a77990-cpg-mssr.c       |   2 +
 drivers/clk/renesas/r8a77995-cpg-mssr.c       |   2 +
 drivers/gpu/drm/rcar-du/Kconfig               |   7 +
 drivers/gpu/drm/rcar-du/Makefile              |   1 +
 drivers/gpu/drm/rcar-du/rcar_cmm.c            | 197 ++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_cmm.h            |  38 ++++
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c        |  18 ++
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h        |   2 +
 drivers/gpu/drm/rcar-du/rcar_du_drv.c         |  12 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.h         |   4 +
 drivers/gpu/drm/rcar-du/rcar_du_group.c       |   8 +
 drivers/gpu/drm/rcar-du/rcar_du_group.h       |   2 +
 drivers/gpu/drm/rcar-du/rcar_du_kms.c         |  86 ++++++++
 drivers/gpu/drm/rcar-du/rcar_du_regs.h        |   5 +
 24 files changed, 544 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/renesas,cmm.txt
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_cmm.c
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_cmm.h

--
2.21.0


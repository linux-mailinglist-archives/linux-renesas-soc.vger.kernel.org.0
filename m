Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 778A16110E
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  6 Jul 2019 16:08:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726870AbfGFOGs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 6 Jul 2019 10:06:48 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:46841 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726446AbfGFOGr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 6 Jul 2019 10:06:47 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id B700AC0004;
        Sat,  6 Jul 2019 14:06:35 +0000 (UTC)
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
Subject: [PATCH v2 00/19] drm: rcar-du: Add Color Management Module (CMM)
Date:   Sat,  6 Jul 2019 16:07:27 +0200
Message-Id: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,
  second iteration of CMM support for Renesas R-Car devices, where I have
fixed comments from Laurent, Geert and Daniel.

A reference to the v1 cover letter, with some background on the CMM is
available here:
https://lkml.org/lkml/2019/6/6/583

Notable changes:
- Rebased on v5.2-rc7
- clock patches rebased, but already collected by Geert for v5.3
- Changed cmm compatible string as suggested by Geert in bindings and
  DTS files
- CMM driver updated to include comments from Laurent, thanks!
- Integration in R-Car DU is very similar, I have squashed a few patches
- Add legagy gamma interface support with .gamma_set callback as suggested
  by Daniel.

Thanks
   j

Jacopo Mondi (19):
  dt-bindings: display: renesas,cmm: Add R-Car CMM documentation
  dt-bindings: display, renesas,du: Document cmms property
  arm64: renesas: Update 'vsps' property
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
  drm: rcar-du: crtc: Register GAMMA_LUT properties
  drm: rcar-du: kms: Update CMM in atomic commit tail

 .../bindings/display/renesas,cmm.txt          |  25 ++
 .../bindings/display/renesas,du.txt           |   5 +
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi     |   2 +-
 arch/arm64/boot/dts/renesas/r8a7795.dtsi      |  36 ++-
 arch/arm64/boot/dts/renesas/r8a7796.dtsi      |  25 ++
 arch/arm64/boot/dts/renesas/r8a77965.dtsi     |  27 +-
 arch/arm64/boot/dts/renesas/r8a77990.dtsi     |  20 +-
 arch/arm64/boot/dts/renesas/r8a77995.dtsi     |  20 +-
 drivers/clk/renesas/r8a7795-cpg-mssr.c        |   4 +
 drivers/clk/renesas/r8a7796-cpg-mssr.c        |   3 +
 drivers/clk/renesas/r8a77965-cpg-mssr.c       |   3 +
 drivers/clk/renesas/r8a77990-cpg-mssr.c       |   2 +
 drivers/clk/renesas/r8a77995-cpg-mssr.c       |   2 +
 drivers/gpu/drm/rcar-du/Kconfig               |   7 +
 drivers/gpu/drm/rcar-du/Makefile              |   1 +
 drivers/gpu/drm/rcar-du/rcar_cmm.c            | 291 ++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_cmm.h            |  38 +++
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c        |  17 +
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h        |   2 +
 drivers/gpu/drm/rcar-du/rcar_du_drv.c         |  12 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.h         |   4 +
 drivers/gpu/drm/rcar-du/rcar_du_group.c       |   8 +
 drivers/gpu/drm/rcar-du/rcar_du_group.h       |   2 +
 drivers/gpu/drm/rcar-du/rcar_du_kms.c         |  86 ++++++
 drivers/gpu/drm/rcar-du/rcar_du_regs.h        |   5 +
 25 files changed, 638 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/renesas,cmm.txt
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_cmm.c
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_cmm.h

--
2.21.0


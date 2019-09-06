Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 532A2AB97D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2019 15:42:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390522AbfIFNmg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Sep 2019 09:42:36 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:49567 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388784AbfIFNmg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Sep 2019 09:42:36 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 1C3CD40015;
        Fri,  6 Sep 2019 13:42:28 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
        horms@verge.net.au, uli@fpond.eu,
        VenkataRajesh.Kalakodima@in.bosch.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, airlied@linux.ie,
        daniel@ffwll.ch, koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/9 drm: rcar-du: Add Color Management Module (CMM)
Date:   Fri,  6 Sep 2019 15:43:32 +0200
Message-Id: <20190906134341.9879-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello, new iteration of CMM support, with quite a few changes compared to
v3:

References:
A reference to the v1 cover letter, with some background on the CMM is
available here:
https://lkml.org/lkml/2019/6/6/583
v2:
https://lore.kernel.org/linux-renesas-soc/20190706140746.29132-10-jacopo+renesas@jmondi.org/
v3:
https://lore.kernel.org/linux-renesas-soc/20190825135154.11488-1-jacopo+renesas@jmondi.org/

Change log:

*Bindings/DT:
- Rebased on renesas-devel-2019-09-03-v5.3-rc7
- Bindings converted to yaml: thanks Laurent for help
- s/'cmms'/'renesas,cmms'/ in DU bindings as suggested by Rob
- s/cmm-<soctype>/<soctype>-cmm/ as suggested by Geert
- squashed CMM addition for Gen3 SoCs in a single path at the end of
  the series

*CMM/DU:
- Only accept fully populated LUT tables, remove the 'size' from the CMM
  configuration structure as suggested by Laurent
- Simplify CMM configuration logic: only rely on color_mgmt_changed flag and
  unconditionally provide a populated LUT table to the cmm_setup() function
- Protect against probing order inversion (DU is operation while CMM still has
  not been probed) by adding rcar_cmm_init() operation as it is done for VSP as
  suggested by Laurent
- Add CMM function stubs to fix compilation erros when CONFIG_DRM_RCAR_CMM is
  not selected
- Minors in the CMM driver as suggested by Laurent
  - Remove per-soc strings
  - Make comments style consistent (not using /** anywhere in the .c file,
    unify comment style)
  - s/rcar_cmm_load()/rcar_cmm_write()/
  - Squash cmm configuration and suspend/resume support in rcar_du_kms.c

Testing:
I have tested by injecting a color inversion LUT table at test program
initialization:
https://jmondi.org/cgit/kmsxx/commit/?h=gamma_lut&id=3c6af4db165e5b3dc8996f0a288746c35dbb1cb9
And by changing the CMM content to switch between a color inversion table
and a linear table every 50 frames:
https://jmondi.org/cgit/kmsxx/commit/?h=gamma_lut&id=fe178a43861da7c8e79618e2a13fa0f19dbcd03d

Pretty happy with the result, which seems to be consistent across system
suspend/resume.

Testing with real world use cases might be beneficial. Rajesh are you still
interested in giving this series a spin?

Thanks
  j

Jacopo Mondi (9):
  dt-bindings: display: renesas,cmm: Add R-Car CMM documentation
  dt-bindings: display, renesas,du: Document cmms property
  drm: rcar-du: Add support for CMM
  drm: rcar-du: Claim CMM support for Gen3 SoCs
  drm: rcar-du: kms: Initialize CMM instances
  drm: rcar-du: crtc: Enable and disable CMMs
  drm: rcar-du: crtc: Register GAMMA_LUT properties
  drm: rcar-du: kms: Update CMM in atomic commit tail
  arm64: dts: renesas: Add CMM units to Gen3 SoCs

 .../bindings/display/renesas,cmm.yaml         |  64 +++++
 .../bindings/display/renesas,du.txt           |   5 +
 arch/arm64/boot/dts/renesas/r8a7795.dtsi      |  40 ++-
 arch/arm64/boot/dts/renesas/r8a7796.dtsi      |  28 ++
 arch/arm64/boot/dts/renesas/r8a77965.dtsi     |  28 ++
 arch/arm64/boot/dts/renesas/r8a77990.dtsi     |  22 +-
 arch/arm64/boot/dts/renesas/r8a77995.dtsi     |  22 +-
 drivers/gpu/drm/rcar-du/Kconfig               |   7 +
 drivers/gpu/drm/rcar-du/Makefile              |   1 +
 drivers/gpu/drm/rcar-du/rcar_cmm.c            | 251 ++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_cmm.h            |  61 +++++
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c        |  17 ++
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h        |   2 +
 drivers/gpu/drm/rcar-du/rcar_du_drv.c         |  32 ++-
 drivers/gpu/drm/rcar-du/rcar_du_drv.h         |   3 +
 drivers/gpu/drm/rcar-du/rcar_du_group.c       |   8 +
 drivers/gpu/drm/rcar-du/rcar_du_group.h       |   2 +
 drivers/gpu/drm/rcar-du/rcar_du_kms.c         | 106 ++++++++
 drivers/gpu/drm/rcar-du/rcar_du_regs.h        |   5 +
 19 files changed, 697 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/renesas,cmm.yaml
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_cmm.c
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_cmm.h

--
2.23.0


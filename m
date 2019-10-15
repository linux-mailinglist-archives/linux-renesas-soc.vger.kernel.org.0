Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC019D7396
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2019 12:44:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729075AbfJOKou (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Oct 2019 06:44:50 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:47445 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728214AbfJOKot (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Oct 2019 06:44:49 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 77817C0004;
        Tue, 15 Oct 2019 10:44:40 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
        horms@verge.net.au, uli+renesas@fpond.eu,
        VenkataRajesh.Kalakodima@in.bosch.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, airlied@linux.ie,
        daniel@ffwll.ch, koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        Harsha.ManjulaMallikarjun@in.bosch.com, ezequiel@collabora.com,
        seanpaul@chromium.org, linux-renesas-soc@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/8] drm: rcar-du: Add Color Management Module (CMM)
Date:   Tue, 15 Oct 2019 12:46:13 +0200
Message-Id: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

References:
A reference to the v1 cover letter, with some background on the CMM is
available here:
https://lkml.org/lkml/2019/6/6/583
v2:
https://lore.kernel.org/linux-renesas-soc/20190706140746.29132-10-jacopo+renesas@jmondi.org/
v3:
https://lore.kernel.org/linux-renesas-soc/20190825135154.11488-1-jacopo+renesas@jmondi.org/
v4:
https://lore.kernel.org/linux-renesas-soc/20190906135436.10622-1-jacopo+renesas@jmondi.org/

Again, quite a consistent changelog, mostly due to the developments happened on
Ezequiel's VOP unit following Sean's advices.

I here implemented the same, and moved the CMM handling to the crtc being and
enable callbacks. As a result the overall implementation results quite a lot
simplified, mostly on the CMM driver side.

I have dropped tags and acks on the CMM driver and CMM enablement patches in
DU crtc driver because of the number of changes.

A more detailed change log:

- Rebased on renesas-devel-2019-10-07-v5.4-rc4

* Bindings/DT
- Included Rob's comments on the yaml file license and the use of 'OneOf'
  in the compatible property description
- Use the bracketed style suggested by Kieran for the 'renesas,cmm' property
  introduced in patch 2
- Re-order the properties in the SoC DTS files as suggested by Kieran

* CMM/DU
- As anticipated, moved CMM management to the crtc from the atomic commit tail
  helper where it was implemented in v4
  This allow to correctly support resume/suspend and proper ordering of the CMM
  enable and setup operations (enable -before- setup)
- As a consequence the CMM driver is greatly simplified by removing the need
  to cache the LUT table entries provided to cmm_setup() and later re-apply
  them at enable time.
- Better support handling of disabled CMM config option by returning -ENODEV
  at cmm_init() time as suggested by Kieran.

* Testing
I have tested by injecting a color inversion LUT table and enabling/disabling it
every 50 displayed frames:
https://jmondi.org/cgit/kmsxx/log/?h=gamma_lut

CMM functionalities are retained between suspend/resume cycles (tested with
suspend-to-idle) without requiring a re-programming of the LUT tables.

Testing with real world use cases might be beneficial. Rajesh are you still
interested in giving this series a spin?

Laurent, Kieran, could we fast-track review of this and hopefully try to have it
merged for v5.5 ?

Thanks Ezequiel for having suggested me this solution.

Thanks
   j

Jacopo Mondi (8):
  dt-bindings: display: renesas,cmm: Add R-Car CMM documentation
  dt-bindings: display, renesas,du: Document cmms property
  drm: rcar-du: Add support for CMM
  drm: rcar-du: kms: Initialize CMM instances
  drm: rcar-du: crtc: Control CMM operations
  drm: rcar-du: crtc: Register GAMMA_LUT properties
  arm64: dts: renesas: Add CMM units to Gen3 SoCs
  drm: rcar-du: kms: Expand comment in vsps parsing routine

 .../bindings/display/renesas,cmm.yaml         |  67 ++++++
 .../bindings/display/renesas,du.txt           |   5 +
 arch/arm64/boot/dts/renesas/r8a7795.dtsi      |  39 ++++
 arch/arm64/boot/dts/renesas/r8a7796.dtsi      |  31 ++-
 arch/arm64/boot/dts/renesas/r8a77965.dtsi     |  31 ++-
 arch/arm64/boot/dts/renesas/r8a77990.dtsi     |  21 ++
 arch/arm64/boot/dts/renesas/r8a77995.dtsi     |  21 ++
 drivers/gpu/drm/rcar-du/Kconfig               |   7 +
 drivers/gpu/drm/rcar-du/Makefile              |   1 +
 drivers/gpu/drm/rcar-du/rcar_cmm.c            | 198 ++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_cmm.h            |  60 ++++++
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c        |  89 ++++++++
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h        |   2 +
 drivers/gpu/drm/rcar-du/rcar_du_drv.h         |   2 +
 drivers/gpu/drm/rcar-du/rcar_du_group.c       |   5 +
 drivers/gpu/drm/rcar-du/rcar_du_group.h       |   2 +
 drivers/gpu/drm/rcar-du/rcar_du_kms.c         |  82 +++++++-
 drivers/gpu/drm/rcar-du/rcar_du_regs.h        |   5 +
 18 files changed, 665 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/renesas,cmm.yaml
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_cmm.c
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_cmm.h

--
2.23.0


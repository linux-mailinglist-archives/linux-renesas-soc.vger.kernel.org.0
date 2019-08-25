Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CCDC9C412
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 25 Aug 2019 15:50:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728154AbfHYNuh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 25 Aug 2019 09:50:37 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:35795 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727941AbfHYNuh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 25 Aug 2019 09:50:37 -0400
X-Originating-IP: 87.18.63.98
Received: from uno.homenet.telecomitalia.it (unknown [87.18.63.98])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 72798C0002;
        Sun, 25 Aug 2019 13:50:29 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
        horms@verge.net.au, uli@fpond.eu, airlied@linux.ie, daniel@ffwll.ch
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 00/14] drm: rcar-du: Add Color Management Module (CMM)
Date:   Sun, 25 Aug 2019 15:51:40 +0200
Message-Id: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,
  this is the third iteration of CMM support series.

A reference to the v1 cover letter, with some background on the CMM is
available here:
https://lkml.org/lkml/2019/6/6/583

The series is now based on the v5.3-rc4-based renesas-devel-2019-08-21 branch
of Geert's tree, which already contains the CMM clock enablement patches that
were part of v2 and which I have now dropped.

Notable changes in the iteratoin are:
- Added per-SoC compatible strings as requested by Geert: updated bindings and
  DTS patches accordingly and dropped R-b tags from there.
- Rework of CMM driver:
  - Use the DRM provided functions to extract and scale to HW precision the LUT
    table entries as suggested by Uli.
  - Re-worked the suspend/resume logic as suggested by Laurent:
    - remove resume/suspend handlers from CMM driver
    - handle re-enablement of CMM at DU resume time
  - Use pm-runtime to handle clock enable/disable of CMM.
- Integration with DU:
  - enforce suspend/resume ordering by creating a device_link between
    DU (consumer) and CMM (supplier): DU suspends before and resume after CMM
  - Force re-enablement of CMM by forcing the color_mgmt_changed flag of a
    CRTC state which had the CMM in use at DU resume time.

Compared to v2 system suspend/resume has been more thoughtfully tested by
running an application program which uses the CMM, suspending and resuming
the system and making sure the DU and the CMM are still operational.

Tested on M3-[W|N] with HDMI output.

The test application used to verify the LUT operations is available at:
https://jmondi.org/cgit/kmsxx/
where a color-inversion 1D-LUT table is applied.

The testing provides good results when running in 'flip' mode, where colors seem
actually inverted. I'm less certain about the 'non-flip' static image mode as
it seems red/green/yellow colors get all reduced to a shade of black. Other
opinions and testing with more realistic use-cases are of course very welcome.

Thanks
   j

Jacopo Mondi (14):
  dt-bindings: display: renesas,cmm: Add R-Car CMM documentation
  dt-bindings: display, renesas,du: Document cmms property
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
  drm: rcar-du: Force CMM enablement when resuming

 .../bindings/display/renesas,cmm.txt          |  33 +++
 .../bindings/display/renesas,du.txt           |   5 +
 arch/arm64/boot/dts/renesas/r8a7795.dtsi      |  36 ++-
 arch/arm64/boot/dts/renesas/r8a7796.dtsi      |  25 ++
 arch/arm64/boot/dts/renesas/r8a77965.dtsi     |  25 ++
 arch/arm64/boot/dts/renesas/r8a77990.dtsi     |  20 +-
 arch/arm64/boot/dts/renesas/r8a77995.dtsi     |  20 +-
 drivers/gpu/drm/rcar-du/Kconfig               |   7 +
 drivers/gpu/drm/rcar-du/Makefile              |   1 +
 drivers/gpu/drm/rcar-du/rcar_cmm.c            | 262 ++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_cmm.h            |  38 +++
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c        |  17 ++
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h        |   2 +
 drivers/gpu/drm/rcar-du/rcar_du_drv.c         |  33 ++-
 drivers/gpu/drm/rcar-du/rcar_du_drv.h         |   4 +
 drivers/gpu/drm/rcar-du/rcar_du_group.c       |   8 +
 drivers/gpu/drm/rcar-du/rcar_du_group.h       |   2 +
 drivers/gpu/drm/rcar-du/rcar_du_kms.c         |  98 +++++++
 drivers/gpu/drm/rcar-du/rcar_du_regs.h        |   5 +
 19 files changed, 634 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/renesas,cmm.txt
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_cmm.c
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_cmm.h

--
2.22.0


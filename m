Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4800B17F1C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2019 19:33:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728700AbfEHRdn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 May 2019 13:33:43 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:53261 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728655AbfEHRdm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 May 2019 13:33:42 -0400
X-Originating-IP: 93.56.79.2
Received: from uno.localdomain (unknown [93.56.79.2])
        (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 1DEC21BF207;
        Wed,  8 May 2019 17:33:38 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [RFC 0/9] drm: rcar-du: Add CMM support to M3-W (plumbing only)
Date:   Wed,  8 May 2019 19:34:19 +0200
Message-Id: <20190508173428.22054-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,
   this patches add the plumbing to integrate CMM support in Renesas R-Car
Display Unit.

CMM unit performs color correction and image enhancement on the DU channels
output pixels, before they get displayed through the connector they attach to.

Support for CMM has been added in Renesas BSP v4.19 and re-sent a few weeks ago
to upstream in the series: "[PATCH 0/8] v4.19.0 Added Color Management Module"
in a form not consumable by mainline.

In order to ease support for implementing CMM support in the mainline DU driver
I took care with this series of addressing the plumbing between DU and CMM,
providing support in device tree and core DU driver.

I'm keeping the submission internal to the renesas-soc list and I'm not
including yet DT and DRM people as the scope of the series is limited and should
not be considered for inclusion, but I would like to start collecting feedbacks.

The series is in RFC as:
- The CMM driver is actually empty. Both BSP and Bosh have working
  implementations of CMM driver which actually does something (I assume so, at
  least). Once the here proposed design is accepted, we can start
  discussing how better expose and control the tables used by the CMM to
  perform color correction.

- It only supports M3-W, mostly because that's what I'm developing on.
  Once the here proposed design is accepted, a patch to add the CMM clock
  definitions will be required for each SoC with CMM support. The same applies
  to device tree updating and DU feature expansion.

I have verified the DU output is still operational with CMM enabled, but again,
this is not the real target of the series, which mostly addresses the necessary
plumbing to have CMM integrated in the DU driver.

Knowing very few things about DRM/KMS I welcome suggestions on how to expose
the CMM tables and controls with DRM/KMS properties, which in my opinion should
be done on top of this series.

Not-Yet-Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
   j

Jacopo Mondi (9):
  dt-bindings: display: renesas,cmm: Add R-Car CMM documentation
  dt-bindings: display, renesas,du: Document cmms property
  [TODO] drm: rcar-du: Add basic support for CMM
  drm: rcar-du: kms: Create CMM instances
  drm: rcar-du: Add CMM support for M3-W
  drm: rcar-du: crtc: Setup the CMM
  drm: rcar-du: group: Enable CMM unit
  clk: renesas: r8a7796: Add CMM clocks
  arm64: dts: renesas: r8a7796: Add CMM units

 .../bindings/display/renesas,cmm.txt          | 24 ++++++
 .../bindings/display/renesas,du.txt           |  4 +
 arch/arm64/boot/dts/renesas/r8a7796.dtsi      | 25 ++++++
 drivers/clk/renesas/r8a7796-cpg-mssr.c        |  3 +
 drivers/gpu/drm/rcar-du/Kconfig               |  7 ++
 drivers/gpu/drm/rcar-du/Makefile              |  1 +
 drivers/gpu/drm/rcar-du/rcar_du_cmm.c         | 78 +++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_cmm.h         | 23 ++++++
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c        | 38 ++++++++-
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h        |  2 +
 drivers/gpu/drm/rcar-du/rcar_du_drv.c         |  3 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.h         |  4 +
 drivers/gpu/drm/rcar-du/rcar_du_group.c       |  8 ++
 drivers/gpu/drm/rcar-du/rcar_du_group.h       |  2 +
 drivers/gpu/drm/rcar-du/rcar_du_kms.c         | 68 ++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_regs.h        |  5 ++
 16 files changed, 292 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/renesas,cmm.txt
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_cmm.c
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_cmm.h

--
2.21.0


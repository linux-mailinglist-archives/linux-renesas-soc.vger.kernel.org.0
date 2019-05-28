Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7ABEA2C864
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2019 16:13:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbfE1ONI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 May 2019 10:13:08 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48880 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726527AbfE1ONI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 May 2019 10:13:08 -0400
Received: from pendragon.ideasonboard.com (85-76-65-42-nat.elisa-mobile.fi [85.76.65.42])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 67861D85;
        Tue, 28 May 2019 16:13:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1559052785;
        bh=/OJ6uuEbh2pjUlDn0QffI7KAufmZ1tyECPU5E9HGb1s=;
        h=From:To:Cc:Subject:Date:From;
        b=nkKd2QNeyK2vkCRmMfKjr4TtVLVeGQRY7u/H8RatACav9wsYBpQimsPtLtiWEFX+o
         sOmc/TtcACAgC6ee5uw9QcVLeFJ0wUq8wwiulM4c8blSDYUWlapX2SJUw906zU+K1c
         k+WhQaC+RgHNhSqQ3MSnD86DwwGKmgna+RBc27no=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        devicetree@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v3 00/10] R-Car DU: LVDS dual-link mode support
Date:   Tue, 28 May 2019 17:12:24 +0300
Message-Id: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello everybody,

This patch series implements support for LVDS dual-link mode in the
R-Car DU and R-Car LVDS encoder drivers, and well as in the thc63lvd1024
LVDS decoder driver.

LVDS dual-link is a mode of operation where two individual LVDS links
are operated together to carry even- and odd-numbered pixels separately.
This doubles the possible bandwidth of the video transmission. Both the
transmitter and the receiver need to support this mode of operation.

The R-Car D3 and E3 SoCs include two independent LVDS encoders that can
be grouped together to operate in dual-link mode. When used separately,
the LVDS encoders are connected to two different CRTCs and transmit
independent video streams. When used in dual-link mode, the first LVDS
encoder is connected to the first CRTC, and split even- and odd-numbered
pixels. It transmits half of the pixels on its LVDS output, and sends
the other half to the second LVDS encoder for transmittion over the
second LVDS link. The second LVDS encoder thus operates under control of
the first one, and isn't connected directly to a CRTC.

On the receiving side, the THC63LVD1024 LVDS-to-parallel bridge has two
LVDS inputs and two parallel outputs. It can operate in four different
modes:

- Single-in, single-out: The first LVDS input receives the video stream,
  and the bridge outputs it on the first parallel output. The second
  LVDS input and the second parallel output are not used.

- Single-in, dual-out: The first LVDS input receives the video stream,
  and the bridge splits even- and odd-numbered pixels and outputs them
  on the first and second parallel outputs. The second LVDS input is not
  used.

- Dual-in, single-out: The two LVDS inputs are used in dual-link mode,
  and the bridge combines the even- and odd-numbered pixels and outputs
  them on the first parallel output. The second parallel output is not
  used.

- Dual-in, dual-out: The two LVDS inputs are used in dual-link mode,
  and the bridge outputs the even- and odd-numbered pixels on the first
  parallel output.

The operating mode is selected by two input pins of the bridge, which
are connected to DIP switches on the development boards I use. The mode
is thus fixed from a Linux point of view.

Patch 01/10 adds a new dual_link boolen field to the drm_bridge_timings
structure to let bridges report their LVDS mode of operation. Patch
02/10 clarifies the THC63LVD1024 DT bindings to document dual-link
operation, and patch 03/10 implements dual-link support in the
thc64lvd1024 bridge driver by setting the drm_bridge_timings dual_link
field according to the mode selected through DT.

Patch 04/10 extends the R-Car LVDS DT bindings to specify the companion
LVDS encoder for dual-link operation. Patches 05/10 then performs a
small cleanup in the LVDS encoder driver. Patch 06/10 implements
dual-link support in the LVDS encoder driver, which involves retrieving
the operation mode from the LVDS receiver, locating the companion LVDS
encoder, and configuring both encoders when dual-link operation is
desired. The API towards the DU driver is also extended to report the
mode of operation.

Patch 07/10 implements dual-link mode support in the DU driver. There is
no specific configuration to be performed there, as dual-link is fully
implemented in the LVDS encoder driver, but the DU driver has to skip
creation of the DRM encoder and connector related to the second LVDS
encoder when dual-link is used, as the second LVDS encoder operates as a
slave of the first one, transparently from a CRTC (and thus userspace)
perspective.

Patch 08/10 specifies the companion LVDS encoder in the D3 and E3 DT
bindings. This by itself doesn't enable dual-link mode, the LVDS0
encoder is still connected to the HDMI output through LVDS receiver, and
the LVDS1 encoder is not used. Patches 09/10 and 10/10, not intended to
be merged, enable dual-link operation for the D3 and E3 boards for
testing and require flipping DIP switches on the boards.

The patches are based on top of my drm/du/next branch, and are available
for convenience at

        git://linuxtv.org/pinchartl/media.git drm/du/lvds/dual-link

They have been tested successfully on the D3 Draak board. I expect them
to work on E3 as well, but I don't have access to an Ebisu board to test
this.

Laurent Pinchart (10):
  drm: bridge: Add dual_link field to the drm_bridge_timings structure
  dt-bindings: display: bridge: thc63lvd1024: Document dual-link
    operation
  drm: bridge: thc63: Report input bus mode through bridge timings
  dt-bindings: display: renesas: lvds: Add renesas,companion property
  drm: rcar-du: lvds: Remove LVDS double-enable checks
  drm: rcar-du: lvds: Add support for dual-link mode
  drm: rcar-du: Skip LVDS1 output on Gen3 when using dual-link LVDS mode
  arm64: dts: renesas: r8a7799[05]: Point LVDS0 to its companion LVDS1
  [HACK] arm64: dts: renesas: draak: Enable LVDS dual-link operation
  [HACK] arm64: dts: renesas: ebisu: Enable LVDS dual-link operation

 .../bindings/display/bridge/renesas,lvds.txt  |   7 +
 .../display/bridge/thine,thc63lvd1024.txt     |   6 +
 .../arm64/boot/dts/renesas/r8a77990-ebisu.dts |  24 +++-
 arch/arm64/boot/dts/renesas/r8a77990.dtsi     |   2 +
 .../arm64/boot/dts/renesas/r8a77995-draak.dts |  24 +++-
 arch/arm64/boot/dts/renesas/r8a77995.dtsi     |   2 +
 drivers/gpu/drm/bridge/thc63lvd1024.c         |  54 ++++++--
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c     |  12 ++
 drivers/gpu/drm/rcar-du/rcar_du_kms.c         |   2 +-
 drivers/gpu/drm/rcar-du/rcar_lvds.c           | 126 +++++++++++++-----
 drivers/gpu/drm/rcar-du/rcar_lvds.h           |   5 +
 include/drm/drm_bridge.h                      |   8 ++
 12 files changed, 214 insertions(+), 58 deletions(-)

-- 
Regards,

Laurent Pinchart


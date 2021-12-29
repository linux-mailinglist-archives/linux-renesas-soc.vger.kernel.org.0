Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8631348164E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Dec 2021 20:31:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230408AbhL2Tbn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Dec 2021 14:31:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230402AbhL2Tbm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Dec 2021 14:31:42 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CBBAC061574;
        Wed, 29 Dec 2021 11:31:42 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 574B433F;
        Wed, 29 Dec 2021 20:31:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1640806300;
        bh=/FyjdaIi5p0Rztu840RJWF2hEju8ChtOWHc6QsTjTPs=;
        h=From:To:Cc:Subject:Date:From;
        b=QME1yS1BQBH2NiLxyDiLHGy+km7qGyq/7NU8jFe3UeEWoGUXYg3yTBmK6YdN2i9hI
         tsJRen2c0cJP1fmW7liVsH0peCGPNdnCrShLfGKu5f+pLdMuSPQ58O0Kq03g+9HtB1
         OzyOc+Tjm8zOEZiRH00zlk5K1b99/Aq/cOgd2wwg=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Subject: [PATCH v2 0/3] arm64: dts: renesas: Prepare AA1024XD12 panel .dtsi for overlay support
Date:   Wed, 29 Dec 2021 21:31:32 +0200
Message-Id: <20211229193135.28767-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

This small patchs series adds two DT overlays that model a Mitsubishi
AA1024XD12 panel connected to a Salvator-X(S) board or a Draak or Ebisu
board.

The panel is external to the development board and is optional, so DT
overlays seem to be the best option to me. They can easily be applied by
U-Boot. For instance, when booting a FIT image, a list of configurations
can be specified. Here's the boot script I'm using (with the U-Boot
bootcmd simply set to "dhcp && source"):

--------
setenv bootargs "console=ttySC0,115200 rw root=/dev/nfs ip=dhcp"
setenv bootfile gen3/kernel_fdt.itb
setenv fdtfile r8a77965-salvator-xs.dtb
setenv overlay_files "salvator-panel-aa104xd12.dtbo"

for overlay in ${overlay_files}; do
        setenv overlaystring "${overlaystring}\\#conf-${overlay}"
done

tftpboot ${bootfile}
bootm ${fileaddr}#conf-${fdtfile}${overlaystring}
--------

This is much simpler than the hack branch I used to carry with per-board
DT changes to enable panel support on a particular board (and last but
not least, it hopefully can be merged in mainline !).

The only difference between the two overlays is the LVDS output that the
panel is connected to (LVDS0 on Salvator-X(S), and LVDS1 on Draak and
Ebisu). On my xmas wish list is a mechanism to make this configurable at
the time the overlay is applied, but I think I'll be a sad little boy on
xmas day.

As these are the first DT overlays for Renesas boards in the mainline
kernel, comments are welcome. If the approach gets positive feedback, we
could turn other external add-ons (panels, camera modules, ...) into
overlays as well.

Compared to v1, this version creates the endpoints for the lvds0 and
lvds1 ports in the overlays, to take into account the changes from
https://lore.kernel.org/all/20211229191838.27922-1-laurent.pinchart+renesas@ideasonboard.com/.

Laurent Pinchart (3):
  arm64: dts: renesas: Prepare AA1024XD12 panel .dtsi for overlay
    support
  arm64: dts: renesas: Add panel overlay for Salvator-X(S) boards
  arm64: dts: renesas: Add panel overlay for Draak and Ebisu boards

 .../arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi | 39 -------------------
 arch/arm64/boot/dts/renesas/Makefile          |  3 ++
 .../renesas/draak-ebisu-panel-aa104xd12.dts   | 36 +++++++++++++++++
 .../boot/dts/renesas/panel-aa104xd12.dtsi     | 30 ++++++++++++++
 .../dts/renesas/salvator-panel-aa104xd12.dts  | 36 +++++++++++++++++
 5 files changed, 105 insertions(+), 39 deletions(-)
 delete mode 100644 arch/arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dts
 create mode 100644 arch/arm64/boot/dts/renesas/panel-aa104xd12.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dts


base-commit: 2b534e90a1e31c7fc9536b512b72274cc3575f4c
-- 
Regards,

Laurent Pinchart


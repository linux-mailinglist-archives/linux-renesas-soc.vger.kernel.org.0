Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C155A4717A1
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Dec 2021 02:34:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229905AbhLLBe1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 Dec 2021 20:34:27 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:34696 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbhLLBe1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 Dec 2021 20:34:27 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 65ED33F0;
        Sun, 12 Dec 2021 02:34:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639272866;
        bh=4RRw4M8FTqfwYR+ChjILPvdXR46Gro8CuvEuWjm87Us=;
        h=From:To:Cc:Subject:Date:From;
        b=In5DLud8ZaH1LgX/AKLIsOx7q8CYglXp1LanQ+BIKIDa1j8A7FAbGb4ySv0iJn00P
         utjbJEQ9vFOaY5/XzFhjho56wZQOL5BqOmidKaUIQ6lSY5RWFx/7A26xNxa7ue2na9
         CZpZNOd1zZj8WQflq7mOHJM6WRM8G4YGq5SANg0w=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 0/3] arm64: dts: renesas: Add DT overlays for LVDS panel
Date:   Sun, 12 Dec 2021 03:33:48 +0200
Message-Id: <20211212013351.595-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.32.0
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

Laurent Pinchart (3):
  arm64: dts: renesas: Prepare AA1024XD12 panel .dtsi for overlay
    support
  arm64: dts: renesas: Add panel overlay for Salvator-X(S) boards
  arm64: dts: renesas: Add panel overlay for Draak and Ebisu boards

 .../arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi | 39 -------------------
 arch/arm64/boot/dts/renesas/Makefile          |  3 ++
 .../renesas/draak-ebisu-panel-aa104xd12.dts   | 32 +++++++++++++++
 .../boot/dts/renesas/panel-aa104xd12.dtsi     | 30 ++++++++++++++
 .../dts/renesas/salvator-panel-aa104xd12.dts  | 32 +++++++++++++++
 5 files changed, 97 insertions(+), 39 deletions(-)
 delete mode 100644 arch/arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dts
 create mode 100644 arch/arm64/boot/dts/renesas/panel-aa104xd12.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dts


base-commit: 211b4dbc070090b4183d6f9db7dd3bd4e6170447
-- 
Regards,

Laurent Pinchart


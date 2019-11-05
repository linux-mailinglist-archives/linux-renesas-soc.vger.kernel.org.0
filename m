Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3389F0529
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Nov 2019 19:35:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390612AbfKESfL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Nov 2019 13:35:11 -0500
Received: from andre.telenet-ops.be ([195.130.132.53]:46768 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390696AbfKESfK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Nov 2019 13:35:10 -0500
Received: from ramsan ([84.195.182.253])
        by andre.telenet-ops.be with bizsmtp
        id NJb62100N5USYZQ01Jb6j8; Tue, 05 Nov 2019 19:35:08 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iS3fW-0002sH-Ke; Tue, 05 Nov 2019 19:35:06 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iS3fW-0005ah-I0; Tue, 05 Nov 2019 19:35:06 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] dt-bindings: display: renesas: du: Add vendor prefix to vsps property
Date:   Tue,  5 Nov 2019 19:35:01 +0100
Message-Id: <20191105183504.21447-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

When the Renesas-specific "vsps" property for the Renesas Display Unit
was introduced, it was forgotten to add a vendor prefix.

Hence this patch series fixes that in DT bindings, Linux driver, and DT
source files.  The driver retains backward compatibility with old DTBs
by falling back to the old property name when needed.

The first two patches are against Laurent's drm/du/next branch.
The last patch is against renesas-devel, and must be postponed until the
second patch has landed upstream.

Thanks!

Geert Uytterhoeven (3):
  dt-bindings: display: renesas: du: Add vendor prefix to vsps property
  drm: rcar-du: Recognize "renesas,vsps" in addition to "vsps"
  arm64: dts: renesas: rcar-gen3: Replace "vsps" by "renesas,vsps"

 .../devicetree/bindings/display/renesas,du.txt  | 12 ++++++------
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi       |  2 +-
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi       |  2 +-
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi       |  3 ++-
 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi    |  2 +-
 arch/arm64/boot/dts/renesas/r8a7795.dtsi        |  3 ++-
 arch/arm64/boot/dts/renesas/r8a7796.dtsi        |  2 +-
 arch/arm64/boot/dts/renesas/r8a77965.dtsi       |  2 +-
 arch/arm64/boot/dts/renesas/r8a77970.dtsi       |  3 ++-
 arch/arm64/boot/dts/renesas/r8a77980.dtsi       |  3 ++-
 arch/arm64/boot/dts/renesas/r8a77990.dtsi       |  2 +-
 arch/arm64/boot/dts/renesas/r8a77995.dtsi       |  2 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c           | 17 ++++++++++++-----
 13 files changed, 33 insertions(+), 22 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

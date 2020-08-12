Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 588BF242AC5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Aug 2020 16:02:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726447AbgHLOCv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Aug 2020 10:02:51 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:30149 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726434AbgHLOCu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Aug 2020 10:02:50 -0400
X-IronPort-AV: E=Sophos;i="5.76,304,1592838000"; 
   d="scan'208";a="54444312"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 12 Aug 2020 23:02:49 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 5B8704007553;
        Wed, 12 Aug 2020 23:02:46 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/9] r8a774e1 add support for DU, HDMI and LVDS
Date:   Wed, 12 Aug 2020 15:02:08 +0100
Message-Id: <20200812140217.24251-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

This patch series adds support for DU, HDMI and LVDS to RZ/G2H SoC.

Cheers,
Prabhakar

Lad Prabhakar (1):
  arm64: dts: renesas: r8a774e1-hihope-rzg2h: Setup DU clocks

Marian-Cristian Rotariu (8):
  dt-bindings: display: renesas,du: Document r8a774e1 bindings
  drm: rcar-du: Add support for R8A774E1 SoC
  arm64: dts: renesas: r8a774e1: Populate DU device node
  dt-bindings: display: renesas,lvds: Document r8a774e1 bindings
  dt-bindings: display: renesas,dw-hdmi: Add r8a774e1 support
  arm64: dts: renesas: r8a774e1: Populate HDMI encoder node
  drm: rcar-du: lvds: Add support for R8A774E1 SoC
  arm64: dts: renesas: r8a774e1: Add LVDS device node

 .../display/bridge/renesas,dw-hdmi.txt        |  1 +
 .../bindings/display/bridge/renesas,lvds.txt  |  1 +
 .../bindings/display/renesas,du.txt           |  2 +
 .../dts/renesas/r8a774e1-hihope-rzg2h.dts     | 11 ++++
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi     | 61 ++++++++++++++++++-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c         | 30 +++++++++
 drivers/gpu/drm/rcar-du/rcar_lvds.c           |  1 +
 7 files changed, 104 insertions(+), 3 deletions(-)

-- 
2.17.1


Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F121EC8CAC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2019 17:20:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728515AbfJBPUs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Oct 2019 11:20:48 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:21434 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728478AbfJBPUs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Oct 2019 11:20:48 -0400
X-IronPort-AV: E=Sophos;i="5.64,574,1559487600"; 
   d="scan'208";a="28118084"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 03 Oct 2019 00:20:43 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id E21104006A99;
        Thu,  3 Oct 2019 00:20:40 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH v3 0/9] Add Display support
Date:   Wed,  2 Oct 2019 16:20:10 +0100
Message-Id: <1570029619-43238-1-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds display support for hihope RZ/G2N board.

This patch depend upon
https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=177939

V1-->V2
 * Incorporated Laurent's review comments for LVDS panels.
V2-->V3
 * Incorporated Laurent's review comments for LVDS panels.

Biju Das (9):
  arm64: dts: renesas: hihope-common: Move du clk properties out of
    common dtsi
  arm64: dts: renesas: r8a774b1: Add DU device to DT
  arm64: dts: renesas: r8a774b1: Add HDMI encoder instance
  arm64: dts: renesas: r8a774b1-hihope-rzg2n: Add display clock
    properties
  arm64: dts: renesas: r8a774b1: Add FDP1 device nodes
  arm64: dts: renesas: r8a774b1: Add PWM device nodes
  arm64: dts: renesas: hihope-rzg2-ex: Enable backlight
  arm64: dts: renesas: hihope-rzg2-ex: Add LVDS support
  arm64: dts: renesas: Add support for Advantech idk-1110wr LVDS panel

 arch/arm64/boot/dts/renesas/hihope-common.dtsi     |   8 --
 arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi    |  49 ++++++++
 .../boot/dts/renesas/r8a774a1-hihope-rzg2m.dts     |  11 ++
 .../boot/dts/renesas/r8a774b1-hihope-rzg2n.dts     |  11 ++
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi          | 133 +++++++++++++++++++++
 .../renesas/rzg2-advantech-idk-1110wr-panel.dtsi   |  41 +++++++
 6 files changed, 245 insertions(+), 8 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2-advantech-idk-1110wr-panel.dtsi

-- 
2.7.4


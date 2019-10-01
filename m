Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E04C0C33F1
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Oct 2019 14:15:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726279AbfJAMPt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Oct 2019 08:15:49 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:48334 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725821AbfJAMPs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Oct 2019 08:15:48 -0400
X-IronPort-AV: E=Sophos;i="5.64,571,1559487600"; 
   d="scan'208";a="27796475"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 01 Oct 2019 21:15:46 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 44CE24243F52;
        Tue,  1 Oct 2019 21:15:44 +0900 (JST)
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
Subject: [PATCH 0/8] Add Display support
Date:   Tue,  1 Oct 2019 13:15:16 +0100
Message-Id: <1569932124-32010-1-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds display support for hihope RZ/G2N board.

This patch depend upon
https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=177939

Biju Das (8):
  arm64: dts: renesas: hihope-common: Move du clk properties out of
    common dtsi
  arm64: dts: renesas: r8a774b1: Add DU device to DT
  arm64: dts: renesas: r8a774b1: Add HDMI encoder instance
  arm64: dts: renesas: r8a774b1-hihope-rzg2n: Add display clock
    properties
  arm64: dts: renesas: r8a774b1: Add FDP1 device nodes
  arm64: dts: renesas: r8a774b1: Add PWM device nodes
  arm64: dts: renesas: hihope-rzg2-ex: Enable backlight
  arm64: dts: renesas: hihope-rzg2-ex: Add LVDS panel support

 arch/arm64/boot/dts/renesas/hihope-common.dtsi     |   8 --
 arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi    |  50 ++++++++
 .../boot/dts/renesas/r8a774a1-hihope-rzg2m.dts     |  11 ++
 .../boot/dts/renesas/r8a774b1-hihope-rzg2n.dts     |  11 ++
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi          | 133 +++++++++++++++++++++
 arch/arm64/boot/dts/renesas/rzg2-panel-lvds.dtsi   |  37 ++++++
 6 files changed, 242 insertions(+), 8 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2-panel-lvds.dtsi

-- 
2.7.4


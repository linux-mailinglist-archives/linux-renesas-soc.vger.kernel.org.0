Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE5FBBB755
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Sep 2019 16:57:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727919AbfIWO5l (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Sep 2019 10:57:41 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:38012 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726902AbfIWO5l (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Sep 2019 10:57:41 -0400
X-IronPort-AV: E=Sophos;i="5.64,540,1559487600"; 
   d="scan'208";a="27260542"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 23 Sep 2019 23:57:39 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id BD7F640061AC;
        Mon, 23 Sep 2019 23:57:37 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 0/4] Add RZ/G2N OPP/Thermal/CMT/TMU support
Date:   Mon, 23 Sep 2019 15:57:24 +0100
Message-Id: <1569250648-33857-1-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series add OPP/Thermal/CMT/TMU driver support for RZ/G2N SoC.

This patch series depend upon
https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=177571

Biju Das (4):
  arm64: dts: renesas: r8a774b1: Add OPPs table for cpu devices
  arm64: dts: renesas: r8a774b1: Add RZ/G2N thermal support
  arm64: dts: renesas: r8a774b1: Add CMT device nodes
  arm64: dts: renesas: r8a774b1: Add TMU device nodes

 arch/arm64/boot/dts/renesas/r8a774b1.dtsi | 233 ++++++++++++++++++++++++++++++
 1 file changed, 233 insertions(+)

-- 
2.7.4


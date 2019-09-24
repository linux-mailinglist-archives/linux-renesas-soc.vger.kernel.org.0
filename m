Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E73EEBC402
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Sep 2019 10:23:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409449AbfIXIXK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Sep 2019 04:23:10 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:1922 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2409445AbfIXIXK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Sep 2019 04:23:10 -0400
X-IronPort-AV: E=Sophos;i="5.64,543,1559487600"; 
   d="scan'208";a="27122690"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 24 Sep 2019 17:23:08 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0D8A5400B9ED;
        Tue, 24 Sep 2019 17:23:05 +0900 (JST)
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
Subject: [PATCH 0/7] Add RZ/G2N SDHI/I2C/IPMMU/FCP/VSP support
Date:   Tue, 24 Sep 2019 09:22:48 +0100
Message-Id: <1569313375-53428-1-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series add SDHI/I2C/IPMMU/FCP/VSP support for RZ/G2N SoC.

This patch series depend upon
https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=177617

Biju Das (7):
  arm64: dts: renesas: r8a774b1: Add SDHI support
  arm64: dts: renesas: r8a774b1: Add I2C and IIC-DVFS support
  arm64: dts: renesas: r8a774b1: Add IPMMU device nodes
  arm64: dts: renesas: r8a774b1: Add FCPF and FCPV instances
  arm64: dts: renesas: r8a774b1: Add VSP instances
  arm64: dts: renesas: r8a774b1: Tie SYS-DMAC to IPMMU-DS0/1
  arm64: dts: renesas: r8a774b1: Connect Ethernet-AVB to IPMMU-DS0

 arch/arm64/boot/dts/renesas/r8a774b1.dtsi | 344 +++++++++++++++++++++++++++++-
 1 file changed, 339 insertions(+), 5 deletions(-)

-- 
2.7.4


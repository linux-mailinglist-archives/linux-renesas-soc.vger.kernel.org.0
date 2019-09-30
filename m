Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B2C1C1CBE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2019 10:19:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729962AbfI3ITL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Sep 2019 04:19:11 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:11364 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729232AbfI3ITL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Sep 2019 04:19:11 -0400
X-IronPort-AV: E=Sophos;i="5.64,565,1559487600"; 
   d="scan'208";a="27894407"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 30 Sep 2019 17:19:09 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id F185E400A880;
        Mon, 30 Sep 2019 17:19:06 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH v2 0/5] Add RZ/G2N SYS-DMAC/SCIF/HSCIF/GPIO/EthernetAVB support
Date:   Mon, 30 Sep 2019 09:18:42 +0100
Message-Id: <1569831527-1250-1-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series add SYS-DMAC/SCIF/HSCIF/GPIO/EthernetAVB driver support
for RZ/G2N SoC.

V1-->V2
 * Fixed the conflict related to AVB node with latest renesas-devel branch

Biju Das (5):
  arm64: dts: renesas: r8a774b1: Add SYS-DMAC device nodes
  arm64: dts: renesas: r8a774b1: Add SCIF and HSCIF nodes
  arm64: dts: renesas: r8a774b1: Add GPIO device nodes
  arm64: dts: renesas: r8a774b1: Add Ethernet AVB node
  arm64: dts: renesas: Add HiHope RZ/G2N sub board support

 arch/arm64/boot/dts/renesas/Makefile               |   1 +
 .../boot/dts/renesas/r8a774b1-hihope-rzg2n-ex.dts  |  15 +
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi          | 381 ++++++++++++++++++++-
 3 files changed, 386 insertions(+), 11 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-ex.dts

-- 
2.7.4


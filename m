Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8539E2C520C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Nov 2020 11:33:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387800AbgKZKbD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Nov 2020 05:31:03 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:63230 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730004AbgKZKbD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Nov 2020 05:31:03 -0500
X-IronPort-AV: E=Sophos;i="5.78,371,1599490800"; 
   d="scan'208";a="63758954"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 26 Nov 2020 19:31:02 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id E693E400F78D;
        Thu, 26 Nov 2020 19:30:59 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 0/2] r8a7742-iwg21d-q7-dbcm: Add support for ov7725 sensors
Date:   Thu, 26 Nov 2020 10:30:51 +0000
Message-Id: <20201126103053.29881-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

This patch set enables to connect ov7725 sensors on iWave-RZ/G1H Qseven
board.

This patch is based on top of [1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/
    renesas-devel.git/log/?h=renesas-arm-dt-for-v5.11

Changes for v3:
* Added support to mix and match the cameras connected to VINx interfaces.

Changes for v2:
* Separated out ov5640 ep into a new dtsi

v1: https://patchwork.kernel.org/project/linux-renesas-soc/patch/
    20201120151343.24175-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (2):
  ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Separate out ov5640 nodes
  ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Add support for 8-bit ov7725
    sensors

 .../boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts    | 166 +++++++++---------
 .../dts/r8a7742-iwg21d-q7-dbcm-ov5640.dtsi    | 124 +++++++++++++
 .../dts/r8a7742-iwg21d-q7-dbcm-ov7725.dtsi    | 112 ++++++++++++
 3 files changed, 322 insertions(+), 80 deletions(-)
 create mode 100644 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640.dtsi
 create mode 100644 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725.dtsi

-- 
2.17.1


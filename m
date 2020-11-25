Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C87752C40CC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Nov 2020 14:03:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729475AbgKYNB7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Nov 2020 08:01:59 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:48489 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729504AbgKYNB6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Nov 2020 08:01:58 -0500
X-IronPort-AV: E=Sophos;i="5.78,368,1599490800"; 
   d="scan'208";a="63639436"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 25 Nov 2020 22:01:56 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8ED014338021;
        Wed, 25 Nov 2020 22:01:54 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/2] r8a7742-iwg21d-q7-dbcm: Add support for ov7725 sensors
Date:   Wed, 25 Nov 2020 13:01:46 +0000
Message-Id: <20201125130148.28724-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Changes for v2:
* Separated out ov5640 ep into a dtsi

v1: https://patchwork.kernel.org/project/linux-renesas-soc/patch/
    20201120151343.24175-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (2):
  ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Separate out ov5640 nodes
  ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Add support for 8-bit ov7725
    sensors

 .../boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts    | 104 +++++-------------
 .../dts/r8a7742-iwg21d-q7-dbcm-ov5640.dtsi    |  89 +++++++++++++++
 .../dts/r8a7742-iwg21d-q7-dbcm-ov7725.dtsi    |  77 +++++++++++++
 3 files changed, 194 insertions(+), 76 deletions(-)
 create mode 100644 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640.dtsi
 create mode 100644 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725.dtsi

-- 
2.17.1


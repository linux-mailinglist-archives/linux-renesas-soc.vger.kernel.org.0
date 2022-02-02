Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54CB04A78BD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Feb 2022 20:33:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240428AbiBBTdp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Feb 2022 14:33:45 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:39684 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S238073AbiBBTdp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Feb 2022 14:33:45 -0500
X-IronPort-AV: E=Sophos;i="5.88,337,1635174000"; 
   d="scan'208";a="109157418"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 03 Feb 2022 04:33:43 +0900
Received: from localhost.localdomain (unknown [10.226.92.2])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8B5BD40F8ACC;
        Thu,  3 Feb 2022 04:33:41 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/4] Add SCIF1/CANFD support
Date:   Wed,  2 Feb 2022 19:33:35 +0000
Message-Id: <20220202193339.22441-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

RZ/G2L and RZ/G2LC SoC use the same carrier board, but the SoM is
different.

Different pin mapping is possible on SoM. For eg:- RZ/G2L SMARC EVK
uses SCIF2, whereas RZ/G2LC uses SCIF1 for the serial interface available
on PMOD1. Like wise CAN1 is multiplexed with SCIF1 using SW1[3] or RSPI
using SW1[4].

This patch series adds support for handling the pin mapping differences 
by moving definitions common to RZ/G2L and RZ/G2LC to a common dtsi file.

Biju Das (4):
  arm64: dts: renesas: rzg2l-smarc: Add common dtsi file
  arm64: dts: renesas: rzg2lc-smarc: Add macros for DIP-Switch settings
  arm64: dts: renesas: rzg2lc-smarc: Enable SCIF1 on carrier board
  arm64: dts: renesas: rzg2lc-smarc: Enable CANFD channel 1

 .../boot/dts/renesas/r9a07g044c2-smarc.dts    |  17 +-
 .../boot/dts/renesas/r9a07g044l2-smarc.dts    |   1 +
 .../boot/dts/renesas/rz-smarc-common.dtsi     | 207 ++++++++++++++++++
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi  | 193 ----------------
 .../dts/renesas/rzg2lc-smarc-pinfunction.dtsi |  30 +++
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi |  75 +++++++
 6 files changed, 314 insertions(+), 209 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi

-- 
2.17.1


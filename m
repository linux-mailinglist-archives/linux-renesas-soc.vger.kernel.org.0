Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A56B4A893D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Feb 2022 18:06:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352485AbiBCRGo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Feb 2022 12:06:44 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:19627 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229671AbiBCRGo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Feb 2022 12:06:44 -0500
X-IronPort-AV: E=Sophos;i="5.88,340,1635174000"; 
   d="scan'208";a="108564563"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 04 Feb 2022 02:06:43 +0900
Received: from localhost.localdomain (unknown [10.226.92.2])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 28D1340B1832;
        Fri,  4 Feb 2022 02:06:40 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 0/4] Add SCIF1/CANFD support
Date:   Thu,  3 Feb 2022 17:06:32 +0000
Message-Id: <20220203170636.7747-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

RZ/{G2L,V2L} and RZ/G2LC SoC use the same carrier board, but the SoM is
different.

Different pin mapping is possible on SoM. For eg:- RZ/G2L SMARC EVK
uses SCIF2, whereas RZ/G2LC uses SCIF1 for the serial interface available
on PMOD1. Like wise CAN1 is multiplexed with SCIF1 using SW1[3] or RSPI
using SW1[4].

This patch series adds support for handling the pin mapping differences 
by moving definitions common to RZ/G2L and RZ/G2LC to a common dtsi file.

v2->v3:
 * Included common file for RZ/V2L.

logs:-
root@smarc-rzv2l:~# for i in machine family soc_id revision; do echo -n "$i: ";cat /sys/devices/soc0/$i; done
machine: Renesas SMARC EVK based on r9a07g054l2
family: RZ/V2L
soc_id: r9a07g054
revision: 0
root@smarc-rzv2l:~# dmesg | grep r9
[    0.000000] Machine model: Renesas SMARC EVK based on r9a07g054l2
[    0.003202] Detected Renesas RZ/V2L r9a07g054 Rev 0

root@smarc-rzg2lc:~# for i in machine family soc_id revision; do echo -n "$i: ";cat /sys/devices/soc0/$i; done
machine: Renesas SMARC EVK based on r9a07g044c2
family: RZ/G2L
soc_id: r9a07g044
revision: 1
root@smarc-rzg2lc:~# dmesg | grep r9
[    0.000000] Machine model: Renesas SMARC EVK based on r9a07g044c2
[    0.003191] Detected Renesas RZ/G2L r9a07g044 Rev 1
root@smarc-rzg2lc:~#

root@smarc-rzg2l:~# for i in machine family soc_id revision; do echo -n "$i: ";cat /sys/devices/soc0/$i; done
machine: Renesas SMARC EVK based on r9a07g044l2
family: RZ/G2L
soc_id: r9a07g044
revision: 1
root@smarc-rzg2l:~# dmesg | grep r9
[    0.000000] Machine model: Renesas SMARC EVK based on r9a07g044l2
[    0.003390] Detected Renesas RZ/G2L r9a07g044 Rev 1 

Biju Das (4):
  arm64: dts: renesas: rzg2l-smarc: Add common dtsi file
  arm64: dts: renesas: rzg2lc-smarc: Add macros for DIP-Switch settings
  arm64: dts: renesas: rzg2lc-smarc: Enable SCIF1 on carrier board
  arm64: dts: renesas: rzg2lc-smarc: Enable CANFD channel 1

 .../boot/dts/renesas/r9a07g044c2-smarc.dts    |  17 +-
 .../boot/dts/renesas/r9a07g044l2-smarc.dts    |   1 +
 .../boot/dts/renesas/r9a07g054l2-smarc.dts    |   1 +
 .../boot/dts/renesas/rz-smarc-common.dtsi     | 207 ++++++++++++++++++
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi  | 193 ----------------
 .../dts/renesas/rzg2lc-smarc-pinfunction.dtsi |  30 +++
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi |  75 +++++++
 7 files changed, 315 insertions(+), 209 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi

-- 
2.17.1


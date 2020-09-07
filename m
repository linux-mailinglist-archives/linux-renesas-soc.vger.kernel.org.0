Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7112825FDC8
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Sep 2020 17:57:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730248AbgIGP5P (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Sep 2020 11:57:15 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:34986 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730176AbgIGP4X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Sep 2020 11:56:23 -0400
X-IronPort-AV: E=Sophos;i="5.76,402,1592838000"; 
   d="scan'208";a="56587344"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 08 Sep 2020 00:55:48 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id AA5C1400E2D0;
        Tue,  8 Sep 2020 00:55:46 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH v2 0/3] iWave G21D-Q7 enable flash, CAN and SD2 LED
Date:   Mon,  7 Sep 2020 16:55:38 +0100
Message-Id: <20200907155541.2011-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

This patch series enables PCIe, SPI NOR flash, CAN0 and SD2 LED indication
on iWave G21D-Q7 board.

Patches apply on top of [1] and also dependent on patch [2]
[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/
    renesas-devel.git/log/?h=renesas-arm-dt-for-v5.10
[2] https://patchwork.kernel.org/patch/11712541/

Cheers,
Prabhakar

v1->v2
* Set SD2 LED trigger GPIO as GPIO_ACTIVE_HIGH
* Added missing "msiof0_sync" in msiof0 pins
* Corrected to can1 interface on carrier board

Lad Prabhakar (3):
  ARM: dts: r8a7742-iwg21d-q7: Add SPI NOR support
  ARM: dts: r8a7742-iwg21d-q7: Add can1 support to carrier board
  ARM: dts: r8a7742-iwg21d-q7: Enable SD2 LED indication

 arch/arm/boot/dts/r8a7742-iwg21d-q7.dts | 62 +++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

-- 
2.17.1


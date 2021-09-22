Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A81741529D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Sep 2021 23:21:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238065AbhIVVW3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Sep 2021 17:22:29 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:51796 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S238177AbhIVVW1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Sep 2021 17:22:27 -0400
X-IronPort-AV: E=Sophos;i="5.85,315,1624287600"; 
   d="scan'208";a="94853359"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 23 Sep 2021 06:20:55 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id E2D6D4103C3F;
        Thu, 23 Sep 2021 06:20:53 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/3] RZ/G2L SMARC EVK enable ADC and CAN interfaces
Date:   Wed, 22 Sep 2021 22:20:46 +0100
Message-Id: <20210922212049.19851-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

This patch series enables ADC and CAN interfaces on RZ/G2L SMARC EVK.

Note: Patches apply on top of [1] + [2]
[1] https://git.kernel.org/pub/scm/linux/kernel/
git/geert/renesas-devel.git/log/?h=renesas-arm-dt-for-v5.16
[2] https://patchwork.kernel.org/project/linux-renesas-soc/
cover/20210921084605.16250-1-biju.das.jz@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (3):
  arm64: dts: renesas: rzg2l-smarc-som: Move extal and memory nodes to
    SOM DTSI
  arm64: dts: renesas: rzg2l-smarc-som: Enable ADC on SMARC platform
  arm64: dts: renesas: rzg2l-smarc: Enable CANFD

 .../boot/dts/renesas/r9a07g044l2-smarc.dts    |  7 +--
 .../boot/dts/renesas/rzg2l-smarc-som.dtsi     | 35 +++++++++++++++
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi  | 44 +++++++++++++++++--
 3 files changed, 76 insertions(+), 10 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi

-- 
2.17.1


Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BBED458C68
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Nov 2021 11:39:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239220AbhKVKmd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Nov 2021 05:42:33 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:41407 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S235098AbhKVKmc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Nov 2021 05:42:32 -0500
X-IronPort-AV: E=Sophos;i="5.87,254,1631545200"; 
   d="scan'208";a="101057615"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 22 Nov 2021 19:39:25 +0900
Received: from localhost.localdomain (unknown [10.226.92.178])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id C5157400515F;
        Mon, 22 Nov 2021 19:39:22 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/2] Rename RZ/G2L SDHI clocks
Date:   Mon, 22 Nov 2021 10:39:03 +0000
Message-Id: <20211122103905.14439-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

RZ/G2L SDHI has 4 clocks which is controlled by PM frame work and is using
Gen3 compatible string. Now the clock factorisation happened on highspeed
clock handling and it changes to fallback by getting parent clock, if
"clkh" is not specified in device tree.

This path series rename the clocks to match with the clock names used in
R-Car Gen2 and later generations. This will avoid driver changes related
to clock names.

This patch series based on renesas-devel

Biju Das (2):
  dt-bindings: mmc: renesas,sdhi: Rename RZ/G2L clocks
  arm64: dts: renesas: r9a07g044: Rename SDHI clocks

 .../devicetree/bindings/mmc/renesas,sdhi.yaml          | 10 +++++-----
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi             |  8 ++++----
 2 files changed, 9 insertions(+), 9 deletions(-)

-- 
2.17.1


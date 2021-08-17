Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D3943EE90B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Aug 2021 11:03:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239136AbhHQJDz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Aug 2021 05:03:55 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:43734 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S235119AbhHQJDx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Aug 2021 05:03:53 -0400
X-IronPort-AV: E=Sophos;i="5.84,328,1620658800"; 
   d="scan'208";a="90881988"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 17 Aug 2021 18:03:18 +0900
Received: from localhost.localdomain (unknown [10.226.93.29])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4605F4249EEF;
        Tue, 17 Aug 2021 18:03:16 +0900 (JST)
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
Subject: [PATCH v4 0/2] Document RZ/G2L SDHI controller bindings
Date:   Tue, 17 Aug 2021 10:03:11 +0100
Message-Id: <20210817090313.31858-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series aims to document RZ/G2L SDHI controller bindings.

v3->v4:
 * Removed duplicate clock-names for sdhi-r7sxxxx SoC's
 * Defined clock-names for RZ/G2L SoC and made this as required property.
v2->v3:
 * Created a separate patch to fix the dtbs-warning check reported by [1].
 * RZ/G2L SDHI binding patch depends up on the above the patch.
 [1] https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20210804091940.23983-1-biju.das.jz@bp.renesas.com/
v1->v2:
 * Fixed dtbs-check issue for RZ/A{1,2} platforms.

v1->
 * newpatch

Biju Das (2):
  dt-bindings: mmc: renesas,sdhi: Fix dtbs-check warning
  dt-bindings: mmc: renesas,sdhi: Document RZ/G2L bindings

 .../devicetree/bindings/mmc/renesas,sdhi.yaml | 133 ++++++++++++------
 1 file changed, 89 insertions(+), 44 deletions(-)

-- 
2.17.1


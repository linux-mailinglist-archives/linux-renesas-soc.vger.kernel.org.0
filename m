Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 666D2444933
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Nov 2021 20:56:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230343AbhKCT6x (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 3 Nov 2021 15:58:53 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:51055 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229697AbhKCT6x (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Nov 2021 15:58:53 -0400
X-IronPort-AV: E=Sophos;i="5.87,206,1631545200"; 
   d="scan'208";a="99386760"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 04 Nov 2021 04:56:13 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id D4CD240E5D50;
        Thu,  4 Nov 2021 04:56:11 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/3] arm64: dts: r9a07g044: Add SCI{F} nodes to SoC DTSI
Date:   Wed,  3 Nov 2021 19:55:57 +0000
Message-Id: <20211103195600.23964-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

This patch series adds SCI{F} nodes to SoC dtsi and enables,
SCIF2 on SMARC EVK.

Note: patch 2/3 is dependent on series [1].

[1] https://patchwork.kernel.org/project/linux-renesas-soc/
cover/20211103173127.13701-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (3):
  arm64: dts: renesas: r9a07g044: Add SCIF[1-4] nodes
  arm64: dts: renesas: r9a07g044: Add SCI[0-1] nodes
  arm64: dts: renesas: rzg2l-smarc: Enable SCIF2 on carrier board

 arch/arm64/boot/dts/renesas/r9a07g044.dtsi   | 102 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi |  28 +++++
 2 files changed, 130 insertions(+)

-- 
2.17.1


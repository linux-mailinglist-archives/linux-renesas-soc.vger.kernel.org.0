Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BE08453D80
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Nov 2021 02:12:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230442AbhKQBPw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Nov 2021 20:15:52 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:58705 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230429AbhKQBPv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Nov 2021 20:15:51 -0500
X-IronPort-AV: E=Sophos;i="5.87,239,1631545200"; 
   d="scan'208";a="100510914"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 17 Nov 2021 10:12:52 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id D32B6400090F;
        Wed, 17 Nov 2021 10:12:50 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] Enable RSPI support on RZ/G2L SMARC EVK
Date:   Wed, 17 Nov 2021 01:12:45 +0000
Message-Id: <20211117011247.27621-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

This patch series enables RSPI support to RZ/G2L SMARC EVK.

Note: Patches are dependent on series [1].

[1] https://patchwork.kernel.org/project/linux-renesas-soc/cover/
20211117010527.27365-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (2):
  arm64: dts: renesas: r9a07g044: Add RSPI{0,1,2} nodes
  arm64: dts: renesas: rzg2l-smarc: Enable RSPI1 on carrier board

 arch/arm64/boot/dts/renesas/r9a07g044.dtsi   | 48 ++++++++++++++++++++
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi | 15 ++++++
 2 files changed, 63 insertions(+)

-- 
2.17.1


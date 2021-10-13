Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7C4A42B9C1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Oct 2021 09:56:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233015AbhJMH65 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Oct 2021 03:58:57 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:33593 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229902AbhJMH65 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Oct 2021 03:58:57 -0400
X-IronPort-AV: E=Sophos;i="5.85,369,1624287600"; 
   d="scan'208";a="96850451"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 13 Oct 2021 16:56:52 +0900
Received: from localhost.localdomain (unknown [10.226.92.46])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 97A79414C0EA;
        Wed, 13 Oct 2021 16:56:50 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/2] Add Ethernet support
Date:   Wed, 13 Oct 2021 08:56:45 +0100
Message-Id: <20211013075647.32231-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series aims to add Ethernet support on RZ/G2L SMARC EVK
platform.

This patch series has functional dependency on [1]
[1] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=561965

v1->v2:
 * Removed extra space before arp_ns.

Biju Das (2):
  arm64: dts: renesas: r9a07g044: Add GbEthernet nodes
  arm64: dts: renesas: rzg2l-smarc-som: Enable Ethernet

 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    | 40 ++++++++
 .../boot/dts/renesas/rzg2l-smarc-som.dtsi     | 97 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi  |  1 -
 3 files changed, 137 insertions(+), 1 deletion(-)

-- 
2.17.1


Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE16CA9E8A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Sep 2019 11:37:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732459AbfIEJhY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 Sep 2019 05:37:24 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:49465 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730872AbfIEJhY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Sep 2019 05:37:24 -0400
X-IronPort-AV: E=Sophos;i="5.64,470,1559487600"; 
   d="scan'208";a="25819792"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 05 Sep 2019 18:37:22 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id BDEC4400C0A5;
        Thu,  5 Sep 2019 18:37:19 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 0/3] RZ/G2N SoC identification support
Date:   Thu,  5 Sep 2019 10:30:40 +0100
Message-Id: <1567675844-19247-1-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series aims to add SoC identification support
for RZ/G2N SoC. RZ/G2N SoC is similar to R-Car Gen3 M3-N SoC.

Biju Das (3):
  dt-bindings: arm: Document RZ/G2N SoC DT bindings
  soc: renesas: Identify RZ/G2N
  arm64: Add Renesas R8A774B1 support

 Documentation/devicetree/bindings/arm/renesas.yaml | 4 ++++
 drivers/soc/renesas/Kconfig                        | 6 ++++++
 drivers/soc/renesas/renesas-soc.c                  | 8 ++++++++
 3 files changed, 18 insertions(+)

-- 
2.7.4


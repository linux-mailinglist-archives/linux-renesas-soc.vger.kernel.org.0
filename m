Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D63645A50E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Nov 2021 15:14:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237653AbhKWORf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Nov 2021 09:17:35 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:53210 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S237761AbhKWORe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Nov 2021 09:17:34 -0500
X-IronPort-AV: E=Sophos;i="5.87,257,1631545200"; 
   d="scan'208";a="101515724"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 23 Nov 2021 23:14:25 +0900
Received: from localhost.localdomain (unknown [10.226.93.159])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id F3B48400C45E;
        Tue, 23 Nov 2021 23:14:23 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] Enable WDT driver support
Date:   Tue, 23 Nov 2021 14:14:18 +0000
Message-Id: <20211123141420.23529-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series aims to Enable WDT driver support
on RZ/G2L SMARC EVK.

This patch series depend upon[1]
[1] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=583861

Biju Das (2):
  arm64: dts: renesas: r9a07g044: Add WDT nodes
  arm64: dts: renesas: rzg2l-smarc-som: Enable watchdog

 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    | 45 +++++++++++++++++++
 .../boot/dts/renesas/rzg2l-smarc-som.dtsi     | 15 +++++++
 2 files changed, 60 insertions(+)

-- 
2.17.1


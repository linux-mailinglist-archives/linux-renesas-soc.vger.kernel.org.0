Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86F0B1E1192
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2020 17:22:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404104AbgEYPWZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 May 2020 11:22:25 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:22773 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2403976AbgEYPWY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 May 2020 11:22:24 -0400
X-IronPort-AV: E=Sophos;i="5.73,433,1583161200"; 
   d="scan'208";a="47759197"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 26 May 2020 00:22:22 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id EE8694006C6C;
        Tue, 26 May 2020 00:22:20 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/4] iW-RainboW-G21D-Qseven Enable SCIFB2, SDHI2, AVB and RWDT
Date:   Mon, 25 May 2020 16:22:05 +0100
Message-Id: <1590420129-7531-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

This patch series enables support for SCIFB2, SDHI2, AVB and
RWDT on iW-RainboW-G21D-Qseven develpoment board.

This patch series is dependent on [1].

[1] https://patchwork.kernel.org/project/linux-renesas-soc/
    list/?series=288491&archive=both&state=*

Cheers,
Prabhakar

Lad Prabhakar (4):
  ARM: dts: r8a7742-iwg21d-q7: Enable scifb2 node
  ARM: dts: r8a7742-iwg21d-q7: Enable SDHI2 controller
  ARM: dts: r8a7742-iwg21d-q7: Enable Ethernet avb
  ARM: dts: r8a7742-iwg21d-q7: Add RWDT support

 arch/arm/boot/dts/r8a7742-iwg21d-q7.dts | 87 +++++++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

-- 
2.7.4


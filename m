Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B481245950
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Aug 2020 21:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729766AbgHPTdb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 16 Aug 2020 15:33:31 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:17695 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729688AbgHPTda (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 Aug 2020 15:33:30 -0400
X-IronPort-AV: E=Sophos;i="5.76,321,1592838000"; 
   d="scan'208";a="54692816"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 17 Aug 2020 04:33:28 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 07D0840D5476;
        Mon, 17 Aug 2020 04:33:26 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH 0/3] r8a7742-iwg21m enable RTC and NOR flash
Date:   Sun, 16 Aug 2020 20:33:13 +0100
Message-Id: <20200816193316.7641-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

This series enables RTC and SPI NOR found on r8a7742-iwg21m
SoM.

Cheers,
Prabhakar

Lad Prabhakar (3):
  ARM: dts: r8a7742-iwg21m: Sort the nodes alphabetically
  ARM: dts: r8a7742-iwg21m: Add RTC support
  ARM: dts: r8a7742-iwg21m: Add SPI NOR support

 arch/arm/boot/dts/r8a7742-iwg21m.dtsi | 62 +++++++++++++++++++++++++--
 1 file changed, 58 insertions(+), 4 deletions(-)

-- 
2.17.1


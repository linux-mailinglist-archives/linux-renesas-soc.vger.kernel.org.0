Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45B6A1E5011
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2020 23:19:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728124AbgE0VTC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 May 2020 17:19:02 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:19589 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728255AbgE0VTC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 May 2020 17:19:02 -0400
X-IronPort-AV: E=Sophos;i="5.73,442,1583161200"; 
   d="scan'208";a="47965343"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 28 May 2020 06:19:00 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 89F09400C44F;
        Thu, 28 May 2020 06:18:58 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/4] Add thermal and CMT to R8A7742 SOC
Date:   Wed, 27 May 2020 22:18:36 +0100
Message-Id: <1590614320-30160-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

This patch series adds thermal and CMT support on RZ/G1H
(R8A7742) SOC DT.

Cheers,
Prabhakar

Lad Prabhakar (4):
  dt-bindings: thermal: rcar-thermal: Add device tree support for
    r8a7742
  ARM: dts: r8a7742: Add thermal device to DT
  dt-bindings: timer: renesas,cmt: Document r8a7742 CMT support
  ARM: dts: r8a7742: Add CMT SoC specific support

 .../devicetree/bindings/thermal/rcar-thermal.yaml  |  1 +
 .../devicetree/bindings/timer/renesas,cmt.txt      |  2 +
 arch/arm/boot/dts/r8a7742.dtsi                     | 62 ++++++++++++++++++++++
 3 files changed, 65 insertions(+)

-- 
2.7.4


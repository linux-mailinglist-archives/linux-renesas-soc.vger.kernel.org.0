Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A877252B13
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Aug 2020 12:04:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728228AbgHZKEJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Aug 2020 06:04:09 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:17410 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728020AbgHZKEI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Aug 2020 06:04:08 -0400
X-IronPort-AV: E=Sophos;i="5.76,355,1592838000"; 
   d="scan'208";a="55365471"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 26 Aug 2020 19:04:07 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id C12D4427E4EF;
        Wed, 26 Aug 2020 19:04:06 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Cc:     Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH LOCAL 0/2] renesas_defconfig enable PCIe configs
Date:   Wed, 26 Aug 2020 11:03:56 +0100
Message-Id: <20200826100358.5936-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

This patch series enables PCIe host and endpoint configurations
in renesas_defconfig.

Cheers,
Prabhakar

Lad Prabhakar (2):
  arm64: renesas: defconfig: Enable CONFIG_PCIE_RCAR_HOST
  arm64: renesas: defconfig: Enable R-Car PCIe endpoint driver

 arch/arm64/configs/renesas_defconfig | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

-- 
2.17.1


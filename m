Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01A74252A12
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Aug 2020 11:32:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728004AbgHZJcc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Aug 2020 05:32:32 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:38743 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727956AbgHZJcc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Aug 2020 05:32:32 -0400
X-IronPort-AV: E=Sophos;i="5.76,355,1592838000"; 
   d="scan'208";a="55362382"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 26 Aug 2020 18:32:30 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2D0CC400419A;
        Wed, 26 Aug 2020 18:32:29 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Russell King <linux@armlinux.org.uk>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] Enable CONFIG_PCIE_RCAR_HOST
Date:   Wed, 26 Aug 2020 10:32:18 +0100
Message-Id: <20200826093220.10266-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

This series enables CONFIG_PCIE_RCAR_HOST in multi_v7_defconfig and
shmobile_defconfig.

Cheers,
Prabhakar

Lad Prabhakar (2):
  ARM: multi_v7_defconfig: enable CONFIG_PCIE_RCAR_HOST
  ARM: shmobile: defconfig: enable CONFIG_PCIE_RCAR_HOST

 arch/arm/configs/multi_v7_defconfig | 2 +-
 arch/arm/configs/shmobile_defconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.17.1


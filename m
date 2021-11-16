Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C94BD452C07
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Nov 2021 08:44:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231517AbhKPHqM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Nov 2021 02:46:12 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:39793 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231245AbhKPHps (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Nov 2021 02:45:48 -0500
X-IronPort-AV: E=Sophos;i="5.87,238,1631545200"; 
   d="scan'208";a="100433352"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 16 Nov 2021 16:42:39 +0900
Received: from localhost.localdomain (unknown [10.166.14.185])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id DC36F40083D3;
        Tue, 16 Nov 2021 16:42:38 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org,
        gregkh@linuxfoundation.org, jirislaby@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 16/16] arm64: defconfig: Enable R-Car S4-8
Date:   Tue, 16 Nov 2021 16:41:30 +0900
Message-Id: <20211116074130.107554-17-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116074130.107554-1-yoshihiro.shimoda.uh@renesas.com>
References: <20211116074130.107554-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable the Renesas R-Car S4-8 (R8A779F0) SoC in the ARM64 defconfig.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f2e2b9bdd702..04db99bfbf9d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1069,6 +1069,7 @@ CONFIG_ARCH_R8A77980=y
 CONFIG_ARCH_R8A77990=y
 CONFIG_ARCH_R8A77995=y
 CONFIG_ARCH_R8A779A0=y
+CONFIG_ARCH_R8A779F0=y
 CONFIG_ARCH_R9A07G044=y
 CONFIG_ROCKCHIP_PM_DOMAINS=y
 CONFIG_ARCH_TEGRA_132_SOC=y
-- 
2.25.1


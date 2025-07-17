Return-Path: <linux-renesas-soc+bounces-19573-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D17BEB08641
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Jul 2025 09:13:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADBB116212C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Jul 2025 07:11:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEA45219EA5;
	Thu, 17 Jul 2025 07:11:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C90063CF;
	Thu, 17 Jul 2025 07:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752736288; cv=none; b=Zokw/ilvZztp9+JZ2zlDp03XgdHA4cATA9dfNi/UuzNKKyKwWpK9/bmUj9hURyeEYH1WXDMpNEnYStHrddf6450tn+ub34OI/ICcOFy6oE1xPqndq+/0AS3pw13SGH9CN06amgc+kori8QgEw0eQNWOtGmlYCOpNoKCVExClirk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752736288; c=relaxed/simple;
	bh=7XQIo3LKI1d7UUOQlsb60PIK1n0FqfafGKjrvD7Z4aI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J87wmTJELPDOT3En8m/VtM53KZosstWQmRfRyMyfqj+s/tROGngWf12Vdaurf7+txruSiyloNcBUSbtSjHUDBNlebSSIIFdjQJm7mdoYJTO+8sclrQKy65YBFZg+3t3TyKd//LfVcaDEIK2YbRnK5VzLdoyRYdfo/kgF2I6N0s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: BNvTaLC4Tx6PpeL8WjTezg==
X-CSE-MsgGUID: x5A995XIQmuBkuP51PqC9w==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 17 Jul 2025 16:11:18 +0900
Received: from localhost.localdomain (unknown [10.226.93.49])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 937E2414FC18;
	Thu, 17 Jul 2025 16:11:13 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>,
	Russell King <rmk+kernel@armlinux.org.uk>
Subject: [PATCH net-next v2] net: stmmac: dwmac-renesas-gbeth: Add PM suspend/resume callbacks
Date: Thu, 17 Jul 2025 08:11:06 +0100
Message-ID: <20250717071109.8213-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add PM suspend/resume callbacks for RZ/G3E SMARC EVK.

The PM deep entry is executed by pressing the SLEEP button and exit from
entry is by pressing the power button.

Logs:
root@smarc-rzg3e:~# PM: suspend entry (deep)
Filesystems sync: 0.115 seconds
Freezing user space processes
Freezing user space processes completed (elapsed 0.002 seconds)
OOM killer disabled.
Freezing remaining freezable tasks
Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
printk: Suspending console(s) (use no_console_suspend to debug)
NOTICE:  BL2: v2.10.5(release):2.10.5/rz_soc_dev-162-g7148ba838
NOTICE:  BL2: Built : 14:23:58, Jul  5 2025
NOTICE:  BL2: SYS_LSI_MODE: 0x13e06
NOTICE:  BL2: SYS_LSI_DEVID: 0x8679447
NOTICE:  BL2: SYS_LSI_PRR: 0x0
NOTICE:  BL2: Booting BL31
renesas-gbeth 15c30000.ethernet end0: Link is Down
Disabling non-boot CPUs ...
psci: CPU3 killed (polled 0 ms)
psci: CPU2 killed (polled 0 ms)
psci: CPU1 killed (polled 0 ms)
Enabling non-boot CPUs ...
Detected VIPT I-cache on CPU1
GICv3: CPU1: found redistributor 100 region 0:0x0000000014960000
CPU1: Booted secondary processor 0x0000000100 [0x412fd050]
CPU1 is up
Detected VIPT I-cache on CPU2
GICv3: CPU2: found redistributor 200 region 0:0x0000000014980000
CPU2: Booted secondary processor 0x0000000200 [0x412fd050]
CPU2 is up
Detected VIPT I-cache on CPU3
GICv3: CPU3: found redistributor 300 region 0:0x00000000149a0000
CPU3: Booted secondary processor 0x0000000300 [0x412fd050]
CPU3 is up
dwmac4: Master AXI performs fixed burst length
15c30000.ethernet end0: No Safety Features support found
15c30000.ethernet end0: IEEE 1588-2008 Advanced Timestamp supported
15c30000.ethernet end0: configuring for phy/rgmii-id link mode
dwmac4: Master AXI performs fixed burst length
15c40000.ethernet end1: No Safety Features support found
15c40000.ethernet end1: IEEE 1588-2008 Advanced Timestamp supported
15c40000.ethernet end1: configuring for phy/rgmii-id link mode
OOM killer enabled.
Restarting tasks: Starting
Restarting tasks: Done
random: crng reseeded on system resumption
PM: suspend exit

15c30000.ethernet end0: Link is Up - 1Gbps/Full - flow control rx/tx
root@smarc-rzg3e:~# ifconfig end0 192.168.10.7 up
root@smarc-rzg3e:~# ping 192.168.10.1
PING 192.168.10.1 (192.168.10.1) 56(84) bytes of data.
64 bytes from 192.168.10.1: icmp_seq=1 ttl=64 time=2.05 ms
64 bytes from 192.168.10.1: icmp_seq=2 ttl=64 time=0.928 ms

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Collected tags.
Note:
This patch is tested with out-of tree patch for save/restore
ethernet OEN registers in the pinctrl block.
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
index 9a774046455b..df4ca897a60c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
@@ -136,6 +136,7 @@ static struct platform_driver renesas_gbeth_driver = {
 	.probe  = renesas_gbeth_probe,
 	.driver = {
 		.name		= "renesas-gbeth",
+		.pm		= &stmmac_pltfr_pm_ops,
 		.of_match_table	= renesas_gbeth_match,
 	},
 };
-- 
2.43.0



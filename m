Return-Path: <linux-renesas-soc+bounces-19268-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E4FAFA0FB
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Jul 2025 19:03:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDD453A3C57
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Jul 2025 17:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B219A1FE47B;
	Sat,  5 Jul 2025 17:03:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2916672634;
	Sat,  5 Jul 2025 17:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751735024; cv=none; b=pIyLRqNA0gQcbLnqXmr+v3l5qickLsWhWNpBiKJnA3uh4SgrPSmc5duIWxmSFZIvIMkbElKa9ODr3eZrhPGBe6iSqGJeGqpVGiR+TgwQvPpYmqzjcC2xwBmwdHaNPcjRHaJdOOBI5cCEvpA7lcWvHLpSbIYikhtr10Dfdnx2BNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751735024; c=relaxed/simple;
	bh=QjfCCAHuG5KSO6VVPMvYRGWXhmONEiIJ+1z/qE4+WX8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LDs8B8vjN35HqwTcYHwBieo1lu76QUt4egD+2+CW+zYAXNrnaS2yP4XCjnYh6gZKkhWCUXEQb5wA95OxcYT2rS6h3SNIvul49ovGC6PU32umWNWFmOwfS7N7O78XTwvCN6y5oW5dImHvVJgwaqXuyBH1EBPe7aOUMxkzTJtFkN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: UIRvHSRsSVmKRx59j0yRyQ==
X-CSE-MsgGUID: cnHpFD2WTtap0SSiNRFArw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 06 Jul 2025 02:03:33 +0900
Received: from localhost.localdomain (unknown [10.226.92.32])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1D9304010E1B;
	Sun,  6 Jul 2025 02:03:28 +0900 (JST)
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
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH net-next] net: stmmac: dwmac-renesas-gbeth: Add PM suspend/resume callbacks
Date: Sat,  5 Jul 2025 18:03:24 +0100
Message-ID: <20250705170326.106073-1-biju.das.jz@bp.renesas.com>
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

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
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



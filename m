Return-Path: <linux-renesas-soc+bounces-17826-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC42ACD808
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Jun 2025 08:52:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E21E81893B1A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Jun 2025 06:52:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AA7A1FCFF1;
	Wed,  4 Jun 2025 06:52:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22B682B9A9;
	Wed,  4 Jun 2025 06:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749019953; cv=none; b=O2qLVl7JppewgTupMuGaCDtAUSkZ2dISUeb5zwg70uTSFiCornaoQ46HKlEhqwrqXjOcpsdcfzzZb3fBR4gqMJGnK/IXSur3sWNJTSOkqnj1yoM4F/0jKzVPC+9D7GH9N2Nx6+Y/MCNs8aPmFnyo35zZ+UQa5giXFU86Ir31NqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749019953; c=relaxed/simple;
	bh=G5m/DmmWuNvT20bPcL1Uarq9Pf4dQmINhuu8phslNrA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KpvH8kWgyedBPtL6qxIAHOlP0aAUI/hYV6EKMzqpbIyqLL2dznBsTh0YjoQ5B+eavh3QeK4D+MZ041RDuZrDFULyzTTSrkEPFpZnuQ9W/C9EN7FL0V7UYilB0QnEnsbslJF2PXDr96GVgIQAf4z5z1Y6BqQa/k9LzK3RqjFJ/tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: EXyizG4rTayaEo+Z3yN2oQ==
X-CSE-MsgGUID: Get4dq+gQSqZI32LIDBxJQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 04 Jun 2025 15:52:22 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.93.1])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 098F8417CA9D;
	Wed,  4 Jun 2025 15:52:16 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: prabhakar.mahadev-lad.rj@bp.renesas.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: biju.das.jz@bp.renesas.com,
	john.madieu@gmail.com,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH 0/4] Add support for GBETH IPs found on RZ/G3E SoCs
Date: Wed,  4 Jun 2025 08:51:56 +0200
Message-ID: <20250604065200.163778-1-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This series adds support for the two Gigabit Ethernet (GBETH) interfaces on the
Renesas RZ/G3E (R9A09G047) SoCs and their enablement on the SMARC-II EVK. This
is achieved by integrating the necessary clock/reset signals prior to defining
common DTS nodes, and enabling both GBETH ports at the board level.

Here are pach dependencies:

 - Patch 1/4 is based on renesas-drivers tree, on top of renesas-clk-for-v6.17
 branch
 - Patches [2,3,4]/4 are based on renesas-devel tree, on top of
 renesas-dts-for-v6.17 branch

Below are some test logs, involving pings, then unbind/bind, then pings again:

```
root@smarc-rzg3e:~# ping -I eth0 google.com
PING google.com (172.217.20.174) from 192.168.1.245 eth0: 56(84) bytes of data.
64 bytes from waw02s07-in-f14.1e100.net (172.217.20.174): icmp_seq=1 ttl=117 time=4.42 ms
64 bytes from waw02s07-in-f14.1e100.net (172.217.20.174): icmp_seq=2 ttl=117 time=3.87 ms
64 bytes from waw02s07-in-f14.1e100.net (172.217.20.174): icmp_seq=3 ttl=117 time=3.68 ms
64 bytes from waw02s07-in-f14.1e100.net (172.217.20.174): icmp_seq=4 ttl=117 time=3.83 ms
^C
--- google.com ping statistics ---
4 packets transmitted, 4 received, 0% packet loss, time 3005ms
rtt min/avg/max/mdev = 3.680/3.949/4.415/0.278 ms
root@smarc-rzg3e:~# 

root@smarc-rzg3e:~# ping -I eth1 google.com
PING google.com (142.250.75.238) from 192.168.1.242 eth1: 56(84) bytes of data.
64 bytes from par10s41-in-f14.1e100.net (142.250.75.238): icmp_seq=1 ttl=251 time=4.72 ms
64 bytes from par10s41-in-f14.1e100.net (142.250.75.238): icmp_seq=2 ttl=251 time=4.34 ms
64 bytes from par10s41-in-f14.1e100.net (142.250.75.238): icmp_seq=3 ttl=251 time=5.66 ms
^C
--- google.com ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2003ms
rtt min/avg/max/mdev = 4.338/4.904/5.659/0.555 ms
root@smarc-rzg3e:~# 
root@smarc-rzg3e:~# 
root@smarc-rzg3e:~# 
root@smarc-rzg3e:~# echo "15c40000.ethernet" > /sys/bus/platform/drivers/renesas-gbeth/bind
[  413.422009] renesas-gbeth 15c40000.ethernet: IRQ sfty not found
[  413.429570] renesas-gbeth 15c40000.ethernet: User ID: 0x0, Synopsys ID: 0x52
[  413.436749] renesas-gbeth 15c40000.ethernet:         DWMAC4/5
[  413.441974] renesas-gbeth 15c40000.ethernet: DMA HW capability register supported
[  413.449536] renesas-gbeth 15c40000.ethernet: RX Checksum Offload Engine supported
[  413.457098] renesas-gbeth 15c40000.ethernet: Wake-Up On Lan supported
[  413.463617] renesas-gbeth 15c40000.ethernet: Enable RX Mitigation via HW Watchdog Timer
[  413.471807] renesas-gbeth 15c40000.ethernet: Enabled L3L4 Flow TC (entries=8)
[  413.478982] renesas-gbeth 15c40000.ethernet: Enabled RFS Flow TC (entries=10)
[  413.486148] renesas-gbeth 15c40000.ethernet: Using 32/32 bits DMA host/device width
[  413.523040] renesas-gbeth 15c40000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
[  413.534875] renesas-gbeth 15c40000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-1
[  413.546218] renesas-gbeth 15c40000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-2
[  413.556666] renesas-gbeth 15c40000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-3
[  413.633799] renesas-gbeth 15c40000.ethernet eth0: PHY [stmmac-1:07] driver [Microchip KSZ9131 Gigabit PHY] (irq=27)
[  413.659645] dwmac4: Master AXI performs fixed burst length
[  413.666549] renesas-gbeth 15c40000.ethernet eth0: No Safety Features support found
[  413.674263] renesas-gbeth 15c40000.ethernet eth0: IEEE 1588-2008 Advanced Timestamp supported
[  413.683733] renesas-gbeth 15c40000.ethernet eth0: registered PTP clock
[  413.695546] renesas-gbeth 15c40000.ethernet eth0: configuring for phy/rgmii-id link mode
[  416.576645] renesas-gbeth 15c40000.ethernet eth0: Link is Up - 1Gbps/Full - flow control off
root@smarc-rzg3e:~#
root@smarc-rzg3e:~# echo "15c30000.ethernet" > /sys/bus/platform/drivers/renesas-gbeth/bind
[  430.269771] renesas-gbeth 15c30000.ethernet: IRQ sfty not found
[  430.277347] renesas-gbeth 15c30000.ethernet: User ID: 0x1, Synopsys ID: 0x52
[  430.284525] renesas-gbeth 15c30000.ethernet:         DWMAC4/5
[  430.289753] renesas-gbeth 15c30000.ethernet: DMA HW capability register supported
[  430.297317] renesas-gbeth 15c30000.ethernet: RX Checksum Offload Engine supported
[  430.304880] renesas-gbeth 15c30000.ethernet: Wake-Up On Lan supported
[  430.311400] renesas-gbeth 15c30000.ethernet: Enable RX Mitigation via HW Watchdog Timer
[  430.319598] renesas-gbeth 15c30000.ethernet: Enabled L3L4 Flow TC (entries=8)
[  430.326774] renesas-gbeth 15c30000.ethernet: Enabled RFS Flow TC (entries=10)
[  430.333942] renesas-gbeth 15c30000.ethernet: Using 32/32 bits DMA host/device width
[  430.360549] renesas-gbeth 15c30000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-0
[  432.366627] renesas-gbeth 15c30000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-1
[  432.377218] renesas-gbeth 15c30000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-2
[  432.386450] renesas-gbeth 15c30000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-3
[  432.461470] renesas-gbeth 15c30000.ethernet eth1: PHY [stmmac-0:07] driver [Microchip KSZ9131 Gigabit PHY] (irq=23)
[  432.487523] dwmac4: Master AXI performs fixed burst length
[  432.494429] renesas-gbeth 15c30000.ethernet eth1: No Safety Features support found
[  432.502149] renesas-gbeth 15c30000.ethernet eth1: IEEE 1588-2008 Advanced Timestamp supported
[  432.511638] renesas-gbeth 15c30000.ethernet eth1: registered PTP clock
[  432.523033] renesas-gbeth 15c30000.ethernet eth1: configuring for phy/rgmii-id link mode
[  435.489601] renesas-gbeth 15c30000.ethernet eth1: Link is Up - 1Gbps/Full - flow control off
root@smarc-rzg3e:~# 
root@smarc-rzg3e:~# 
root@smarc-rzg3e:~# ping -I eth0 google.com
PING google.com (142.250.75.238) from 192.168.1.242 eth0: 56(84) bytes of data.
64 bytes from par10s41-in-f14.1e100.net (142.250.75.238): icmp_seq=1 ttl=251 time=4.62 ms
64 bytes from par10s41-in-f14.1e100.net (142.250.75.238): icmp_seq=2 ttl=251 time=4.19 ms
64 bytes from par10s41-in-f14.1e100.net (142.250.75.238): icmp_seq=3 ttl=251 time=4.49 ms
64 bytes from par10s41-in-f14.1e100.net (142.250.75.238): icmp_seq=4 ttl=251 time=4.76 ms
^C
--- google.com ping statistics ---
4 packets transmitted, 4 received, 0% packet loss, time 3005ms
rtt min/avg/max/mdev = 4.189/4.514/4.758/0.210 ms
root@smarc-rzg3e:~# ping -I eth1 google.com
PING google.com (142.250.75.238) from 192.168.1.245 eth1: 56(84) bytes of data.
64 bytes from par10s41-in-f14.1e100.net (142.250.75.238): icmp_seq=1 ttl=251 time=4.45 ms
64 bytes from par10s41-in-f14.1e100.net (142.250.75.238): icmp_seq=2 ttl=251 time=4.79 ms
64 bytes from par10s41-in-f14.1e100.net (142.250.75.238): icmp_seq=3 ttl=251 time=4.42 ms
64 bytes from par10s41-in-f14.1e100.net (142.250.75.238): icmp_seq=4 ttl=251 time=4.47 ms
^C
--- google.com ping statistics ---
4 packets transmitted, 4 received, 0% packet loss, time 3005ms
rtt min/avg/max/mdev = 4.417/4.530/4.787/0.149 ms
root@smarc-rzg3e:~# 
```

Regards,
John Madieu

John Madieu (4):
  clk: renesas: r9a09g047: Add clock and reset signals for the GBETH IPs
  dt-bindings: net: renesas-gbeth: Add support for RZ/G3E (R9A09G047)
    SoC
  arm64: dts: renesas: r9a09g047: Add GBETH nodes
  arm64: dts: renesas: rzg3e-smarc-som: Enable eth{0-1} (GBETH)
    interfaces

 .../bindings/net/renesas,r9a09g057-gbeth.yaml |   2 +
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    | 207 ++++++++++++++++++
 .../boot/dts/renesas/rzg3e-smarc-som.dtsi     | 106 +++++++++
 drivers/clk/renesas/r9a09g047-cpg.c           |  64 ++++++
 4 files changed, 379 insertions(+)

-- 
2.25.1



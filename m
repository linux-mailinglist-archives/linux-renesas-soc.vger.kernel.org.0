Return-Path: <linux-renesas-soc+bounces-18222-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AF0AD7C0B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 22:12:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8ED963A8CD0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 20:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D6A62D6629;
	Thu, 12 Jun 2025 20:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Db5mO92E"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11DF2D6615;
	Thu, 12 Jun 2025 20:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749759142; cv=none; b=tSdhqXWkxLUdkgyxA0EPmLkhDiSzhhDl92mI0GbjpJLN5s5yQp6DtRKwTolgEYQEqSTjvRiCpq8BXEZph0ZU4BVCznqSQv6K+/DLBrcEyPYk6oZV9O3SA+tqOsbByb80f3Pe8yVjACGsNTAxsTZvpz5OCd/g10vHQBDOyl0ZPKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749759142; c=relaxed/simple;
	bh=8WUwrNIEifWHlDqkSgSAcyhQuIrjdbk3GhQhzH3A3BM=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=ggFGq5URxY/pCjrzbdfYUCWejo9Cr3bpXfmmSanA9eLsti3PJUbWmAnBekrYdetTf0nO5RUqbicocNIIqbTXrbzOlRry6azh79+QCGMw8r6qBfLZlZN57viC2k+lbHq5vz2o2Cyn0nae5Lt9UgagBYK+Cd5hoy73wnmZ2xDUYEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Db5mO92E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FD49C4CEED;
	Thu, 12 Jun 2025 20:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749759141;
	bh=8WUwrNIEifWHlDqkSgSAcyhQuIrjdbk3GhQhzH3A3BM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Db5mO92EwgjRc+0a4g34hDnKxpwY9/yH2Xq0ikIN/VFJsq8jzFAJhn1Qfkr9Do7lo
	 jqsLk0v8q7QYLpyDlubgBdh4res7Epbam5ET8pWcRbyEELg5GQglOrqf6D3v9KsHeC
	 nM0U3ZWe0gRuISBJkxfpStqYkh4zAp/CLjAnnEmrpHtUME1GbZ+bQfmJBIjvBgjJ+Z
	 ULXjfQekairzB9L25OT9e4YHkR+MWW6gmisciU9e8STjkNqh1x/zVozr8pofEz8wJx
	 BG7N6wUL815HLJ5mcQnHVBlBhgLZG/clB25H896bQnr/74ONvVH03mV02cAwX6O5xO
	 opJa1JiG/sRFw==
Date: Thu, 12 Jun 2025 15:12:19 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: kuba@kernel.org, krzk+dt@kernel.org, john.madieu@gmail.com, 
 linux-kernel@vger.kernel.org, geert+renesas@glider.be, davem@davemloft.net, 
 pabeni@redhat.com, linux-renesas-soc@vger.kernel.org, 
 netdev@vger.kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, 
 conor+dt@kernel.org, biju.das.jz@bp.renesas.com, magnus.damm@gmail.com, 
 edumazet@google.com, devicetree@vger.kernel.org, andrew+netdev@lunn.ch
To: John Madieu <john.madieu.xa@bp.renesas.com>
In-Reply-To: <20250611061609.15527-1-john.madieu.xa@bp.renesas.com>
References: <20250611061609.15527-1-john.madieu.xa@bp.renesas.com>
Message-Id: <174975871363.2914832.8987482116722925693.robh@kernel.org>
Subject: Re: [PATCH v2 0/3] Add support for GBETH IPs found on RZ/G3E SoCs


On Wed, 11 Jun 2025 08:16:06 +0200, John Madieu wrote:
> Hi all,
> 
> This series adds support for the two Gigabit Ethernet (GBETH) interfaces on the
> Renesas RZ/G3E (R9A09G047) SoCs and their enablement on the SMARC-II EVK. This
> is achieved by integrating the necessary clock/reset signals prior to defining
> common DTS nodes, and enabling both GBETH ports at the board level.
> 
> Here are pach dependencies:
> 
>  - Patch 1/3 is based on renesas-drivers tree, on top of renesas-clk-for-v6.17
>  branch
>  - Patches [2,3]/3  are based on renesas-devel tree, on top of
>  renesas-dts-for-v6.17 branch
> 
> V1 of this series is located here [1]. It originaly included a patch for binding
> documentation, which, in response to Jakub [2], has been resubmited as a
> standalone patch for net-next.
> 
> Changes in v2:
>  - Appart from resending the patches and some collected tags, there is no changes in V2.
>  - Separated binding patch send as standalone patch can be found here [3]
> 
> Below are some test logs, involving pings, then unbind/bind, then pings again:
> 
> ```
> root@smarc-rzg3e:~# ping -I eth0 google.com
> PING google.com (172.217.20.174) from 192.168.1.245 eth0: 56(84) bytes of data.
> 64 bytes from waw02s07-in-f14.1e100.net (172.217.20.174): icmp_seq=1 ttl=117 time=4.42 ms
> 64 bytes from waw02s07-in-f14.1e100.net (172.217.20.174): icmp_seq=2 ttl=117 time=3.87 ms
> 64 bytes from waw02s07-in-f14.1e100.net (172.217.20.174): icmp_seq=3 ttl=117 time=3.68 ms
> 64 bytes from waw02s07-in-f14.1e100.net (172.217.20.174): icmp_seq=4 ttl=117 time=3.83 ms
> ^C
> --- google.com ping statistics ---
> 4 packets transmitted, 4 received, 0% packet loss, time 3005ms
> rtt min/avg/max/mdev = 3.680/3.949/4.415/0.278 ms
> root@smarc-rzg3e:~#
> 
> root@smarc-rzg3e:~# ping -I eth1 google.com
> PING google.com (142.250.75.238) from 192.168.1.242 eth1: 56(84) bytes of data.
> 64 bytes from par10s41-in-f14.1e100.net (142.250.75.238): icmp_seq=1 ttl=251 time=4.72 ms
> 64 bytes from par10s41-in-f14.1e100.net (142.250.75.238): icmp_seq=2 ttl=251 time=4.34 ms
> 64 bytes from par10s41-in-f14.1e100.net (142.250.75.238): icmp_seq=3 ttl=251 time=5.66 ms
> ^C
> --- google.com ping statistics ---
> 3 packets transmitted, 3 received, 0% packet loss, time 2003ms
> rtt min/avg/max/mdev = 4.338/4.904/5.659/0.555 ms
> root@smarc-rzg3e:~#
> root@smarc-rzg3e:~#
> root@smarc-rzg3e:~#
> root@smarc-rzg3e:~# echo "15c40000.ethernet" > /sys/bus/platform/drivers/renesas-gbeth/bind
> [  413.422009] renesas-gbeth 15c40000.ethernet: IRQ sfty not found
> [  413.429570] renesas-gbeth 15c40000.ethernet: User ID: 0x0, Synopsys ID: 0x52
> [  413.436749] renesas-gbeth 15c40000.ethernet:         DWMAC4/5
> [  413.441974] renesas-gbeth 15c40000.ethernet: DMA HW capability register supported
> [  413.449536] renesas-gbeth 15c40000.ethernet: RX Checksum Offload Engine supported
> [  413.457098] renesas-gbeth 15c40000.ethernet: Wake-Up On Lan supported
> [  413.463617] renesas-gbeth 15c40000.ethernet: Enable RX Mitigation via HW Watchdog Timer
> [  413.471807] renesas-gbeth 15c40000.ethernet: Enabled L3L4 Flow TC (entries=8)
> [  413.478982] renesas-gbeth 15c40000.ethernet: Enabled RFS Flow TC (entries=10)
> [  413.486148] renesas-gbeth 15c40000.ethernet: Using 32/32 bits DMA host/device width
> [  413.523040] renesas-gbeth 15c40000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
> [  413.534875] renesas-gbeth 15c40000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-1
> [  413.546218] renesas-gbeth 15c40000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-2
> [  413.556666] renesas-gbeth 15c40000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-3
> [  413.633799] renesas-gbeth 15c40000.ethernet eth0: PHY [stmmac-1:07] driver [Microchip KSZ9131 Gigabit PHY] (irq=27)
> [  413.659645] dwmac4: Master AXI performs fixed burst length
> [  413.666549] renesas-gbeth 15c40000.ethernet eth0: No Safety Features support found
> [  413.674263] renesas-gbeth 15c40000.ethernet eth0: IEEE 1588-2008 Advanced Timestamp supported
> [  413.683733] renesas-gbeth 15c40000.ethernet eth0: registered PTP clock
> [  413.695546] renesas-gbeth 15c40000.ethernet eth0: configuring for phy/rgmii-id link mode
> [  416.576645] renesas-gbeth 15c40000.ethernet eth0: Link is Up - 1Gbps/Full - flow control off
> root@smarc-rzg3e:~#
> root@smarc-rzg3e:~# echo "15c30000.ethernet" > /sys/bus/platform/drivers/renesas-gbeth/bind
> [  430.269771] renesas-gbeth 15c30000.ethernet: IRQ sfty not found
> [  430.277347] renesas-gbeth 15c30000.ethernet: User ID: 0x1, Synopsys ID: 0x52
> [  430.284525] renesas-gbeth 15c30000.ethernet:         DWMAC4/5
> [  430.289753] renesas-gbeth 15c30000.ethernet: DMA HW capability register supported
> [  430.297317] renesas-gbeth 15c30000.ethernet: RX Checksum Offload Engine supported
> [  430.304880] renesas-gbeth 15c30000.ethernet: Wake-Up On Lan supported
> [  430.311400] renesas-gbeth 15c30000.ethernet: Enable RX Mitigation via HW Watchdog Timer
> [  430.319598] renesas-gbeth 15c30000.ethernet: Enabled L3L4 Flow TC (entries=8)
> [  430.326774] renesas-gbeth 15c30000.ethernet: Enabled RFS Flow TC (entries=10)
> [  430.333942] renesas-gbeth 15c30000.ethernet: Using 32/32 bits DMA host/device width
> [  430.360549] renesas-gbeth 15c30000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-0
> [  432.366627] renesas-gbeth 15c30000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-1
> [  432.377218] renesas-gbeth 15c30000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-2
> [  432.386450] renesas-gbeth 15c30000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-3
> [  432.461470] renesas-gbeth 15c30000.ethernet eth1: PHY [stmmac-0:07] driver [Microchip KSZ9131 Gigabit PHY] (irq=23)
> [  432.487523] dwmac4: Master AXI performs fixed burst length
> [  432.494429] renesas-gbeth 15c30000.ethernet eth1: No Safety Features support found
> [  432.502149] renesas-gbeth 15c30000.ethernet eth1: IEEE 1588-2008 Advanced Timestamp supported
> [  432.511638] renesas-gbeth 15c30000.ethernet eth1: registered PTP clock
> [  432.523033] renesas-gbeth 15c30000.ethernet eth1: configuring for phy/rgmii-id link mode
> [  435.489601] renesas-gbeth 15c30000.ethernet eth1: Link is Up - 1Gbps/Full - flow control off
> root@smarc-rzg3e:~#
> root@smarc-rzg3e:~#
> root@smarc-rzg3e:~# ping -I eth0 google.com
> PING google.com (142.250.75.238) from 192.168.1.242 eth0: 56(84) bytes of data.
> 64 bytes from par10s41-in-f14.1e100.net (142.250.75.238): icmp_seq=1 ttl=251 time=4.62 ms
> 64 bytes from par10s41-in-f14.1e100.net (142.250.75.238): icmp_seq=2 ttl=251 time=4.19 ms
> 64 bytes from par10s41-in-f14.1e100.net (142.250.75.238): icmp_seq=3 ttl=251 time=4.49 ms
> 64 bytes from par10s41-in-f14.1e100.net (142.250.75.238): icmp_seq=4 ttl=251 time=4.76 ms
> ^C
> --- google.com ping statistics ---
> 4 packets transmitted, 4 received, 0% packet loss, time 3005ms
> rtt min/avg/max/mdev = 4.189/4.514/4.758/0.210 ms
> root@smarc-rzg3e:~# ping -I eth1 google.com
> PING google.com (142.250.75.238) from 192.168.1.245 eth1: 56(84) bytes of data.
> 64 bytes from par10s41-in-f14.1e100.net (142.250.75.238): icmp_seq=1 ttl=251 time=4.45 ms
> 64 bytes from par10s41-in-f14.1e100.net (142.250.75.238): icmp_seq=2 ttl=251 time=4.79 ms
> 64 bytes from par10s41-in-f14.1e100.net (142.250.75.238): icmp_seq=3 ttl=251 time=4.42 ms
> 64 bytes from par10s41-in-f14.1e100.net (142.250.75.238): icmp_seq=4 ttl=251 time=4.47 ms
> ^C
> --- google.com ping statistics ---
> 4 packets transmitted, 4 received, 0% packet loss, time 3005ms
> rtt min/avg/max/mdev = 4.417/4.530/4.787/0.149 ms
> root@smarc-rzg3e:~#
> ```
> 
> [1] - https://lore.kernel.org/all/20250604065200.163778-1-john.madieu.xa@bp.renesas.com/
> [2] - https://lore.kernel.org/all/20250609083008.0157fe47@kernel.org/
> [3] - https://lore.kernel.org/all/20250611061204.15393-1-john.madieu.xa@bp.renesas.com/
> 
> Regards,
> John Madieu
> 
> John Madieu (3):
>   clk: renesas: r9a09g047: Add clock and reset signals for the GBETH IPs
>   arm64: dts: renesas: r9a09g047: Add GBETH nodes
>   arm64: dts: renesas: rzg3e-smarc-som: Enable eth{0-1} (GBETH)
>     interfaces
> 
>  arch/arm64/boot/dts/renesas/r9a09g047.dtsi    | 207 ++++++++++++++++++
>  .../boot/dts/renesas/rzg3e-smarc-som.dtsi     | 106 +++++++++
>  drivers/clk/renesas/r9a09g047-cpg.c           |  64 ++++++
>  3 files changed, 377 insertions(+)
> 
> --
> 2.25.1
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/v6.16-rc1-15-gc3303e716218 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/renesas/' for 20250611061609.15527-1-john.madieu.xa@bp.renesas.com:

arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dtb: ethernet@15c30000 (renesas,r9a09g047-gbeth): compatible:0: 'renesas,r9a09g047-gbeth' is not one of ['renesas,r9a09g056-gbeth', 'renesas,r9a09g057-gbeth']
	from schema $id: http://devicetree.org/schemas/net/renesas,r9a09g057-gbeth.yaml#
arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dtb: ethernet@15c40000 (renesas,r9a09g047-gbeth): compatible:0: 'renesas,r9a09g047-gbeth' is not one of ['renesas,r9a09g056-gbeth', 'renesas,r9a09g057-gbeth']
	from schema $id: http://devicetree.org/schemas/net/renesas,r9a09g057-gbeth.yaml#







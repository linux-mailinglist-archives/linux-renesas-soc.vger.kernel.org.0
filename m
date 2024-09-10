Return-Path: <linux-renesas-soc+bounces-8933-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FC397440B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Sep 2024 22:23:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27BE41C25211
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Sep 2024 20:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 111571A0708;
	Tue, 10 Sep 2024 20:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="IdhMDD7y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D8217DFEF;
	Tue, 10 Sep 2024 20:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725999811; cv=none; b=FZ9FOrMglRIum2Mo3pm9b5HFOoZjTXper+eYZoI7z9zoPIOqS4mOWZSHjVm7ECNhgis6zK2fCjn9biLPMAc9/ciWXcLIwrggV2OBlRb/Ygu5iLFTUgAVO3ijUMBXnuEGQ1zSlSb8Ql86mJE/LT7pHJaiJPfmrJ+7GErtdc+hV40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725999811; c=relaxed/simple;
	bh=+2mI3aVPTFAjNlPmZ31IgSUQL2Z6Nm4c8jT5AMKE3OU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JoclZ1HRSu46p2yb/8GRHQbDVqNNTk+GUebb5w+w+w6q1wgkt9FgWksP9xme0iwZlNTVgIxvNklTgDUR7GWY0GJk9NH8ABNCFPp23F7djn//EP/gxRPt79o5EE76kaoDIOmylY50D2Ljoq0zu2Sf3C3SOqk/KDvxBbf/mvmGRVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=IdhMDD7y; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=UScy8S4PwLWTUHBkvNN5SsfhvZ/groIzspKz4jIa54E=; b=Id
	hMDD7yg8kLYwOlh7L4SAhPH327yk8+RavVcyJe/EfWsuulDzHL59+/5dsA187Tguk0XoU+lDSXFpq
	rahOg8hncoJ4wYjDAhEptQ1+AAgl0p2a1/ygD4HxJP27kOUZa0THgeytF84uIrpdLkHyu9B1P3pCi
	eyEaIIefOva2Z+c=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1so7OQ-0078tn-VG; Tue, 10 Sep 2024 22:23:18 +0200
Date: Tue, 10 Sep 2024 22:23:18 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	Dimitri Fedrau <dima.fedrau@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next 3/3] net: phy: marvell-88q2xxx: Enable auto
 negotiation for mv88q2110
Message-ID: <70b86181-7bcf-42d7-b5a8-d26ac0c4c573@lunn.ch>
References: <20240906133951.3433788-1-niklas.soderlund+renesas@ragnatech.se>
 <20240906133951.3433788-4-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240906133951.3433788-4-niklas.soderlund+renesas@ragnatech.se>

On Fri, Sep 06, 2024 at 03:39:51PM +0200, Niklas Söderlund wrote:
> The initial marvell-88q2xxx driver only supported the Marvell 88Q2110
> PHY without auto negotiation support. The reason documented states that
> the provided initialization sequence did not to work. Now a method to
> enable auto negotiation have been found by comparing the initialization
> of other supported devices and an out-of-tree PHY driver.
> 
> Perform the minimal needed initialization of the PHY to get auto
> negotiation working and remove the limitation that disables the auto
> negotiation feature for the mv88q2110 device.
> 
> With this change a 1000Mbps full duplex link is able to be negotiated
> between two mv88q2110 and the link works perfectly. The other side also
> reflects the manually configure settings of the master device.
> 
>     # ethtool eth0
>     Settings for eth0:
>             Supported ports: [  ]
>             Supported link modes:   100baseT1/Full
>                                     1000baseT1/Full
>             Supported pause frame use: Symmetric Receive-only
>             Supports auto-negotiation: Yes
>             Supported FEC modes: Not reported
>             Advertised link modes:  100baseT1/Full
>                                     1000baseT1/Full
>             Advertised pause frame use: No
>             Advertised auto-negotiation: Yes
>             Advertised FEC modes: Not reported
>             Link partner advertised link modes:  100baseT1/Full
>                                                  1000baseT1/Full
>             Link partner advertised pause frame use: No
>             Link partner advertised auto-negotiation: Yes
>             Link partner advertised FEC modes: Not reported
>             Speed: 1000Mb/s
>             Duplex: Full
>             Auto-negotiation: on
>             master-slave cfg: preferred master
>             master-slave status: slave
>             Port: Twisted Pair
>             PHYAD: 0
>             Transceiver: external
>             MDI-X: Unknown
>             Link detected: yes
>             SQI: 15/15
> 
> Before this change I was not able to manually configure 1000Mbps link,
> only a 100Mpps link so this change providers an improvement in
> performance for this device.
> 
>     [  5] local 10.1.0.2 port 5201 connected to 10.1.0.1 port 38346
>     [ ID] Interval           Transfer     Bitrate         Retr  Cwnd
>     [  5]   0.00-1.00   sec  96.8 MBytes   812 Mbits/sec    0    469 KBytes
>     [  5]   1.00-2.00   sec  94.3 MBytes   791 Mbits/sec    0    469 KBytes
>     [  5]   2.00-3.00   sec  96.1 MBytes   806 Mbits/sec    0    469 KBytes
>     [  5]   3.00-4.00   sec  98.3 MBytes   825 Mbits/sec    0    469 KBytes
>     [  5]   4.00-5.00   sec  98.4 MBytes   825 Mbits/sec    0    469 KBytes
>     [  5]   5.00-6.00   sec  98.4 MBytes   826 Mbits/sec    0    469 KBytes
>     [  5]   6.00-7.00   sec  98.9 MBytes   830 Mbits/sec    0    469 KBytes
>     [  5]   7.00-8.00   sec  91.7 MBytes   769 Mbits/sec    0    469 KBytes
>     [  5]   8.00-9.00   sec  99.4 MBytes   834 Mbits/sec    0    747 KBytes
>     [  5]   9.00-10.00  sec   101 MBytes   851 Mbits/sec    0    747 KBytes
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

I will mark this one as 'change-requested', when in fact it is more a
test-requested. Once we get a Tested-by: we can merge this next cycle.

    Andrew

---
pw-bot: cr


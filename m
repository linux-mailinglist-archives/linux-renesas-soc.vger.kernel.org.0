Return-Path: <linux-renesas-soc+bounces-15749-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF6AA84479
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 15:18:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2A1F3AB861
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 13:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32C2228C5AF;
	Thu, 10 Apr 2025 13:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="U6Xav6ef"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97592857F7;
	Thu, 10 Apr 2025 13:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744290623; cv=none; b=rfVK4jjF5g9jIt37HyS6CuQmbXYzCpAB+2mXGyPbLWI9uXHLXVuGK3ke1v4ySE65h8iGt6/tevztIlT3ZO613ElS82hFprJ2TzuU2ROQVx7wl3gSI+idaSuUQGmR5mrVZhxq8XCEPXlrd/vhgPg0xb+WvzMNQO55S8m0Um3x8SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744290623; c=relaxed/simple;
	bh=MoxeGQBB0DlHcBQSkAbqgT6ZAgbftqn1oFID8/wRUxw=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hPcqKnjgaPO8xnANmYN5k3c/3mJRa3hhcBf+jVSMtfPe2mxv452Z2npevbjrRaRf0NYyehdufmtRO21Khe9jmGciErr97k3hMyrIra159VZK7gW75xpjDQvPzujGRw46qVNeEjldIL2KiAJabnEtjhAHhuGKd4YAI63/L22yunQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=U6Xav6ef; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:To:From:Date:From:Sender:Reply-To:Subject:Date:
	Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=wGP7jv8iNn4I7r6ejBZS9/y63Kx5RjV7Hlwbnu/j0BA=; b=U6Xav6efg0Aef+i5e7mS9u9Tpe
	MOJE8G6fObtlsILpVVcRFZdesUNZf5meScKsUPS9X9Dw1NjWQuVzD9cWbKHkXQ0SpPrB8UUoR+lfn
	bXxhZaQ4+NAetGoOq3pOpl+s7opP9pHSRNz1VbwpyN5ZUOz1+UotPZv1WG/g7xAF3oQw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u2rfS-008gOE-5o; Thu, 10 Apr 2025 15:10:06 +0200
Date: Thu, 10 Apr 2025 15:10:06 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org
Subject: Re: [RFC PATCH net-next] net: phy: marvell: support DT
 configurations with only two LEDs
Message-ID: <1cb6ec18-9abb-48d9-b9a2-ca79584d4d0d@lunn.ch>
References: <20250408063136.5463-2-wsa+renesas@sang-engineering.com>
 <7f706127-aa48-4385-a7b8-f016e0ba52b7@lunn.ch>
 <Z_YZ3NiXb15wgDuY@shikoro>
 <0fe35fe3-b63c-478b-9674-a2522f582167@lunn.ch>
 <Z_d2CgxLKaEV3w8X@shikoro>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_d2CgxLKaEV3w8X@shikoro>

On Thu, Apr 10, 2025 at 09:40:58AM +0200, Wolfram Sang wrote:
> 
> > You should then find that you gain an LED directory per LED in sysfs,
> > trigger has [netdev] and there are additional files you can use to
> > configure when the LED lights/blinks for different link speeds, RX and
> > TX etc.
> 
> Again thanks for the pointer, yet I get weird results. After booting,
> with the interface up:
> 
> ===
> # cd /sys/class/leds/stmmac-0:08:green:lan/
> # ls -l
> total 0
> -rw-r--r--    1 root     root          4096 May  5 10:13 brightness
> lrwxrwxrwx    1 root     root             0 May  5 10:13 device -> ../../../stmmac-0:08
> -rw-r--r--    1 root     root          4096 May  5 10:13 device_name
> -rw-r--r--    1 root     root          4096 May  5 10:13 full_duplex
> -rw-r--r--    1 root     root          4096 May  5 10:13 half_duplex
> -rw-r--r--    1 root     root          4096 May  5 10:13 interval
> -rw-r--r--    1 root     root          4096 May  5 10:13 link
> -r--r--r--    1 root     root          4096 May  5 10:13 max_brightness
> -r--r--r--    1 root     root          4096 May  5 10:13 offloaded
> drwxr-xr-x    2 root     root             0 May  5 10:13 power
> -rw-r--r--    1 root     root          4096 May  5 10:13 rx
> -rw-r--r--    1 root     root          4096 May  5 10:13 rx_err
> lrwxrwxrwx    1 root     root             0 May  5 10:13 subsystem -> ../../../../../../../../../class/leds
> -rw-r--r--    1 root     root             0 May  5 10:13 trigger
> -rw-r--r--    1 root     root          4096 May  5 10:13 tx
> -rw-r--r--    1 root     root          4096 May  5 10:13 tx_err
> -rw-r--r--    1 root     root          4096 May  5 10:13 uevent
> # cat trigger device_name offloaded 
> none kbd-scrolllock kbd-numlock kbd-capslock kbd-kanalock kbd-shiftlock kbd-altgrlock kbd-ctrllock kbd-altlock kbd-shiftllock kbd-shiftrlock kbd-ctrlllock kbd-ctrlrlock [netdev] mmc0
> 
> 0
> ===
> 
> This shows that 'netdev' trigger is selected, alas the device name is
> empty and offloading is disabled despite the driver using those
> callbacks. The only thing that works is setting 'brightness' manually.

There is a weak relationship between the MAC, in this case, stmmac,
and the PHY. They get created at different times, and have different
life cycles. The LEDs get created when the PHY is probed. This is
generally before the MAC is created. At that point, you can use the
LED as just another LED. However, due to the default trigger, the
netdev trigger will be assigned to the LED. But at this stage it is
useless.

Sometime later the MAC will get created. Generally, at this point, the
MAC and PHY are still not linked together.

When you open the device, i.e. configure it admin up, then the MAC
driver goes and finds its PHY and connects to it. It is only at this
point can the LED get the MAC device name, know what speeds are
supported etc, which is the subset of what the MAC and PHY support
etc.

> If I now select the 'netdev' trigger _again_, things change:

That was how the code was initially developed, and the most tested
scenario. Using DT to set the trigger came a lot later.

Due to the weak link between the MAC and the PHY, the LED trigger
firsts asks the PHY what MAC are you connected to when the trigger is
activated. This can return indicating it is not connected, and this is
likely with DT configuration.

The trigger also links into the netdev notifier chain. It gets called
when the MAC registers, changes its name, unregisters, or is
configured up. The admin up notifier is the one which normally links
the LED to the MAC. So if you have time to debug this further, i would
start from netdev_trig_notify().

> The 'link_*' files appeared, 'device_name' and 'offloaded' have the
> expected values. But now the LED is blinking like crazy despite all the
> rx/tx/whatnot triggers still set to 0.

So that is odd. If offloaded indicates the hardware is doing the
blinking, that means we have a problem with the PHY configuration.
What model of Marvell PHY is it? There are some differences between
the models.

	Andrew


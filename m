Return-Path: <linux-renesas-soc+bounces-15662-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 30ED7A8246E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 14:12:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62BDE1BA3ED7
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 12:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64B6325E829;
	Wed,  9 Apr 2025 12:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="aGIjfjn3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B005125E478;
	Wed,  9 Apr 2025 12:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744200689; cv=none; b=nri36556H9k+wmSAoJuh9X8wJRsLZ6Z4u3QWmw1NehRpsTQhKY6denwyEVwH9rkp0mW9YYZIGklOqii3dftPO8fvepNwgcG59abV5PVCvO9rT0xRBQafq80OHmRsPYuEtLZvTvqTbXaOQNqxBonB2ackbU24ZI4e1sXwy1QOLT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744200689; c=relaxed/simple;
	bh=KLkilOFKphTG8GxrVVGT0sc7EkGHKSwqaU/iaMs8KFE=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sdMBzSZWllw1md0yJ7KErK2RwpI5TRwLxJc/+2FX5l2C+cgj/ELiZWNYN981o04U0yv/IUPWNU5mQLQdwRSkHNCcdBaXIlScI+mtTIMCZg295u8gg5PQt3dncDw2uEnqMcqsN7EPW1ZHu3EZJhGViZpWidPouJr4B37axbY9rD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=aGIjfjn3; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:To:From:Date:From:Sender:Reply-To:Subject:Date:
	Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=SwQ+6WD97tage8nC5az+Ng5lCMDKmy/g4EcXjscUpEE=; b=aGIjfjn3R6ScS9Q5FdZiUvq6Wf
	Ur7mm5wUpuUgaJ06zoiCZLOGQnr/NcIAL1nrk+XU+n6t464bkXcNeCesT8foGREwviTVk+t5pzZaB
	P3gMdQgNFfSlOOOYtfUUDOEmChaGOB2v3HQLOs0i1TIjijdehy32n91vN5Xpnm5DiLrs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u2UGv-008X8R-4I; Wed, 09 Apr 2025 14:11:13 +0200
Date: Wed, 9 Apr 2025 14:11:13 +0200
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
Message-ID: <0fe35fe3-b63c-478b-9674-a2522f582167@lunn.ch>
References: <20250408063136.5463-2-wsa+renesas@sang-engineering.com>
 <7f706127-aa48-4385-a7b8-f016e0ba52b7@lunn.ch>
 <Z_YZ3NiXb15wgDuY@shikoro>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_YZ3NiXb15wgDuY@shikoro>

On Wed, Apr 09, 2025 at 08:55:24AM +0200, Wolfram Sang wrote:
> Hi Andrew,
> 
> > Please make use of the LED binding:
> > 
> > &mdio {
> >         pinctrl-0 = <&mdio_pins>;
> >         pinctrl-names = "default";
> >         phy0: ethernet-phy@0 {
> >                 reg = <0>;
> >                 leds {
> >                         #address-cells = <1>;
> >                         #size-cells = <0>;
> > 
> >                         led@0 {
> >                                 reg = <0>;
> >                                 color = <LED_COLOR_ID_WHITE>;
> >                                 function = LED_FUNCTION_WAN;
> >                                 default-state = "keep";
> >                         };
> >                 };
> >         };
> > 
> > Just list the two LEDs you have connected.
> 
> Been there, didn't work. This is what I had:
> 
> 	mdio {
> 		#address-cells = <1>;
> 		#size-cells = <0>;
> 		compatible = "snps,dwmac-mdio";
> 
> 		phy_mii0: ethernet-phy@8 {
> 			reg = <8>;
> 			leds {
> 				#address-cells = <1>;
> 				#size-cells = <0>;
> 				led@0 {
> 					reg = <0>;
> 					color = <LED_COLOR_ID_GREEN>;
> 					function = LED_FUNCTION_LAN;
> 					default-state = "keep";
> 				};
> 
> 				led@1 {
> 					reg = <1>;
> 					color = <LED_COLOR_ID_AMBER>;
> 					function = LED_FUNCTION_ACTIVITY;
> 					default-state = "keep";
> 				};
> 			};
> 		};
> 	};
> 
> I played around with LED_FUNCTION_* values.


Function is just to do with naming. What you want is to add

linux,default-trigger = "netdev";

and ensure you have drivers/leds/trigger/ledtrig-netdev.c in your
kernel.

You should then find that you gain an LED directory per LED in sysfs,
trigger has [netdev] and there are additional files you can use to
configure when the LED lights/blinks for different link speeds, RX and
TX etc.

	Andrew


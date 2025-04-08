Return-Path: <linux-renesas-soc+bounces-15566-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C668A8099D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 14:55:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 656674C611D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 12:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0C8326FDA5;
	Tue,  8 Apr 2025 12:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="qxjegSsb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096CD26FD9F;
	Tue,  8 Apr 2025 12:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744116275; cv=none; b=N+CIwrLa6m3Y48DPXmeArty0rvQay69GycdUp+bnp4eDLhJ6Na099NdPEd/EXMezWnwNmHoysWgEsovZTI9kY6EhPHg6A5cY2q3Y3woan4EWQXcaa/fKBFwcbnruJrZAKZm8isvI1RYquzlw4zADLHKsKMudkfdHF2kunX0Q6p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744116275; c=relaxed/simple;
	bh=UJScE3kYaobY+fY2Uz/Nfl+hsuuZmwc6LBqbhIVVjmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J76TduQwlNDjur50g4UHOT8RMbWhJG08+IhJgayiFGr1cfgkggMdyxR7xMnC5jZaZqK84n5IciDquP0JSMGNtC+mUHPy25F6oBmCr543Mir6x9hGskEnrWb1STP1fGmz6RwuCZ8MDX+WMg+TIJHZMbp5yJHiItyJZUs2iROxu8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=qxjegSsb; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=JGl1R+x7hLzZECjPVOCTZiM6kuv4w+pilTYt2aB9ctQ=; b=qxjegSsbKUfVlvRusyLTIIyZ0b
	T3+LwsJN3s1Pi07TF9ZGiZSNobP2n3QKbreEfp+NFEXKr0U5TFUCzTEh8kmtXwQzU7+bl6KQgu53r
	Ay70q18OGTbLqPYovXLdceqc3l8ygZp4z6jQXAzBDMDBqzNXAtQCY6NFAiU+2OHthfmY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u28JO-008O58-V7; Tue, 08 Apr 2025 14:44:18 +0200
Date: Tue, 8 Apr 2025 14:44:18 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org
Subject: Re: [RFC PATCH net-next] net: phy: marvell: support DT
 configurations with only two LEDs
Message-ID: <7f706127-aa48-4385-a7b8-f016e0ba52b7@lunn.ch>
References: <20250408063136.5463-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408063136.5463-2-wsa+renesas@sang-engineering.com>

On Tue, Apr 08, 2025 at 08:30:56AM +0200, Wolfram Sang wrote:
> The Renesas RZ/N1-extension board also connects only two out of three
> LED outputs from the Marvell PHY to the actual LEDs. The already
> existing setting MARVELL_PHY_LED0_LINK_LED1_ACTIVE fits this scenario,
> but a device flag cannot be used because the PHYs use a generic MDIO bus
> on which also PHYs from other vendors reside. So, the driver is updated
> to count the number of LED nodes in DT. If the number is 2, the
> alternative LED configuration is used, otherwise the default one.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Hi Wolfram

Please make use of the LED binding:

&mdio {
        pinctrl-0 = <&mdio_pins>;
        pinctrl-names = "default";
        phy0: ethernet-phy@0 {
                reg = <0>;
                leds {
                        #address-cells = <1>;
                        #size-cells = <0>;

                        led@0 {
                                reg = <0>;
                                color = <LED_COLOR_ID_WHITE>;
                                function = LED_FUNCTION_WAN;
                                default-state = "keep";
                        };
                };
        };

Just list the two LEDs you have connected.

	Andrew


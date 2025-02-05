Return-Path: <linux-renesas-soc+bounces-12883-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA01A29A34
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 20:35:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46F2A16459E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 19:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2B88211A1E;
	Wed,  5 Feb 2025 19:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="bKVstiUN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12597211472;
	Wed,  5 Feb 2025 19:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738784119; cv=none; b=feNYjoH+o1w2khJjyIi23inqeHbmNOpbAl33kMo623xtebYC2XUf5F/R1B6bkevjFQDinyg79inw6ydDbyK3sHVgbnb5w+BRuIPy3P/zOtaW3Pv3rASAZH7oTXcD5IWnnWfiWgUSfMOR/CxCRwE/ZwXMrI0F/1g9P09R0Z8796g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738784119; c=relaxed/simple;
	bh=DO6FpVoqzj5kCjnT44+RkYsqLTR3OjhBRC7wUK5LZZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AvKeCH0ug0ZmSAPgDjmrWqebyNbWUJK+mykYbL38RiIR3uqcH3uqKX9J3DKvHliv9b4/+/6sNYoCGOb6aCbxLFoBrIakx1TntEsuPVX3QJ/w0Wyj3I5KdqiVX2GPzv7CX/6iwh2CAqbF9hqGJ6aSoG2Igss0PUFxknwPvnXgb4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=bKVstiUN; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=826zsmKNv9Jw5QB/wJ9JVPtGcQjVlcATi9B8bvTUPOc=; b=bKVstiUNxvz75cQPO0AULFZQDS
	Xud6Id3iizvk9wCZ3Jd86tRqhwel4z1IPZZpBxdXdOy/wmDqxVQc8MTy16DMiI3eXKNbBFoWSUB13
	zszWQ7Bl/pE6jpqmAJZbFOSlOVHUzy12vVAANaJjldqyR0Grso0P+IvUYVxseBbllets=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tflAz-00BHnk-Rr; Wed, 05 Feb 2025 20:35:09 +0100
Date: Wed, 5 Feb 2025 20:35:09 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Dege <michael.dege@renesas.com>,
	Christian Mardmoeller <christian.mardmoeller@renesas.com>,
	Dennis Ostermann <dennis.ostermann@renesas.com>
Subject: Re: [PATCH net-next] net: renesas: rswitch: cleanup max_speed setting
Message-ID: <18a72981-9896-4725-8f5b-5783224de300@lunn.ch>
References: <20250203170941.2491964-1-nikita.yoush@cogentembedded.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203170941.2491964-1-nikita.yoush@cogentembedded.com>

> +	err = of_get_phy_mode(rdev->np_port, &etha->phy_interface);
>  	if (err)
>  		return err;
>  
> -	err = of_property_read_u32(rdev->np_port, "max-speed", &max_speed);
> -	if (!err) {
> -		rdev->etha->speed = max_speed;
> -		return 0;
> -	}
> -
> -	/* if no "max-speed" property, let's use default speed */
> -	switch (rdev->etha->phy_interface) {
> -	case PHY_INTERFACE_MODE_MII:
> -		rdev->etha->speed = SPEED_100;
> -		break;
> +	switch (etha->phy_interface) {
>  	case PHY_INTERFACE_MODE_SGMII:
> -		rdev->etha->speed = SPEED_1000;
> +		etha->max_speed = SPEED_1000;
>  		break;
>  	case PHY_INTERFACE_MODE_USXGMII:
> -		rdev->etha->speed = SPEED_2500;
> +	case PHY_INTERFACE_MODE_5GBASER:
> +		etha->max_speed = SPEED_2500;

If the interface mode is 5GBASER why set the speed to SPEED_2500?
Also, USXGMII allows up to 10G. So this all looks a bit odd.

	Andrew


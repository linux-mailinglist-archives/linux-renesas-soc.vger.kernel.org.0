Return-Path: <linux-renesas-soc+bounces-5194-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C438BD5DE
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 May 2024 21:54:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EEB581F2252A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 May 2024 19:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B57B15ADA4;
	Mon,  6 May 2024 19:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="Dq/N96ON"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8CADDC7;
	Mon,  6 May 2024 19:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715025252; cv=none; b=pLMieRuhWVrDNhzUPtSsKN3uei0KCcqdqdRpUUOH7DO0f/bgw4jcVYFYcVJI98zuakuhe9fSGgYQSKTft7+ADHV83/0q0MDZuZWgwCtm/y5ks/0Y+ZJeB9TG9sGr/6im1cf/PpQPu3qF8J+0ljygW3lAru6S0U0JUnIHn6q4ZY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715025252; c=relaxed/simple;
	bh=CZ6zTwWmgdAYTUZMUKTM9DmLIxjNnLXAUHTo0f3Lkn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hOVFIZ6CFOUw3Dd6tBlkFOVliJrutMMbVNMo7b4+2DUOI93Sll5m5y7+88eg1NY/5NkLaC5lp634xMkpXplc6M4YfWszdTSE43WEZ00T3DSRQfgDP8bKFdV7UZA4a6RxpFXRi2UO/w4qwA4jPWU0gAPcN9cClQHu+Bz/8K7p9xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=Dq/N96ON; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=AelF1gqCOH4YchdWMBnkwBkyYAZ2G5E2YoUL/GTtTRg=; b=Dq
	/N96ONiAiqHxMrNx4h3lcbSMzaSZevMfSQee+P5NJhk8edM0mZBWClYN04kg04vfecIIsryGXgJ+e
	R+jcO9PiWx6PdyK82BGiQ5YHVMAITKic6aynudOQH+j+J8oSoXaqGtynJJg2DRbqdoK7LhJwTzQne
	y3L0ZIj9sxCnCcQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1s44PO-00EnKj-5H; Mon, 06 May 2024 21:53:58 +0200
Date: Mon, 6 May 2024 21:53:58 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Message-ID: <0b686943-51de-49c9-afef-04db18b8fdbc@lunn.ch>
References: <20240414135937.1139611-1-niklas.soderlund+renesas@ragnatech.se>
 <5fd25c58-b421-4ec0-8b4f-24f86f054a44@lunn.ch>
 <20240503102006.GI3927860@ragnatech.se>
 <e3ce12b0-fb5d-49d7-a529-9ea7392b80ca@lunn.ch>
 <20240503133033.GJ3927860@ragnatech.se>
 <d5f6f31a-6ecc-48a9-a2ca-9d22fc6acb21@lunn.ch>
 <20240506140533.GD720810@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240506140533.GD720810@ragnatech.se>

On Mon, May 06, 2024 at 04:05:33PM +0200, Niklas Söderlund wrote:
> Hi Andrew,
> 
> Thanks for this explanation, it helps understand what's going on.
> 
> On 2024-05-06 03:51:45 +0200, Andrew Lunn wrote:
> 
> > What PHY is this? Does it have C22 registers? Can it be identified via
> > C22 registers 2 and 3?
> 
> The PHY in question is mv88q2110 (drivers/net/phy/marvell-88q2xxx.c), 
> unfortunately I do not have a datasheet for it so I can't tell you much 
> about it.

The mv88q2110 declares itself as 0x002b0b20.

> 
> <snip>
> 
> > 
> > So i would drop the compatible. See if C22 is sufficient to get the
> > correct driver loaded.
> 
> - Remove C45 compatible; Remove C45 read/write in driver
> 
>   The PHY is identified as "Generic PHY", and the correct PHY driver is 
>   not used. I can't test more than that as the generic PHY driver do not 
>   implement some quirks I need to get the link up.

What ID does it return in registers 2 and 3? Anything like 0x002b0b20?
If there is some usable value there, we can probably extend the driver
to accept that ID as well.

Another option it to use a compatible conforming to:

      - pattern: "^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$"

ethernet-phy-id002b.0b20

That will bypass reading ID registers for the ID, and just use the ID
in the compatible. However, it would be better to read them from the
PHY.

	Andrew




Return-Path: <linux-renesas-soc+bounces-6354-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 441B590B392
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2024 17:11:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD67A1F21248
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2024 15:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D75C2155CA7;
	Mon, 17 Jun 2024 14:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="j94Fw9eC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418F5155C90;
	Mon, 17 Jun 2024 14:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718634598; cv=none; b=uwFsPq/cvaKYBLFo6iDUJqSNCL4KqMVL3mVzLczyGK99EDGVrhGMeDvDESAmpYC5D7bezdDOjyZKwKGAql7v4uVWkj/SivM2ZT+ITJnbMkPogyBlu2rqm+8KVR26p3hFcLEbPI3gbQ0hP6iNQSsNIt28WVEi9zCsssGhDLsRVmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718634598; c=relaxed/simple;
	bh=+oLVuF20b17/KeD/cnhmpNZn4qN3JI5332dEw38tUHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XJMouKDloCVpq15UvkuLaob/6qHqfqro/L0ypgy1f65xTe7z+nIPjqM60dkqpUsS6s4yDcgL8JalPs7AsuHkIq5N/DPQvK4jyvVyhNtoT54eZJawKdxl49vL8mFbF7fB2JUbxgPtuAr3mZO+OLWMQ/oIU33RPDjFddo3Nn25lkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=j94Fw9eC; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ghrNYOjKUEns5+oO8F4lUhqgpFkLNAVFJZuIbM/3u/w=; b=j94Fw9eC7NnKbFDeBoa45Q7SGt
	sG5hfav4ymiv/Y4PtNTKhkxBaxoDxJMaelWnUjSpWqPVbvYyEjIHUGyle/WG35CGO4879yIQxDpN6
	WxD5Rp1S2g6LhgHe1znMW+vwjynMt7vcHKfX8kKepX9mSVoB+VPN4tW4sjUXOqxN81D0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sJDMY-000HK8-Q6; Mon, 17 Jun 2024 16:29:38 +0200
Date: Mon, 17 Jun 2024 16:29:38 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Paul Barker <paul.barker.ct@bp.renesas.com>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Mitsuhiro Kimura <mitsuhiro.kimura.kc@renesas.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [net-next PATCH 2/2] net: ravb: Fix R-Car RX frame size limit
Message-ID: <ed455f3f-dcb3-4654-af78-6ff6c6c5c22e@lunn.ch>
References: <20240615103038.973-1-paul.barker.ct@bp.renesas.com>
 <20240615103038.973-3-paul.barker.ct@bp.renesas.com>
 <b1c10539-4d47-4752-8613-785b0ad83f5e@lunn.ch>
 <933ffa58-8092-4768-993d-cd62897d203d@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <933ffa58-8092-4768-993d-cd62897d203d@bp.renesas.com>

On Mon, Jun 17, 2024 at 03:03:21PM +0100, Paul Barker wrote:
> On 16/06/2024 02:23, Andrew Lunn wrote:
> > On Sat, Jun 15, 2024 at 11:30:38AM +0100, Paul Barker wrote:
> >> The RX frame size limit should not be based on the current MTU setting.
> >> Instead it should be based on the hardware capabilities.
> > 
> > This is a bit odd. MTU is Maximum Transmission Unit, so clearly is
> > about Tx. MRU does not really exist. Does TCP allow for asymmetric
> > MTU/MRU? Does MTU discovery work correctly for this?
> > 
> > In general, it seems like drivers implement min(MTU, MRU) and nothing
> > more. Do you have a real use case for this asymmetry?
> > 
> >       Andrew
> 
> Hi Andrew,
> 
> This change is based on my understanding of MTU/MRU, on the specs of the
> RZ SoCs I'm working with (primarily RZ/G2L family, RZ/G3S and RZ/G2H)
> and on some testing. My goal here is just to make the capabilities of
> the hardware available to users.
> 
> For the RZ/G2L family and RZ/G3S, we can only support an MTU of up to
> 1500 bytes, but we can receive frames of up to (IIRC) 8192 bytes. I have
> tested sending jumbo frames to an RZ/G2L device using both iperf3 and
> ping and I see no errors.
> 
> * For iperf3 RX testing, the RZ/G2L is only responding with acks. These
>   are small regardless of the size of the received packets, so the
>   mis-match in MTU between the two hosts causes no issue.
> 
> * For ping testing, the RZ/G2L will give a fragmented response to the
>   ping packet which the other host can reassemble.
> 
> For the RZ/G2H, we support sending frames of up to 2047 bytes but we can
> receive frames of up to 4092 bytes. The driver will need a few more
> changes to handle reception of packets >2kB in size, but this is
> something we can do in the near future.
> 
> Is there any reason why we shouldn't support this? I am by no means an
> expert in the Linux networking internals so there may be things I'm
> missing.

I've no really experience what the Linux stack will do. I have seen a
number of devices which do not limit received packets to the MTU,
i.e. they are happy to receive bigger packets. And i don't think this
has caused an issue. But is it ever actually used? Do users setup
asymmetric jumbo systems? I've no idea.

One thing i suggest you test is you put this in the middle of two
systems which do support jumbo.

     4K       1.5K       4K
A <-----> B <-----> C <------> D.

Make your device B and C, setting the MTU as supported. But set A and
D with a jumbo MTU which your systems should be able to receive. Do IP
routing along the chain. And then do some iperf transfers. I would
test both IPv4 and IPv6, since MTU path discovery in IPv6 is used a
lot, and gateways are not supposed to fragment.

I'm assuming here your device does actually have two interfaces?  If
it is only ever an end system, that simplifies it a lot, and these
tests are not needed.

    Andrew


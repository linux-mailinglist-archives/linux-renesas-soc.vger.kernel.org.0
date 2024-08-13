Return-Path: <linux-renesas-soc+bounces-7820-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8119695072A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Aug 2024 16:07:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A511B22564
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Aug 2024 14:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED88F17A583;
	Tue, 13 Aug 2024 14:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="1kHyrHpH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80AF3A8CE;
	Tue, 13 Aug 2024 14:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723558022; cv=none; b=jD3OqlQs2pU8Y5/TmPB6G88ukMiOiKnpraXCetaPeaPAI5EjvlugU3V9Wl7SiIo7NHIz4q7JoITvOZeuj9234xMoGlmL5QzO2J83nRCjcgOJSzZYFWt4GrLN7UsHjByvU+AQrYeuvHUKD+9STZk4NGO2X1qgyDMA9j/wGn9U4Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723558022; c=relaxed/simple;
	bh=eP+XEdCR1KUU2cjZqfxOFd9Vh9Bw+zlNK0kQu5w+Ne8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VMFccY5tskPW/D8E/rdpGhZcMjDb3JKx3sdgX/S1zRVFTRIzuIxczkLS4sgn2eqiXJVoiGZ8iAqJNWMIns0sYRU7ioHQ+ez0mXWI52XLLBVKrOOUYsr8yLlKjtRTbR2tg6sR2fKZZlJXpvEN8Z0bcwZcb5N59bD1Xa+RkKKx6sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=1kHyrHpH; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=XjvtdBWhIB3jnaC/VSJnnGrzxMjaNNlM2ipFgRhPhh0=; b=1kHyrHpH5Deq/apHEKzacsp6Qg
	hFzdHrgs6rP9M7inFWaTQyPt7mEaAkAO2eBcLE3ksAwOzAfagBPgS0jPVYFGLayWL9OManZlaapal
	E7z/lvbiNjrmPhCbpwbFYzrhnuQqgiHbniHoXTcnRhC8dt/XKxicwcCNYS5OT28ddTRU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sdsAa-004gij-MM; Tue, 13 Aug 2024 16:06:40 +0200
Date: Tue, 13 Aug 2024 16:06:40 +0200
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
Message-ID: <d5e2d054-e309-4382-a211-9fa9a0e83783@lunn.ch>
References: <20240615103038.973-1-paul.barker.ct@bp.renesas.com>
 <20240615103038.973-3-paul.barker.ct@bp.renesas.com>
 <b1c10539-4d47-4752-8613-785b0ad83f5e@lunn.ch>
 <933ffa58-8092-4768-993d-cd62897d203d@bp.renesas.com>
 <ed455f3f-dcb3-4654-af78-6ff6c6c5c22e@lunn.ch>
 <524873e1-d770-4f29-a374-dab99fe87c14@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <524873e1-d770-4f29-a374-dab99fe87c14@bp.renesas.com>

> Apologies, my response here is abysmally late due to illness, other
> priorities and then the loss of my main dev box.

Not a problem, life happens.

> As you've said, a number of devices do not limit received packet size to
> the MTU. There are many applications, other than a gateway, where using
> jumbo packets in even just one direction would be beneficial. For
> example if an application needs to receive large amounts of data but
> only needs to send back control and acknowledgement messages. I think we
> should support this where possible. This is the thought behind the first
> patch in this series as the GbEth IP present in the RZ/G2L and other
> Renesas SoCs has a very asymmetric capability (it can receive 8000 byte
> frames but only transmit 1522 byte frames).
> 
> If we explicitly do not wish to support this, that restriction should be
> documented and then (maybe over time) handled uniformly for all network
> drivers.
> 
> I'm planning to submit v2 of this series shortly.

Does the hardware support scatter/gather? How does supporting jumbo
receive affect memory usage? Can you give the hardware a number of 2K
buffers, and it will use one for a typical packet, and 4 for a jumbo
frame?

	Andrew


Return-Path: <linux-renesas-soc+bounces-11618-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1979F8ED4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 10:19:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB95E189248C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 09:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 206DB1A83F3;
	Fri, 20 Dec 2024 09:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="5SwpSUa0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2491185920;
	Fri, 20 Dec 2024 09:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734686361; cv=none; b=M4C7pGNEgr1WvFEfMx+Xkq8YYYV6D6BHJI+ux+GPY/h5zak6C9KMfpWT0/tvoU4bGpiHHadeSmTy8jczoLkPsn/dTt+V00y59o/0Ll30MAzgJQl1rhHWbDdY9PrUIGGCPMJWZr1RQkFbmPqntdkqQUUmThvxE6G4uADx5hr7anw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734686361; c=relaxed/simple;
	bh=4YOy5iVlYvpOmLep8DXk2vW9ptnWNCewAvfrbUWtEhw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=krDCrooEJc8KLp5EXnzgRQxmQD97wilmezUrOGTCfaKfu+gjXOALADRt7QaeP/3vh/N1/i8XXLTn3bTOTWOlJ3m02T57P0TkPnFU8kjxZDwnAUf+Dkhii2tNcnujtoJMdgSfQziX1i1kRsEW3KEZCVyTHQRvZv2nZhETBmqeRwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=5SwpSUa0; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=9Z/1xeLhR2RBedeERoDgl5altdaof6/Xy+v/lUiiGg4=; b=5SwpSUa0Y7Ac3PJZsPBBbz1cvM
	bFZLsXWLq8rDiRCai93dgQu6weVd0iFC9GQuGVno+ubObsMnCI2JsEf7EdV2sD+SHhgRximnYL4XF
	zi/m7bFQS4GSPjylDcSGu9dubOZQxTLw6lm1i27rhFphTuzAHPa85inOWWVuRMFFfhxE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tOZA6-001w6I-TU; Fri, 20 Dec 2024 10:19:10 +0100
Date: Fri, 20 Dec 2024 10:19:10 +0100
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
Subject: Re: [PATCH net-next 1/2] net: renesas: rswitch: use per-port irq
 handlers
Message-ID: <1f4b60ec-544c-49c5-b939-89882e1311ed@lunn.ch>
References: <20241220041659.2985492-1-nikita.yoush@cogentembedded.com>
 <20241220041659.2985492-2-nikita.yoush@cogentembedded.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220041659.2985492-2-nikita.yoush@cogentembedded.com>

On Fri, Dec 20, 2024 at 09:16:58AM +0500, Nikita Yushchenko wrote:
> Instead of handling all possible data interrupts in the same handler,
> switch to per-port handlers.
> 
> This significantly simplifies handling: when the same interrupt is used
> for several ports, system calls all handlers, and each handler only has
> to check interrupts for one port's tx and rx queues.
> 
> But it is not required to use the same interrupt for all ports - GWCA
> provides 8 data interrupts and allows arbitrary per-queue assignment
> of those. Support that by reading interrupt index for each port from
> optional 'irq-index' device tree property.

It has been pointed out that adding this property breaks backwards
compatibility with older DT blobs.

I don't know this hardware...

How many ports are there? Less than 9? Can you just do a static
allocation, port 0 gets interrupt 0, port 1 interrupt 1...

	Andrew


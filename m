Return-Path: <linux-renesas-soc+bounces-11648-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DF59F9200
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 13:16:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3F1116A4CA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 12:16:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D232B1C549E;
	Fri, 20 Dec 2024 12:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="3OWLiJQ2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED57470818;
	Fri, 20 Dec 2024 12:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734697004; cv=none; b=GGMGQNR2Zu31wygGZdOPEzaSmJQmVTE4wLzozUDcv5UO/3n9yIYoskBnsObzw4mvr1ZrCiLBfBse/3C0T5GNuUzGIk9EApCgswZvZeKeTZthnxPp21bKS21GIS7rlNvzMpXETx4eT20mIXCe91bnH08JdmJfyjxCX8lJmpzuQTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734697004; c=relaxed/simple;
	bh=2mGUGxrdg3kztyaCOP9lkSQqaCRokM1EgyFFVrNgtw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fz+tffDafRursYtWOCKAeAcesFYIilBaJTe5p3Zw8UMCQ0PL+ZI/hKAt2pTc6KeF0u+qMSWDhoA86D6UBOBj8BIGpA89RIs66gsWVChs54Iy/gFwsAl5n+jMuAHnfr+Oo8GVOY7Z33DIZWfXuj6SpS2ZKRILflFlEHCR2O1qEXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=3OWLiJQ2; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=P0NgN4Z8Lh/cbDV1U9cv7HjHcBhOIksrlCtMzz3yK80=; b=3O
	WLiJQ2FixItt7NOY0JYxnZR/He8U6z79L4VqpKR2O93vlNwS9ckc0F4OT3a96RSw4oJxSXina5OU7
	F8FovBkLhkyLSDoU93tFj24/0fAXUQsgEgegYToUaCMtKnt15i1dLbwCqrZBSOpUVrLXvN7C+RSGG
	R6hHl43M5pm0p/M=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tObvi-001z1H-CD; Fri, 20 Dec 2024 13:16:30 +0100
Date: Fri, 20 Dec 2024 13:16:30 +0100
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
Message-ID: <b82ba8c6-b8ba-4045-bd65-b2cdc80d7df9@lunn.ch>
References: <20241220041659.2985492-1-nikita.yoush@cogentembedded.com>
 <20241220041659.2985492-2-nikita.yoush@cogentembedded.com>
 <1f4b60ec-544c-49c5-b939-89882e1311ed@lunn.ch>
 <21f0aa0e-9df3-4b5a-957a-dcf68399cdce@cogentembedded.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <21f0aa0e-9df3-4b5a-957a-dcf68399cdce@cogentembedded.com>

> There are only 3 physical ports, however the use case I'm targeting is -
> virtual ports serving virtual machines (with offloading features making
> hardware directly L2-forward or L3-route most traffic between outside world
> and VM-owned virtual port frontends). In this setup, some of 8 GWCA irqs
> will be given to VMs and thus there are definitely not enough to
> per-consumer allocation.

And you are describing your VMs in DT as well? And if you change your
VM setup, you are going to modify your DT? This all sounds wrong.

It sounds like you need to be able to configure the interrupt mappings
from user space somehow. And you probably need to be able to do it on
the fly, or at least, when the interface is down.

I don't know if it will help, but ethtool mentions:

       -l --show-channels
              Queries the specified network device for the numbers of  channels
              it has.  A channel is an IRQ and the set of queues that can trig‐
              ger that IRQ.

       -L --set-channels
              Changes the numbers of channels of the specified network device.

           rx N   Changes the number of channels with only receive queues.

           tx N   Changes the number of channels with only transmit queues.

           other N
                  Changes  the  number of channels used only for other purposes
                  e.g. link interrupts or SR-IOV co-ordination.

           combined N
                  Changes the number of multi-purpose channels.


Maybe there is something you can use here? Or extend.

	Andrew



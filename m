Return-Path: <linux-renesas-soc+bounces-5218-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E968BF3C2
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2024 02:35:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7920F1C23353
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2024 00:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 603F2621;
	Wed,  8 May 2024 00:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="rHcG1FKd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F37438F;
	Wed,  8 May 2024 00:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715128544; cv=none; b=FZSHi+PXIB0QFqKgmzNPHrzcpzSd3COiy+yRMUfyTaIpC/JX0sBIHSJj0bDqmgcoNq8UY6ceVS6/eP3gYhNysDqqDlyyW7ZnWueVKAdfy5yHs/SW1vciRdGd451gFOK8tuClt6YZ0ml8IGZgRHFC8FgqKMuhMMTv3A2O7d+6A1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715128544; c=relaxed/simple;
	bh=Q/Oz3HJPLgYYD1nFMRvUNG4dDSMWhhBKJ2m1Ir2m3p8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h8df1zMzNu0VUU5IYh/Q1/o/WVX5m2CL4zomvPzTLyR6lSgFzKdllqk+pJdnnfr7/zxqc13twDXepZdqOHH9RQ3BcLEF4sAZln37OC7aYrIQHfrlWnzRv2ykpllzNl56Btx0f/uTF4xqCgp+VAQpfHyb5f/V3xmiICks4YitWAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=rHcG1FKd; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=afWDwWqDzrBDQb4Qn3PLT48G1CJrSlo0u/nbgy9fXXg=; b=rHcG1FKd6ILkeKMMWUjs25L61W
	4zCsZjWTri4ls3d7N4CeV/cG4aoB0Ti7XOamV4g/LnZ5orDodfhlma026vPT+USK2SPa/O6u2oP65
	o47lBYsCUFIFPAoM7YTHC7iY8ForH42mK87FUItb8XMqA2IrtPqwZv2cuyusPQhwnW/k=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1s4VHL-00Eu1F-5a; Wed, 08 May 2024 02:35:27 +0200
Date: Wed, 8 May 2024 02:35:27 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next,v2] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Message-ID: <2cd13d49-6b9f-4ce8-ba4e-ca02b4568842@lunn.ch>
References: <20240507201839.1763338-1-niklas.soderlund+renesas@ragnatech.se>
 <b51b7b2d-c6d0-49ef-8b84-b9ed8368c797@lunn.ch>
 <20240507215017.GA1385281@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240507215017.GA1385281@ragnatech.se>

> > This looks wrong. You should be applying delays for rgmii-id and
> > rgmii-rxid. Plain rgmii means no delays are required, because the
> > board has extra long clock lines. Same for TX delays, only for
> > rgmii-tx or rgmii-id.
> 
> This confuses me a bit, from the bindings in ethernet-controller.yaml I 
> get this the other way around,
> 
>       # RX and TX delays are added by the MAC when required
>       - rgmii
> 
>       # RGMII with internal RX and TX delays provided by the PHY,
>       # the MAC should not add the RX or TX delays in this case
>       - rgmii-id
> 
>       # RGMII with internal RX delay provided by the PHY, the MAC
>       # should not add an RX delay in this case
>       - rgmii-rxid
> 
>       # RGMII with internal TX delay provided by the PHY, the MAC
>       # should not add an TX delay in this case
>       - rgmii-txid
> 
> The way I understand it is that if if the phy-mode is 'rgmii' the MAC 
> shall apply delays if requested and only if the phy-mode is 'rgmii-id' 
> shall the MAC completely ignore the delays and let the PHY handle it.

It is confusing, and made worse by you doing different to normal and
implementing it in the MAC, not the PHY.

1% of boards use extra long clock lines, so don't need additional
delays. They use 'rgmii'. There is at least one board i know of which
has one extra long clock line, and one normal length clock line. That
board uses 'rgmii-txid', or 'rgmii-rxid', i don't remember which. The
other 98% of boards should be using 'rgmii-id', indicating something
needs to insert delays.  Of those 98%, the vast majority pass phy-mode
straight to the PHY, and the PHY added delays in both the Rx and Tx
clock. If the MAC decides to add the delays, and it is 'rgmii-id', it
should enable delays for both clock lines, and pass 'rgmii' to the
PHY. In the unlikely event somebody builds one of those 2% boards
using the MAC, you need to enable just Rx delays, or just Tx delays,
or maybe no delay at all, because of extra long clock lines. But you
should still be passing 'rgmii' to the PHY.

> Just so I understand correctly, if the phy-mode is A I should pass B to 
> of_phy_connect() if I apply the delays in the MAC.
> 
> A               B
> rgmii           rgmii-id
> rgmii-id        rgmii
> rgmii-rxid      rgmii-txid
> rgmii-txid      rgmii-rxid

Nope. Since the MAC is doing the delay, you always pass rgmii to the
PHY. A determines what, if any, delays the MAC adds.

     Andrew


Return-Path: <linux-renesas-soc+bounces-5310-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AD68C2505
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 May 2024 14:39:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71AAD1C215E6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 May 2024 12:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63C577E58F;
	Fri, 10 May 2024 12:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="eBuMJcuq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9554F2907;
	Fri, 10 May 2024 12:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715344750; cv=none; b=hvHyub0KS5arf6cpzB6npNet2s14xoi0DJZOteqKFEZZxhhbmmSiuMemWlEjerGOqDkKnNxopvZt8EqT2zzGl+9fFZgfoD5f3RGedCi93vmAlYrO58wMup6cbKOdzsIGykJlef1qLUC4U1HPB4tpjx430X7z7FSX70QoCXeec5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715344750; c=relaxed/simple;
	bh=3IY6IAxR6R5guWt/8FH1ZSU/IkTLSmrGQwGE3wDDl/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iPGVu7lF5T6KRYKLLDtEYIKksFlUEm7Fd2539POxcUWcpylPtUyytiZ9ViTwFLbva/nrPrqJrFPNBwLnQOLxgSiOqsl9ZEb3oho3RZ7IaDmhqFecVYougZXfVNrGXWaE+93dhoXJB/KN0vLHcon/ekP8XvAOyPJeDv8hfXfaeHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=eBuMJcuq; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=MvC0HLT6kAfafwmZDs4Ca35FRtlYrsMcUQPpkQ/Wj5I=; b=eB
	uMJcuq6Gh7YWFHRLIEtCXsJIgbIypUNIwaXbwvyOrupiPmBkRpqlR/Sz9+iRsP24bw7AhDtthxBKW
	Xk8y6iUGjbs8id/5JLAsLysZh5JbW+NTq5b33IZtY7S7vNf1vm3CFHcX6HK0/j+mjAQ3xiV7i5yWO
	EYsT1SVfbx/zkbE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1s5PWa-00F8Vk-BK; Fri, 10 May 2024 14:38:56 +0200
Date: Fri, 10 May 2024 14:38:56 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next,v4] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Message-ID: <c12d4a97-2dda-4fd9-b58c-d923681230ea@lunn.ch>
References: <20240509095217.3274671-1-niklas.soderlund+renesas@ragnatech.se>
 <62ab3417-0f2d-40e7-a816-b43788c448e2@lunn.ch>
 <20240509220720.GN1385281@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240509220720.GN1385281@ragnatech.se>

On Fri, May 10, 2024 at 12:07:20AM +0200, Niklas Söderlund wrote:
> On 2024-05-09 23:12:43 +0200, Andrew Lunn wrote:
> > > +	/* Link verification */
> > > +	rtsn_modify(priv, MLVC, MLVC_PLV, MLVC_PLV);
> > > +	ret = rtsn_reg_wait(priv, MLVC, MLVC_PLV, 0);
> > > +	if (ret)
> > > +		return ret;
> > 
> > What is link verification?
> 
> It's a part of the TSN capabilities, it verifies if the link is capable 
> of preemption. AFIK it's described in IEEE802.1Qbu Frame Preemption 
> Protocol.
> 
> For this device in particular, this register writes enables the Link 
> Verification process. Which in turn allows the IP to transmitting Verify 
> frames, which if replied too with a valid Reply frame by the other node 
> lets the IP know the link supports preemption.

Thanks for the explanation.

I've seen some hardware which polls the PHY for link status. Such
hardware assumes it has exclusive access to the PHY, which is
incorrect in Linux. hwmon might of swapped the PHY to a different page
in order to read a temperature sensor etc. If the hardware were to
poll at that point, rather than getting the BMSR it reads some other
random register...

I just wanted to check it was not something like this.

	Andrew


Return-Path: <linux-renesas-soc+bounces-24330-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5BDC402DD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 07 Nov 2025 14:47:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E819B3A7BC0
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Nov 2025 13:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F294A2F7AC4;
	Fri,  7 Nov 2025 13:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="hY76J/49"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2892EDD4F;
	Fri,  7 Nov 2025 13:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762523219; cv=none; b=n/EilrRol6TZWQHvUV07Co/5V/LbcmIPLSQ3QfuExQXDGHMCg/Gaj/YFQppmHvNIAplVM16y22Q5A2SHjeMfw+ahKbZb5+hEABzeTGNlRJHqybI8gvdQ1mM9QRTwCK6AEe64n59a4VxhB1aWvcYuF+rMQAICr2b07fIq1hUqc5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762523219; c=relaxed/simple;
	bh=k0VYtxQ4PaLjvbUVZD+2TtBsLjcRNRLUmGTSWCXR+o8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cnWGOvUl6TNChgOMdPrEcT6V4dLW9h7s39Zi2JZA2lEl3+ivi/12osxzWlQv4eKyJ4eFgE4mE2iH4K81ESn56wMaOD+bB3qvK3gZoT9955v33St5FXui5VAChE13rjeoHjU2tDYxfVlSslLL0jrN4FSrt6ZP503VFPR6W0d9fb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=hY76J/49; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=aCx80GZnKiwHZMq1rbj1gG3c07DmcMmiYYKluNyIJx0=; b=hY76J/49CBXSHS6N3lORi1l3NJ
	GclCFP9NQTLcfA/XzWFNSw3Z+k9MLOmp5yWJ9c9oK3BXG2EN8Fw1cti9DqLyMUT0xb0ZtBVIiA3p7
	MJG4cOEX0qv34UvHQQXUgoyZ4cI8U9ZDAGRfhKDQa2xJy40iMdhN0ocZet1LPMWQPJ+8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vHMnc-00DER6-Ri; Fri, 07 Nov 2025 14:46:44 +0100
Date: Fri, 7 Nov 2025 14:46:44 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Michael Dege <michael.dege@renesas.com>
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	"niklas.soderlund" <niklas.soderlund@ragnatech.se>,
	Paul Barker <paul@pbarker.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"magnus.damm" <magnus.damm@gmail.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH net-next 09/10] net: renesas: rswitch: add simple l3
 routing
Message-ID: <4c93ea95-a601-4cf5-ba92-a5a0e672ab62@lunn.ch>
References: <20251106-add_l3_routing-v1-0-dcbb8368ca54@renesas.com>
 <20251106-add_l3_routing-v1-9-dcbb8368ca54@renesas.com>
 <06213fb1-12dc-4045-803e-d2a65c7e9fc6@lunn.ch>
 <03012c3b-ae9d-4591-8ac5-8cf302b794a5@cogentembedded.com>
 <TY4PR01MB142826AEB522E9717D6B1E59B82C3A@TY4PR01MB14282.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY4PR01MB142826AEB522E9717D6B1E59B82C3A@TY4PR01MB14282.jpnprd01.prod.outlook.com>

> > But, there is a more interesting question about this patchset (that actually stopped me from
> > submitting
> > it when it was originally developed).
> >
> > What do people thing about the entire approach used to detect streams to offload?
> >
> > The situation is:
> > - hardware is capable of doing L3 routing, with some (limited) packet update capabilities - rewrite
> > DST
> > MAC, decrease TTL,
> > - there is interest to use that, because software L3 routing even at 1Gbps consumes significant CPU
> > load, and for 5Gbps will likely not keep the speed at all (we did not have hw to try),
> > - but - given the capabilities of hw are incomparably weaker than capabilities of linux networking,
> > which approach to take to detect streams for offloading?
> >
> > Second question - how exactly to get the routing decision from the kernel stack, to apply it in
> > hardware? I was not able to find any existing implementations of something similar...

You should probably look at how the mellanox switch does this. It is
kind of the reference implementation. The sparx5 and prestera might
have something, i don't remember their capabilities.

Some of the mediatek devices also do interesting things with flows,
but that is more for NAT, not necessarily L3 routing.

	Andrew


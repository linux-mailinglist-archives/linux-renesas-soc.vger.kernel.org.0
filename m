Return-Path: <linux-renesas-soc+bounces-9259-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C599C98B9FF
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Oct 2024 12:44:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 824BA1F21135
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Oct 2024 10:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34F191A0B10;
	Tue,  1 Oct 2024 10:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eaQU8Ojj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083C81A08BD;
	Tue,  1 Oct 2024 10:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727779460; cv=none; b=qVfImCtTO4PtSQf3kFz1E+eEnawtCAP0HIC2UWspmtbvsH6vKw2AL2VhqH/cDwknNOYlG18E+usiJPUq7xtkLQUnwxcI/MFR38WsX+WxbmL8fb1Fv5Rp0Gb3RukH1SYC7u/t4XTRsoYeWl4qya6NvMlA2JMxpGSgjyJjYIfzK8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727779460; c=relaxed/simple;
	bh=zUac4mTgYFe3J5I3U1RWEIeyQbCbgvdJW4ANE4PRK1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dBu4EB+oVwpN1kQrGxkVK/EJLhYQEswcdOgh+v9cHvtk29roCPT3CnFLnP+txlpZbhhTHgfpXlmAfWIETyWzFFL3sZGZI7MyDr9yq8EWmmV7rKg/l36tR9smpAM/I1Dvo4+B/iuxmU4j0SJo78cLR0+8voQCrbHr/ZgjZfdQnFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eaQU8Ojj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14021C4CECD;
	Tue,  1 Oct 2024 10:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727779458;
	bh=zUac4mTgYFe3J5I3U1RWEIeyQbCbgvdJW4ANE4PRK1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eaQU8OjjO0Ek9h0TsrwR8J3iIfnEjEhCu68BvQ+7JYzs8YseuvHV52Zm1qHAQ7QYh
	 9HaYBqYNKq+lN63WNylyJLqAzEuT67WrC841H4Hxs6t7hjkRYadBrB3WEb5wPmzEYd
	 Qh5N5ba91DsEd2vkitpEKMZXtoAbQf3SIHNDjnxPtM0Zin0bwma6bN2yj8rAfq9puF
	 Tju9YKT0hMko5YV3nyUynIwGIUrffvNtTMJWJQGd/9E9oSLaQrkD2imfpiSeetW5SY
	 YQ5+gZDVETB0ERnlxYUnO6KdoHWf7tWnC1xbD1cE0CHhBz9Trnmn34sptfHikQ+Kg2
	 CnaUgZQgqUBvA==
Date: Tue, 1 Oct 2024 11:44:13 +0100
From: Simon Horman <horms@kernel.org>
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: Paul Barker <paul@pbarker.dev>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [net-next PATCH 11/11] net: ravb: Add VLAN checksum support
Message-ID: <20241001104413.GK1310185@kernel.org>
References: <20240930160845.8520-1-paul@pbarker.dev>
 <20240930160845.8520-12-paul@pbarker.dev>
 <ab7482f9-6833-416f-8adf-5e1347628dec@omp.ru>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab7482f9-6833-416f-8adf-5e1347628dec@omp.ru>

On Mon, Sep 30, 2024 at 11:36:40PM +0300, Sergey Shtylyov wrote:
> On 9/30/24 19:08, Paul Barker wrote:
> 
> > From: Paul Barker <paul.barker.ct@bp.renesas.com>
> > 
> > The GbEth IP supports offloading checksum calculation for VLAN-tagged
> > packets, provided that the EtherType is 0x8100 and only one VLAN tag is
> > present.
> > 
> > Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
> [...]
> 
> > diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> > index 832132d44fb4..eb7499d42a9b 100644
> > --- a/drivers/net/ethernet/renesas/ravb_main.c
> > +++ b/drivers/net/ethernet/renesas/ravb_main.c
> > @@ -2063,11 +2063,30 @@ static void ravb_tx_timeout_work(struct work_struct *work)
> >  
> >  static bool ravb_can_tx_csum_gbeth(struct sk_buff *skb)
> >  {
> > -	/* TODO: Need to add support for VLAN tag 802.1Q */
> > -	if (skb_vlan_tag_present(skb))
> > +	u16 net_protocol = ntohs(skb->protocol);
> > +
> > +	/* GbEth IP can calculate the checksum if:
> > +	 * - there are zero or one VLAN headers with TPID=0x8100
> > +	 * - the network protocol is IPv4 or IPv6
> > +	 * - the transport protocol is TCP, UDP or ICMP
> > +	 * - the packet is not fragmented
> > +	 */
> > +
> > +	if (skb_vlan_tag_present(skb) &&
> > +	    (skb->vlan_proto != ETH_P_8021Q || net_protocol == ETH_P_8021Q))
> 
>    Not sure I understand this check... Maybe s/==/!=/?

A minor nit if the check stays in some form:
vlan_proto is big endian, while ETH_P_8021Q is host byte order.

> 
> >  		return false;
> >  
> > -	switch (ntohs(skb->protocol)) {
> > +	if (net_protocol == ETH_P_8021Q) {
> > +		struct vlan_hdr vhdr, *vh;
> > +
> > +		vh = skb_header_pointer(skb, ETH_HLEN, sizeof(vhdr), &vhdr);
> 
>    Hm, I thought the VLAN header starts at ETH_HLEN - 2, not at ETH_HLEN...
> 
> [...]
> 
> MBR, Sergey
> 
> 


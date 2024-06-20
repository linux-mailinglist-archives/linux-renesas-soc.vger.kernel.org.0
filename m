Return-Path: <linux-renesas-soc+bounces-6560-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 817419109BD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 17:24:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EF3E2835E1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 15:24:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9BEF1B1406;
	Thu, 20 Jun 2024 15:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U5G0PAPT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E1D1B0109
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Jun 2024 15:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718896990; cv=none; b=Zd+zQRKDicvCwu1YpF1timdLqlcWsp8mAB9gwaOGuMus5abTo8Wn8DVrmNBKz5zHLs7IhmOHXm5y2/9QM8Y/BCH1bppNdXfu7OqfJ6AIObDl/CwBZks59RvmR/+YFTZnXo6g57J1ECJdmBs+sTC0xAR6qNIOlIugMt6uOVqSNTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718896990; c=relaxed/simple;
	bh=m3jVM7bpUoeE5+49dp7A4ZjgZwmHV6SRQMJ7iXtVHb8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MVIebHMKqF9MNFn7krY0KE83fL8/rbv3/oP5JK6xQThabO0OU8SIOj5N8mRLuanH6yws1OFYKSzNb49rVG6F/bYNo42fruUAtGyCvyX5pILVFMYv1B1bZV2slHQnIkSqzCQuzP5c4cvb7d8MGSaDxDhhNnR+X31JSJkKuN2oIgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U5G0PAPT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718896987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UzeNngK957g2WcRSeg/oMGQjkGqxAJG/+Y13WqhKcnI=;
	b=U5G0PAPTLT31Z2iNOfh8s//9zI/6/C9dMZnPIkoGfaXFfb4N9hzBy6olhNKiFmaqBUaL3p
	C1K4QBDQ9+3lbQYPTrYxDX3rJfSf18BPPWiGoNCNPN166vFzc88+nzzD4kn+3kqkJyvaR1
	vANu5q/2CgYgG4DB97XFedTAV2xajWc=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-kE3zBsNrO6uEy8qqtqsRAQ-1; Thu, 20 Jun 2024 11:23:06 -0400
X-MC-Unique: kE3zBsNrO6uEy8qqtqsRAQ-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2ebe9456e2dso1411381fa.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Jun 2024 08:23:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718896983; x=1719501783;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UzeNngK957g2WcRSeg/oMGQjkGqxAJG/+Y13WqhKcnI=;
        b=o17DSDk4qoLe06qbAGWbG7vYj5t8TUNgqyB0t7NEyH7c+eGAzEV18+nBFxsokH1LT2
         h2fgWkZE5rQDBIjkDDiN9K1YvP53SNP/cj7fWWz6F9x0bV230ZVE9xGN15IAPFSUItnB
         rhcryRMDKmGWhvbKulbPmGm4sXUh+iXg27+yeG89zT3YNszyKMjqFAwRFlB8Qfb82QKW
         XNe0l3nqdj8/a8y6o05JraDyim0y3d9UhIdrxE+I+yBOa5hLPt/69mu/7SDLcbq2stpD
         NHfnYyC7af4JgiXhNc6V/EOFJ6Naym/h5tB7deSr+ZA0NSU8PXKinXh0gQzDVbLTIv2K
         n07Q==
X-Forwarded-Encrypted: i=1; AJvYcCXMGvNz9J2VGwR+L9vi92g2Rg5PtrDOeOi+lAdYBWHJBIDh9rXMG6jNAF+UQIlyi7k99jJhEWbvuJ8vTjzkZDwAvnwwzHj+SEeDB5awLRp5bJ4=
X-Gm-Message-State: AOJu0YyDgGjyYE0skK+c4F/UjZx2OroSkNCAc4I6Nta7lfuMKo9G+Q3y
	T06LG1WdMlX7dE1AL9MGoCZ5NndTfI/WBjyhGcRcmAzGRQ487DZ+zb5jAvIEJ+rFUpsouwsxchU
	GWP03rDCAuTdQ5tDe0U2jrMIxC4JlDyEv1Ax4QgvIa5EC0D241JYcmzqb20whbR80n71/
X-Received: by 2002:a2e:9b57:0:b0:2ec:40d1:fb4 with SMTP id 38308e7fff4ca-2ec40d11208mr22497961fa.1.1718896983673;
        Thu, 20 Jun 2024 08:23:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCBG8fL9fZVdrMdacTdFV33H27Cm4uEe4wbLxHle4yNnqwc3reIYOZxHWesPF1+HGpzMeuaQ==
X-Received: by 2002:a2e:9b57:0:b0:2ec:40d1:fb4 with SMTP id 38308e7fff4ca-2ec40d11208mr22497821fa.1.1718896983264;
        Thu, 20 Jun 2024 08:23:03 -0700 (PDT)
Received: from gerbillo.redhat.com ([2a0d:3341:b0b7:b110::f71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d21264fsm29910285e9.44.2024.06.20.08.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 08:23:02 -0700 (PDT)
Message-ID: <4bc6795cb1b731f47d2c0b3f06f106f59abf0637.camel@redhat.com>
Subject: Re: [net-next,v9] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
From: Paolo Abeni <pabeni@redhat.com>
To: Niklas =?ISO-8859-1?Q?S=F6derlund?=
	 <niklas.soderlund+renesas@ragnatech.se>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, "David S. Miller"
	 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	 <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Date: Thu, 20 Jun 2024 17:23:01 +0200
In-Reply-To: <20240620115051.GW382677@ragnatech.se>
References: <20240618090824.553018-1-niklas.soderlund+renesas@ragnatech.se>
	 <716088809af5c646b3f1342656dbb08969becaaa.camel@redhat.com>
	 <20240620115051.GW382677@ragnatech.se>
Autocrypt: addr=pabeni@redhat.com; prefer-encrypt=mutual; keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2024-06-20 at 13:50 +0200, Niklas S=C3=B6derlund wrote:
> Hello Paolo,
>=20
> Thanks for your feedback.
>=20
> On 2024-06-20 13:13:21 +0200, Paolo Abeni wrote:
> > On Tue, 2024-06-18 at 11:08 +0200, Niklas S=C3=B6derlund wrote:
> > > Add initial support for Renesas Ethernet-TSN End-station device of R-=
Car
> > > V4H. The Ethernet End-station can connect to an Ethernet network usin=
g a
> > > 10 Mbps, 100 Mbps, or 1 Gbps full-duplex link via MII/GMII/RMII/RGMII=
.
> > > Depending on the connected PHY.
> > >=20
> > > The driver supports Rx checksum and offload and hardware timestamps.
> > >=20
> > > While full power management and suspend/resume is not yet supported t=
he
> > > driver enables runtime PM in order to enable the module clock. While
> > > explicit clock management using clk_enable() would suffice for the
> > > supported SoC, the module could be reused on SoCs where the module is
> > > part of a power domain.
> > >=20
> > > Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnat=
ech.se>
> >=20
> > I'm sorry for giving such fundamental feedback this late, but I think
> > this should be split in series to simplify the review process.
> >=20
> > You could e.g. introduce the defines and probe in patch 1, the rx path
> > in patch 2, and the tx path in patch 3.
>=20
> I have been given the opposite advice in the past, to add a basic driver=
=20
> in one single commit. All be it this was in other subsystems. This=20
> already have been thru a lot of review, do you feel strongly about this=
=20
> or can I note it down for how netdev prefers work do be done in future?

I understand your pain with such change. Hopefully this will not need
many more revisions, so I guess you can keep a single patch.

WRT to the previous advice, I guess the controversial word is 'basic':
this patch is ~2k LoC, considerably more then a comfortable (to me)
size.

> >=20
> > > +	/* Refill the RX ring buffers */
> > > +	for (; priv->cur_rx - priv->dirty_rx > 0; priv->dirty_rx++) {
> > > +		const unsigned int entry =3D priv->dirty_rx % priv->num_rx_ring;
> > > +		struct rtsn_ext_ts_desc *desc =3D &priv->rx_ring[entry];
> > > +		struct sk_buff *skb;
> > > +		dma_addr_t dma_addr;
> > > +
> > > +		desc->info_ds =3D cpu_to_le16(PKT_BUF_SZ);
> > > +
> > > +		if (!priv->rx_skb[entry]) {
> > > +			skb =3D napi_alloc_skb(&priv->napi,
> > > +					     PKT_BUF_SZ + RTSN_ALIGN - 1);
> >=20
> > skb allocation is preferred at receive time, so that the sk_buff itself
> > is hot in the cache. Adapting to such style would likely require a
> > larger refactor, so feel free to avoid it.
>=20
> This is good feedback. There are advanced features in TSN that I would=
=20
> like to work on in the future. One of them is to improve the Rx path to=
=20
> support split descriptors allowing for larger MTU. That too would=20
> require invasive changes in this code. I will make a note of it and try=
=20
> to do both.

In the context of a largish refactor, then I suggest additional
investigating replacing napi_gro_receive() with napi_gro_frags().

The latter should provide the best performances for GRO-ed traffic.

Cheers,

Paolo



Return-Path: <linux-renesas-soc+bounces-2242-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F92784627D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Feb 2024 22:14:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 444311C20F0A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Feb 2024 21:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5937039AE1;
	Thu,  1 Feb 2024 21:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zs9qgkCR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEEC7472;
	Thu,  1 Feb 2024 21:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706822049; cv=none; b=YvmMCZzqZmsBuevtFoquPNGRAQuP3gblS09hyz/YqfmeqBRwu+wVhJp/0UXtW9UH45b22ipnll+IXA+bYjKYulAJyhO03emwQze4Qw4c75bEOqlXdolHsqp5ejoqfKF05mIa9f67zd7yeTS8xQ6DZFN5a/PxlHCu4C7wZfSD15o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706822049; c=relaxed/simple;
	bh=YFgnfBLucu85ptKP2p7HpNLLQpCoH2a8SI4kbIvbpRk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qS5EUPdbT02LF5UnheIWubMtGhg5uUQ/ldpBq/Xtf8d2c+VVfr7PJqqE0kgv2HP30e4pDkWTXMLJAOLPqsY2OC8vDem9GeyT+CN4EpB9VZ9QXE7reXWPs2XyO92MnP6LWpQ+xawbp6ztHbUEFgH+VDk+GEyjOflKwKvQS0FGu0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zs9qgkCR; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-55fc9a581f8so1107061a12.2;
        Thu, 01 Feb 2024 13:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706822045; x=1707426845; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftVgWUeYL2XoK4+UC76bqY+RetEWYpldhnbErfDuhfw=;
        b=Zs9qgkCRcZv3ZSNY7yrIM3Fnsolfy/HgeiZKH+QWPsJo03hIRFJz+qM9Sobyi4K951
         2bz4XZ9pOy6ZkCHMXU1u+rVmbJulSB5tMjRXVhKN7mV6M/Airs2mvaZRGoJkmBBf9kbE
         KYLbZDHCXo+itWUeitznos9/VPzV7UR7KAkVQdL6U2ODULlIaE2SmB4+vfa02/J1qXTE
         pnsbaIONnEiqLFipEJqrvjgKmJwniuhRjgC8IEdbGBwzSVw8wtHy7AcQ2SipcB3Xrdjf
         9BZc3xT7rJ5NZul2rD8/k8Gn1tUBg0GiiuRw27AnkOxPLHG5xDs9OwzWMFu/k/REp9hI
         MUvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706822045; x=1707426845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ftVgWUeYL2XoK4+UC76bqY+RetEWYpldhnbErfDuhfw=;
        b=pBDqHvKAnQ6IfZWMas33ySOoZ9+u3NKM8Nn5VTHtORtGgqNWbAZ4PCuex1ypDNca1W
         A1+Sct2tqZHauoTrOEDAh6EZl4VGuPHGEtcrLLf7MOeN7H4gf9DOJfvtN1ySNftxTRg4
         LVKVoxWREepiaARDZhlJo2BuMLHAt/PLvH8UTREeHn3qp+BSKiORYLGKZIBTVbSIyUYl
         BPZUqs7AN1PW/i+xkMRmDtCIEkkGIDRZIuPerkeEszthvav5jMP13x7gGmjqpbDyUkb8
         SkGkaQDle2XHEoVRUbMMuW8g/USw1H+jnNpR7jq8o86A1VMBnjgrZO2qANIxFEhxb3Oy
         8igg==
X-Gm-Message-State: AOJu0YxRHJ8ufoffaktgXl/JCEDLKVEzg4PPlNxNA+qFqmgfUImZ0z9g
	qjGn9Myly9/QFBNsB+tKuhw3WXjMiLVgw1o/ZmK8E1WR0v27qElQIkzWBo1M213Hrrdv5Q18SAr
	3+piCHSznbOuY0DY5Qom8nSFvHek=
X-Google-Smtp-Source: AGHT+IFUb9VpSM3tlJelkffQ1mXaVP5k5IDoF1WvoVK3mShxW7a5CP04A811/hfKTaMGDbgzbSWJrJJaWp8Ftah8PI8=
X-Received: by 2002:aa7:d615:0:b0:55f:cab9:5f9c with SMTP id
 c21-20020aa7d615000000b0055fcab95f9cmr18020edr.0.1706822045281; Thu, 01 Feb
 2024 13:14:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240201194521.139472-1-biju.das.jz@bp.renesas.com>
 <20240201194521.139472-3-biju.das.jz@bp.renesas.com> <d3a6657d-0a67-a826-24b1-17ec8f43ee81@omp.ru>
In-Reply-To: <d3a6657d-0a67-a826-24b1-17ec8f43ee81@omp.ru>
From: Biju Das <biju.das.au@gmail.com>
Date: Thu, 1 Feb 2024 21:13:54 +0000
Message-ID: <CADT+UeAeT0dC2AV1RP8H10V7LY2WLeET=6C-U_cXEDW95eYgYg@mail.gmail.com>
Subject: Re: [PATCH v3 net-next 2/2] ravb: Add Tx checksum offload support for GbEth
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>, netdev@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sergey,

On Thu, Feb 1, 2024 at 8:56=E2=80=AFPM Sergey Shtylyov <s.shtylyov@omp.ru> =
wrote:
>
> On 2/1/24 10:45 PM, Biju Das wrote:
>
> > TOE has hardware support for calculating IP header and TCP/UDP/ICMP
> > checksum for both IPv4 and IPv6.
> >
> > Add Tx checksum offload supported by TOE for IPv4 and TCP/UDP.
> >
> > For Tx, the result of checksum calculation is set to the checksum field=
 of
> > each IPv4 Header/TCP/UDP/ICMP of ethernet frames. For the unsupported
> > frames, those fields are not changed. If a transmission frame is an UDP=
v4
> > frame and its checksum value in the UDP header field is 0x0000, TOE doe=
s
> > not calculate checksum for UDP part of this frame as it is optional
> > function as per standards.
> >
> > We can test this functionality by the below commands
> >
> > ethtool -K eth0 tx on --> to turn on Tx checksum offload
> > ethtool -K eth0 tx off --> to turn off Tx checksum offload
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v2->v3:
> >  * Updated commit header and description as suggested by Sergey.
> >  * Replaced NETIF_F_IP_CSUM->NETIF_F_HW_CSUM as we are supporting only =
IPv4.
>
>    You do vice versa, NETIF_F_HW_CSUM->NETIF_F_IP_CSUM. :-)
>    However, I'm now seeing this comment under CHECKSM_PATIAL:
>
>  *   %NETIF_F_IP_CSUM and %NETIF_F_IPV6_CSUM are being deprecated in favo=
r of
>  *   %NETIF_F_HW_CSUM. New devices should use %NETIF_F_HW_CSUM to indicat=
e
>  *   checksum offload capability.
>
>    So probably we should've kept NETIF_F_HW_CSUM? :-/

Ok, Will do in the next version.
>
> >  * Updated the comment related to UDP header field.
> >  * Renamed ravb_is_tx_checksum_offload_gbeth_possible()->ravb_is_tx_csu=
m_gbeth().
> > v1->v2:
> >  * No change.
> [...]
>
> > diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/eth=
ernet/renesas/ravb_main.c
> > index c4dc6ec54287..042dc565d1a5 100644
> > --- a/drivers/net/ethernet/renesas/ravb_main.c
> > +++ b/drivers/net/ethernet/renesas/ravb_main.c
> [...]
> > @@ -524,15 +525,27 @@ static int ravb_ring_init(struct net_device *ndev=
, int q)
> >
> >  static void ravb_csum_init_gbeth(struct net_device *ndev)
> >  {
> > -     if (!(ndev->features & NETIF_F_RXCSUM))
> > +     bool tx_enable =3D ndev->features & NETIF_F_IP_CSUM;
> > +     bool rx_enable =3D ndev->features & NETIF_F_RXCSUM;
> > +
> > +     if (!(tx_enable || rx_enable))
> >               goto done;
> >
> >       ravb_write(ndev, 0, CSR0);
> > -     if (ravb_wait(ndev, CSR0, CSR0_RPE, 0)) {
> > +     if (ravb_wait(ndev, CSR0, CSR0_TPE | CSR0_RPE, 0)) {
> >               netdev_err(ndev, "Timeout enabling hardware checksum\n");
> > -             ndev->features &=3D ~NETIF_F_RXCSUM;
> > +
> > +             if (tx_enable)
> > +                     ndev->features &=3D ~NETIF_F_IP_CSUM;
> > +
> > +             if (rx_enable)
> > +                     ndev->features &=3D ~NETIF_F_RXCSUM;
> >       } else {
> > -             ravb_write(ndev, CSR2_ALL, CSR2);
> > +             if (tx_enable)
> > +                     ravb_write(ndev, CSR1_ALL, CSR1);
> > +
> > +             if (rx_enable)
> > +                     ravb_write(ndev, CSR2_ALL, CSR2);
> >       }
> >
> >  done:
> > @@ -1986,6 +1999,35 @@ static void ravb_tx_timeout_work(struct work_str=
uct *work)
> >       rtnl_unlock();
> >  }
> >
> > +static bool ravb_is_tx_csum_gbeth(struct sk_buff *skb)
>
>    Hm, this new name doesn't parse well for me... :-(
>    Maybe ravb_can_tx_csum_gbeth() or ravb_tx_csum_possible_gbeth()?

OK, ravb_can_tx_csum_gbeth() as it is shorter.

>
> > +{
> > +     struct iphdr *ip =3D ip_hdr(skb);
> > +
> > +     /* TODO: Need to add support for VLAN tag 802.1Q */
> > +     if (skb_vlan_tag_present(skb))
> > +             return false;
> > +
> > +     switch (ip->protocol) {
> > +     case IPPROTO_TCP:
> > +             break;
> > +     case IPPROTO_UDP:
> > +             /* If the checksum value in the UDP header field is 0, TO=
E does
> > +              * not calculate checksum for UDP part of this frame as i=
t is
> > +              * optional function as per standards.
> > +              */
> > +             if (udp_hdr(skb)->check =3D=3D 0)
> > +                     return false;
> > +             break;
> > +     /* TODO: Need to add HW checksum for ICMP */
>
>    s/HW/hardware/?

OK.
>
> > +     case IPPROTO_ICMP:
> > +             fallthrough;
>
>    You don't even need fallthrough, actually...

Clang Compiler will complain.

[1] https://patchwork.kernel.org/project/xfs/patch/20210420230652.GA70650@e=
mbeddedor/#24129659

https://patches.linaro.org/project/netdev/patch/20210305094850.GA141221@emb=
eddedor/#617482

>    But why do you return false for ICMP? Isn't it supported by TOE?

It is supported by the hardware, but not the network subsystem.

Cheers,
Biju


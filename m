Return-Path: <linux-renesas-soc+bounces-9045-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1FF98607F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Sep 2024 16:24:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1EF1B1F2602F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Sep 2024 14:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DBCD187550;
	Wed, 25 Sep 2024 13:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JzbbvifS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972A643AA4;
	Wed, 25 Sep 2024 13:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727269466; cv=none; b=g0fwP/PTN7/cifWb/f4Z1zNO0BuUX02iVepTzsKn7RNTSM7BWiYM0G3PAVa9DWdBdQzm2aj2BYvE8T//y6AcCfYT8OZ5O6qTAaU2yXxoQy4oc902IQcqqj/W+Htgt9LW+cits+bDreq/Vpv/Gmz7uABvgDTm9PcYGl1bb0b8Lx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727269466; c=relaxed/simple;
	bh=EchhUKDCT0c9jPflNJ3DvHngI4+2g3zFk93f1tD6GN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E9I5lgTw98qSfW08zavbjN7i9TOr0toMlitpWsi/cimGRfxf0vq7/REbG1fiiomeKz9fyMQ5Mz5UdkebpH4pYPsVjcxNUabOBb6abvg8xsMcn+VZRNmDrhYNlb2ozEHhpg5edsOX+7ZKfOXLKZe2pfTE/+gC0TjSCH7/WcAamgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JzbbvifS; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-374c180d123so3994557f8f.3;
        Wed, 25 Sep 2024 06:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727269463; x=1727874263; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DBu5XUnhJNdOeappOvbSgH7IVH7jDxNvY4SRG1JHBCk=;
        b=JzbbvifSIIiR3w1ZfJoUerM4f8ySQjGJBuK6WpAPrSBxKJFoGu8GWlK5erG5qkSFM8
         sGDvE+gb923Nl28tqd/errznjrT4uO/4FvhAUqhHA5lKVnRIpBsGXm1zQTx5nax1Xt+t
         qHePec8MTPMp/qF5hWh49DxyXeS0ZSuoQLA8KdbdSIR+zrz7gy7PR+DjWa4TauQaO7O8
         WAGOIsfteHnjf3+1y3Fzb0buZl/paxzbt3AryBh+aaBMNAEqdDdSpogt3a9mz/GyI8tf
         CCeyRjHgWPDk4FHh4Eam8XNA2WeSKwVW/QFtwPmSEZbbYDCxBAl/lRsOixRKvNJFg/sD
         dNtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727269463; x=1727874263;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DBu5XUnhJNdOeappOvbSgH7IVH7jDxNvY4SRG1JHBCk=;
        b=mGOwWVErSh/rRFARm+d3xj8z8ceamLMk2Dj7A9Z004VJGcw70uT1lNYyWLllOAtqYT
         WHRSxry0nQnMPv+YFcsj9mwIe6ylsEITAPAlQ0xxon2Wdb6DXcFXp2rbIEErvuTvqkeL
         F5Up/464T/3bIF+oHKNDjJh4gIvtrsQAAwk2SgnHpM7IGIVINs2oxciLJvo6/ViPV+d/
         u0/74tUGHFPl7m/W315SzJkw5gmXvxOpgao/oHYQ/I85XTsJuTFuOmpgcpP7wj/Dpeat
         IjSKkcBrBec27QZ+kFHtUpSn1xbWUw6h85pJmetKomMWIB/w9TtQ/NmaHxiapfoyZ4f6
         P9fw==
X-Forwarded-Encrypted: i=1; AJvYcCWn47oJ2d6If+sq8CbYSZtOowTjdIqTIu0rL8BrZYmrNDXnIYsm27Tanf6b0T2kvgQriYXmr/h8qVcJcCbHbSDXOQ==@vger.kernel.org, AJvYcCXfKR29vHodV9LzhS/pgktri1tcYX9meaQm2IUBhqoPdlXKBDouD89GPHDjXgTCJw/GzXWWhT5x@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb6rRmYPqzxf5RitBlaDs5BL4JPpGr/Bm/Q5L7UiWrM4KL0+2t
	cW9/eu+Ccn2kH2zOV/AvH9RSgBZpcxRklZQkAh+SdU65xMlSVB1z
X-Google-Smtp-Source: AGHT+IFwKMc+tAQezLhJNXzzXloJLI9dfhwj83QKjLHjVCF/RnFrIRbTT01y2K0W5H7ly+6gOUk6Ig==
X-Received: by 2002:a5d:5587:0:b0:377:2df4:55f6 with SMTP id ffacd0b85a97d-37cc2468768mr1755328f8f.17.1727269462406;
        Wed, 25 Sep 2024 06:04:22 -0700 (PDT)
Received: from eichest-laptop ([2a02:168:af72:0:bfae:1f4d:37af:7b02])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cbc318803sm3924142f8f.94.2024.09.25.06.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 06:04:21 -0700 (PDT)
Date: Wed, 25 Sep 2024 15:04:19 +0200
From: Stefan Eichenberger <eichest@gmail.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Dimitri Fedrau <dima.fedrau@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next 3/3] net: phy: marvell-88q2xxx: Enable auto
 negotiation for mv88q2110
Message-ID: <ZvQKU02iGgcq5Mzp@eichest-laptop>
References: <20240906133951.3433788-1-niklas.soderlund+renesas@ragnatech.se>
 <20240906133951.3433788-4-niklas.soderlund+renesas@ragnatech.se>
 <70b86181-7bcf-42d7-b5a8-d26ac0c4c573@lunn.ch>
 <ZuWW4UOtOGI_KmSg@eichest-laptop>
 <20240914142136.GC64607@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240914142136.GC64607@ragnatech.se>

Hi Niklas,

On Sat, Sep 14, 2024 at 04:21:36PM +0200, Niklas Söderlund wrote:
> Hello,
> 
> On 2024-09-14 16:00:01 +0200, Stefan Eichenberger wrote:
> > Hi Niklas and Andrew,
> > 
> > I was able to do a first basic test on my setup. I'm using the MV88Q2110
> > and connecting it to a Göpel media converter that I use as a reference.
> 
> Thanks for testing this work.
> 
> > However, with your patch applied, I can't get a link. When I set a fixed
> > link speed of 1GBit/s and the media converter is configured as the
> > master, I can normally do: 
> > ethtool -s end1 speed 1000 master-slave forced-slave
> > After that, the link came up. However, with the changes made, I can't do
> > this anymore. Can you reproduce this in your setup?
> 
> Without this patch I can't bring up a 1GBit/s link at all, I can only 
> setup a 100 MBit/s link with,
> 
>     ethtool -s eth1 speed 100 master-slave forced-slave
> 
> If I do the same with speed set to a 1000 I never get a link. That's why 
> autoneg is a such a boon for me, as with that I do get a 1 Gbit/s link.
> 
> As you have the MV88Q2110 datasheets, can you check the register writes 
> in mv88q2110_init_seq0 and mv88q2110_init_seq1 for sanity? Maybe 
> something is not quiet right there, I have only been able to reveres 
> engineer support for autoneg so it's quiet likely.

Unfortunately this registers are not documented in the datasheet.
However, from the software initialization guide the following values
would be correct for A1 and A2 devices (A0 does not need one write):
static const struct mmd_val mv88q2110_init_seq1[] = {
	{ MDIO_MMD_PCS, 0xffde, 0x402f },
	{ MDIO_MMD_PCS, 0xfe2a, 0x3c3d},
	{ MDIO_MMD_PCS, 0xfe34, 0x4040 },
	{ MDIO_MMD_PCS, 0xfe4b, 0x9337},
	{ MDIO_MMD_PCS, 0xfe2a, 0x3c1d },
	{ MDIO_MMD_PCS, 0xfe34, 0x0040 },
	{ MDIO_MMD_AN, 0x8032, 0x0064 },
	{ MDIO_MMD_AN, 0x8031, 0x0a01 },
	{ MDIO_MMD_AN, 0x8031, 0x0c01 },
	{ MDIO_MMD_PCS, 0xFE0F, 0x0000 },
	{ MDIO_MMD_PCS, 0x800C, 0x0000 },
	{ MDIO_MMD_PCS, 0x801D, 0x0800 },
	{ MDIO_MMD_PCS, 0xfc00, 0x01c0 },
	{ MDIO_MMD_PCS, 0xfc17, 0x0425},
	{ MDIO_MMD_PCS, 0xfc94, 0x5470},
	{ MDIO_MMD_PCS, 0xfc95, 0x0055},
	{ MDIO_MMD_PCS, 0xfc19, 0x08d8},
	{ MDIO_MMD_PCS, 0xfc1a, 0x0110},
	{ MDIO_MMD_PCS, 0xfc1b, 0x0a10},
	{ MDIO_MMD_PCS, 0xfc3a, 0x2725},
	{ MDIO_MMD_PCS, 0xfc61, 0x2627},
	{ MDIO_MMD_PCS, 0xfc3b, 0x1612},
	{ MDIO_MMD_PCS, 0xfc62, 0x1c12},
	{ MDIO_MMD_PCS, 0xfc9d, 0x6367},
	{ MDIO_MMD_PCS, 0xfc9e, 0x8060},
	{ MDIO_MMD_PCS, 0xfc00, 0x01c8},
	{ MDIO_MMD_PCS, 0x8000, 0x0000},
	{ MDIO_MMD_PCS, 0x8016, 0x0011},
	{ MDIO_MMD_PCS, 0xfda3, 0x1800}, /* According to datahsheet not for Rev A0 */
	{ MDIO_MMD_PCS, 0xfe02, 0x00c0},
	{ MDIO_MMD_PCS, 0xffdb, 0x0010},
	{ MDIO_MMD_PCS, 0xfff3, 0x0020},
	{ MDIO_MMD_PCS, 0xfe40, 0x00a6},
	{ MDIO_MMD_PCS, 0xfe60, 0x0000},
	{ MDIO_MMD_PCS, 0xfe04, 0x0008},
	{ MDIO_MMD_PCS, 0xfe2a, 0x3c3d},
	{ MDIO_MMD_PCS, 0xfe4b, 0x9334},
	{ MDIO_MMD_PCS, 0xfc10, 0xf600},
	{ MDIO_MMD_PCS, 0xfc11, 0x073d},
	{ MDIO_MMD_PCS, 0xfc12, 0x000d},
	{ MDIO_MMD_PCS, 0xfc13, 0x0010},
};

On my side, your values and the ones above are working.

By the way, do you know why you only get between 800 and 850 Mbps? On my
setup I see up to 930 Mbps in bidir mode. Just asking because maybe this
is the reason why fixed speed doesn't work in your setup (would be weird
though)?

[ ID][Role] Interval           Transfer     Bitrate         Retr
[  5][TX-C]   0.00-10.01  sec  1.09 GBytes   935 Mbits/sec    0             sender
[  5][TX-C]   0.00-10.01  sec  1.09 GBytes   932 Mbits/sec                  receiver
[  7][RX-C]   0.00-10.01  sec  1.09 GBytes   933 Mbits/sec  154             sender
[  7][RX-C]   0.00-10.01  sec  1.08 GBytes   931 Mbits/sec                  receiver

Regards,
Stefan


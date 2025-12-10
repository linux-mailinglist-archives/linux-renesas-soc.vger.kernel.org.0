Return-Path: <linux-renesas-soc+bounces-25703-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 58113CB4077
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Dec 2025 22:10:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F5503044B8E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Dec 2025 21:10:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A176E2F90C4;
	Wed, 10 Dec 2025 21:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h/il+UyR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF152D73B8
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Dec 2025 21:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765401023; cv=none; b=C4g6GAedg18o/QzyF5ZeWGd/05rNb+7pqPOx30ZVCjy+SHvnDkUbKTi7u19gMNCG6cIj1cXq1CcIYYj2TA8eb8zsBxWIlmUsFdwJH7hBnCscNtD85DgnwONpLf37JOHsP5Fxp943N9cC95Ac2RctJpe+7OVdCmQMyig/Jrr4wZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765401023; c=relaxed/simple;
	bh=Uh+9H8bdDNwclyo234VBfjWf+hPZD/RjvnJ13fK+bUE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NA2DlteO+urG89FmWkU+ASlcDqikSO7cEHJr8+fjSdw216Q+ZeVeWycw+0YKPTDKzfODRS4N+P4AobtQpdq8X8mqe4C6U69pVUzLwI31B0ELLTOX2AwJ8/SEWxs9avMZszApUgqOi9FIx1vt9XGMaRfPjwS+ERaE27mLsRXWzRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h/il+UyR; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47774d3536dso2605085e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Dec 2025 13:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765401020; x=1766005820; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f6Ap2wL2QNWzNOuJh0hZXjD0O0VdpkojkcVs56Al8cw=;
        b=h/il+UyRcfUV5ophE7yr1bMcD8/fMeLheEypjbuvu7gg07nvOz18oRtr5oLVz5LIyH
         xUf21BFcctap5DVpMyUTbqXg8IKTvg45zLY1ajh6etNnEuom/Cx52lsTKw3LTj41JRMB
         foS0SH8GdRloYqhxhBULP2sGCsUU2nngKpmtzwl7C11IdHVzd6RWOt8wmFfvyjn5pZpj
         VIaB0tSnlnaKxfAc9hB7116T9zslVFg+lNl+TfIgyFnFTx12y6nF4wwZveALQl5HgPu8
         p7YgcSurCZH/C/4PrCxCf2AdPcs7FoXdfw7qRqe7G76B4qLIg/ayaXaSL5cYqrCXNCoG
         HcSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765401020; x=1766005820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f6Ap2wL2QNWzNOuJh0hZXjD0O0VdpkojkcVs56Al8cw=;
        b=p9Kb3yz+XnpvtGAX+UKRi8wwVLUjkrf9cDJMD+9Y744Rb+faXVBQaLdJ6vPQxdL4+o
         Ei/hlieAXIm/8IYb3Mo73A71t8KrFMo2RIO3FnNZ05G4qkXvGpnwDTBNspgcDKpHE+pn
         INPtGTWBzQvvEIxN/iTaEuxE3qomcAt5aapQCFhbgVvP8tmalfNE5QZPznGaEnyCaoJb
         4i9mlvqh+6ESkMPFNiuxKnCheMAtIDc4YcRVzaAGb4fZH3ZIjFFrjmqDrTSwSUcAq0qz
         6Wj7DN4ArlHiNJf5vnSKm04e7s8kNSpmVHHFLG8A3fsnoSUOWESiIjJKkB4LQVvZFex2
         rYfg==
X-Forwarded-Encrypted: i=1; AJvYcCWCEx7bLdjFbAZbGAqhiE5H43Br5gg6O/imD18p8hb6f09DP0SuEly1l1jaPM4cKhPTAhM4kdJcYKR898gXn4jkog==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTV8CbP1v3REyRYUJhwIMekBxtk6ryKUmNENZYGUYcCtF1ZyMu
	1MeEwcAuEClFG2QcX6Tm/50+C/8Ix4m5WGTGtGjzegLSrye0hzpUL8wawlkUEBiExiot7eFGOje
	TVMRTdvkZYHAnoAq61Y/1CSE3FJlfu5E=
X-Gm-Gg: ASbGncu78DVRVbNyuSzhiG5DXjANNhB702bS49zq1dUMqjajZfxmNz3Xvugnuad0kUu
	4DF13Cr8erqMmJJTpC9o6FRIH18XvJAAdgo+usqhvefZBFcYyYjUOyAnHRvnD+mh+bizuquwHTo
	6uKQpt7zthsioilrQrqi1vLzhJPmaew3Q8xpjD3uDJ575F9uSMHTOIo9Ft2clIgmJ9IkMAzDyGz
	1RsH8D9msqJcSjXJ8uQN+a+eZq2gz9JqrzbXbJpQs3G0YALeC0qf2QH0UCep5oSqYfd4Cqr6Q==
X-Google-Smtp-Source: AGHT+IFQU1/Jhu22RnkhsOBefhQOpeX8PaoabdXqTjqdirBbdMixKWOg/r6NaWYfEBa73u04Avqi37Rvk+u2FM+qxao=
X-Received: by 2002:a05:600c:56c8:b0:477:9890:4528 with SMTP id
 5b1f17b1804b1-47a886a08e1mr5232305e9.2.1765401020116; Wed, 10 Dec 2025
 13:10:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251121113553.2955854-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251121113553.2955854-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251121210504.ljeejnltaawahqtv@skbuf> <CA+V-a8ve6vV_O1XwPX0sn+Qqm5QoYrf6Xu5gansxW05waMf43Q@mail.gmail.com>
 <20251209212841.upskgi5dphsmkrpi@skbuf>
In-Reply-To: <20251209212841.upskgi5dphsmkrpi@skbuf>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 10 Dec 2025 21:09:52 +0000
X-Gm-Features: AQt7F2o4iDtd3Rpuz4FTtk60m3_b-aAdWYBIboBEH1hguLv-mqZPIp_mG5EBJfA
Message-ID: <CA+V-a8vkzrO77UBeR+YhPwcv608Zh9n7CHL-ugcsuhk-vuRyMg@mail.gmail.com>
Subject: Re: [PATCH net-next 09/11] net: dsa: rzn1-a5psw: Add support for
 management port frame length adjustment
To: Vladimir Oltean <olteanv@gmail.com>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Simon Horman <horms@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vladimir,

On Tue, Dec 9, 2025 at 9:28=E2=80=AFPM Vladimir Oltean <olteanv@gmail.com> =
wrote:
>
> On Tue, Dec 09, 2025 at 04:02:19PM +0000, Lad, Prabhakar wrote:
> > > In the next change you set this to 40. What's the reason behind such =
a
> > > high value (need to set the management port A5PSW_FRM_LENGTH value to
> > > 1574 bytes to pass L2 payload of 1500 bytes)? It sounds like this nee=
ds
> > > to be called out more clearly for what it is - a hardware bug.
> > >
> > Regarding the question about the relatively large adjustment value:
> > according to the hardware manual,
> > =E2=80=9CSet the FRM_LENGTH register in port 3 (CPU port) to more than =
or
> > equal to the initial value. When you want to limit the frame length of
> > the received frame, use FRM_LENGTH registers in port 0 to port 2.=E2=80=
=9D
> >
> > In practice, with the default MTU (i.e. without applying the +40-byte
> > adjustment), RX traffic operates correctly. For example, running
> > iperf3 in reverse mode shows no issues, and frames are received
> > without errors. However, in the forward direction (TX from the CPU
> > port), throughput drops to zero and iperf3 fails.
> >
> > When the MTU of the CPU-facing interface is increased (e.g. ip link
> > set lan0 mtu 1540),
>
> "lan0" isn't a typical name for a CPU-facing interface. Do you mean that
> the primary action is that you increase the MTU of a user port, and the
> FRM_LENGTH of the CPU port is implicitly readjusted by the driver as
> well (to 1540 + ETH_HLEN + A5PSW_EXTRA_MTU_LEN + ETH_FCS_LEN)?
>
> This isn't actually bringing new data, because unless you also increase
> the MTU of the other iperf3 device to 1540, the TCP MSS will still be
> calculated as if the MTU were 1500, and you won't be making use of
> larger packet sizes on the wire. On the contrary, you are introducing
> one extra variable into the equation: with this test you are also
> increasing the stmmac MTU, which you later clarify that by itself it
> doesn't change the outcome.
>
> > TX traffic immediately starts working correctly.
> > Likewise, increasing the FRM_LENGTH on the switch side for the CPU
> > port resolves the problem, which indicates that the frame length
> > configuration on this port is directly involved.
>
> So increasing FRM_LENGTH is the only factor that alters the outcome.
>
> > Given this behaviour, it appears that the management (CPU) port
> > requires additional headroom to successfully transmit frames, even
> > though RX succeeds without it. The STMMAC driver is used as the
> > controller driver for the management port, we are trying to determine
> > whether there is any known interaction, alignment constraint, or
> > undocumented overhead that would explain the need for this extra
> > margin.
> >
> > Could you please advise on how to handle this issue?
>
> Have you verified that the value you need to add to FRM_LENGTH is linear
> for MTU values above 1500? I.e. that at MTU values of 1510, 1520, 1540,
> 2000, ..., you always need to add 40 additional octets to FRM_LENGTH on
> top of the ETH_HLEN + A5PSW_EXTRA_MTU_LEN + ETH_FCS_LEN extra that the
> driver is already adding, and no less?
>
> One other thing to look at is to send known-size Ethernet frames using
> mausezahn or ping over lan0, run ethtool -S on the eth0 stmmac interface
> (this will also capture the switch's CPU port statistics counters) and
> see by how many octets does the aOctetsReceivedOK counter increment for
> a known size packet. Then, if you go oversize, look at the statistics
> counters and see which counter marks the drop. Maybe this will provide
> any clue.
>
So I started off with ping and that worked i.e. without +40 to
FRM_LENGTH. So when I increased the size upto <=3D1440 ping worked OK.
Anything after 1441 ping failed I could see
p03_etherStatsOversizePkts/p03_ifInErrors incrementing.

              MTU Ifconfig
-----------------------------
ETH0 -  1508
LAN0 -  1500
LAN1 -  1500

After increasing the MTU size to 1501 of lan0 propagtes change to eth0
as seen below:
root@rzn2h-evk:~# ip link set lan0 mtu 1501

              MTU Ifconfig
-----------------------------
ETH0 -  1509
LAN0 -  1501
LAN1 -  1500

$ ping -I lan0 192.168.10.30 -c5 -s 1441 # Works
$ ping -I lan0 192.168.10.30 -c5 -s 1442 # Fails and
p03_etherStatsOversizePkts/p03_ifInErrors increments.

So +40 to FRM_LENGTH just made the iperf worked earlier as the length
of iperf packets is 1514.

I'm still looking into the switch on why it could be dropping the frames.

Cheers,
Prabhakar


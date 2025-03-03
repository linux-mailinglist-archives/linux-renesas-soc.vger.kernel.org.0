Return-Path: <linux-renesas-soc+bounces-13912-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D590A4C665
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Mar 2025 17:14:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F2097AA486
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Mar 2025 16:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD5BB22ACDF;
	Mon,  3 Mar 2025 16:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eU89vQG4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF376215F43;
	Mon,  3 Mar 2025 16:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741017925; cv=none; b=pr8gSBhDVD6iWo9EziAdKaBWBcN3hKJ9/4aHz/PtHhtvg5H2oieK7EXu72NorZZG+jMl+nNDR/nbeqLzEogi2G+A/AYrcAezFFcdZIzr6kubP3tkXbsN2icNgtlZ7MLhmo6UVI7GiDBiU0R4Mh3oU4AJYL+Mm1y5PopqS5hV3zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741017925; c=relaxed/simple;
	bh=o3Vom5u/1XsSjlLPauYQLijGjRjG8HyZS+I8BMFbW0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=deICV4f/JwHrJ5tzdp4NCYQDkqFRUXpkrmpk60cSvmpW2I0CLwMVOJ4FogyXvPnbBGwwHaRZYplMNOZjFiG6qWVKP+L4NS7Vz2sOy7uZIB35Mw0vXV0jPPylCQLd6YnMPMhxckkNeA74q9vN8gCX2MZu1X+22n3Im3H8fsqZYaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eU89vQG4; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-51f22008544so1845697e0c.1;
        Mon, 03 Mar 2025 08:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741017922; x=1741622722; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yg9dj5bG2dgxol7z28Zc4Vx4OJ7ZcMf3ke2e1RAfM+w=;
        b=eU89vQG436O2/oAxgdQR11ZCsTgEcDAhjQD1joUGFmyd2OgJxfW9kXbGiLgzbk8WZ+
         vSs0c/lZcHQmhvayfMrhye2xC2eO+d6GXqQ4WsY/EiJm1lORBKuuOkx48WMnbUEruaOw
         hF2VE0Vpy5Dsnht0FVbf8DlWJaSXz1UWQI15nVkvSEy0UmJnT3/TCmQN5AOhVqnVrUMG
         9e8PYAhb66IoN+KYsIU2inv28F73b+ryRbO0etRt2jL+MkZxs8cZZ67jNGCjAtpgPecD
         F6IR0lfFEzXgP6U2Nlp5A6NEmbk9+hBUFCzohZwIYGKvKB4R9eJq4eF9cu66Klr6VKVT
         niZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741017922; x=1741622722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yg9dj5bG2dgxol7z28Zc4Vx4OJ7ZcMf3ke2e1RAfM+w=;
        b=PDcTIjoCkC3PKCUw1DFYGuXX92FpBruodCbgWzrM9vseVVLW+KCqXuPWyswI09iZkc
         16LNRRLIxJZ7qLhhZ8toyBN+oHlr4KxJOyp2piP//AjujJH0ISwCO340v945QvsWtJOQ
         Ny8rtUBYm9jWCEanoNIxHum2p7Hlo0diAg98qvR89fBwrmlqUzy/yQi8sOJ5JsCILYz+
         tFFRwf7CCWyBaFq44jKqCx5MHdDjQpOayuEJwe+MZSammITtlZddQQIDiVjd2PePLTjH
         alTjkDILSFzE0wajtwgZ5rzDHpA9BchAbTxzy6k/mO4cOZCRsiySEaNJfMSS09WzyOgj
         XYcQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3ZMMNSwFkyOH+m3Frf2H7sF2b6SrvHqW0Lfa9cj3jgVyig3mcH6tcWZugluuytT26Pvq94b4WkDHk7TFA@vger.kernel.org, AJvYcCWFLjCZssiU+HgVnwqlOIe9cKCLUqmsQeAWvCqnLpDEHMcb2bYVd1MKXeRrGsAjzw5cB5O8gfWIw+bt@vger.kernel.org, AJvYcCXCT6KifkfIpTti96dDuYIYJZoKVVORzLgla8lC5TZbOKYocuHuNfYeZHOWGucwXU/jjrtY+/4MABs9X/iHI7jSleQ=@vger.kernel.org, AJvYcCXcwXX7eJkIt0hTCvu5gajYl5HqaUMLfCBepb3b0LPJ+UvJts3Kcd7qH0ybMnCY+svjgbb108lT@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt0Vie6w+sGv0fJarjXFeAYjDkkeZinsKTNJ2VR6PMrEKyUN1n
	OwnXEmpmFc9dXvgBpRyklPVWE/pDn/Iz2dJq3zKfNNbX7cTB728BhJqCcfgix00bthMmWOG+vD4
	R/Ozy3qxnRN1MhRMzFNucgeMpBV0=
X-Gm-Gg: ASbGncviPaXPFL00sBbMsNrgr//vVtIukipQxOnZnYXuZJZEkZyESpc7Tnpy6tLznjR
	69liSM88GuOlm3RDwW2GfOopNYDEMJ52dhFXufOYjyQE0pSmdHO8lqcEiCok42MoRrTeMXW6BNJ
	g4KArSLRE1Ssa/3/LpG8Ot28r7iAMeZOPiMrYutEr4ftk++Ya4aaVI4h0xjQ==
X-Google-Smtp-Source: AGHT+IGZhUGgimEx7Yd4GnJt3PXvVpTgFBQejSjmUmMfJrB0cDHMhFhdBmU2P/auwEr2Sgf0CKJm9gmYseuztTuE4qs=
X-Received: by 2002:a05:6122:2897:b0:520:3987:ce0b with SMTP id
 71dfb90a1353d-5235b519bf9mr8776775e0c.2.1741017922512; Mon, 03 Mar 2025
 08:05:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250302181808.728734-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250302181808.728734-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Z8SydsdDsZfdrdbE@shell.armlinux.org.uk> <CA+V-a8vCB7nP=tsv4UkOwODSs-9hiG-PxN6cpihfvwjq2itAHg@mail.gmail.com>
 <Z8TRQX2eaNzXOzV0@shell.armlinux.org.uk> <CA+V-a8vykhxqP30iTwN6yrqDgT8YRVE_MadjiTFp653rHVqMNg@mail.gmail.com>
 <Z8WQJQo5kW9QV-wV@shell.armlinux.org.uk>
In-Reply-To: <Z8WQJQo5kW9QV-wV@shell.armlinux.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 3 Mar 2025 16:04:55 +0000
X-Gm-Features: AQ5f1Jo58dfCPSbr_LygSD0HpkN57A-j2nqiiBeRIwww0srAwlBBwXcm7umdJrc
Message-ID: <CA+V-a8vCqxCaB_UEf-Ysg3biu5VoQ2_0OxWnN97Mdee9Op3YDA@mail.gmail.com>
Subject: Re: [PATCH 3/3] net: stmmac: Add DWMAC glue layer for Renesas GBETH
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Russell,

On Mon, Mar 3, 2025 at 11:19=E2=80=AFAM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Sun, Mar 02, 2025 at 10:02:15PM +0000, Lad, Prabhakar wrote:
> > Hi Russell,
> >
> > On Sun, Mar 2, 2025 at 9:44=E2=80=AFPM Russell King (Oracle)
> > <linux@armlinux.org.uk> wrote:
> > >
> > > On Sun, Mar 02, 2025 at 09:20:49PM +0000, Lad, Prabhakar wrote:
> > > > Hi Russell,
> > > > > What is the reason for setting this flag? If it's because of susp=
end/
> > > > > resume failures, does my "net: stmmac: fix resume failures due to
> > > > > RX clock" series solve this for you without requiring this flag?
> > > > >
> > > > Ive set this flag based on the configuration supported by this IP.
> > > > Unfortunately the platform which I am working on doesn't support s2=
r
> > > > yet so I cannot test suspend/resume path yet. But I do see an issue
> > > > when I unload and load just the glue module the DMA reset fails.
> > >
> > > Thanks for that feedback - that's a scenario I hadn't considered.
> > >
> > > I was trying to avoid having to disable LPI RX clock-stop on suspend =
by
> > > ensuring that it was enabled at resume time. I think that's valid, bu=
t
> > > you've brought up another similar scenario:
> > >
> > > - device is brought up, configures RX clock stop
> > > - links with media, negotiates EEE
> > > - driver is unloaded, link doesn't go down, but due to no traffic goe=
s
> > >   into idle, so RX clock is stopped
> > > - driver reloaded, RX clock still stopped, reset fails
> > >
> > > I would like to solve that so we can get the power savings from
> > > stopping the clock, but still have reset work when necessary.
> > >
> > I would be happy to test the patches ;)
> >
> > > I'm guessing that the "DMA reset fails" refers to this path:
> > >
> > > stmmac_open() -> __stmmac_open() -> stmmac_hw_setup() ->
> > > stmmac_init_dma_engine() -> stmmac_reset() ?
> > >
> > Yes.
> >
> > > In other words, when the device is being brought back up
> > > adminsitratively?
> > >
> > > What happens if you (replace $if):
> > >
> > > # ip li set dev $if down
> > > # ip li set dev $if up
> > >
> > > Does that also fail without STMMAC_FLAG_RX_CLK_RUNS_IN_LPI set?
> > >
> > Logs without STMMAC_FLAG_RX_CLK_RUNS_IN_LPI flag set:
> > --------------------------------------------------------------
> > root@rzv2h-evk-alpha:~# ip li set dev eth1 down
> > [   33.606549] renesas-gbeth 15c40000.ethernet eth1: Link is Down
> > root@rzv2h-evk-alpha:~#
> > root@rzv2h-evk-alpha:~# ip li set dev eth0 down
> > [   37.356992] renesas-gbeth 15c30000.ethernet eth0: Link is Down
> > root@rzv2h-evk-alpha:~#
> > root@rzv2h-evk-alpha:~# ip li set dev eth1 up
> > [   43.974803] renesas-gbeth 15c40000.ethernet eth1: Register
> > MEM_TYPE_PAGE_POOL RxQ-0
> > [   43.983189] renesas-gbeth 15c40000.ethernet eth1: Register
> > MEM_TYPE_PAGE_POOL RxQ-1
> > [   43.991155] renesas-gbeth 15c40000.ethernet eth1: Register
> > MEM_TYPE_PAGE_POOL RxQ-2
> > [   43.999128] renesas-gbeth 15c40000.ethernet eth1: Register
> > MEM_TYPE_PAGE_POOL RxQ-3
> > [   44.072079] renesas-gbeth 15c40000.ethernet eth1: PHY [stmmac-1:00]
> > driver [Microchip KSZ9131 Gigabit PHY] (irq=3DPOLL)
> > [   44.094605] dwmac4: Master AXI performs fixed burst length
> > [   44.100138] renesas-gbeth 15c40000.ethernet eth1: No Safety
> > Features support found
> > [   44.107748] renesas-gbeth 15c40000.ethernet eth1: IEEE 1588-2008
> > Advanced Timestamp supported
> > [   44.116725] renesas-gbeth 15c40000.ethernet eth1: registered PTP clo=
ck
> > [   44.123352] renesas-gbeth 15c40000.ethernet eth1: configuring for
> > phy/rgmii-id link mode
> > root@rzv2h-evk-alpha:~#
> > root@rzv2h-evk-alpha:~# ip li set dev eth1[   47.207761] renesas-gbeth
> > 15c40000.ethernet eth1: Link is Up - 1Gbps/Full - flow control off
> > ^C
> > root@rzv2h-evk-alpha:~# ^C
> > root@rzv2h-evk-alpha:~# ip li set dev eth0 up
> > [   55.636722] renesas-gbeth 15c30000.ethernet eth0: Register
> > MEM_TYPE_PAGE_POOL RxQ-0
> > [   55.645139] renesas-gbeth 15c30000.ethernet eth0: Register
> > MEM_TYPE_PAGE_POOL RxQ-1
> > [   55.653111] renesas-gbeth 15c30000.ethernet eth0: Register
> > MEM_TYPE_PAGE_POOL RxQ-2
> > [   55.661073] renesas-gbeth 15c30000.ethernet eth0: Register
> > MEM_TYPE_PAGE_POOL RxQ-3
> > [   55.732087] renesas-gbeth 15c30000.ethernet eth0: PHY [stmmac-0:00]
> > driver [Microchip KSZ9131 Gigabit PHY] (irq=3DPOLL)
> > [   55.754612] dwmac4: Master AXI performs fixed burst length
> > [   55.760143] renesas-gbeth 15c30000.ethernet eth0: No Safety
> > Features support found
> > [   55.767740] renesas-gbeth 15c30000.ethernet eth0: IEEE 1588-2008
> > Advanced Timestamp supported
> > [   55.776705] renesas-gbeth 15c30000.ethernet eth0: registered PTP clo=
ck
> > [   55.783333] renesas-gbeth 15c30000.ethernet eth0: configuring for
> > phy/rgmii-id link mode
> > root@rzv2h-evk-alpha:~#
> > root@rzv2h-evk-alpha:~# [   58.855844] renesas-gbeth 15c30000.ethernet
> > eth0: tx_clk_stop=3D1
> > [   58.861989] renesas-gbeth 15c30000.ethernet eth0: Link is Up -
> > 1Gbps/Full - flow control rx/tx
> >
> > root@rzv2h-evk-alpha:~#
> > root@rzv2h-evk-alpha:~#
> >
> > Logs with STMMAC_FLAG_RX_CLK_RUNS_IN_LPI flag set:
> > --------------------------------------------------------------
> > root@rzv2h-evk-alpha:~# ip li set dev eth1 down
> > [   30.053790] renesas-gbeth 15c40000.ethernet eth1: Link is Down
> > root@rzv2h-evk-alpha:~# ip li set dev eth0 down
> > [   35.366935] renesas-gbeth 15c30000.ethernet eth0: Link is Down
> > root@rzv2h-evk-alpha:~# ip li set dev eth1 up
> > [   40.448563] renesas-gbeth 15c40000.ethernet eth1: Register
> > MEM_TYPE_PAGE_POOL RxQ-0
> > [   40.456725] renesas-gbeth 15c40000.ethernet eth1: Register
> > MEM_TYPE_PAGE_POOL RxQ-1
> > [   40.464893] renesas-gbeth 15c40000.ethernet eth1: Register
> > MEM_TYPE_PAGE_POOL RxQ-2
> > [   40.472840] renesas-gbeth 15c40000.ethernet eth1: Register
> > MEM_TYPE_PAGE_POOL RxQ-3
> > [   40.543895] renesas-gbeth 15c40000.ethernet eth1: PHY [stmmac-1:00]
> > driver [Microchip KSZ9131 Gigabit PHY] (irq=3DPOLL)
> > [   40.566419] dwmac4: Master AXI performs fixed burst length
> > [   40.571949] renesas-gbeth 15c40000.ethernet eth1: No Safety
> > Features support found
> > [   40.579550] renesas-gbeth 15c40000.ethernet eth1: IEEE 1588-2008
> > Advanced Timestamp supported
> > [   40.588505] renesas-gbeth 15c40000.ethernet eth1: registered PTP clo=
ck
> > [   40.595135] renesas-gbeth 15c40000.ethernet eth1: configuring for
> > phy/rgmii-id link mode
> > root@rzv2h-evk-alpha:~#
> > root@rzv2h-evk-alpha:~# [   43.687551] renesas-gbeth 15c40000.ethernet
> > eth1: Link is Up - 1Gbps/Full - flow control off
> >
> > root@rzv2h-evk-alpha:~# ip li set dev eth0 up
> > [   49.644479] renesas-gbeth 15c30000.ethernet eth0: Register
> > MEM_TYPE_PAGE_POOL RxQ-0
> > [   49.652719] renesas-gbeth 15c30000.ethernet eth0: Register
> > MEM_TYPE_PAGE_POOL RxQ-1
> > [   49.660681] renesas-gbeth 15c30000.ethernet eth0: Register
> > MEM_TYPE_PAGE_POOL RxQ-2
> > [   49.669059] renesas-gbeth 15c30000.ethernet eth0: Register
> > MEM_TYPE_PAGE_POOL RxQ-3
> > [   49.740011] renesas-gbeth 15c30000.ethernet eth0: PHY [stmmac-0:00]
> > driver [Microchip KSZ9131 Gigabit PHY] (irq=3DPOLL)
> > [   49.762518] dwmac4: Master AXI performs fixed burst length
> > [   49.768057] renesas-gbeth 15c30000.ethernet eth0: No Safety
> > Features support found
> > [   49.775655] renesas-gbeth 15c30000.ethernet eth0: IEEE 1588-2008
> > Advanced Timestamp supported
> > [   49.784609] renesas-gbeth 15c30000.ethernet eth0: registered PTP clo=
ck
> > [   49.791236] renesas-gbeth 15c30000.ethernet eth0: configuring for
> > phy/rgmii-id link mode
> > root@rzv2h-evk-alpha:~#
> > root@rzv2h-evk-alpha:~# [   52.871635] renesas-gbeth 15c30000.ethernet
> > eth0: tx_clk_stop=3D1
> > [   52.877777] renesas-gbeth 15c30000.ethernet eth0: Link is Up -
> > 1Gbps/Full - flow control rx/tx
>
> I would like to get to the bottom of why this fails for module removal/
> insertion, but not for admistratively down/upping the interface.
>
> Removal of your module will unregister the netdev, and part of that
> work will bring the netdev administratively down. When re-inserting
> the module, that will trigger various userspace events, and it will
> be userspace bringing the network interface(s) back up. This should
> be no different from administratively down/upping the interface but
> it seems you get different behaviour.
>
> I'd like to understand why that is, because at the moment I'm wondering
> whether my patches that address the suspend/resume need further work
> before I send them - but in order to assess that, I need to work out
> why your issue only seems to occur in the module removal/insertion
> and not down/up as well as I'd expect.
>
> Please could you investigate this?
>
Sure I will look into this. Just wanted to check on your platform does
unload/load work OK? Also do you know any specific reason why DMA
reset could be failing so that I can look at it closer.

Cheers,
Prabhakar


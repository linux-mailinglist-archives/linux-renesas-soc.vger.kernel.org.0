Return-Path: <linux-renesas-soc+bounces-14164-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2D4A57A68
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  8 Mar 2025 14:20:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 70FE97A3B49
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  8 Mar 2025 13:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 815E11C07DA;
	Sat,  8 Mar 2025 13:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V/S2gI7l"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD591891A8;
	Sat,  8 Mar 2025 13:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741440044; cv=none; b=frRsDi5Hosjeno5l+Q0SGuATJCPGi/BmdzlVfWyLWsRPt8pgCCW4iErUb7RmOaNAvyVdkrB7n1RHVv6mBU/XTY6g55eTTyuCzHvCrtPuCAH/UqG5ys46hdjG6IBrxUrSmA2IEktND/1w6wnIt3o0YVU8+LP6XJ/aX0DDdgGQmkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741440044; c=relaxed/simple;
	bh=D4oKkGX26KTbthbjLnWboGwRkjN98U22AHUOogVxXLU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VRXrh2UIdWV+wXFp2uQGax2fllfdpSloJAYRL+8jtxI43QEO9K9qsKWzNA/b48MqgG19e7+HdMw6atDU6d37OigdQKZQflDbS/y3XaRrhw2EhWJE53nBVayzzziP6VTVjNDcw043p9pqELXZHj6QbnoZFXLSBRvBXsaA9/RSpkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V/S2gI7l; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-521b84da5e9so1036353e0c.0;
        Sat, 08 Mar 2025 05:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741440041; x=1742044841; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0teQ0xQ01nIDKBdyYestvyKR5bJo44qsrj0IZvrtCE4=;
        b=V/S2gI7lJuITXf0oxw5AWeEgotqMN47gpZ8FtqKAfcY3yNhuB/D7AexdUh/GIKUhUe
         ACWuSO+N3aCtVZOjmCws8R4/jf49zx+rrHcekT+73oVQXN4EAbw9/FLPBBGlAVF9PpJR
         gx1uVC1i3NXB+kZ+Yq6dQFnIryuGMJHjgfat8Infge4rRnwqQe+FVkn/tMYMVnVuuKNl
         hyWNrDQDo6Wq+nPaB2YtQn/Z4mMCT47X/6h5rUJbiftly5hO5JdLzLOszSBQbzUGHkbT
         PubgcTbpFinOgvrH8V3Ggk2YZoxd7gLP2oDacwWXLmyEs13Orgpp9LrWA8pFwIZunE4P
         qdVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741440041; x=1742044841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0teQ0xQ01nIDKBdyYestvyKR5bJo44qsrj0IZvrtCE4=;
        b=YXW1+bRknqQYclk1RrozNFRTQEUas0kQaqEGYL2apOjoCx+dVaDVEqv/G6E0YUxcGa
         82uT2Pf4yxFPkba+OMQCs1zPpzt8jRfl4a4SMi8N1dzww/L2B5NkJGla7GwzBy6ILq9b
         1oc+WLHlaW/vIKc8p/tfGPifkadimXpjVzRgisYAsqs4td2KwC8AhBG51fMsCmMaK1Ys
         Tjs0ijQLG005qznKJcGPdHKTk8KU5Btpvp7Qr5bev1nHRr0iaqzqHf108kBGyldI/OFX
         8FPmJ8Ij4MXK3YunTq4kVDHs7pV6NKio9ErhD04ptiXDknDi32uybjTEpi9Cj8QAjVTX
         kM7A==
X-Forwarded-Encrypted: i=1; AJvYcCU/pBCc/7FsRvPInIELl+ox56iz14l2/2MdwidDWlOD4aOXHdiHd/HjPsCyMY6ZPEwb/1KzgCV3c7/0wIjL@vger.kernel.org, AJvYcCUBumtJEkg0QptyIViBblM7Sallc5bEUkvZDx2n9lZCGv8/LEc9acjixMOfPDYsdsY5MFogHCXH@vger.kernel.org, AJvYcCUK7Vz6SRqDrAt16TgtmMXxilWhCmtrp0qaNJWVr3tKIujaSR9NvCqyMqpqbHblI7aG7zZXs/Pl6+6x395oApAaNrY=@vger.kernel.org, AJvYcCV19D0xJbV81wtlsAWXzUtPmegtzTf1nn+XL7vUCGQcpO+eAmOorCjyp5HvMoAxecHuQ5Fi+D3KaNXb@vger.kernel.org
X-Gm-Message-State: AOJu0YxyLOU/c/COl2Mew9irxm7wugArHJZfIQBkKqHEKK5F9abndPF8
	acUoykEeYdFlSMM0idmGWiIc96uYHd/MV3wxvAYq9aHIrWIb5XfJLso3BnBB0DssIOiGtWTAoZA
	6fZFCwNR1367QdG8hhObpq4uvkrvb6QkBFRc=
X-Gm-Gg: ASbGnctWheO2D8YJjwXtGmldyRsNHwZnEiOGw1KfrMNydbSNEXCLmwmcIw5GewSWD15
	GFc3vgfRBDozStLWjlmOdT1LjoOT30Rb03rJlGA+hPn2HTchbWOELMnPnI43sZjp4Jnbego2Gyu
	qGacuKSf+EVgZ7K2l2VHRXTLtqow==
X-Google-Smtp-Source: AGHT+IFJNCj8TRReqbXLD5fJR+8T3urlo/Xug4h3oLl6ysnfn7w0z1PU4DI6NEA0lGfyECiKOV1jA8X8l8XYNhDUtlM=
X-Received: by 2002:a05:6122:21a3:b0:520:652b:cdf9 with SMTP id
 71dfb90a1353d-523e407ac09mr4910218e0c.5.1741440041123; Sat, 08 Mar 2025
 05:20:41 -0800 (PST)
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
 <Z8WQJQo5kW9QV-wV@shell.armlinux.org.uk> <CA+V-a8vCqxCaB_UEf-Ysg3biu5VoQ2_0OxWnN97Mdee9Op3YDA@mail.gmail.com>
 <Z8XZh9nvX3yrE6wB@shell.armlinux.org.uk> <CA+V-a8teuTznxBE2_LqqQcqRgQu1saAMuOUST8jFLFFTALqUMw@mail.gmail.com>
 <Z8js74ASE_b-y9sR@shell.armlinux.org.uk>
In-Reply-To: <Z8js74ASE_b-y9sR@shell.armlinux.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sat, 8 Mar 2025 13:20:15 +0000
X-Gm-Features: AQ5f1Jpuo5MtDEubRHbz_jryeEb3cWN3klKgmfvzN2DMnklu4YeQJMYwosj7i44
Message-ID: <CA+V-a8uWY1Av8eS1k9C6Td=RuB4PbCnQyXbNLzmhao0nr8Spbg@mail.gmail.com>
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

On Thu, Mar 6, 2025 at 12:31=E2=80=AFAM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Wed, Mar 05, 2025 at 09:26:43PM +0000, Lad, Prabhakar wrote:
> > I did investigate on these lines:
> >
> > 1] With my current patch series I have the below in remove callback
> >
> > +static void renesas_gbeth_remove(struct platform_device *pdev)
> > +{
> > +       struct renesas_gbeth *gbeth =3D get_stmmac_bsp_priv(&pdev->dev)=
;
> > +
> > +       stmmac_dvr_remove(&pdev->dev);
> > +
> > +       clk_bulk_disable_unprepare(gbeth->num_clks, gbeth->clks);
> > +}
> >
> > After dumping the CLK registers I found out that the Rx and Rx-180 CLK
> > never got turned OFF after unbind.
>
> I think that's where further investigation needs to happen. This
> suggests there's more enables than disables for these clocks, but
> there's nothing that I can see in your submitted driver that would
> account for that behaviour.
>
> > 2] I replaced the remove callback with below ie first turn OFF
> > Tx-180/Rx/Rx-180 clocks
> >
> > +static void renesas_gbeth_remove(struct platform_device *pdev)
> > +{
> > +       struct renesas_gbeth *gbeth =3D get_stmmac_bsp_priv(&pdev->dev)=
;
> > +
> > +       clk_bulk_disable_unprepare(gbeth->num_clks, gbeth->clks);
> > +
> > +      stmmac_dvr_remove(&pdev->dev);
> > +}
> >
> > After dumping the CLK registers I confirmed all the clocks were OFF
> > (CSR/PCLK/Tx/Tx-180/Rx/Rx-180) after unbind operation. Now when I do a
> > bind operation Rx clock fails to enable, which is probably because the
> > PHY is not providing any clock.
>
> However, disabling clocks _before_ unregistering the net device is a
> bad thing to do! The netdev could still be in use.
>
> You can add:
>
>         if (ndev->phydev)
>                 phy_eee_rx_clock_stop(ndev->phydev, false);
>
> just before unregister_netdev() in stmmac_dvr_remove() only as a way
> to test out that idea.
>
I tried the above and I can still see the PHY providing the Rx clocks.

> Do the clock registers you refer to only update when the relevant
> clocks are actually running?
>
> > > However, PHYs that have negotiated EEE are permitted to stop their
> > > receive clock, which can be enabled by an appropriate control bit.
> > > phy_eee_rx_clock_stop() manipulates that bit. stmmac has in most
> > > cases permitted the PHY to stop its receive clock.
> > >
> > You mean phy_eee_rx_clock_stop() is the one which tells the PHY to
> > disable the Rx clocks? Actually I tried the below hunk with this as
> > well the Rx clock fails to be turned ON after unbind/bind operation.
>
> phy_eee_rx_clock_stop() doesn't turn the clock on/off per-se, it
> controls the bit which gives the PHY permission to disable the clock
> when the media is in EEE low-power mode. Note that 802.3 does not
> give a default setting for this bit, so:
>
> > diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
> > index 0ba434104f5b..e16f4a6f5715 100644
> > --- a/drivers/net/phy/phy.c
> > +++ b/drivers/net/phy/phy.c
> > @@ -1756,6 +1756,7 @@ EXPORT_SYMBOL_GPL(phy_eee_tx_clock_stop_capable);
> >   */
> >  int phy_eee_rx_clock_stop(struct phy_device *phydev, bool clk_stop_ena=
ble)
> >  {
> > +       return 0;
> >         int ret;
> >
> >         /* Configure the PHY to stop receiving xMII
>
> May not be wise, and if you want to ensure that the PHY does not stop
> the clock, then forcing clk_stop_enable to zero would be better.
>
> > > NVidia have been a recent victim of this - it is desirable to allow
> > > receive clock stop, but there hasn't been the APIs in the kernel
> > > to allow MAC drivers to re-enable the clock when they need it.
> > >
> > > Up until now, I had thought this was just a suspend/resume issue
> > > (which is NVidia's reported case). Your testing suggests that it is
> > > more widespread than that.
> > >
> > > While I've been waiting to hear from you, I've prepared some patches
> > > that change the solution that I proposed for NVidia (currently on top
> > > of that patch set).
> >
> > I tried your latest patches [0], this didnt resolve the issue.
>
> I assume without the modification to phy_eee_rx_clock_stop() above -
> thanks. If so, then your issue is not EEE related.
>
> > [0] https://lore.kernel.org/all/Z8bbnSG67rqTj0pH@shell.armlinux.org.uk/
>
> Wasn't quite the latest, but still had the same build bug (thanks for
> reporting, now fixed.) Latest is equivalent so no need to re-test.
>
Maybe looking at the behaviour on my SoC, we should request to disable
the PHY clocks upon module removal see below...

> > > However, before I proceed with them, I need you to get to the bottom
> > > of why:
> > >
> > > # ip li set dev $if down
> > > # ip li set dev $if up
> > >
> > > doesn't trigger it, but removing and re-inserting the module does.
> > >
> > Doing the above does not turn OFF/ON all the clocks. Looking at the
> > dump from the CLK driver on my platform only stmmaceth and pclk are
> > the clocks which get toggled and rest remain ON. Note Im not sure if
> > the PHY is disabling the Rx clocks when I run ip li set dev $if down I
> > cannot scope that pin on the board.
> >
> > Please let me know if you have any pointers for me to look further
> > into this issue.
>
> Given the behaviour that you're reporting from your clock layer, I'm
> wondering if the problem is actually there... it seems weird that clocks
> aren't being turned off and on when they should.
>
You were right, the problem was indeed in the clock layer. On the SoC
we have two registers one for clock gating (turn ON/OFF) and other for
monitoring the clock (ie CLOK_ON and CLK_MON registers). When we turn
ON the clock the CLK_ON bit gets set and to make sure it's turned ON
the corresponding CLK_MON bit is checked to ensure it's ON. When a
request is made to turn ON the clock first we check the CLK_MON bit
and if it's being set we return early as the clock was ON. This worked
OK up until now where the clocks used were internally generated.

In the case of RGMII interface where the Rx/Rx-180 clock was coming
from an PHY on an external pin the above didn't work as expected. When
we issued an unbind request on the glue driver all the clocks were
gated to OFF state i.e CLK_ON bits were set to '0'. Now when the bind
operation was requested  the clocks were requested to be turned ON, ie
when CLK_MON bits for RX/Rx-180 reported to be '1'  that is because
PHY was providing the clock and due to which the CLK_ON bit was unset
(and not gated to ON state)  due to which the DMA reset operation
failed in our case.

After fixing the clock driver, to ignore CLK_MON bits for clocks
coming from external pins and just relying on CLK_ON bits I am seeing
no more DMA reset timeouts.

Below are the logs, for unbind/bind operation working for both
eth0/eth1 interfaces.
---------------------------------------------------------------------------=
----------------------------------
root@rzv2h-evk-alpha:~# ethtool --show-eee eth0
EEE Settings for eth0:
        EEE status: enabled - active
        Tx LPI: 1000000 (us)
        Supported EEE link modes:  100baseT/Full
                                   1000baseT/Full
        Advertised EEE link modes:  100baseT/Full
                                    1000baseT/Full
        Link partner advertised EEE link modes:  100baseT/Full
                                                 1000baseT/Full
root@rzv2h-evk-alpha:~# ethtool --show-eee eth1
EEE Settings for eth1:
        EEE status: enabled - inactive
        Tx LPI: 1000000 (us)
        Supported EEE link modes:  100baseT/Full
                                   1000baseT/Full
        Advertised EEE link modes:  100baseT/Full
                                    1000baseT/Full
        Link partner advertised EEE link modes:  Not reported
root@rzv2h-evk-alpha:~#
root@rzv2h-evk-alpha:~# cd /sys/bus/platform/drivers/renesas-gbeth/ &&
echo 15c30000.ethernet > unbind && cd -
[  440.623862] renesas-gbeth 15c30000.ethernet eth0:
stmmac_dvr_remove: removing driver
[  440.632176] renesas-gbeth 15c30000.ethernet eth0: Link is Down
/home/root
root@rzv2h-evk-alpha:~# cd /sys/bus/platform/drivers/renesas-gbeth/ &&
echo 15c30000.ethernet > bind && cd -
[  448.384065] renesas-gbeth 15c30000.ethernet: IRQ sfty not found
[  448.391491] renesas-gbeth 15c30000.ethernet: User ID: 0x1, Synopsys ID: =
0x52
[  448.398735] renesas-gbeth 15c30000.ethernet:         DWMAC4/5
[  448.404007] renesas-gbeth 15c30000.ethernet: DMA HW capability
register supported
[  448.411633] renesas-gbeth 15c30000.ethernet: RX Checksum Offload
Engine supported
[  448.419245] renesas-gbeth 15c30000.ethernet: Wake-Up On Lan supported
[  448.425916] renesas-gbeth 15c30000.ethernet: Enable RX Mitigation
via HW Watchdog Timer
[  448.433977] renesas-gbeth 15c30000.ethernet: Enabled L3L4 Flow TC (entri=
es=3D8)
[  448.441167] renesas-gbeth 15c30000.ethernet: Enabled RFS Flow TC (entrie=
s=3D10)
[  448.448352] renesas-gbeth 15c30000.ethernet: Using 32/32 bits DMA
host/device width
/home/root
[  448.468325] renesas-gbeth 15c30000.ethernet eth0: Register
MEM_TYPE_PAGE_POOL RxQ-0
[  448.476762] renesas-gbeth 15c30000.ethernet eth0: Register
MEM_TYPE_PAGE_POOL RxQ-1
[  448.484756] renesas-gbeth 15c30000.ethernet eth0: Register
MEM_TYPE_PAGE_POOL RxQ-2
[  448.492705] renesas-gbeth 15c30000.ethernet eth0: Register
MEM_TYPE_PAGE_POOL RxQ-3
root@rzv2h-evk-alpha:~# [  448.564797] renesas-gbeth 15c30000.ethernet
eth0: PHY [stmmac-0:00] driver [Microchip KSZ9131 Gigabit PHY]
(irq=3DPOLL)
[  448.587333] dwmac4: Master AXI performs fixed burst length
[  448.592868] renesas-gbeth 15c30000.ethernet eth0: No Safety
Features support found
[  448.600466] renesas-gbeth 15c30000.ethernet eth0: IEEE 1588-2008
Advanced Timestamp supported
[  448.609409] renesas-gbeth 15c30000.ethernet eth0: registered PTP clock
[  448.616637] renesas-gbeth 15c30000.ethernet eth0: configuring for
phy/rgmii-id link mode
[  451.704179] renesas-gbeth 15c30000.ethernet eth0: Link is Up -
1Gbps/Full - flow control rx/tx

root@rzv2h-evk-alpha:~# cd /sys/bus/platform/drivers/renesas-gbeth/ &&
echo 15c40000.ethernet > unbind && cd -
[  486.269883] renesas-gbeth 15c40000.ethernet eth1:
stmmac_dvr_remove: removing driver
[  486.278374] renesas-gbeth 15c40000.ethernet eth1: Link is Down
[  486.323261] audit: type=3D1334 audit(1741436947.780:15): prog-id=3D13 op=
=3DLOAD
[  486.330102] audit: type=3D1334 audit(1741436947.788:16): prog-id=3D14 op=
=3DLOAD
/home/root
root@rzv2h-evk-alpha:~#
root@rzv2h-evk-alpha:~# cd /sys/bus/platform/drivers/renesas-gbeth/ &&
echo 15c40000.ethernet > bind && cd -
[  491.951054] renesas-gbeth 15c40000.ethernet: IRQ sfty not found
[  491.958576] renesas-gbeth 15c40000.ethernet: User ID: 0x0, Synopsys ID: =
0x52
[  491.965819] renesas-gbeth 15c40000.ethernet:         DWMAC4/5
[  491.971087] renesas-gbeth 15c40000.ethernet: DMA HW capability
register supported
[  491.978705] renesas-gbeth 15c40000.ethernet: RX Checksum Offload
Engine supported
[  491.986423] renesas-gbeth 15c40000.ethernet: Wake-Up On Lan supported
[  491.992927] renesas-gbeth 15c40000.ethernet: Enable RX Mitigation
via HW Watchdog Timer
[  492.001011] renesas-gbeth 15c40000.ethernet: device MAC address
de:08:73:a2:96:42
[  492.008547] renesas-gbeth 15c40000.ethernet: Enabled L3L4 Flow TC (entri=
es=3D8)
[  492.015793] renesas-gbeth 15c40000.ethernet: Enabled RFS Flow TC (entrie=
s=3D10)
[  492.022941] renesas-gbeth 15c40000.ethernet: Using 32/32 bits DMA
host/device width
/home/root
root@rzv2h-evk-alpha:~# [  492.045756] renesas-gbeth 15c40000.ethernet
eth1: Register MEM_TYPE_PAGE_POOL RxQ-0
[  492.055375] renesas-gbeth 15c40000.ethernet eth1: Register
MEM_TYPE_PAGE_POOL RxQ-1
[  492.063568] renesas-gbeth 15c40000.ethernet eth1: Register
MEM_TYPE_PAGE_POOL RxQ-2
[  492.071575] renesas-gbeth 15c40000.ethernet eth1: Register
MEM_TYPE_PAGE_POOL RxQ-3
[  492.123684] renesas-gbeth 15c40000.ethernet eth1: PHY [stmmac-1:00]
driver [Microchip KSZ9131 Gigabit PHY] (irq=3DPOLL)
[  492.146301] dwmac4: Master AXI performs fixed burst length
[  492.151840] renesas-gbeth 15c40000.ethernet eth1: No Safety
Features support found
[  492.159438] renesas-gbeth 15c40000.ethernet eth1: IEEE 1588-2008
Advanced Timestamp supported
[  492.168266] renesas-gbeth 15c40000.ethernet eth1: registered PTP clock
[  492.175237] renesas-gbeth 15c40000.ethernet eth1: configuring for
phy/rgmii-id link mode

root@rzv2h-evk-alpha:~# [  495.255185] renesas-gbeth 15c40000.ethernet
eth1: Link is Up - 1Gbps/Full - flow control off
[  527.352545] audit: type=3D1334 audit(1741436988.809:17): prog-id=3D14 op=
=3DUNLOAD
[  527.359538] audit: type=3D1334 audit(1741436988.809:18): prog-id=3D13 op=
=3DUNLOAD

root@rzv2h-evk-alpha:~#

Cheers,
Prabhakar


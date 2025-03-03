Return-Path: <linux-renesas-soc+bounces-13931-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F95A4C870
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Mar 2025 17:59:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41A62188EA15
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Mar 2025 16:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2C9827C173;
	Mon,  3 Mar 2025 16:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="XZEn/CZj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D17327935F;
	Mon,  3 Mar 2025 16:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741019557; cv=none; b=aIZr6o5DWfHgiR4sICvpBIORPDB0BLl2m6FBqrf9mWaJkKL2aLgqAtFwk8iqAmBKKyxATQ8fZnH0n29XPXL7TiH+WxdqayJEAk+dFSDOoJU42DQMY2c0LT+5oY0eZgrnmUHSeV3S5EdtoSAulOdoaYeFtUS+DODjhxt5Q5rt+rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741019557; c=relaxed/simple;
	bh=snXp1UXHksrHhFqNr0vuVdyNgGZ/phdEKQ35WjSqjXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UDTMkT2wFr8299JXOP9vY7e1x2MQRuFwj1INNACuXa6PnDX5AaWUK6zzm2d8jWMcid9cSEv1fnQ2sIiYBBGhoZ6f/zkvvD/6IKRDdBB84iMb7/wbSxqjwZTxPRQiFrFJd4oDBLO71KZ7LNEQrSb2AFUz9zZv5d5dbXjZo5koM3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=XZEn/CZj; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3Pe2TbaadeDhFFasbw3K7/pNGf7n/9+lcTGSnwml38Y=; b=XZEn/CZjYZdVqREnnUFRkiQdiV
	BdxI+LCU7Fy9Jt2uq0AKCeTRLLRCVB7QFUIebZ6vYN9BusEovBHoXf4DlDHlGY6JS/cuQ6CnWObx3
	TtwePWUJvTfrARjiP9F2zGnhulh0H/P0x63lsQD1jnUzhexrYYuV4sZb8Lty9BcR7ske83nQ53/sL
	GWm7Sm3295JLe4zOyykWPXorII9HnwZGDieQY3F7mtjkVFWmBlpFKPiH4jyECiikHg8hKG5Xf9P2Y
	YI96vYcSA/r2ExjpS/LMlXQjSt7ZGXCzoAB4JAmkMH60Il+zAV2iR2c3VLEnq4RZpu7xRs7s98Nq3
	8DpQNOGg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54482)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tp8iC-0000xq-1W;
	Mon, 03 Mar 2025 16:32:12 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tp8i7-0003vP-1f;
	Mon, 03 Mar 2025 16:32:07 +0000
Date: Mon, 3 Mar 2025 16:32:07 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 3/3] net: stmmac: Add DWMAC glue layer for Renesas GBETH
Message-ID: <Z8XZh9nvX3yrE6wB@shell.armlinux.org.uk>
References: <20250302181808.728734-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250302181808.728734-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Z8SydsdDsZfdrdbE@shell.armlinux.org.uk>
 <CA+V-a8vCB7nP=tsv4UkOwODSs-9hiG-PxN6cpihfvwjq2itAHg@mail.gmail.com>
 <Z8TRQX2eaNzXOzV0@shell.armlinux.org.uk>
 <CA+V-a8vykhxqP30iTwN6yrqDgT8YRVE_MadjiTFp653rHVqMNg@mail.gmail.com>
 <Z8WQJQo5kW9QV-wV@shell.armlinux.org.uk>
 <CA+V-a8vCqxCaB_UEf-Ysg3biu5VoQ2_0OxWnN97Mdee9Op3YDA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8vCqxCaB_UEf-Ysg3biu5VoQ2_0OxWnN97Mdee9Op3YDA@mail.gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Mon, Mar 03, 2025 at 04:04:55PM +0000, Lad, Prabhakar wrote:
> Hi Russell,
> 
> On Mon, Mar 3, 2025 at 11:19 AM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> > I would like to get to the bottom of why this fails for module removal/
> > insertion, but not for admistratively down/upping the interface.
> >
> > Removal of your module will unregister the netdev, and part of that
> > work will bring the netdev administratively down. When re-inserting
> > the module, that will trigger various userspace events, and it will
> > be userspace bringing the network interface(s) back up. This should
> > be no different from administratively down/upping the interface but
> > it seems you get different behaviour.
> >
> > I'd like to understand why that is, because at the moment I'm wondering
> > whether my patches that address the suspend/resume need further work
> > before I send them - but in order to assess that, I need to work out
> > why your issue only seems to occur in the module removal/insertion
> > and not down/up as well as I'd expect.
> >
> > Please could you investigate this?
> >
> Sure I will look into this. Just wanted to check on your platform does
> unload/load work OK? Also do you know any specific reason why DMA
> reset could be failing so that I can look at it closer.

It may be surprising, but I do not have stmmac hardware (although
there is some I might be able to use, it's rather complicated so I
haven't investigated that.) However, there's a lot of past history
here, because stmmac has been painful for me as phylink maintainer.
Consequently, I'm now taking a more active role in this driver,
cleaning it up and fixing some of the stuff it's got wrong.

That said, NVidia are in the process of arranging hardware for me.

You are not the first to encounter reset failures, and this has always
come down to clocks that aren't running.

The DWMAC core is documented as requiring *all* clocks for each part of
the core to be running in order for software reset to complete. If any
clock is stopped, then reset will fail. That includes the clk_rx_i /
clk_rx_180_i signals that come from the ethernet PHY's receive clock.

However, PHYs that have negotiated EEE are permitted to stop their
receive clock, which can be enabled by an appropriate control bit.
phy_eee_rx_clock_stop() manipulates that bit. stmmac has in most
cases permitted the PHY to stop its receive clock.

NVidia have been a recent victim of this - it is desirable to allow
receive clock stop, but there hasn't been the APIs in the kernel
to allow MAC drivers to re-enable the clock when they need it.

Up until now, I had thought this was just a suspend/resume issue
(which is NVidia's reported case). Your testing suggests that it is
more widespread than that.

While I've been waiting to hear from you, I've prepared some patches
that change the solution that I proposed for NVidia (currently on top
of that patch set).

However, before I proceed with them, I need you to get to the bottom
of why:

# ip li set dev $if down
# ip li set dev $if up

doesn't trigger it, but removing and re-inserting the module does.

I'd suggest looking at things such as:
- does the media link actually go down in one case but not the other
  (I don't mean does the kernel report the link went down - I mean
  did the remote end see the link go down, or is it still up, and
  thus *may* be in EEE low-power idle mode.)

- printing the statis from stmmac_host_irq_status() so we can see
  when the DWMAC tx/rx paths enters and exits LPI mode while the
  driver is active. (could be quite noisy).

- verify that .ndo_stop does get called when removing your module
  (it should, it's a core net function.)

- print the value of the LPI control/status register at various
  points that may be relevant (e.g. before the reset function is
  called.) bits 9 and 8 indicate receive and transmit LPI status.

I'm sure there's other things, but the above is just off the top of my
head.

Thanks for anything you can do to locate this.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


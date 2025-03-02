Return-Path: <linux-renesas-soc+bounces-13878-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CF3A4B503
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Mar 2025 22:44:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13FBC16A0E7
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Mar 2025 21:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 775CE1EE7BD;
	Sun,  2 Mar 2025 21:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="Rwa69Alx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729E2A94A;
	Sun,  2 Mar 2025 21:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740951895; cv=none; b=oeV8b1TxDUSN6/M1yzVCDiUJOG28vuPX6piHEhwj4DrcQZPsrLDm6mXQsxGqCEciMZRyx8ZJ+I4bzZTpmWmdf0XGPmWtCeCUVGiK4bVG88Ia5JNIshaDRdX0yuV8vF/Ec6TVeU85fOHWwkDaN+NpTDgwiZMw+RPkJCEVH+uwujQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740951895; c=relaxed/simple;
	bh=c7cT3P1CCgyCiXNoJf0VCCDsWG7rc8CevlypqdqQksM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M4OZgrnyu4DnTdYDBeiZ2TrFSGl+SI5laTOxuGTswdXR/oNxbaTIS/0klZ+z7q2iT9qs7wCeTmgzMf8lX628+jfTFFmTyFCbVu3ZfcbqMKIaViPEClVULCl0JrcgTE8gtBrNbZzNv4Zq6MNRW04kKt/JI9mRKq19VC7haugE7b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=Rwa69Alx; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=V4MsvqbddxXxf5oDvP4aWXVXAkSaW4C6i1gfOIY1xj8=; b=Rwa69AlxPF5XIve2OqXlTu79Jg
	LamKRk0n795z0mO0neI5Ov4YnOxdk5xKHiS7KuxSIQCdHqAnjGZrG4IXkimAMpi7zaRYfyRG6HDgZ
	zlzh6UWDbUlUg1je0bUr3yrMGKOjRAmRME1w1y8NemOpX4fBtsOMFyAauIGzdl2AEfzKwF9WSbdDO
	LtdChZNW7MVfWEJ/j4tBRTRMBORtohrGE0/a905scS9AUdLBuMJ4rwAtnI2Krobh6atQHTAWqEQFI
	x3YPuOyJ3D24EeDWT6nnvCM0LzGTPWSOgK7bfhxCWHHRJmZ5xquqsVMR/pzEu+L2t21H+ttkdLHHr
	g65K1Y/w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54356)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tor6z-0007Ip-2s;
	Sun, 02 Mar 2025 21:44:37 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tor6v-00037a-1u;
	Sun, 02 Mar 2025 21:44:33 +0000
Date: Sun, 2 Mar 2025 21:44:33 +0000
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
Message-ID: <Z8TRQX2eaNzXOzV0@shell.armlinux.org.uk>
References: <20250302181808.728734-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250302181808.728734-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Z8SydsdDsZfdrdbE@shell.armlinux.org.uk>
 <CA+V-a8vCB7nP=tsv4UkOwODSs-9hiG-PxN6cpihfvwjq2itAHg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+V-a8vCB7nP=tsv4UkOwODSs-9hiG-PxN6cpihfvwjq2itAHg@mail.gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Sun, Mar 02, 2025 at 09:20:49PM +0000, Lad, Prabhakar wrote:
> Hi Russell,
> > What is the reason for setting this flag? If it's because of suspend/
> > resume failures, does my "net: stmmac: fix resume failures due to
> > RX clock" series solve this for you without requiring this flag?
> >
> Ive set this flag based on the configuration supported by this IP.
> Unfortunately the platform which I am working on doesn't support s2r
> yet so I cannot test suspend/resume path yet. But I do see an issue
> when I unload and load just the glue module the DMA reset fails.

Thanks for that feedback - that's a scenario I hadn't considered.

I was trying to avoid having to disable LPI RX clock-stop on suspend by
ensuring that it was enabled at resume time. I think that's valid, but
you've brought up another similar scenario:

- device is brought up, configures RX clock stop
- links with media, negotiates EEE
- driver is unloaded, link doesn't go down, but due to no traffic goes
  into idle, so RX clock is stopped
- driver reloaded, RX clock still stopped, reset fails

I would like to solve that so we can get the power savings from
stopping the clock, but still have reset work when necessary.

I'm guessing that the "DMA reset fails" refers to this path:

stmmac_open() -> __stmmac_open() -> stmmac_hw_setup() ->
stmmac_init_dma_engine() -> stmmac_reset() ?

In other words, when the device is being brought back up
adminsitratively?

What happens if you (replace $if):

# ip li set dev $if down
# ip li set dev $if up

Does that also fail without STMMAC_FLAG_RX_CLK_RUNS_IN_LPI set?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


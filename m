Return-Path: <linux-renesas-soc+bounces-13888-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC739A4BD34
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Mar 2025 12:01:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18F313B3660
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Mar 2025 10:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87C741F3BA7;
	Mon,  3 Mar 2025 10:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="sKqmJQMr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE2B1F37C3;
	Mon,  3 Mar 2025 10:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740999313; cv=none; b=u9KTLfPrE5vx8ldLYLH17BsebEzXLUOVB8XUAoF6sAAmuTjTVTi1aWh3/3IQFDLXGImbH2LJNhzz8ESPFYA+EqHo791Yr78PQWwUCOJ5YJmYKNjgm3YiyjuuxpT1z15OwAEEflI5QjsXxt8lRpCzNlsOHwvGUbYam1YKJxijrjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740999313; c=relaxed/simple;
	bh=4epQYMM8V6R2XZ6JN5BLdmkVYJuE3uqln+lvFkjWs6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WdMo8yPp4yVeJ3AhMAVgRnzNBeLXZjwXBYoVIYRfIDf+6YaDB7ni7r4/KM0AZOZI2uS4g3J0aZ08+K8PYglqtaHA9fizIwAcJs7/r8Q6ySvke5fKzahPVmIwhrJ2QZ6T+HuC5jImY4moWQ07eU+QkKs2qaudkPHyPTTK3fGRVm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=sKqmJQMr; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dwfJYbyuqIqVPnvZM3QlfqAfWt6YK41SIugqNIJXGxA=; b=sKqmJQMrnMBahd7o7VMxol5jlD
	Zd5eCP03/HWkwk5g9RYniKSKC2q1/E05b6JS5R84V28ttl4yY33fjM2DQ/C0nP+ugZNN1A55lvbx1
	b/w/ldnFmbSWt+oYuTxC/+JuigPU60P5FSMPgDvQ8LsKe6crnQbQjJ9qlfsqWHQtWQJ00xD390a26
	AUg70g5/PVmBzCUKUDAhxhcRUHW17XzMR1sxvqGoACO7Vt+LiXkUMzWe494Tkw134aqwgiuguVBVF
	yXOYM4Eb4e99iyIldxDypdxPBXShtM5OhDshsnlnkZhQXs7lSFTzV3PMx8g9N2Qx7R63CoECCJOsn
	uptfEH8A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40532)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tp3Rm-0000HA-33;
	Mon, 03 Mar 2025 10:54:55 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tp3Rh-0003jJ-2R;
	Mon, 03 Mar 2025 10:54:49 +0000
Date: Mon, 3 Mar 2025 10:54:49 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Prabhakar <prabhakar.csengg@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
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
Message-ID: <Z8WKeRS7TvkVJ0Sb@shell.armlinux.org.uk>
References: <20250302181808.728734-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250302181808.728734-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdV8GqnhsJg7J7keGvT=Dvj_w0hZOiuZqCa=tiUgLE8Vtg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdV8GqnhsJg7J7keGvT=Dvj_w0hZOiuZqCa=tiUgLE8Vtg@mail.gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Mon, Mar 03, 2025 at 11:40:15AM +0100, Geert Uytterhoeven wrote:
> > +       err = stmmac_get_platform_resources(pdev, &stmmac_res);
> > +       if (err)
> > +               return dev_err_probe(dev, err,
> > +                                    "failed to get resources\n");
> > +
> > +       plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
> > +       if (IS_ERR(plat_dat))
> > +               return dev_err_probe(dev, PTR_ERR(plat_dat),
> > +                                    "dt configuration failed\n");
> > +
> > +       gbeth = devm_kzalloc(dev, sizeof(*gbeth), GFP_KERNEL);
> > +       if (!gbeth)
> > +               return -ENOMEM;
> > +
> > +       plat_dat->clk_tx_i = devm_clk_get_enabled(dev, "tx");
> 
> drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c:52:17:
> error: ‘struct plat_stmmacenet_data’ has no member named ‘clk_tx_i’

False error. You need to build netdev patches marked as net-next
against the net-next tree, not the outdated next tree.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


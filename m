Return-Path: <linux-renesas-soc+bounces-15921-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D74E0A8862D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 17:02:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC6683AE47D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 14:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DEE5253954;
	Mon, 14 Apr 2025 14:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="Zm9eD3mk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86474275872;
	Mon, 14 Apr 2025 14:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744641116; cv=none; b=jUIIRb8cfpB2v0b+bq0Pqx8Y7ufq4H0BbKbKZnmQXL8zmsK0Lbgctx6IBhlXvu5aXLoLCbBaYsz0NL1SW7DGFNDJLy7b+rWKnxkPUlnbmwDU3zUmKu9/SwUo8eA3Cw9/4EvhxkQTVf92Jp/7zL52KCVlI2Lj55YeiSc13euV5Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744641116; c=relaxed/simple;
	bh=JTrzdiz7XhEyL0SreHMCxYY3DvYmAUsCVxY/Glddl2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iBb9mxK0FZwJOnZWg1mhPvU8SoyofL+iAUU9FajBTW7je8KNgc0AdLmp2moltKjet8tmjVBgRReXLXnarDHPuyEDTGiaT1J7B7tpl/5mqiw1mOcJdUVMqNt6NUYAO2bTKgeJWHNhLGxVmyXCYtodBJ/jdcTP3nM34LyMN5fQACM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=Zm9eD3mk; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cuaKggYDRTaGllYGEl45fC0lvQ48d6zJXW22p95ihu0=; b=Zm9eD3mk3WM5hftniSBwFF1yr9
	wvxNTAJzgVasbkxZJHOK1DR3oOVb/26e4oc2Nzpgxl1KKp3lmgm7r0q4O4v1RXq44g3YXAnkmPM43
	2ha6YdMWO85CxFeTmi0XPvzd/aM0EX4N1G0Bo7ih03EUeqbV7ZcBOWGPdcG+MVbfEwUGIeKhmBY1g
	wZUp8xPG4mf95iso0eT2piUlROajI6jwnHoSX8Ei8Of0/zZAt3qtyK3lSb39SV9/9l7TRKiqaPBao
	z2gd3UeLxHusJWeDBZkkC2cny2t4IQ9/61aLTMG/t/Bj2Ul5kUTCL/MpnPtuL1et0NBwMJz/BygFc
	P5hiyRbA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58820)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1u4KqS-0006gu-0p;
	Mon, 14 Apr 2025 15:31:32 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1u4KqM-0007pA-1n;
	Mon, 14 Apr 2025 15:31:26 +0100
Date: Mon, 14 Apr 2025 15:31:26 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
Message-ID: <Z_0cPmY_LzI_fo4S@shell.armlinux.org.uk>
References: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407120317.127056-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Z_QSHpvSK7I--xPq@shell.armlinux.org.uk>
 <CA+V-a8vgavmN7c9KYjc-3tm-9GC1_aVUkF-dF=Ws9axTBmSa5g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8vgavmN7c9KYjc-3tm-9GC1_aVUkF-dF=Ws9axTBmSa5g@mail.gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Mon, Apr 07, 2025 at 07:07:49PM +0100, Lad, Prabhakar wrote:
> On Mon, Apr 7, 2025 at 6:58 PM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> >
> > On Mon, Apr 07, 2025 at 01:03:17PM +0100, Prabhakar wrote:
> > > +static struct clk *renesas_gbeth_find_clk(struct plat_stmmacenet_data *plat_dat,
> > > +                                       const char *name)
> > > +{
> > > +     for (unsigned int i = 0; i < plat_dat->num_clks; i++)
> > > +             if (!strcmp(plat_dat->clks[i].id, name))
> > > +                     return plat_dat->clks[i].clk;
> > > +
> > > +     return NULL;
> > > +}
> >
> > In addition to Jakub's request, I'll ask that you hold off for a week
> > because I have the following that I'd like to submit:
> >
> Ack, please add me in Cc while you post this patch.

FYI, the patch was merged last Thursday, so please update to replace
the above with stmmac_pltfr_find_clk() which will do this for you.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


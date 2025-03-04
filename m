Return-Path: <linux-renesas-soc+bounces-13957-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E674A4DC53
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Mar 2025 12:21:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E82A9178B3B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Mar 2025 11:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68BBB202990;
	Tue,  4 Mar 2025 11:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="kUMu1Lta"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791D820296C;
	Tue,  4 Mar 2025 11:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741087040; cv=none; b=Mbj+lE3pp5RXPiN/goUdpXSnDp7Sf2V0TCviThKd6LIV0v9GGQZPQy0YyVm/eC8EAGtxf0ID8fyMi7qHj3XS0ffy4yio9rdBoQDciERjKPDEMYc7/RcRHwROKY2fwN/Ewh7pk2gJHBGD00k7ZsfFXOaiXcw+s72/ru78JgSqsjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741087040; c=relaxed/simple;
	bh=QE9f9U6qBLX5qQnRNb/K2veaOv9T9oPGSSr2c+2t69o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uOUTBQTv2HApPZvlsUEP9NvLA9K6U2Dd+W9SUWF1yD6FuUSIcJ1iJhojAU5V3yJadf+7d6SKZXkVomO9zE7rjQM3qtCy6O1DX9B2/eoaqOnwDFOmEtMZ9c1IfWRaOCK8Ygfh+J3zA52AuBO6GuhQDGYXsCwI1UrkOzkW3LuQyMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=kUMu1Lta; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=s8QP+PcdkEe8qBX7uaK17qVTpMvKKoLatmaqsWLrObc=; b=kUMu1LtaST727sBsLR9Z+xv+pT
	VTEA9V17eS0Mm3AATaXIxZ36sX83I1ISqlP8bw+XbbJXh01HNPecswM08cQXZ2ZW3UjTO22N44ff3
	f/1jk55vMSQXGkHnSPcEeprdM2BYF94IZj3ZlwHp1Ecpi8Dl0z/6upf/E60x00ieSlkSvIIY4HsEj
	in3binWX42cjNNGEKN4gkVbhXrqCaP4HJS36MR7jzEHKWsEI/MIVfkZGJ1PssmeEaobMSimhFXMcj
	BFMLuMuYOUA4z2Z/S+zzzXKN13y29cUcsbHMGmXGMI6rp4+Ep+jf9AWn+OITzaoBlsa1zxLLUfEgC
	sOA//5rQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33082)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tpQGh-0002Xw-2u;
	Tue, 04 Mar 2025 11:17:00 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tpQGc-0004kQ-1S;
	Tue, 04 Mar 2025 11:16:54 +0000
Date: Tue, 4 Mar 2025 11:16:54 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
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
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 3/3] net: stmmac: Add DWMAC glue layer for Renesas GBETH
Message-ID: <Z8bhJkxUbG_HjXVf@shell.armlinux.org.uk>
References: <20250302181808.728734-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250302181808.728734-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Z8SydsdDsZfdrdbE@shell.armlinux.org.uk>
 <CA+V-a8vCB7nP=tsv4UkOwODSs-9hiG-PxN6cpihfvwjq2itAHg@mail.gmail.com>
 <Z8TRQX2eaNzXOzV0@shell.armlinux.org.uk>
 <CA+V-a8vykhxqP30iTwN6yrqDgT8YRVE_MadjiTFp653rHVqMNg@mail.gmail.com>
 <Z8WQJQo5kW9QV-wV@shell.armlinux.org.uk>
 <TY3PR01MB113468803E298C5FA6FB6712886C82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <Z8bPPaT4Vsob4FHH@shell.armlinux.org.uk>
 <TY3PR01MB1134624A76189BF079F1CE82186C82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY3PR01MB1134624A76189BF079F1CE82186C82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Tue, Mar 04, 2025 at 10:56:39AM +0000, Biju Das wrote:
> > For the failure to happen, you need to check whether EEE is being used:
> > 
> > # ethtool --show-eee ethX
> > 
> > and check whether it states that EEE is enabled and active, and Tx LPI also shows the timer value.
> > 
> > You need a PHY that does stop it's receive clock when the link enters low-power mode. PHYs are not
> > required to have this ability implemented, and there's no way for software to know whether it is or
> > not.
> > 
> > Then, you need to be certain that your link partner does actually support EEE and signals LPI from its
> > side, rather than just advertising EEE. Lastly, you need to ensure that there is no traffic over the
> > cable when you're resuming for the period of the reset timeout for the failure to occur. If the link
> > wakes up, the clock will be started and reset will complete.
> > 
> > One can rule out some of the above by checking the LPI status bits, either in the DWMAC or PHY which
> > indicates whether transmit and/or receive seeing LPI signalled.
> > 
> > If the link doesn't enter low power, then the receive clock won't be stopped, and reset will complete.
> > If the link wakes up during reset, then the clock will be restarted, and reset will complete before
> > the timeout expires.
> > 
> > So, the possibility for a successful test is quite high.
> 
> 
> This what I get on next. It is showing enabled , but inactive.
> 
> root@smarc-rzg3e:~# ethtool --show-eee eth0
> EEE settings for eth0:
>         EEE status: enabled - inactive
>         Tx LPI: 1000000 (us)
>         Supported EEE link modes:  100baseT/Full
>                                    1000baseT/Full
>         Advertised EEE link modes:  100baseT/Full
>                                     1000baseT/Full
>         Link partner advertised EEE link modes:  Not reported

That means your link partner doesn't support EEE (or has EEE disabled)
so the issue we're discussing in this thread doesn't occur for your
setup.

In order to do a valid test for the issue in this thread, you need a
link partner that supports EEE and has EEE enabled.

Note that also with an EEE capable setup, with the LPI timer set to
one second, you need to have not transmitted any packets for one
second before the transmit path enters LPI. Although this is the
default for stmmac, it seems to me to be an excessively long default,
and may even be masking some problems.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


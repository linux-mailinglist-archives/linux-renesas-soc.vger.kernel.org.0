Return-Path: <linux-renesas-soc+bounces-5316-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E248C2861
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 May 2024 18:00:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5FC3285547
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 May 2024 16:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0E17171E6A;
	Fri, 10 May 2024 16:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="gSaXuqTF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04774F4EB;
	Fri, 10 May 2024 15:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715356800; cv=none; b=BOrOF1a5/MA2rU4JqH5khgBRf6r1DI0dlfq4Ifk895FJtRlMtjxTo1M36Widf+fZp/YFSyVuyumjWgFSjtWBS6ahxC9g75Di5fHYsusXUlCY8e3nLkqhYKnuwdTmIGlBqhzpkiagOFYETh9gdcsCtOFE0dcbOW1QOXGa7uBMeEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715356800; c=relaxed/simple;
	bh=wbKDnKfEQHCAXUwX9RfyMwgfTbBBsErC9trEzdCJW5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qk6UWnN8B9PHjk7l3XMS/A7yffk060GL/015pQtovXbBcqn+YBbb5OiRVrfUUSlCXSfUR2mUhm2wh3VtHDACs+3P6vuuu2TduAplfXgobJe0CDS1p6HNYqpLUcjPJrNOQsTh32NOm4rmba2E24aNLs527w7vLL0289isKOwXPIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=gSaXuqTF; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NCElh/tyDAszVw05ZrkDEqetMG00D6E7lhb4V2GSblY=; b=gSaXuqTFqMJJ10MxmWKnlqyahH
	e1mtg+tX+08Yx0Z9JFi0WOx/NiqCo4TT1PJDVduXxGn6u+pePxT+nwNL9/d48J3K2ZU8arGzt5f+a
	TGCW31WrhkduJNdKfUzkNTGu5jHMFlC1RDNdkTABWJou3KBqDQ7S8/r5rFZALDMwNkW9iHenJnro/
	t0ITEhVmlir8R67TOPrT4nB0xUfpQClLM+Qhhv8k6EgNDAVm8j0CPllNk/LGXiLlgKO54VDTUZXL0
	nsq4Ao1zCKfbCNERsZretL0QxEegZPfrfqK9xSeiYjKAKq6641j39vyjIU2WQGoP23XCRDAzIrTVK
	G9LY5HAQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40528)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1s5Ses-0007bb-2P;
	Fri, 10 May 2024 16:59:42 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1s5Ses-0003RF-DD; Fri, 10 May 2024 16:59:42 +0100
Date: Fri, 10 May 2024 16:59:42 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v6 6/7] net: stmmac: add support for RZ/N1 GMAC
Message-ID: <Zj5EbvYdOivxdrJc@shell.armlinux.org.uk>
References: <20240510-rzn1-gmac1-v6-0-b63942be334c@bootlin.com>
 <20240510-rzn1-gmac1-v6-6-b63942be334c@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240510-rzn1-gmac1-v6-6-b63942be334c@bootlin.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Fri, May 10, 2024 at 09:38:13AM +0200, Romain Gantois wrote:
> From: Clément Léger <clement.leger@bootlin.com>
> 
> Add support for the Renesas RZ/N1 GMAC. This support can make use of a
> custom RZ/N1 PCS which is fetched by parsing the pcs-handle device tree
> property.
> 
> Signed-off-by: "Clément Léger" <clement.leger@bootlin.com>
> Co-developed-by: Romain Gantois <romain.gantois@bootlin.com>

Looks fine to me.

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


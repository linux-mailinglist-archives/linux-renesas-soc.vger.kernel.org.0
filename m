Return-Path: <linux-renesas-soc+bounces-5148-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F36578BC81D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 May 2024 09:07:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 36BCDB21F6A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 May 2024 07:07:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB0B36BFD4;
	Mon,  6 May 2024 07:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="j6S2vSVa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C92481B1;
	Mon,  6 May 2024 07:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714979233; cv=none; b=IOoUWJoZINYDGvp18N/jKzq6cpt4/sbUsoaKVeINlhO3GUotQkwEYC3KaRdywoF8SwaNheP7rcywDVs8pK91r6FvW7iTToP44HvspW75toebdObU219BY6ArW13rmNtzlcEQR5+2E2qmfSb0WpcuzkLdjS71S48lR2x1LnU5ISQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714979233; c=relaxed/simple;
	bh=/ygl80MN8pFCAtka2vGNeRmQZQPFH5Tx21QOyhP/sdw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=YTBrWNaU/b5DMWIjxKQ0Ne2fWH4AE5S9TlKWny2+qCeLqVv729IITLtH5H4apwKEF5AQomuy0XTK/bPlCEw1rsNlul9z6K1cqEAWvj1Wf+f1F60Rld7IKSjIgwsk6W873nNp8Y084bGZ1k5f1V4p2cjZUEEu+0Fgk/Kxl/YkpMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=j6S2vSVa; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5B373C0009;
	Mon,  6 May 2024 07:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714979223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mF3okb/zlCrXIKizMgfKu76xu/b0djUY7d04ZIvQ2SI=;
	b=j6S2vSVa12Y36dfV8tSiSbHT3HtfhSkv0miIpTvodL/pMj702HSJQ9y/L1BrzHr+qwLXn6
	v2ZyKVzBxVY7xGQtCTXTbWlD8rGppHUFKNmkECKa+Yf1VYBvrBLYTLoG7xuPT0nlDSFKTn
	tQ7+PrQmjCcsQsxCuGd/N0KUPOwZG5vSd8hklW22nf0kovdubmuVt/SGy/3rbafk+S4FOJ
	tzr3557EK3oB4tVti3Y4jis6NgO+W+RNz4aJ954fCkd/SayzGMqihFKlpTH/owBuA4AaJk
	mFHMNUcOPz0toEn0zeYQqJcoHweorazXNAudn8zQUYj+d9aebS6A5a/Z6hztRg==
Date: Mon, 6 May 2024 09:07:41 +0200 (CEST)
From: Romain Gantois <romain.gantois@bootlin.com>
To: Serge Semin <fancer.lancer@gmail.com>
cc: Romain Gantois <romain.gantois@bootlin.com>, 
    "David S. Miller" <davem@davemloft.net>, 
    Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
    Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
    Conor Dooley <conor+dt@kernel.org>, 
    Geert Uytterhoeven <geert+renesas@glider.be>, 
    Magnus Damm <magnus.damm@gmail.com>, 
    Alexandre Torgue <alexandre.torgue@foss.st.com>, 
    Jose Abreu <joabreu@synopsys.com>, 
    Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
    Russell King <linux@armlinux.org.uk>, 
    =?ISO-8859-15?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>, 
    Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org, 
    devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
    linux-renesas-soc@vger.kernel.org, 
    linux-stm32@st-md-mailman.stormreply.com, 
    linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v5 2/7] net: stmmac: Add dedicated XPCS cleanup
 method
In-Reply-To: <4wdcmcb2yxneynxtppestl6cp25z5xge3hfv7o47bxwpafn4cg@mtvc3ls2cxij>
Message-ID: <ec3e6c1b-1a5e-f7c9-4782-bc8f01a67f5f@bootlin.com>
References: <20240430-rzn1-gmac1-v5-0-62f65a84f418@bootlin.com> <20240430-rzn1-gmac1-v5-2-62f65a84f418@bootlin.com> <4wdcmcb2yxneynxtppestl6cp25z5xge3hfv7o47bxwpafn4cg@mtvc3ls2cxij>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-GND-Sasl: romain.gantois@bootlin.com

Hi Serge,

On Fri, 3 May 2024, Serge Semin wrote:

> 
> > +void stmmac_pcs_clean(struct stmmac_priv *priv)
> 
> Ideally it would have been great to have the entire driver fixed to
> accept the stmmac_priv pointer as the functions argument. But this
> would be too tiresome. Anyway seeing the PCS-setup protagonist method
> has the net_device pointer passed I would implement the same prototype
> for the antagonist even though it would require an additional local
> variable. That will make the MDIO and PCS local interface-functions
> looking alike and as if unified. That is the reason of why I made
> stmmac_xpcs_clean() accepting the net_device pointer. 
> 
> Alternatively both stmmac_pcs_setup() and stmmac_pcs_clean() could be
> converted to just accepting a pointer to the stmmac_priv instance.

I think that adapting stmmac_pcs_clean() to take a net_device struct would be 
more appropriate since it's the simpler of the two methods. I'll implement this 
in the next version.

Thanks,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


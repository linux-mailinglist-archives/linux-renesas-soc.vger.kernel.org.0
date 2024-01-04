Return-Path: <linux-renesas-soc+bounces-1281-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDAC823D19
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jan 2024 09:00:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8971D2860EA
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jan 2024 08:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBC20200BF;
	Thu,  4 Jan 2024 08:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CbgyAwwY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03615200AA;
	Thu,  4 Jan 2024 08:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 419CBFF809;
	Thu,  4 Jan 2024 08:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1704355251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WE9QlQ4KlC5mveEewBeLNMj9oTityHpI66OG1EcBCwM=;
	b=CbgyAwwYD8uWKnBEgnl/OqXn2LUAQHeNN/lWlX/vr/r6ucck2EZSDFljAqvkAwXTeRKdIw
	f3S4uGvc23ZEKWpqLpAdLtS704Q4SvPW+4emTG94vUG9jeaRYdxYsTdy3Qyt4r9njWkHqD
	241KrAuXnu9FzclO8hTw8m/mNyp1SrcXJ+Ml+ICZgUtXMbQb41Ty7d8AU269yFLHgwYqC4
	DvDfTNAltJL5Zw6ilI7BkqBGKpvoUXsENg0ZLMT+qDKwHw8QMGs2/G8VdrzSPrF7VSc3OZ
	llNrbvUWGkQ2mwgWJbmBqX5ewlV5/MDChwqCnkBAj1oyeiFPzWsEWuX/oLVfwA==
Date: Thu, 4 Jan 2024 09:01:11 +0100 (CET)
From: Romain Gantois <romain.gantois@bootlin.com>
To: Jakub Kicinski <kuba@kernel.org>
cc: Romain Gantois <romain.gantois@bootlin.com>, 
    Alexandre Torgue <alexandre.torgue@foss.st.com>, 
    Jose Abreu <joabreu@synopsys.com>, Russell King <linux@armlinux.org.uk>, 
    Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
    "David S. Miller" <davem@davemloft.net>, 
    Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
    Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
    =?ISO-8859-15?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>, 
    Marek Vasut <marex@denx.de>, Clark Wang <xiaoning.wang@nxp.com>, 
    Miquel Raynal <miquel.raynal@bootlin.com>, 
    Sylvain Girard <sylvain.girard@se.com>, 
    Pascal EBERHARD <pascal.eberhard@se.com>, netdev@vger.kernel.org, 
    linux-stm32@st-md-mailman.stormreply.com, 
    linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net 0/5] Fix missing PHY-to-MAC RX clock
In-Reply-To: <20240103132810.1aae03e8@kernel.org>
Message-ID: <a34046ef-b543-3f82-1562-5e7542f8529e@bootlin.com>
References: <20240103142827.168321-1-romain.gantois@bootlin.com> <20240103132810.1aae03e8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463808768-824936069-1704355274=:2791"
X-GND-Sasl: romain.gantois@bootlin.com

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463808768-824936069-1704355274=:2791
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

Hello Jakub,

On Wed, 3 Jan 2024, Jakub Kicinski wrote:

> On Wed,  3 Jan 2024 15:28:20 +0100 Romain Gantois wrote:
> > There is an issue with some stmmac/PHY combinations that has been reported
> > some time ago in a couple of different series:
> > 
> > Clark Wang's report: https://lore.kernel.org/all/20230202081559.3553637-1-xiaoning.wang@nxp.com/
> > Clément Léger's report: https://lore.kernel.org/linux-arm-kernel/20230116103926.276869-4-clement.leger@bootlin.com/
> 
> If those stmmac/PHY combinations never worked upstream please tag 
> as [PATCH net-next], we should consider this work to be a be a new
> feature / HW support. If they used to work - we'll need some Fixes
> tags.

These never worked properly upstream so I'll send it to net-next.

Best Regards,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
---1463808768-824936069-1704355274=:2791--


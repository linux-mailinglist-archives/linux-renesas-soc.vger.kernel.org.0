Return-Path: <linux-renesas-soc+bounces-5015-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5628B950B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 May 2024 09:06:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5EFAA1C20DEC
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 May 2024 07:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EC31339AC;
	Thu,  2 May 2024 07:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W6Sn+8cO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1532575B
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 May 2024 07:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714633544; cv=none; b=ZmkMaDqB2+5m1zXC6Gemjv3YVXpgKjKnJuKZ1C0zfGJnaMlQ63gaHoRE90VvCtb/cCf/9Xu4HatRHxS4ROrtsY4X9sdKp+g0Bs22C7PPuNkk83yvBSU6sjyySMeNboeKofHj0ZlR4bN83Xhru2i/ui2eXEc4lRBqqDZ2SyVeJ6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714633544; c=relaxed/simple;
	bh=jmCz2bzZzN6llSSfnEw77N01jtx9utNXMW5o87pvL2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OmHQpnjbY+lAbUxXt17S/dhM4SwjPm21rGAEbYOrZn4qBXVr4Jdek1v5HKg6W46BbcJFZACMnKnx0ZPxHox04tbGs9G3D0kVotMhhUDXwEEOYgYH/SYQp18xvN6N9oj/xPnwkUBfLdDDl5H2CUhPjg0EXtmfIuBqBTOQR/ObvB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W6Sn+8cO; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2e0a34b2899so47334081fa.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 May 2024 00:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714633541; x=1715238341; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V3T3S0/ACanJIeY4czsTT+RTZ1YRol9ljsewIaXQads=;
        b=W6Sn+8cO0TVgnS4jBCR0iUTTQwG9M3gKj3+uZXl47T31C/oPGFJjiVy9WPOAskyKnw
         vzU7NHHpVqhXOEcoliJK4PZNyldYrNrRuvwe7BFdWyLR+xMafENoVHMzrOH28vavKH80
         CoaYdCxuIPJZtKMVX6Eq7Ls3KxAP4rklwsDeCdc4I+rv2LkKaTZp47vnwQCf/2zfZ3Il
         YglnfxSCf2C2IFAfEDw4skCo2Cs5z4fbQwTDJ5DWW00LaODxOKYhU/tELVIxicy/4Iwo
         utLoALa4GgmQZIdAjbGp2KFE8MnYVNdCH9mMhu+dypoopUSP9aHgfaaFwATUb4LZCvIq
         b9Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714633541; x=1715238341;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3T3S0/ACanJIeY4czsTT+RTZ1YRol9ljsewIaXQads=;
        b=ViJaDzWGNnZK9Wuh5c22pmOuW7yYD7f1FNhUbOnqg4cN09qtFU/1OrmiDVuHacMT3Y
         LFBnD3as4tp8B0fer1RYqdpjWrSn3rAcZzZCN6yyx+t9peEwJiKz9mzhmVvkCu3+znx1
         epzOIay2qo/MK37jNAUqOMebEskmZUelmhhAOh8LW7NmveRcWyGJLfPHpQQz0s6Nwpd1
         QkynCl2dHLHPJOqlnuVmShZFctBrjNcsHpmIbaD6Oo5Wny/DZjdN7d3weJ08Rg2yUtbZ
         JlbQYm3ngACLCxyjp5yxd7ib2KgjS1dLNMcX/dxB1qMfGTcCGyKje55suA9xtz8KEZWE
         Uz5w==
X-Forwarded-Encrypted: i=1; AJvYcCWMlL7+tHuNgl3x6mjaWsSsIM5s+xDZwuwu5i8xNjqCCY/59CxMwJfq+vm0NOIu4F5TjecsJ2r/1WCEsYQASEZ17VSvgIh0/wQBmKuYRpYc6Xs=
X-Gm-Message-State: AOJu0YzJi3Rtc6LRmN7Dy0whPPbNGP/36dYA6Wv2JGxqfyC1x4B+Yant
	/SkL05HOTRIvpJmZjrvY7VTUkpMSX556UnYka68PIhp9wRSLQnAnxVmKrFa8dDQ=
X-Google-Smtp-Source: AGHT+IGHVWuyebZDGCsij4vuuCGXUnlNacdJhnGzP0jhAixWhDpzQ1nmi4t3DPfRBlZrMwTir+WhcA==
X-Received: by 2002:a2e:a58e:0:b0:2d9:fb60:9afa with SMTP id m14-20020a2ea58e000000b002d9fb609afamr1096872ljp.40.1714633540084;
        Thu, 02 May 2024 00:05:40 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id q26-20020a2e969a000000b002d860a40f9dsm69420lji.136.2024.05.02.00.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 00:05:39 -0700 (PDT)
Date: Thu, 2 May 2024 10:05:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	"soc@kernel.org" <soc@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Damien Le Moal <dlemoal@kernel.org>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Aisheng Dong <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	"Ghennadi Procopciuc (OSS)" <ghennadi.procopciuc@oss.nxp.com>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Joel Stanley <joel@jms.id.au>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>,
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH 01/21] pinctrl: ti: iodelay: Use scope based
 of_node_put() cleanups
Message-ID: <26aab31b-8085-49e0-862d-24c26ff4d02c@moroto.mountain>
References: <20240501-pinctrl-cleanup-v1-0-797ceca46e5c@nxp.com>
 <20240501-pinctrl-cleanup-v1-1-797ceca46e5c@nxp.com>
 <ee5c8637-b8b2-491b-b011-e399942691dc@moroto.mountain>
 <DU0PR04MB9417AD5892A1A45E6AE18D8688182@DU0PR04MB9417.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DU0PR04MB9417AD5892A1A45E6AE18D8688182@DU0PR04MB9417.eurprd04.prod.outlook.com>

On Thu, May 02, 2024 at 12:28:42AM +0000, Peng Fan wrote:
> > Subject: Re: [PATCH 01/21] pinctrl: ti: iodelay: Use scope based of_node_put()
> > cleanups
> > 
> > On Wed, May 01, 2024 at 08:55:59PM +0800, Peng Fan (OSS) wrote:
> > > @@ -879,16 +874,12 @@ static int ti_iodelay_probe(struct
> > platform_device *pdev)
> > >  	ret = pinctrl_register_and_init(&iod->desc, dev, iod, &iod->pctl);
> > >  	if (ret) {
> > >  		dev_err(dev, "Failed to register pinctrl\n");
> > > -		goto exit_out;
> > > +		return ret;
> > >  	}
> > >
> > >  	platform_set_drvdata(pdev, iod);
> > >
> > >  	return pinctrl_enable(iod->pctl);
> > > -
> > > -exit_out:
> > > -	of_node_put(np);
> > > -	return ret;
> > >  }
> > 
> > This will call of_node_put() on the success path so it's a behavior change.  The
> > original code is buggy, it's supposed to call of_node_put() on the success path
> > here or in ti_iodelay_remove().
> > 
> > If it's supposed to call of_node_put() here, then fine, this is bugfix but if it's
> > supposed to call it in ti_iodelay_remove() then we need to save the pointer
> > somewhere using no_free_ptr().  Probably saving ->np is the safest choice?
> > 
> > The original code is already a little bit buggy because it doesn't check for
> > pinctrl_enable() errors and cleanup.
> 
> It was introduced by 
> commit 6118714275f0a313ecc296a87ed1af32d9691bed (tag: pinctrl-v4.11-4)
> Author: Tony Lindgren <tony@atomide.com>
> Date:   Thu Mar 30 09:16:39 2017 -0700
> 
>     pinctrl: core: Fix pinctrl_register_and_init() with pinctrl_enable()
> 
> of_node_put is expected in probe, not in remove.
> 

Ah, right.  You'll add that for the Fixes tag obviously...

regards,
dan carpenter



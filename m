Return-Path: <linux-renesas-soc+bounces-8127-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4FF95C957
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 11:37:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 500F91F24F11
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 09:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4743814B97B;
	Fri, 23 Aug 2024 09:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jAr/WVJf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590FC6BFA5;
	Fri, 23 Aug 2024 09:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724405847; cv=none; b=rK4AM6cyqECfPmX9qBozjEA4+MmJd6h4jxQpxZpZ+bS8dC7OsKHuq6cUDb4/WfbWwhANgYU6LvY2GVyHkBDimRcKQllRa6lPQiu1iId/zyZX5nt07NYgu3zB1lSFliLrDkzfoXHGmPgDTICax0XvuFajS9ghOkaSf0t7eV03zuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724405847; c=relaxed/simple;
	bh=O1OTi7k21ZKoW0vZsCGLHRZ/pqltgRbjn+aluUUCWiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZcvzxYnQ1Ou2uaepaFqcINIsPnCRs01NdXlduDzJzb1Dy89HESyLRV0fXuHNBQ/iVzDY6kNz/KnIasQzedlXcwqZSV5+NXzx+xCuec+nj17fQoydglkGNh8kVGjeWsJz6XGmoooIg/XfxwO7RzVFvRxEM82Yh5Pq5TzlO/zTbX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jAr/WVJf; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f409c87b07so16005161fa.0;
        Fri, 23 Aug 2024 02:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724405843; x=1725010643; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4Ac5nNCVhdhZDVEQMZ1e+QZs8PBYNOPIlMHADdFcn1k=;
        b=jAr/WVJfLbp+hBajEWrQalOGxPNaGayYeUlNSMOVIJ7TvLevwBrJ6f2JCVz5vbGFbR
         2dVzxjg4zQ/2iMLhbSHHgrV6Ov0FRmGYfFRJ95uIhLApK2QM/vNKgX/wOgtftsQ2Svcc
         eXrvNXCN96APJ6+ewKqlbYi38y8fUPZsRLSrpY3uq2E5qulpsAQreF+CQf+E3qcgRZye
         RlQhTetFRpq/TiHytQvXgwXVQRxsFLLd+Kl3G7b+vlV/ECJaXPXsYRpurAGHvumykPvV
         E4K480u0QppzcVYku08WQ1M/aHi6QyoaPwdY7h8hIN7LnDInhhuiTSsH5uMJNV6Kb+HR
         HyTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724405843; x=1725010643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Ac5nNCVhdhZDVEQMZ1e+QZs8PBYNOPIlMHADdFcn1k=;
        b=bBV8fj8m9zM418HLQMi4pmF047CPF8EGHtRkV1fhTZ4dpoSoKmx0kwML4PbLpSg6FF
         WlNqMF7Qy+gPKiBdm/SsI9srx2bXeZGZIwsFyXp/9Oa+CnAp/OgS/ug2OGouG/S8xbky
         bMkN3YW17S/2THqmFh8lYixhqIC6ACW4atyofTBNevn0fP86t4u7NqKGLNhpGzHhAolf
         fTdHQOe+A3xThxykexIlECCLrGVn4eUHtvNcj2Jv273vueLolCmq+bRoUwMgVRRo/dc9
         2B5NCr5KdAO/5TRsnMxZgvkGzUBEjqZ7aE2rvZ314HjmSoHgamwGi1+91Qze4fYUPXE3
         k6zw==
X-Forwarded-Encrypted: i=1; AJvYcCW99CIBx+bGb71ESzlg92EHxzg2d8pbhsw1m/5L0Iu9Ip8FnURw9h2RA8Iit1SIfK/eBHO9KDh5v8OYoPA=@vger.kernel.org, AJvYcCWwhGoAngmXQ50SsK4HSTu7LfJUQiFH3/nUueelfC0ZpGHNZMvxwYvSywRDbyK9b/YUUtaVz+jk@vger.kernel.org, AJvYcCXs9lGCqZzx0Fe0GJNW9irhLUqyub3YOPsv5yxOhoKqx1NplBVSwP5gPPzTBHHPfi0QkSCJWOceNJFaaDLYb30hsso=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJNLsnzmljga+dnaCaRj8jigqjzoj3VEH7m+jPKAW3R+5Dvas5
	A3MM7r3sAwemoxCqWTGDqe1Kks0Ew3EI56DgtPtE/4boY6VxDN8A
X-Google-Smtp-Source: AGHT+IEmGbUcGDz88fFiESnHSTe8A1VR8m1CYlhAGl7LSVJErE5o8dcM5mYZwvJiw622MTGNoY9ILA==
X-Received: by 2002:a2e:8e8f:0:b0:2f1:59ed:87ab with SMTP id 38308e7fff4ca-2f4f4904c5dmr9805651fa.24.1724405841764;
        Fri, 23 Aug 2024 02:37:21 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f40487e931sm4200131fa.104.2024.08.23.02.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 02:37:21 -0700 (PDT)
Date: Fri, 23 Aug 2024 12:37:19 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Yangtao Li <frank.li@vivo.com>, 
	"clement.leger@bootlin.com" <clement.leger@bootlin.com>, "andrew@lunn.ch" <andrew@lunn.ch>, 
	"f.fainelli@gmail.com" <f.fainelli@gmail.com>, "olteanv@gmail.com" <olteanv@gmail.com>, 
	"davem@davemloft.net" <davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>, 
	"kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>, 
	"ulli.kroll@googlemail.com" <ulli.kroll@googlemail.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, 
	"marcin.s.wojtas@gmail.com" <marcin.s.wojtas@gmail.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, 
	"alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>, "joabreu@synopsys.com" <joabreu@synopsys.com>, 
	"mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, "hkallweit1@gmail.com" <hkallweit1@gmail.com>, 
	"kees@kernel.org" <kees@kernel.org>, "justinstitt@google.com" <justinstitt@google.com>, 
	"u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, "horms@kernel.org" <horms@kernel.org>, 
	"sd@queasysnail.net" <sd@queasysnail.net>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: Re: [net-next v2 2/9] net: stmmac: platform: Convert to
 devm_clk_get_enabled() and devm_clk_get_optional_enabled()
Message-ID: <zxfzr5s3hpmn5nkhjess5w2ruozdsco3lcakhfid67qeld2lpi@foykn7w4ltd3>
References: <20240823072122.2053401-1-frank.li@vivo.com>
 <20240823072122.2053401-3-frank.li@vivo.com>
 <qx4k2xehasda7zj6vt3bygdh3scehiiwniqvljj4b4rjde25a5@ys4oqsithhwi>
 <TY3PR01MB11346C33198DE80DD9DD1CC3C86882@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346C33198DE80DD9DD1CC3C86882@TY3PR01MB11346.jpnprd01.prod.outlook.com>

Hi Biju

On Fri, Aug 23, 2024 at 09:15:06AM +0000, Biju Das wrote:
> Hi Serge Semin,
> 
> > -----Original Message-----
> > From: Serge Semin <fancer.lancer@gmail.com>
> > Sent: Friday, August 23, 2024 10:11 AM
> > Subject: Re: [net-next v2 2/9] net: stmmac: platform: Convert to devm_clk_get_enabled() and
> > devm_clk_get_optional_enabled()
> > 
> > Hi Yangtao
> > 
> > On Fri, Aug 23, 2024 at 01:21:14AM -0600, Yangtao Li wrote:
> > > Use devm_clk_get_enabled() and devm_clk_get_optional_enabled() to
> > > simplify code.
> > >
> > > Signed-off-by: Yangtao Li <frank.li@vivo.com>
> > > Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> > > ---
> > > v2:
> > > -remove unused 'ret'
> > > -fix incompatible-pointer-types
> > >
> > >  .../ethernet/stmicro/stmmac/stmmac_platform.c | 35
> > > +++++--------------
> > >  1 file changed, 8 insertions(+), 27 deletions(-)
> > >
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > > b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > > index ad868e8d195d..1a66baaa4081 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > > @@ -415,8 +415,6 @@ static int stmmac_of_get_mac_mode(struct
> > > device_node *np)  static void stmmac_remove_config_dt(struct platform_device *pdev,
> > >  				    struct plat_stmmacenet_data *plat)  {
> > > -	clk_disable_unprepare(plat->stmmac_clk);
> > > -	clk_disable_unprepare(plat->pclk);
> > >  	of_node_put(plat->phy_node);
> > >  	of_node_put(plat->mdio_node);
> > >  }
> > > @@ -436,7 +434,6 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
> > >  	struct plat_stmmacenet_data *plat;
> > >  	struct stmmac_dma_cfg *dma_cfg;
> > >  	int phy_mode;
> > > -	void *ret;
> > >  	int rc;
> > >
> > >  	plat = devm_kzalloc(&pdev->dev, sizeof(*plat), GFP_KERNEL); @@
> > > -615,21 +612,16 @@ stmmac_probe_config_dt(struct platform_device
> > > *pdev, u8 *mac)
> > >
> > >  	/* clock setup */
> > >  	if (!of_device_is_compatible(np, "snps,dwc-qos-ethernet-4.10")) {
> > > -		plat->stmmac_clk = devm_clk_get(&pdev->dev,
> > > -						STMMAC_RESOURCE_NAME);
> > > +		plat->stmmac_clk = devm_clk_get_enabled(&pdev->dev,
> > > +STMMAC_RESOURCE_NAME);
> > >  		if (IS_ERR(plat->stmmac_clk)) {
> > >  			dev_warn(&pdev->dev, "Cannot get CSR clock\n");
> > >  			plat->stmmac_clk = NULL;
> > >  		}
> > > -		clk_prepare_enable(plat->stmmac_clk);
> > >  	}
> > >
> > > -	plat->pclk = devm_clk_get_optional(&pdev->dev, "pclk");
> > > -	if (IS_ERR(plat->pclk)) {
> > > -		ret = plat->pclk;
> > > -		goto error_pclk_get;
> > > -	}
> > > -	clk_prepare_enable(plat->pclk);
> > > +	plat->pclk = devm_clk_get_optional_enabled(&pdev->dev, "pclk");
> > > +	if (IS_ERR(plat->pclk))
> > 
> > > +		return (void *)plat->pclk;
> > 
> > Use the ERR_CAST() macro instead of the open coded void type cast.
> 

> Which is better ERR_PTR or ERR_CAST in this case?

The only correct macro in this case is ERR_CAST() which implies one
error-pointer cast to another. Open-coding the pointers cast is
discouraged.

The ERR_PTR() macro is utilized to cast an _integer-error_ to an
error-pointer.

-Serge(y)

> 
> Cheers,
> Biju
> 
> > 
> > >
> > >  	/* Fall-back to main clock in case of no PTP ref is passed */
> > >  	plat->clk_ptp_ref = devm_clk_get(&pdev->dev, "ptp_ref"); @@ -644,26
> > > +636,15 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8
> > > *mac)
> > >
> > >  	plat->stmmac_rst = devm_reset_control_get_optional(&pdev->dev,
> > >  							   STMMAC_RESOURCE_NAME);
> > > -	if (IS_ERR(plat->stmmac_rst)) {
> > > -		ret = plat->stmmac_rst;
> > > -		goto error_hw_init;
> > > -	}
> > > +	if (IS_ERR(plat->stmmac_rst))
> > 
> > > +		return (void *)plat->stmmac_rst;
> > 
> > ditto
> > 
> > >
> > >  	plat->stmmac_ahb_rst = devm_reset_control_get_optional_shared(
> > >  							&pdev->dev, "ahb");
> > > -	if (IS_ERR(plat->stmmac_ahb_rst)) {
> > > -		ret = plat->stmmac_ahb_rst;
> > > -		goto error_hw_init;
> > > -	}
> > > +	if (IS_ERR(plat->stmmac_ahb_rst))
> > 
> > > +		return (void *)plat->stmmac_ahb_rst;
> > 
> > ditto
> > 
> > -Serge(y)
> > 
> > >
> > >  	return plat;
> > > -
> > > -error_hw_init:
> > > -	clk_disable_unprepare(plat->pclk);
> > > -error_pclk_get:
> > > -	clk_disable_unprepare(plat->stmmac_clk);
> > > -
> > > -	return ret;
> > >  }
> > >
> > >  static void devm_stmmac_remove_config_dt(void *data)
> > > --
> > > 2.39.0
> > >
> > >
> 


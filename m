Return-Path: <linux-renesas-soc+bounces-470-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6899E7FF85A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Nov 2023 18:35:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2347D2816BE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Nov 2023 17:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F37A856769;
	Thu, 30 Nov 2023 17:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YM+oXZR1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF86F47A5A;
	Thu, 30 Nov 2023 17:35:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B65B5C433C8;
	Thu, 30 Nov 2023 17:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701365719;
	bh=8tB+d3+DCHPtwWHOb3AAbeDRc2KBSaXv3m0Macm8Qh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YM+oXZR12HQ5LY5CCuIiplh3+5Mv37hmnRcJWaur+3vbaiTwqtyaeEUFiOXMawL0m
	 5dBlsmcVPt3+fZHE2Jr8/cAEobFZxP7z85UaMo+SvwPnf3W0Pn7SfUYLD5yTaV0dov
	 hQVSui3wQfuWv9PHPxa2H3Js4WpDsnQnH7acW1UhC4QwQNzIg2qFotSgANuMRY7DUt
	 9tTNjQkTuZ4d6HMt3rCEGMFyQXxHb+9GNPTYgw2JRqa72OJplwMFxBYaUtvIXmJJSQ
	 8Ro8oa+J+PsuDpkE4ilkXCaMZXvZ5+yI4GGZSDxM3H260gjuq64M/CaE8gnwKUOYP1
	 Ist+fnuVzc5ng==
Date: Thu, 30 Nov 2023 17:35:12 +0000
From: Simon Horman <horms@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, p.zabel@pengutronix.de,
	yoshihiro.shimoda.uh@renesas.com, geert+renesas@glider.be,
	wsa+renesas@sang-engineering.com, biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	sergei.shtylyov@cogentembedded.com, mitsuhiro.kimura.kc@renesas.com,
	masaru.nagai.vx@renesas.com, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 13/13] net: ravb: Add runtime PM support
Message-ID: <20231130173512.GI32077@kernel.org>
References: <20231120084606.4083194-1-claudiu.beznea.uj@bp.renesas.com>
 <20231120084606.4083194-14-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120084606.4083194-14-claudiu.beznea.uj@bp.renesas.com>

On Mon, Nov 20, 2023 at 10:46:06AM +0200, Claudiu wrote:

...

>  		}
>  	}
>  
> +	error = ravb_pm_runtime_get(priv);
> +	if (error < 0)
> +		return error;

Hi Claudiu,

the error handling doesn't seem right here.
I think you need:

		goto out_free_irq_mgmta;

> +
>  	/* Device init */
>  	error = ravb_dmac_init(ndev);
>  	if (error)
> -		goto out_free_irq_mgmta;
> +		goto pm_runtime_put;
>  	ravb_emac_init(ndev);
>  
>  	/* Initialise PTP Clock driver */
> @@ -1820,7 +1862,8 @@ static int ravb_open(struct net_device *ndev)
>  	if (info->gptp)
>  		ravb_ptp_stop(ndev);
>  	ravb_stop_dma(ndev);
> -out_free_irq_mgmta:
> +pm_runtime_put:
> +	ravb_pm_runtime_put(priv);

And the out_free_irq_mgmta label should go here.

Flagged by Smatch.

>  	if (!info->multi_irqs)
>  		goto out_free_irq;
>  	if (info->err_mgmt_irqs)

...


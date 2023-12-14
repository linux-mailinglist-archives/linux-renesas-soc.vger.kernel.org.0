Return-Path: <linux-renesas-soc+bounces-1065-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 90672813034
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Dec 2023 13:33:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AA9828115E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Dec 2023 12:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D523541778;
	Thu, 14 Dec 2023 12:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="rPQOtEhj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2486FA3
	for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Dec 2023 04:33:18 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2c9f413d6b2so101428411fa.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Dec 2023 04:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1702557196; x=1703161996; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qOKRvReK44WjC67PpboxcBAbWNfB0BRmMGzQVugpv1I=;
        b=rPQOtEhj7NoKrhnE41K6eNPo8ZJBU3/TvDfFUEnrxKTiSkQAlJc6LV3WJ6bdCndALU
         uGsNJ3/eq4/FKFLtMpsXuqgSTkw2SlDlowCmryhXChavD1qiznHXwl9jWU2Z1AipECNe
         /0aLh3iEnh9sQxgFOW4wM6C8K2dLKUz2dtQen4HjEp66bgrF8SCZNzaqzJbdrgWTAblx
         gLm1i108wVPQ/PQe9BiEMAH3FeegsjU4WhgSp6OSR6TUGXVEV95PGVbbou/5Bl5VuKPt
         swDVKTUVwhb6tUJ7Du814/QtX2pevkqp35gXRiYG3V+tote8utvZ8uwvp6ZrEnn718C1
         lxoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702557196; x=1703161996;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qOKRvReK44WjC67PpboxcBAbWNfB0BRmMGzQVugpv1I=;
        b=aDVdsEia7UQKUTw4X+L7sFqL+Lq+Kn8WDzyJ2p7lO48KIQrrazOkG1D/jZdZVEXYHg
         CD5TtGeu8gTcYKZztScm8MlGMjLVZLH4JHGn5biQAgbqcLcH7w1xkA4o/3i1rNwt0aRL
         aeMBajn12Sw1WFr1SOcC581S8P3sdimubpGyUutHeL51o0yr1pS3Y2mUM6xQ+aJVLiy5
         m9zHYiFosbipsQ56krcX7a7YBMHDbR5gLjHMS44oi52bcIRpYHhKV5ngqamPaIVBDG3u
         lT/krZOLpvf0jjIqCoS8VaGJu9kG8kdokwJciLt9Zw4/dDXAFSXc9WyS9lWAymyEEa2T
         R7Rg==
X-Gm-Message-State: AOJu0YynN1JtwjDLBNw+knpRZqlKASjKeFAeqQk5eV0DZaYtYvrHGf24
	DBQQhaR2WzERYXufl7SQYh7PJg==
X-Google-Smtp-Source: AGHT+IH5NkhwO7Bck9gXySSKfyEWsZo7KqBsKJph/ZdaImpEC0ABrLLMoAFOIsAgX7Nrk1vij46ftA==
X-Received: by 2002:a2e:908d:0:b0:2c9:f864:9c7 with SMTP id l13-20020a2e908d000000b002c9f86409c7mr2982649ljg.55.1702557196324;
        Thu, 14 Dec 2023 04:33:16 -0800 (PST)
Received: from localhost (h-46-59-36-206.A463.priv.bahnhof.se. [46.59.36.206])
        by smtp.gmail.com with ESMTPSA id v18-20020a2e87d2000000b002ca013cb05csm2119750ljj.79.2023.12.14.04.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 04:33:15 -0800 (PST)
Date: Thu, 14 Dec 2023 13:33:15 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com,
	claudiu.beznea.uj@bp.renesas.com, yoshihiro.shimoda.uh@renesas.com,
	wsa+renesas@sang-engineering.com, biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	mitsuhiro.kimura.kc@renesas.com, geert+renesas@glider.be,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 2/2] net: ravb: Check that GTI loading request is done
Message-ID: <20231214123315.GL1863068@ragnatech.se>
References: <20231214113137.2450292-1-claudiu.beznea.uj@bp.renesas.com>
 <20231214113137.2450292-3-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231214113137.2450292-3-claudiu.beznea.uj@bp.renesas.com>

Hi Claudiu,

Thanks for your work.

On 2023-12-14 13:31:37 +0200, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Hardware manual specifies the following for GCCR.LTI bit:
> 0: Setting completed
> 1: When written: Issue a configuration request.
> When read: Completion of settings is pending

This is hard to parse at first glance, the last row have odd indentation 
and the mixing of read and write info is odd. I know this reflects how 
it's written in the datasheet, but at least there the indentation is 
correct. Also missing here is the fact that only 1 can be written to the 
bit.

> 
> Thus, check the completion status when setting 1 to GCCR.LTI.

Can you describe in the commit why this fix is needed. I agree it is, 
but would be nice to record why. As this have a fixes tags have you hit 
an issue? Or are you correcting the driver based on the datasheet?

Maybe a more informative commit message could be to describe the change 
and why it's needed instead of the register layout?

  The driver do not wait for the confirmation of the configuring request 
  of the gPTP timer increment before moving on. Add a check to make sure 
  the request completes successfully.

> 
> Fixes: 7e09a052dc4e ("ravb: Exclude gPTP feature support for RZ/G2L")
> Fixes: 568b3ce7a8ef ("ravb: factor out register bit twiddling code")
> Fixes: 0184165b2f42 ("ravb: add sleep PM suspend/resume support")
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>  drivers/net/ethernet/renesas/ravb_main.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index ce95eb5af354..1c253403a297 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -2819,6 +2819,10 @@ static int ravb_probe(struct platform_device *pdev)
>  
>  		/* Request GTI loading */
>  		ravb_modify(ndev, GCCR, GCCR_LTI, GCCR_LTI);
> +		/* Check completion status. */
> +		error = ravb_wait(ndev, GCCR, GCCR_LTI, 0);
> +		if (error)
> +			goto out_disable_refclk;

nit: Maybe create a helper for this so future fixes only need to be 
addressed in one location?

>  	}
>  
>  	if (info->internal_delay) {
> @@ -3041,6 +3045,10 @@ static int __maybe_unused ravb_resume(struct device *dev)
>  
>  		/* Request GTI loading */
>  		ravb_modify(ndev, GCCR, GCCR_LTI, GCCR_LTI);
> +		/* Check completion status. */
> +		ret = ravb_wait(ndev, GCCR, GCCR_LTI, 0);
> +		if (ret)
> +			return ret;
>  	}
>  
>  	if (info->internal_delay)
> -- 
> 2.39.2
> 

-- 
Kind Regards,
Niklas Söderlund


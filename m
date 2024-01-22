Return-Path: <linux-renesas-soc+bounces-1658-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB95836BF5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 17:54:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F225E1C261A6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 16:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D42435D758;
	Mon, 22 Jan 2024 15:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="UeI6At6N"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4FB4644D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jan 2024 15:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705937335; cv=none; b=Mi3w/lysugv/reuzKZHly+PqbsbjUsz41NPHCTxTKWC4XroSXnnO5Jemu3GwV3iIrIRh5A8jUtZquJpQaKghG0tozxYPUpM06KXEJbI8C8jVcLxjVAqgoqmncR0g9iw6qby+s4WxP6eCnlfI/aPAvQKzl8x5HnfK5MGth3egfis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705937335; c=relaxed/simple;
	bh=9BdBSqeP+pKAU1otFzDF6/umZq7OutkXNkVwcIuJQAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C940UMdE40GYfeojkKnNtTWNAojDwexzPwfTP6gPs8xzuOIOnZ3GiHQ9NPeVea5HUXfQSvvdtfoHqr2VhDc3jztgjSqGKPIyqbrq5DTriaCKFPrhN59rUIWWZ31VWAjsPKRUiHYG5hA3ELsnArAO0P7n474++TXaesb7vtpd0X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=UeI6At6N; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-50ff9bde634so1024513e87.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jan 2024 07:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1705937330; x=1706542130; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2K12GqOYOmu/kngnIcRPPAXG1MUNKwc6xKsFfoWOXrk=;
        b=UeI6At6NFCH5powLVwcaLYggyPZeHDZAHw2m67waGZai2AJLjwRxTr3SFz7KGRhxaI
         7Yk6JejoxyWCAmVA/WbBYmFkMFUp5/YXmYvFY5Zplc/oItg+v4QAGWjUqQd3EHCMS4Ym
         3EEyNZzQ0EYvXQ7DI0II+x2ycnAeoQZZIY+1vjG1bCjXkLbtZMedZPTqbJyduHv3RPcb
         Q9lujAV0nBIixqG7lsppxVfwzE1VADVii6F5KHfk7sr+aZ7L9iuHQ0/9U7Xbb4qBmQ/J
         oTV/k41m1GL6kElrIrDz3q5IE713Q2zRFhfQOQmniauYCL3O56oxmZE0OGgTEfVuYxcC
         PR5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705937330; x=1706542130;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2K12GqOYOmu/kngnIcRPPAXG1MUNKwc6xKsFfoWOXrk=;
        b=HxhNCJbAQyIk1u7dXifPkhQTx/56Z1UKfF1Q/RhxxXbNzwhWppVzzgMOYbFk71Z5NX
         KrC2ahpaSTV+zVmU13k6P5wkj2J7tCkHtqS8maCKGSpSVkHGLljlHxXvTkyh0ClUv1kD
         rtpLOe/eOeqgIZMFQ7T+UHxRRiuo2CsCe3ArZGkPO4OxnD503UmPrQc6Iw6eC2HD0DX3
         eTKOlGCsNtCoErggeFU6TAg4FzlFKJ0dUOv5No5CepVyME1S4dR5hYfMGeau4gLxidug
         BtwTvavpG9s5AiUCE80PjdnkvyEtDxPGdCy6uDUzdwsImJniFqdQUnNNLbKoGFPpqN0Z
         hp2A==
X-Gm-Message-State: AOJu0YzTDwDu7x0dgGg7RDyKGxQDvXe+88rrozbyw++tBcKJ+ZEuhocr
	zPQidYwmI8Tn6Mq/Mkg1yJdv7QqN/luiN0oe9Kd2xveVA0Z/x0uIgL+icRl6rrwHHM9JmRD7e4L
	rF2I=
X-Google-Smtp-Source: AGHT+IFXMsLAfSiyXwYetfcWWI5V/6UXuXMRBGjPtwt7+N7rAeMR8gi0EtfzDJPIeqQ3uAipOI8Y/A==
X-Received: by 2002:a05:6512:33c3:b0:50e:9a0d:d402 with SMTP id d3-20020a05651233c300b0050e9a0dd402mr2309630lfg.105.1705937330396;
        Mon, 22 Jan 2024 07:28:50 -0800 (PST)
Received: from localhost (h-46-59-36-113.A463.priv.bahnhof.se. [46.59.36.113])
        by smtp.gmail.com with ESMTPSA id b15-20020a056512304f00b0050e897b320fsm2018106lfb.192.2024.01.22.07.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 07:28:50 -0800 (PST)
Date: Mon, 22 Jan 2024 16:28:49 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: mstp: Remove obsolete clkdev registration
Message-ID: <20240122152849.GF4126432@ragnatech.se>
References: <e98a6e47ebecc44fa41de6d88b4ed20c6efbd177.1705931322.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e98a6e47ebecc44fa41de6d88b4ed20c6efbd177.1705931322.git.geert+renesas@glider.be>

Hi Geert,

Thanks for your work.

On 2024-01-22 14:49:45 +0100, Geert Uytterhoeven wrote:
> After the DT conversion of SH-Mobile and Armadillo-800-EVA display
> support, all devices are registered from DT, so we can remove the
> registration of clkdevs.
> 
> Add the missing #include <linux/slab.h>, which was included implicitly
> through <linux/clkdev.h> before.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> Patch written in 2015 ;-)

I scratch my head reading some of these patches, I have seen some of 
them before, but could not figure out when.

> 
> To be queued in renesas-clk for v6.9.
> ---
>  drivers/clk/renesas/clk-mstp.c | 16 +++-------------
>  1 file changed, 3 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/clk/renesas/clk-mstp.c b/drivers/clk/renesas/clk-mstp.c
> index e96457371b4cce88..cab4c89c4d657740 100644
> --- a/drivers/clk/renesas/clk-mstp.c
> +++ b/drivers/clk/renesas/clk-mstp.c
> @@ -10,7 +10,6 @@
>  
>  #include <linux/clk.h>
>  #include <linux/clk-provider.h>
> -#include <linux/clkdev.h>
>  #include <linux/clk/renesas.h>
>  #include <linux/device.h>
>  #include <linux/io.h>
> @@ -19,6 +18,7 @@
>  #include <linux/of_address.h>
>  #include <linux/pm_clock.h>
>  #include <linux/pm_domain.h>
> +#include <linux/slab.h>
>  #include <linux/spinlock.h>
>  
>  /*
> @@ -238,22 +238,12 @@ static void __init cpg_mstp_clocks_init(struct device_node *np)
>  
>  		clks[clkidx] = cpg_mstp_clock_register(name, parent_name,
>  						       clkidx, group);
> -		if (!IS_ERR(clks[clkidx])) {
> +		if (!IS_ERR(clks[clkidx]))
>  			group->data.clk_num = max(group->data.clk_num,
>  						  clkidx + 1);
> -			/*
> -			 * Register a clkdev to let board code retrieve the
> -			 * clock by name and register aliases for non-DT
> -			 * devices.
> -			 *
> -			 * FIXME: Remove this when all devices that require a
> -			 * clock will be instantiated from DT.
> -			 */
> -			clk_register_clkdev(clks[clkidx], name, NULL);
> -		} else {
> +		else
>  			pr_err("%s: failed to register %pOFn %s clock (%ld)\n",
>  			       __func__, np, name, PTR_ERR(clks[clkidx]));
> -		}
>  	}
>  
>  	of_clk_add_provider(np, of_clk_src_onecell_get, &group->data);
> -- 
> 2.34.1
> 
> 

-- 
Kind Regards,
Niklas Söderlund


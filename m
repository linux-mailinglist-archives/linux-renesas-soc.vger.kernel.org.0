Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 401701585BB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2020 23:47:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727452AbgBJWrr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Feb 2020 17:47:47 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:34459 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727436AbgBJWrr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Feb 2020 17:47:47 -0500
Received: by mail-lf1-f66.google.com with SMTP id l18so5548796lfc.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Feb 2020 14:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ziXSid8CCKAm4F7rWBURLQZwd/Cb31uMBwVbldO9hQ0=;
        b=lyVhN+A0H8K2Il96ZSbNCoCY9tlPJ/5/bCOTZSNRJrKRvH/c/6RbwDwSME7gdOobie
         DGYwIu/qTPestP7UgpeOTzC3cBAMT5CdGTcsKTGAmIJF4hKnFsxo85Qd8SCMUNPPw3Lu
         WmS//vQsVgLoakmbDe34y2Cw28YY61BxFVMdHU0v819X5d6npSy19HnrxhkcDxHLgq5c
         CIDEggRsE7Zj+bYa2grjZ7bU3msBH1k08UgtjUCobSgwyz+KqjRXDhqBeFoHw44FjNtX
         rryOI52h5NObfEd+ANXmXp3RoaT36BbJjA4j5vg6sLgqAspFKVbL9/L+oy8ps5b+R8ZE
         1CWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ziXSid8CCKAm4F7rWBURLQZwd/Cb31uMBwVbldO9hQ0=;
        b=fH3xdn2R2M4JoarHFExRQUodIIf5V8sZchqSwtFAaxo11gaNzriHfDpDf7JrImaQDh
         7UqpRTPLfO+XN6jUz5Xzf4ZhzS/+6CJyMzrW6fyxQ8sOpv4GBqYCPge+Xud17y3F7uXE
         qkWwtJXK8dBQrcpdBGLXRPHtudRCOmcLlnTu6F1wBkPzFQYBt7FHtVlMvvHcNyYMuGVf
         HtKRnNSJ94WQ7IB+F6yiO8hHp9KdLvwVVgfgcYuOldNMNgjPVMFsvlIkRzS0KujTiTbU
         4sUL4hJfKKk8SgFomTEZ0NeLApU5vnu5EEHRbeNP4AxUQXxw2SU5dbGwvC02yrMvwiC2
         cmTQ==
X-Gm-Message-State: APjAAAUHl4wQy2PMPbAIhUQAKXPtupEP417X68bYr4BW8udPbWWNnMFV
        aJ+RsDmAfAho7ihiMX9k05UjQQ==
X-Google-Smtp-Source: APXvYqwQMZDtOnQpUeoAmKdigmzNMAxinmVuU3FEIwq+xYwzSVZOtkqfNRXlXTyJsFdpv0vYqhqJow==
X-Received: by 2002:a19:94d:: with SMTP id 74mr1797274lfj.144.1581374865494;
        Mon, 10 Feb 2020 14:47:45 -0800 (PST)
Received: from localhost (h-200-138.A463.priv.bahnhof.se. [176.10.200.138])
        by smtp.gmail.com with ESMTPSA id z19sm751630lfg.26.2020.02.10.14.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 14:47:44 -0800 (PST)
Date:   Mon, 10 Feb 2020 23:47:44 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [RFC PATCH 2/6] mmc: renesas_sdhi: complain loudly if driver
 needs update
Message-ID: <20200210224744.GB2443363@oden.dyn.berto.se>
References: <20200129203709.30493-1-wsa+renesas@sang-engineering.com>
 <20200129203709.30493-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200129203709.30493-3-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thanks for your patch.

On 2020-01-29 21:37:05 +0100, Wolfram Sang wrote:
> When the tap array in the driver is too low, this is not a warning but
> an error. Also _once is not helpful, we should make sure it is
> prominently in the logs. It is safe to do this because this will only
> show up during SoC enablement when we a new SoCs needs more taps (if
> that ever will happen).
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Note: 'unsigned long' seems big enough for a while. But, famous last
> words(tm). We could handle this at runtime by reallocating a bigger
> buffer. Very unsure if it is worth it, though.

I can not tell if it's worth doing this now or not. But if it's a error 
instead of a warning it will be easier to spot if we should have done so 
;-)

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> 
>  drivers/mmc/host/renesas_sdhi_core.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index b3ab66f963f8..d63aeb35bd0b 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -499,9 +499,9 @@ static int renesas_sdhi_execute_tuning(struct tmio_mmc_host *host, u32 opcode)
>  		return 0; /* Tuning is not supported */
>  
>  	if (host->tap_num * 2 >= sizeof(host->taps) * BITS_PER_BYTE) {
> -		dev_warn_once(&host->pdev->dev,
> -			"Too many taps, skipping tuning. Please consider updating size of taps field of tmio_mmc_host\n");
> -		return 0;
> +		dev_err(&host->pdev->dev,
> +			"Too many taps, please update 'taps' in tmio_mmc_host!\n");
> +		return -EINVAL;
>  	}
>  
>  	priv->doing_tune = true;
> -- 
> 2.20.1
> 

-- 
Regards,
Niklas Söderlund

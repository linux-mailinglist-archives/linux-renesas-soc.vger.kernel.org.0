Return-Path: <linux-renesas-soc+bounces-12218-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0F8A14ECF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jan 2025 12:52:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38DEA3A8A46
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jan 2025 11:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 970DB1FECC5;
	Fri, 17 Jan 2025 11:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="JwiXnVRM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF181FE44A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jan 2025 11:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737114723; cv=none; b=aGyfmgQ8loJgYkrBGV1PLKR8o8GJwSfvJIPb6tNUnnGTweibJagMstnKfYQxH9OTi1J+SpL/5LzAKHDHVYmjaojGxZ91/r8HsTa/vmh3iWy3IJZw3PEqc8vt/ymLtu2x/GpTk5dtDnhOjZA8bh8G2FKWo8JN4eW5q8gLV1quy4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737114723; c=relaxed/simple;
	bh=xwCWCIDVfn4ljQgFgns26pvg+plF0yfuzXPTokcNkqY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=XN79g2sVDpYnXLv5gYAY3XpQoK0MQGeaJ/MUZv8xrv2rUWJsdefgi3i/h7TxSV2QJPSh5wD+VPAOTQIL6a9XveV45F6MiNrpAQ+RC8zqjgikYfu46JK/JI3r7UwSEyxRxuvLKAmKr2JEvLvGctn2TY6GQkIX7nzoq5yjwBeEg8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=JwiXnVRM; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-436202dd7f6so21585045e9.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jan 2025 03:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1737114719; x=1737719519; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=umzbMSBjj46+zs1yQ9Kml6XKWdNkQzuAfOK6WAMVw/Y=;
        b=JwiXnVRMyFBl6Eihpwrr+qUCAhq3cM9QBLGz1Ar4IxTnrwfeMKTyoIbDZTCnSPa1ye
         gNS+89L8yRbPTWMn+80Fc8YJakDfD+sHVYtQyhnVCAxidjq/U6fmDKWfkt1OMtk2Aa7B
         JUfLm+PA7tRjWgCfPvoPB6SQBahns6gUTkCL7OkdAAvJ4MpfrOGz6QKYB8PTe0l1CQK2
         q4Bmd64Q/4wA1njz5tIzPN2XFzj82zk1s5iZ7uhasmTsvj0lCijN+yBWLnOG2AcP+Lq6
         MocgwIC/r2N22tQrQciKvMLmhagssSphX2+GMIqVC1h+sFIAwsJZxRzpmr4rH9Y3Q0H4
         34UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737114719; x=1737719519;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=umzbMSBjj46+zs1yQ9Kml6XKWdNkQzuAfOK6WAMVw/Y=;
        b=SGKyxfWR4N1dSOaUWtwePSn05qDVwp3TDYa680OLScRg0AaZvDgfk1Wc+WEVyM6ZfV
         qsd6XWa8bpgNywKBShdETYH5kRdeXvOFPxv/rmIlxqiWhfLyRETOm2yNo++di15D0u9t
         W6bNzUySbEoNQ1MctKuB4ZjVJ8egArlOefD8BMDAa6FjjgH4Ak4+OnawT/9w+bD/iZnJ
         SyrumgVjkeDSU/fypaTl743Ge7nFQH/ic/ZWgIEPmDRs5epWxTRC7m9VXcgDS521GRew
         hW/9BzAjU7EJLOv6zM24+iezaTQ5Cz083aodT2/pr9N6mvz5afvNIIW+JtP/N7cADMZ5
         ib3Q==
X-Forwarded-Encrypted: i=1; AJvYcCX593hIU1ZtCw2VoQV/jcnZEgMMUsqJANo6GR7SpNCxwVrrlBcVSwtq6M2ReAXFqoOGcsnygcw064gvBAzs53iOcw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrye/cyECbSCe0z/McH5hj+95CRRR/4C8eQFROPagEHBtzpf9M
	FsLOKjHXCGDL9Daei8VOaLcNj+Its4M/Pu7ke2VXYiCUHZb/z/L9fDD+UpQ0g3I=
X-Gm-Gg: ASbGnctS373jm+FCoelviZlxerxnWYjDT3g8S5LlpuhMuyAus+74vIxci8IA/mXtc15
	4Tt8gRX13pUlYjYqoxbHbjlnZC5kluhm0ylPu4WVPANeq1T2SXDF3B6lEKl/Em5l6BrUOYEQ5+Q
	5UJzjOjqJn5xgnjuJPxfYLQ72FF7VPCfjxyjss8rUDOpM8G5BHbDau/OyYutPSG9JP7B+ImPOuS
	+tPLncITlCb+c9qU86ChV7gMVeDaRngTOFET/Tuh8exuPCytIY9kRBbqlBtXYimUg==
X-Google-Smtp-Source: AGHT+IE4kQUYANidWG36nYutNXYRmfHEWSkKEVnx3dSgIu3dG++0ldqKCDbRAujA8YCCuBSVUPPU4Q==
X-Received: by 2002:a5d:5f56:0:b0:38a:9f47:557b with SMTP id ffacd0b85a97d-38bf57a97bcmr2347139f8f.40.1737114718508;
        Fri, 17 Jan 2025 03:51:58 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf32845e8sm2342552f8f.97.2025.01.17.03.51.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2025 03:51:58 -0800 (PST)
Message-ID: <8ff70298-8a9c-4228-b064-f46ec81f6d15@tuxon.dev>
Date: Fri, 17 Jan 2025 13:51:55 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH] ASoC: renesas: rz-ssi: Clean up on error in probe()
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <14864a18-c256-4c7d-b064-ba1400bed894@stanley.mountain>
Content-Language: en-US
In-Reply-To: <14864a18-c256-4c7d-b064-ba1400bed894@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Dan,

On 15.01.2025 08:55, Dan Carpenter wrote:
> Call rz_ssi_release_dma_channels() on these error paths to clean up from
> rz_ssi_dma_request().
> 
> Fixes: 26ac471c5354 ("ASoC: sh: rz-ssi: Add SSI DMAC support")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  sound/soc/renesas/rz-ssi.c | 42 ++++++++++++++++++++++++--------------
>  1 file changed, 27 insertions(+), 15 deletions(-)
> 
> diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
> index 3a0af4ca7ab6..4b3016282717 100644
> --- a/sound/soc/renesas/rz-ssi.c
> +++ b/sound/soc/renesas/rz-ssi.c
> @@ -1150,35 +1150,47 @@ static int rz_ssi_probe(struct platform_device *pdev)
>  		ssi->irq_rx = platform_get_irq_byname(pdev, "dma_rx");
>  		if (ssi->irq_tx == -ENXIO && ssi->irq_rx == -ENXIO) {
>  			ssi->irq_rt = platform_get_irq_byname(pdev, "dma_rt");
> -			if (ssi->irq_rt < 0)
> -				return ssi->irq_rt;
> +			if (ssi->irq_rt < 0) {
> +				ret = ssi->irq_rt;
> +				goto err_release_dma_chs;
> +			}
>  
>  			ret = devm_request_irq(dev, ssi->irq_rt,
>  					       &rz_ssi_interrupt, 0,
>  					       dev_name(dev), ssi);
> -			if (ret < 0)
> -				return dev_err_probe(dev, ret,
> -						     "irq request error (dma_rt)\n");
> +			if (ret < 0) {
> +				dev_err_probe(dev, ret,
> +					      "irq request error (dma_rt)\n");
> +				goto err_release_dma_chs;
> +			}
>  		} else {
> -			if (ssi->irq_tx < 0)
> -				return ssi->irq_tx;
> +			if (ssi->irq_tx < 0) {
> +				ret = ssi->irq_tx;
> +				goto err_release_dma_chs;
> +			}
>  
> -			if (ssi->irq_rx < 0)
> -				return ssi->irq_rx;
> +			if (ssi->irq_rx < 0) {
> +				ret = ssi->irq_rx;
> +				goto err_release_dma_chs;
> +			}
>  
>  			ret = devm_request_irq(dev, ssi->irq_tx,
>  					       &rz_ssi_interrupt, 0,
>  					       dev_name(dev), ssi);
> -			if (ret < 0)
> -				return dev_err_probe(dev, ret,
> -						"irq request error (dma_tx)\n");
> +			if (ret < 0) {
> +				dev_err_probe(dev, ret,
> +					      "irq request error (dma_tx)\n");
> +				goto err_release_dma_chs;
> +			}
>  
>  			ret = devm_request_irq(dev, ssi->irq_rx,
>  					       &rz_ssi_interrupt, 0,
>  					       dev_name(dev), ssi);
> -			if (ret < 0)
> -				return dev_err_probe(dev, ret,
> -						"irq request error (dma_rx)\n");
> +			if (ret < 0) {
> +				dev_err_probe(dev, ret,
> +					      "irq request error (dma_rx)\n");
> +				goto err_release_dma_chs;
> +			}
>  		}
>  	}

The code block ending here is entered only if !rz_ssi_is_dma_enabled(). If
that is true there are no DMA channel to be released. Maybe better would be
to move this code block on the failure path of the rz_ssi_dma_request() as
also proposed here:
https://lore.kernel.org/all/CAMuHMdU+_NuLp2FuwwcLfJRe2ssMtp=z7fqcsANgYfFehTNJGg@mail.gmail.com/

Thank you,
Claudiu

>  



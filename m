Return-Path: <linux-renesas-soc+bounces-4950-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFDB8B6E59
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Apr 2024 11:30:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4CC03B22B0B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Apr 2024 09:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D44B11292EE;
	Tue, 30 Apr 2024 09:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="eRF+cqcD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3811292DC
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Apr 2024 09:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714469232; cv=none; b=jk2u6pjx8KxhsLoxS1kVLrSH1HAKTu2iIa21vuaqg8ITo0Fr85Bt2eOanC4jzZ/G5lNdpIkS5VJ3zTjuXfaIBZiM6i1Hj5VL3vKzl04cmwbfgjnRMKzXoA6C8RXgjFvP6hry4TGJC1xlak2f5t8DARcxJkGzSvTXHRfet9TUz60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714469232; c=relaxed/simple;
	bh=xAjHBhW5G9x0pVHnYlKzO2XdfWKpzJvrtWMvXKHGP44=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=aWIDZK+g3UkN41HA6N88bRzOtlvwLF3yfawq6Pvw0eQ6bO/HV39Hv5gKpYJ3pTV6lzI/A2/f5CC6EuDeI4G+lqkYowkeeNsgqQ9InsdnVNrHe+him9erepvpeYFaZ8J5P4vkbbu31ck7ywvx70Hhb1eVPg7SflZLtwytFKyM2tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=eRF+cqcD; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-516d3a470d5so6754496e87.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Apr 2024 02:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1714469229; x=1715074029; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HisHiVQGKfq5Qf2qSm14t1Am2lK9Nhtd7sYyAIDnp7s=;
        b=eRF+cqcD/74yq/aDqDIvUqdRTVzm78B7pff+7+c5K9eLTh6dyK87EZ6tCvTfdQQy8o
         9bbh+k7G13aYxs9W8o0U571aODJWXVgVdoL/v6NpFx1xyGRS9CneZukGFtv6r2/MFjmt
         LFvsqSClcYX44j3zmORqDzKwTfL5dpZGGbaZrjkvmaPPcKW7I0JE+nzJbVCFBVSqlNU3
         lwTDxY1OX8SZLq8QPDSWvFi6Ww+DsvBpsL5kuhlbsH6zYSJlwVVm+8hOIbaflx7TFnJw
         bo19XPEPQjivHEPbfvkMwiBjJaB4OGvC8q74xXWOxDn6Y7C+adM/dEReDWIz/eB/c8cs
         KWtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714469229; x=1715074029;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HisHiVQGKfq5Qf2qSm14t1Am2lK9Nhtd7sYyAIDnp7s=;
        b=Ddd4hgLfhkAlbdAHYCT26hn/VFB+I53Mbtio9XFuP9ogjOoXKXIBEAAM7UMMjGFVpT
         Pp6dx8RPvHKGam/vc/9iqgsV09xigg2YF2/mF/qx4s/LnDkz4O1SxMc7YZ3v4TCQOA3n
         fjq0W+cJv3e5IbeCxfgNbbFVL+5c/A/3RG9nu9muGTxMN1b8OfvWC90GTc8kPufkrMJg
         6SM1lP1j9SVZQ2Pb1ZOXosnhs9SGqyPTwBNqwENoTCly4qaklLhUw35Z9Jw8gVgUsZDs
         wgdq7NUWhyQRPONR/C1KxXutP1k7G+p++GGLzgnQVKdK9hojlnlFugNk5EWdAQIEGqF2
         UVXQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3qnh0CJzodcHmckRC50Jv+3b3x9vG5NBkdjAlPJYPq2A0IyIgXxgLtiD3avLvSxfAADX/MLWfxVjOu/lXIGt2NmxhTmidRs353t9a8DR7AGg=
X-Gm-Message-State: AOJu0YyxcofXMzNMhlj/6y0wRNpkQXate3I5qM0LB+dYjv18yQtPZ0rj
	Q7If06dNmpzOxY11PT/9lvU1iGZspI2iRwNsPsPnNkqpHW63rSasjYuuLcboDlo=
X-Google-Smtp-Source: AGHT+IF4mXAeWBqtm2dKYVvycB6lOTk+pmfqmDMR+Chfi6wfJeprlJ9UpCscbn4gZdES6ULMXWrEBg==
X-Received: by 2002:ac2:58d8:0:b0:51d:1239:21e8 with SMTP id u24-20020ac258d8000000b0051d123921e8mr5818763lfo.37.1714469228919;
        Tue, 30 Apr 2024 02:27:08 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.53])
        by smtp.gmail.com with ESMTPSA id y22-20020a0565123f1600b0051b64136e0esm2818510lfa.52.2024.04.30.02.27.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Apr 2024 02:27:08 -0700 (PDT)
Message-ID: <6f1ed4ca-617e-4618-a868-44de47aa3974@tuxon.dev>
Date: Tue, 30 Apr 2024 12:27:05 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mmc: renesas_sdhi: Set the SDBUF after reset
Content-Language: en-US
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, ulf.hansson@linaro.org,
 linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Hien Huynh <hien.huynh.px@renesas.com>
References: <20240410135416.2139173-1-claudiu.beznea.uj@bp.renesas.com>
 <h2fhduxr5bv3m7vkxl2ga6pqkkv5mlzpwgk2q6lfsnz3l63ckk@pyzj2vt4jkfw>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <h2fhduxr5bv3m7vkxl2ga6pqkkv5mlzpwgk2q6lfsnz3l63ckk@pyzj2vt4jkfw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Wolfram,

On 30.04.2024 12:10, Wolfram Sang wrote:
> Hi Claudiu,
> 
> On Wed, Apr 10, 2024 at 04:54:16PM +0300, Claudiu Beznea wrote:
>> For development purpose, renesas_sdhi_probe() could be called w/
>> dma_ops = NULL to force the usage of PIO mode. In this case the
>> renesas_sdhi_enable_dma() will not be called before transferring data.
>>
>> If renesas_sdhi_enable_dma() is not called, renesas_sdhi_clk_enable()
>> call from renesas_sdhi_probe() will configure SDBUF by calling the
>> renesas_sdhi_sdbuf_width() function, but then SDBUF will be reset in
>> tmio_mmc_host_probe() when calling tmio_mmc_reset() though host->reset().
>> If SDBUF is zero the data transfer will not work in PIO mode for RZ/G3S.
>>
>> To fix this call again the renesas_sdhi_sdbuf_width(host, 16) in
>> renesas_sdhi_reset(). The call of renesas_sdhi_sdbuf_width() was not
>> removed from renesas_sdhi_clk_enable() as the host->reset() is optional.
> 
> So, I tried to find a place where we would need only one call to
> renesas_sdhi_sdbuf_width() but I also couldn't find a sweet spot. So,
> this approach seems also best to me.
> 
>> +
>> +			/*
>> +			 * In case the controller works in PIO mode the SDBUF
>> +			 * needs to be set as its reset value is zero.
>> +			 */
> 
> But I think we can shorten the above comment to something like:
> 
> 			/* Ensure default value for this driver */
>> +			renesas_sdhi_sdbuf_width(host, 16);
> 
> D'accord?

Ok! I'm going to prepare a new version to change the comment.

Thank you,
Claudiu Beznea

> 
> Happy hacking,
> 
>    Wolfram
> 


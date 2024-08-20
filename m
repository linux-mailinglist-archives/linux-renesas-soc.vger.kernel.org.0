Return-Path: <linux-renesas-soc+bounces-7938-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 582C9957FAF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Aug 2024 09:32:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8ACAB1C210D8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Aug 2024 07:32:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F512148301;
	Tue, 20 Aug 2024 07:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="mxqQwMDK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F0418E37B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Aug 2024 07:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724139156; cv=none; b=ldwpRHQaTkNWf/Ij3h7QCA14BZ/ULDG5QlG+14tsl5DVqRorKq7Y/sGwZ7qjwMjGDjlhhkTZV8KaE7hLRiERgOuJYM8QXTEEECVwGHVrnkP45M6tw1FutsUhko75VpIk2dXxbEdx9dmfmeofy0+WkOKh3BEb23Afhp3TnwLrH48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724139156; c=relaxed/simple;
	bh=T37XdcPAhagA4eDYDownsf2XsJs98bfRZyVq01bf9Dc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=owXcQFVSHkcqW2n5mGJ0LLkGJBeQNB4QNf5jHH9v6gf0YOMjmzw3TqtXhzULOs6qzK554SG3gDbIlKj66C+zZfyX38b2x53WwgWy26Hp6VyX9dVZKue1Q7/bZLVCuBk5AG54ylC64TQ+r2A6NUcM165pIoqioJomlBXV9LSe2G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=mxqQwMDK; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a8647056026so65539466b.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Aug 2024 00:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724139153; x=1724743953; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KgM+QzWQcZ2DUZR7KveS9LeXc/9kicV430vfS4VSRd8=;
        b=mxqQwMDKDGJtlLjiZ0RXn9FN4PTZxtv2pBIBAv63tyosqE3FmvqCNe2+tdzS7YjRxu
         UJWwYs3HX6K9cj3TzyMndluDAxfEqi6cMg1sYzsXdUz2tv8P9EyDWkyH/p1c3ZXVhwST
         1TSImBRFTu7/d4K1vwVIfqMaaTMASDbzK5zxq6bZ4OvBUFlPo1eObBTwPerp/LsUbrbW
         TI6XjM7iBXgz8b7Iz4hXAVcpKAwFXcb/kkgpz1Q4xu9rNn+Lo3O5W2o7KG36U6hFxVpf
         wR1ZFxpAlvOsKernWb1pBiaUGFqfCqH6JXS6awIMF41zr6nfuuulaKOL4iEh9V54tNen
         vs3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724139153; x=1724743953;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KgM+QzWQcZ2DUZR7KveS9LeXc/9kicV430vfS4VSRd8=;
        b=U63TFLsWaaeTsJEWY9UgywTvGvZlXDSKnMmlFiSQOTAoN6MJF2dHK8sJpb2WzlkD2/
         Jfws/XqhhcHdFV/aDQBhu2ze+CyRLZHBrZiSiK5MhY3XeRIxItFG6eFoozjzNECDCUWM
         XuMaD36l8gaF1I4M4fFmFkEbIkIWDQd6SNtu7KrmJVqilGWHMi3Okume6YpyWY6CUZ31
         eaY8G1vZOB244uPJYpiF303HCgnL18l90nQQCLAjLiAXvZsvygmq8tr4y0wrUU5kCZ1f
         1EUE0isA5WCBHaQaGWZPMFZbXwXLYrBJgpf9/IMVwOHtS2gUfvkYbDmKPBzCESLLaqw6
         2WEw==
X-Forwarded-Encrypted: i=1; AJvYcCVYaHIu8R0wUClMsY3LVqphpljnXXhlmHFd0ufz8uzw4CBtNeWPPcVRSSgruNMtYZYJKoORxFmZ2OowWFk5qTHWhw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/5J6g3V/lZX+eHRGFb05CPDhLaPYoaJlLtfe1hOY/n/5zCMQ8
	IOhMtqdllXj4Gvfmp5Oq91RfJ4j9C9rKfGI06RgFbWWhIa+ZGiACinUQUquMN2M=
X-Google-Smtp-Source: AGHT+IHkyNt7DNdr1FwUFXM1w0JBcq+qGUSMD1P8jHKB+jsefPksVAXH7weJcswaTpOC3d6flO3v/w==
X-Received: by 2002:a17:907:c7c5:b0:a7d:26ff:aeb0 with SMTP id a640c23a62f3a-a8392952665mr895469166b.30.1724139152450;
        Tue, 20 Aug 2024 00:32:32 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83839471c0sm726532466b.182.2024.08.20.00.32.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2024 00:32:32 -0700 (PDT)
Message-ID: <96265c60-5b16-4a02-a991-ac0e06f7baf3@tuxon.dev>
Date: Tue, 20 Aug 2024 10:32:29 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/11] i2c: riic: Add support for fast mode plus
Content-Language: en-US
To: Andi Shyti <andi.shyti@kernel.org>
Cc: chris.brandt@renesas.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
 p.zabel@pengutronix.de, wsa+renesas@sang-engineering.com,
 linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240819102348.1592171-1-claudiu.beznea.uj@bp.renesas.com>
 <20240819102348.1592171-9-claudiu.beznea.uj@bp.renesas.com>
 <hu4yt2a7ipxrqd7ciqqyg4izei2dr7yerpgf7j53quepxj4ed6@gzlv7l3etpqb>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <hu4yt2a7ipxrqd7ciqqyg4izei2dr7yerpgf7j53quepxj4ed6@gzlv7l3etpqb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Andi,

On 19.08.2024 23:12, Andi Shyti wrote:
> Hi Claudiu,
> 
> ...
> 
>>  struct riic_dev {
>> @@ -311,11 +315,14 @@ static int riic_init_hw(struct riic_dev *riic)
>>  	int total_ticks, cks, brl, brh;
>>  	struct i2c_timings *t = &riic->i2c_t;
>>  	struct device *dev = riic->adapter.dev.parent;
>> +	const struct riic_of_data *info = riic->info;
> 
> Because you are only using info->fast_mode_plus, perhaps you can
> directly take:
> 
> 	fast_mode_plus = riic->info->fast_mode_plus;
> 
> and you make it even more compact.
> 
>>  
>> -	if (t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ) {
>> +	if ((!info->fast_mode_plus && t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ) ||
>> +	    (info->fast_mode_plus && t->bus_freq_hz > I2C_MAX_FAST_MODE_PLUS_FREQ)) {
>>  		dev_err(&riic->adapter.dev,
>> -			"unsupported bus speed (%dHz). %d max\n",
>> -			t->bus_freq_hz, I2C_MAX_FAST_MODE_FREQ);
>> +			"unsupported bus speed (%dHz). %d max\n", t->bus_freq_hz,
> 
> super nitpick: can you please put t->bus_freq_hz on a new line,
> it looks better to either have everything put in columns or not.
> 
>> +			info->fast_mode_plus ? I2C_MAX_FAST_MODE_PLUS_FREQ :
>> +			I2C_MAX_FAST_MODE_FREQ);
> 
> another super-nitpick: can you please align
> I2C_MAX_FAST_MODE_PLUS_FREQ with I2C_MAX_FAST_MODE_FREQ? It makes
> more clear that there is a "? ... :" statement.

I'll adjust everything as suggested.

Thank you,
Claudiu Beznea

> 
> Thanks,
> Andi
> 
>>  		return -EINVAL;
>>  	}


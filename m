Return-Path: <linux-renesas-soc+bounces-14925-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CED3A736E3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Mar 2025 17:35:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 987217A69AB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Mar 2025 16:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40C6419F111;
	Thu, 27 Mar 2025 16:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Es4wJgpW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5932219ADBA
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Mar 2025 16:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743093306; cv=none; b=MPijDl1v4ToKdpRHIFPNiQGph1i5361Sgr9DNTtJiUDLw89/uv9DoekiXoB6CCh9KguFnrw+bZNxWd/c4cNhD+zpx7Pb77Wd10caYm5E70uzKUdCnbgZLxmA9ORWk5afqJ5igCAf8Gp0wGbQ3FvGBjFXbASqw+I7RYxC5tX80n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743093306; c=relaxed/simple;
	bh=yrLrJ07jSyEkRNOIGSnIx6UIH6SW0uwq2gx5Xt6MpTw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GYW/GNL+tym5tj9C22A5+NH+bk4CB1GtZbFmtMuddc5duKBDdp1XqelLrvUVig6Ki46cXxWubIB+WH39qQ9igfVTY6BBpZvCbqmwp1KzKgOVpwI7XaMkYT16KnIJxb8sQ1O9K0PzRbCS34rs3qS08hK+Ec1uYjIceIGqcU6/2uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Es4wJgpW; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43d0782d787so9200685e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Mar 2025 09:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1743093301; x=1743698101; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GGjDGhXvhOctDrW1nI1udXGMONQSxA0lH5by2Ntn0tg=;
        b=Es4wJgpWTP8jzV/2d74v1syhkB6P/YbPKpMSQpi+7LHCy3AmT1Hdh+jh8vz4xdzbUp
         2TLKwxYc81UpK8LTlzqTw5tLbjKtsxOrkbAXhZB5v31/tl+UH60puHzPQJ9SMSvpRHLG
         TgbP+GOmJCIPLWmiPdTNy2PJnCEhAYJB3Ss+eM7HNNNePe1AzN+O6VFGCaL1wmyrPsEG
         Ged4/X6chrEGM9B8V9FLwpuNzpyoeYwVMmJb1HLh5ahDDeR4o4ouM/6T/+xDKj4JR00r
         Zhd7HBSIFYaNzZ5xB7DbfadSmxhwgTkKjRLE+cquz6cvQs8jsZIIESTMYDDYfFhsnyBr
         PVqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743093301; x=1743698101;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GGjDGhXvhOctDrW1nI1udXGMONQSxA0lH5by2Ntn0tg=;
        b=xSnWyT3iATrQ+KnPHAih8emAY4JVF+9XtyVBr6XpsJWjPYJ+Dj4zzM0M1s8QZwDGNM
         X/mlSnuC9fF95hgjLTMnSXGnJ43215IoqBgq6uspJLHma1RRfg8BEx0q5SaV7Bb4lJJC
         rWO4KWYp+y8v7O/fQACc7ococeTSl9r+c0Q9jYDziz+xrl+G2niDh6IAW8LTUddzJTk1
         vE6fztkacqLuF0ovhDnxRrdhCYkPq5+WTfTgrVoHPs/rbCQ//Ymkr46wRcvHvPMpo8gr
         /7iHAHhISssCi6FkT/F384wH6mXlW6JM+A2djfjV+KxmP5loix5jmPs8SBaNOC2dImBV
         LM5A==
X-Forwarded-Encrypted: i=1; AJvYcCVO1ctxlGkAR2gejRSQTCON0DZviQYzeBOrOoYH0qQpN80t2aH2pjmGJTWUMyTzFiwuG5alzUgaF7OTeICJ9ZNf6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbaAmG7QqSW6twYXvzWxHV4MXHkJlTHHFMRiLad90keRQefnKU
	mHAnex3/eoMIcrutMA35Nhw+Suy7bGI+37nWgSSFZMBOyM8Btr98FrZBVBJZMcI=
X-Gm-Gg: ASbGncuFAB7xu4UMh8l/gKYhJGsIEW4EGJdPSLwmb2B8hnxnenLElQy5p4JjfXw9OKZ
	dYJpN9T64UCkuXpJZ6A4QZFbLxiNp9xPRSl+c7cXevUIvycFS12kwxeOs43X4Tmj//1kuZgIa5p
	Pnx5X+tVm/eIxBDXmMFlJt6GTasTsQELEet2PFaPbO02ME1s9NELRStNMDdyB1QKMiggV9p/h0e
	VXpKKAIBZjHI/neiP1jXfY+ZtU/CzeXtgJUm+/2Y7+Z82V7/4Ugz+WsbjUX2qwyCoQ6dxEc5ZYP
	+OYuOC5O4z0YGPSU2wH2+bGfMjzo7HPZ55DyhLuJLvhW13Em8ww0y23UPf1J+mL8
X-Google-Smtp-Source: AGHT+IGawtvFBb4fS5ToIj7CyXU2x5hbH3B/DoIrPXE5LcvhbfIugmJW/IZ0c8unwGyuVy6PG4hKmQ==
X-Received: by 2002:a05:600c:3ba1:b0:43c:ef55:f1e8 with SMTP id 5b1f17b1804b1-43d84fb5ffdmr36069095e9.13.1743093301462;
        Thu, 27 Mar 2025 09:35:01 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d7ae6a206sm39611675e9.0.2025.03.27.09.35.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 09:35:00 -0700 (PDT)
Message-ID: <a66f3c88-0fe7-4e9c-83cd-1fe4bca8b14e@tuxon.dev>
Date: Thu, 27 Mar 2025 18:34:59 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] iio: rzg2l_adc: Cleanups for rzg2l_adc driver
To: Jonathan Cameron <jic23@kernel.org>
Cc: prabhakar.mahadev-lad.rj@bp.renesas.com, lars@metafoo.de,
 linux-iio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, gregkh@linuxfoundation.org
References: <20250324122627.32336-1-claudiu.beznea.uj@bp.renesas.com>
 <20250327153845.6ab73574@jic23-huawei>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250327153845.6ab73574@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Jonathan,

On 27.03.2025 17:38, Jonathan Cameron wrote:
> On Mon, 24 Mar 2025 14:26:25 +0200
> Claudiu <claudiu.beznea@tuxon.dev> wrote:
> 
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Hi,
>>
>> Series adds some cleanups for the RZ/G2L ADC driver after the support
>> for the RZ/G3S SoC.
> 
> This doesn't address Dmitry's comment or highlight the outstanding
> question he had to Greg KH on v3.  
> I appreciate you want to get this fixed but I'd rather we got
> it 'right' first time!

My bad. As there was no input on platform bus patch I though this is not
the desired way of going forward. Sorry for that.

> 
> Also, please make sure to +CC anyone who engaged with an earlier version.

Ok, will do it.

> 
> For reference of Greg if he sees this, Dmitry was expressing view that
> the fix belongs in the bus layer not the individual drivers.
> FWIW that feels like the right layer to me as well.

To me, too.

Thank you,
Claudiu

> 
> https://lore.kernel.org/all/Z8k8lDxA53gUJa0n@google.com/#t
> 
> Jonathan
> 
> 
> 
>>
>> Thank you,
>> Claudiu Beznea
>>
>> Changes in v4:
>> - open the devres group in its own function and rename the
>>   rzg2l_adc_probe() to rzg2l_adc_probe_helper() to have simpler code
>> - collected tags
>>
>> Changes in v3:
>> - in patch 2/2 use a devres group for all the devm resources
>>   acquired in the driver's probe
>>
>> Changes in v2:
>> - updated cover letter
>> - collected tags
>> - updated patch 1/2 to drop devres APIs from the point the
>>   runtime PM is enabled
>>
>> Claudiu Beznea (2):
>>   iio: adc: rzg2l_adc: Open a devres group
>>   iio: adc: rzg2l: Cleanup suspend/resume path
>>
>>  drivers/iio/adc/rzg2l_adc.c | 67 +++++++++++++++++++++++++------------
>>  1 file changed, 45 insertions(+), 22 deletions(-)
>>
> 



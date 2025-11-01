Return-Path: <linux-renesas-soc+bounces-23987-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B9FC28139
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 01 Nov 2025 16:00:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 770DC188B3EA
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  1 Nov 2025 15:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18DA2221FDA;
	Sat,  1 Nov 2025 15:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="h0B+Iq8E"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A14F288D0
	for <linux-renesas-soc@vger.kernel.org>; Sat,  1 Nov 2025 15:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762009237; cv=none; b=EZYEk8sy+PJ6lUiqKYIUnPF8Vwam1NzgdUNTMZVTm/PJJycVlKyF/Nbv0pftf0+yTlbRvXEBwDw7onqjS6GQI6l0jecE7W03avL/iPQY399m0N4ewa3CMUzYbofJuGPvy9VZLBaMx6UuelEXoHJssxpTSHKJELX57cY7DxiFcXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762009237; c=relaxed/simple;
	bh=K3/b3jr5SBSHHuWefiHTx21BlqOp5dw/wmKirB+uwkw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AuDvbho11hjyuQ+dneG+9CZKANvF+A4lBi47G6S1QZVJIAqsBePk9LrL0K85E+jlD2ou9RO03N6LEhciEe1mLZgarBACqUM72F+7kArXrzzIvXuomUpQx5u9APgsaRNXTFteU23W2k71qb34iN9JBXKAjuGXem7/z+bnFbwcNGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=h0B+Iq8E; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-429c7e438a8so481470f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 01 Nov 2025 08:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1762009232; x=1762614032; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J6g7/oxMyVMxygIoIjYSwO2RhZz+LTOeAZEKc76K6rk=;
        b=h0B+Iq8EMiI/uM3RZAgX45is0ksIrBB3vVl2jGbikXyVBEBEbbMt8OTwIgXqiaqnE0
         ucs3LLV6JzdaTbnxiu/RMFrKA9kQuTPdIX6agE7JSwIxKk+qitDmLXBNKG0fNT/GNADx
         4bmOgFiKdPRcOi+PcPAlqputBur/EAoS542l14bbEgiEhhOojXo3/LgelpSc/Kz1UYuC
         LaBooIMxJyL7BRhmNS+KcrDwlmfarj5GY3GqTniR8XSAM45v7j3i6glrMDuTo9AwHh04
         Lou4BD/aS4+AikEEfujubsUCw7OJFlL0R4tYUh3baCO5Lr4MUnlyw0rgNKGBGvM9SBP9
         FOBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762009232; x=1762614032;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J6g7/oxMyVMxygIoIjYSwO2RhZz+LTOeAZEKc76K6rk=;
        b=KpBeoYOBiFki+DEVlewpzzX+I/5PU+d4X4QXHn2DedKrhVBKkggcjVycgB7PtktvlQ
         nHt5FefY0JT5nTEIndtU8Qe7/Wn/TFF1y0/MBldPbyeuMjwS07daRYTDtKue1u5Vu9bA
         klFSxxn0Z1Z4fIijG65XZgi9z/xIG56XiDumRFQCfzzBNZk/AnDTPWRL0yMxu147mjVm
         T1+rrTfuxRbkJbMRj4WQyzST9voBk/ex1umkuZmaEevwRlt/CZz+7ESg4VPxDqBTQp2I
         YvKlBqqhC9uUz382+WdH05gAzhWpbSToJhNFDpqsC9GIzexkoRLc0DRDK5PQDj0ZF5jI
         TgXQ==
X-Forwarded-Encrypted: i=1; AJvYcCULgmtp3ogJY4Eso9CYY20GRSJergHZHjbt9p526jrMqNhkxpBnjf4v2+bOquCvG2hiKmQiNGNbKrAUUyQaReAgAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmOAigZuiwwK/6GFhsqWONj3VTFzFom4Yktv0d1Vt6MZT+xAJq
	47Pc6ayZdZRRAaQZ0NSjcDIyYTqdruh1YVlOaD59aL78U17djpV6MiG22wPJRzqJmH0=
X-Gm-Gg: ASbGnctb7LPZh0TiWwKS0+3xcDVxKupCsbNqP7PAT4NygZj0Ea6mZWf72rVVYI3r4Mq
	sA5n8KlslJD3QFpzuLjvZ/foPPOVsSZBnQ63wdlUSB7spghi1um4BBDjVkYt5nQvXw/XQFMb8hj
	lGQ//ccE7MwxWJtLs4E0hb4I2cr2qwezW7yAZiF583KRXu56zAEoxkMgkNpy0udqMp0BQ5nRJs8
	l4snodITj+nccNBG43uXoF6Ei0kLxHxtc7D1lnZZmaI/SJwRl3ZraWbq7tOHcL4Eza+SfGECvbc
	6ik129Pt/YFWzQptR8M15A8EfN3cO5bt05KHALhKVTSC9Qxm84ddn44yfA4+TwlX5B/rAjvUPSX
	aEp8V3QcW/BeUshvVESELczucVdB09RpepRjGvaStjHKoKoJPzXR9T2cjjtT6VjfsBtwlI0u2gc
	uKQVo/fpce
X-Google-Smtp-Source: AGHT+IFIRiQVA75Sc+kE1CPWUk4PiMBnedhmmWdsH1gtnnIcarCQEzcyI5Zta9nGlQH0Yr7n0uCFuA==
X-Received: by 2002:a5d:5f87:0:b0:428:55f2:be4b with SMTP id ffacd0b85a97d-429bd6a4c29mr7851522f8f.38.1762009232556;
        Sat, 01 Nov 2025 08:00:32 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c13f3278sm9347526f8f.42.2025.11.01.08.00.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Nov 2025 08:00:32 -0700 (PDT)
Message-ID: <12f2e17e-15ee-40d3-90c6-e8e210b7da2e@tuxon.dev>
Date: Sat, 1 Nov 2025 17:00:30 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] rtc: renesas-rtca3: stop setting max_user_freq
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Joshua Kinard <linux@kumba.dev>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20251101-max_user_freq-v1-0-c9a274fd6883@bootlin.com>
 <20251101-max_user_freq-v1-4-c9a274fd6883@bootlin.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20251101-max_user_freq-v1-4-c9a274fd6883@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/1/25 02:45, Alexandre Belloni wrote:
> max_user_freq has not been related to the hardware RTC since commit
> 6610e0893b8b ("RTC: Rework RTC code to use timerqueue for events"). Stop
> setting it from individual driver to avoid confusing new contributors.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

> ---
>  drivers/rtc/rtc-renesas-rtca3.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-renesas-rtca3.c b/drivers/rtc/rtc-renesas-rtca3.c
> index ab816bdf0d77..a238ead6cf1a 100644
> --- a/drivers/rtc/rtc-renesas-rtca3.c
> +++ b/drivers/rtc/rtc-renesas-rtca3.c
> @@ -772,7 +772,6 @@ static int rtca3_probe(struct platform_device *pdev)
>  		return PTR_ERR(priv->rtc_dev);
>  
>  	priv->rtc_dev->ops = &rtca3_ops;
> -	priv->rtc_dev->max_user_freq = 256;
>  	priv->rtc_dev->range_min = RTC_TIMESTAMP_BEGIN_2000;
>  	priv->rtc_dev->range_max = RTC_TIMESTAMP_END_2099;
>  
> 



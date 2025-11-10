Return-Path: <linux-renesas-soc+bounces-24378-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEE4C46658
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 12:54:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 315E91881887
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 11:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BD80309EF7;
	Mon, 10 Nov 2025 11:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xp20MxYh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B692FCC0F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 11:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762775672; cv=none; b=HVacOZGFT5tvRyO3raUwN6hy4IwbXpSBAuqGXNbZa0b0ioyPIs/hCyW6IPwZtBsLU4KXt6eRVra/Y8zF2t9/hZBXNEN5CCoeyZ4qd95x/Zp1mC841dUUC0L1PJYhoI9ATfs/lLQSO0YV71ud72OIl92bJaPkt0u8L6Shaxbtbq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762775672; c=relaxed/simple;
	bh=m14UuhQAtTVkGBGRwXQgis+qG89w5J+jO0n0Pjk8p18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ajr6y8s5yUqtKIb5n5UKv5OUSOaY/6YtMVus7hOzibUQO5uXUc+wbUfl7BswUorK2DtqhM9xt6KCk5IXhy1OzD1ELdw1ICejiYfZ0EyHEuC3niaAnlv6MLTxyTdQ56HaDklw04odBKvEIyPX2pBQAN4Z2g+6hJnZEV6j5rS7k3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xp20MxYh; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-429c7e438a8so2563179f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 03:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762775669; x=1763380469; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EMD9+URtcaUjSQn0X74/mQzArg3218Yo/nyvQktn/2A=;
        b=xp20MxYhf4/JtLImqEftv3pnj4AAIrYmDUNT2xh7nHegqxXXuMj/uhUKP4N/wvp+f6
         mVYd18RDVtuDRtrNbR0qgeOoqen/ZbkrBDzKcNND17EkqQaag406B0zbGsbVI0Tc/2QU
         zwKQIJgR1qfE0gfGFEbH+ZnisyGimfA7aY14c+LZVpdTrCXEQOS0UbmdsiuLftX3OgpW
         zCLgwNMVakguD3LPCh9NS5Q1V8SPobuQ1qd1B5Jph3/pR6wk6x/L5Ng49W77KoW91YKl
         Ro5E/X5yWhTeDV8ax4hSHweyeQSP0lHNSh2xT7JQZwWEGMOF/hJxZJg2UUh1yh4KhgFf
         H4EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762775669; x=1763380469;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EMD9+URtcaUjSQn0X74/mQzArg3218Yo/nyvQktn/2A=;
        b=UrfPi15V1OhgcszoikvSp8MIval0aQ8/2aIehcw1XhiIX6lUMEb+L2HPH93Ho2bLHO
         2XxhUDhGqTuMaPi6Kp3a+x8WRpGaPbs5oXa0axGTFJivaZ9U3mrDI3kP46qAZdMB0EzD
         NgDCnMzxxAljV3Fs+LJdmUzhi0dD+c5QO7NxyNagRGA2QGooTdQ274B+QXlWXB4NgANx
         q8bChRm2zpnr3BCYvwzOh7f+XSoeE3oumtgJnCZQI1ECvFF6FjdoJp3UdJ7mIoxBBksV
         NycCSzHRfLOtIjER4smFgxd8fvC4yIbn9AZZI9liR63zfGvCD+ebGSUBaKVRQ4utgMbe
         8MEw==
X-Forwarded-Encrypted: i=1; AJvYcCVRTp3VPTEGeZTry3CRakE/MZz+pMEU+bNez/1F1S48G+eF93D7TMT54/5A0GK1ViRRh/pBW9TLXD9YMxsyLbg02A==@vger.kernel.org
X-Gm-Message-State: AOJu0YynWabpIDNABGKzkGmEGfNCjzPQAR61miTBJUGHgdDQ+8jeGJVE
	73iWp6qEedia37/sUb9zH0ZCGgJNb5CfLl6A24P4Y2hn9Dz3d9SxF3xkqCaaORY1iqo=
X-Gm-Gg: ASbGncu3re2Msrp9Uwjh7ii4jhXpv25XnvsevqbLLYk6nBMOaquJo/ouV+IBp9XMdMY
	cW51yfKKAush5y2GbDfKNk30285rSDO1xEJtGele6Biuq3nCr9VSbxh0hZFMllsOBfOmU6I4lFo
	N5zMZVXEQWdOHNUsU0ODcSQ3oIvPa6p/oYOoNFTiKoZ0+T/RE80yxD5sCkCMkPR3m0wGU7RVKk5
	1CUudYZamq7AQQ8hvRyrzx2hjahELLPGBg6DhbgJS3S4mQrz+fIhzzrVwcvlgvP18Dfd3qI1CMz
	UB4n6fc7OFBs9Yi0Zct+1Ga1aitCvjo1UZTWBkU+k1WV50UVNtHnwrd+CjumJl+0WQNWzD9DHta
	fXCm+Bb0/6f48kIGRp33zAbdYo60MMtW0KbFwtst5q+/dTFlniN1Vv6SqOcazgtddwmHokwjG68
	EBK823BtcF18zKzgFrs9MBrq5W7P4fgslgFXRKEmYJLWc/ILLc60CU0BTcoVtCaohEk8JxsPihf
	E0y
X-Google-Smtp-Source: AGHT+IFt7FkGrjUGlQOSv30PcOTuYAg+G2jnyYcbkEOUdx4PafX6+NozVe5jVhG/6PDgSwaF9ZS0xA==
X-Received: by 2002:a05:6000:2dc6:b0:42b:3746:3b82 with SMTP id ffacd0b85a97d-42b3746406cmr3612494f8f.54.1762775668787;
        Mon, 10 Nov 2025 03:54:28 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:2b20:d700:6e9c:533c? ([2a05:6e02:1041:c10:2b20:d700:6e9c:533c])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42b30dd4d86sm13217556f8f.26.2025.11.10.03.54.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 03:54:28 -0800 (PST)
Message-ID: <8f4e2705-6174-462d-9160-6723c28ea08a@linaro.org>
Date: Mon, 10 Nov 2025 12:54:27 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] thermal/drivers/rcar_gen3: Document R-Car Gen4 and
 RZ/G2 support in driver comment
To: Marek Vasut <marek.vasut@mailbox.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Lukasz Luba <lukasz.luba@arm.com>, Magnus Damm <magnus.damm@gmail.com>,
 Zhang Rui <rui.zhang@intel.com>, linux-renesas-soc@vger.kernel.org
References: <20251015155905.186612-1-marek.vasut+renesas@mailbox.org>
 <20251015173303.GA607688@ragnatech.se>
 <48f394d9-69d4-449b-8478-f2f24b230e94@mailbox.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <48f394d9-69d4-449b-8478-f2f24b230e94@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Hi Marek,

On 10/15/25 20:11, Marek Vasut wrote:
> On 10/15/25 7:33 PM, Niklas Söderlund wrote:
> 
> Hello Niklas,
> 
>>> - *  R-Car Gen3 THS thermal sensor driver
>>> + *  R-Car Gen3/Gen4 and RZ/G2 THS thermal sensor driver
>>
>> Super nit: I would write "Gen3, Gen4 and RZ/...". Compared to v1 you
>> updated the commit message not the comment here. Not a big deal all the
>> information is there.
> 
> Like this, right ? I will include that in V3, thanks:

Did you send the V3 ? Not sure if I missed it or if you had no time to 
send it yet


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


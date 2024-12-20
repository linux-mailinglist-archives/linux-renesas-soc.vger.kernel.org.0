Return-Path: <linux-renesas-soc+bounces-11656-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9719F9555
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 16:23:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0439161E72
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 15:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5F25215713;
	Fri, 20 Dec 2024 15:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bb0JCuxN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6682AE8D;
	Fri, 20 Dec 2024 15:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734708208; cv=none; b=FnLiUUBe0im3hdz0fWrA60Ki89VrjZWtI77NEvUIrxgA/BgR0vgXNVWOn47B6WOV0TtFc6LuMbtgZtV5YIPVQsyNWqdhwKJF1tXW2jFdznCCDAc4d9tUMUtWlJnmGYcNDgnLC63zq2IUMmFzfYJ9VykmU164NdFg/OvFkVAP1EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734708208; c=relaxed/simple;
	bh=4NPWQX1TUCxx4P0MpQf8hiCs5xoYtgmV1AvamYOWUqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RLvnMXXTXtaihjIvlAZ49h0voJuMCXf8dXKQD9ZHa096YO6BcF2eNZo3DOkgclYs40+8Fo89zj2lkurwKnPTqj4imn+6cWJdsZa9PdhlZzsVYEmNgf2b9FhvpmS0tP8qtIWwBx7UOacTZuIpJYDtsmMirLBhUKzYjeGukqJjQ24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bb0JCuxN; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2eeb4d643a5so1911506a91.3;
        Fri, 20 Dec 2024 07:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734708205; x=1735313005; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=8iPFWYwSnImOXx3QAv8lECm/0WA2y1jYYWPcGukOggY=;
        b=Bb0JCuxNDO3dc37lsmsjaMc8qmRSPwv4gZRBryu4KVZ4K3f2k6ngLj+8NO+p+8pf4X
         A4fnGGCmxP2q/DWYzFsBnaBDY/n1gqaCyswXz1X/G1GVEMEbpU03r123tEtMnZtkgEIk
         qoa5Kmpyax1bBlDTKkUz6YTqDxbDpDUIPJG84orITLw2XQdwKoRW4+fTogwKZL/D8VIu
         JIlEvkxb54MlzPLNjm8XPZEmQ0AIPjf9p/3f0RfH8YFOR200G0Y8Wc8w3AbL1vrJVbVw
         QWAkO7mSglGRI241bH2AOeXngB5YbNJSY7i7kCT7afGPnnjAM7E8ESBpWi5w3sx3NBRD
         7Lmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734708205; x=1735313005;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8iPFWYwSnImOXx3QAv8lECm/0WA2y1jYYWPcGukOggY=;
        b=pJKKDEyoxq7t0eUI1ttOvhJdnaoCqpU74fDVgfmTQdyJIdc/YovRR62Z5btrWf98to
         uVJEweVR/BH2t6O1AmsC4osLQkL4w467j/ihtugsQhyM3g4Rx7rM3CSjuo4c4ItedOVC
         8TnicrEfdv1s8U84DjSsME0o/WSUN0Op/5N5cRf/4xIf0C6fbi5Q2fGPuDZ+pp+ORdCx
         LCFtEhNQVlVsYP0bv+D8q2OqIg56T2OI36Xm6Kr5Fs6Hrq+7vTIW/6T8W4efBlXj9hAT
         SwRDxiLvPL88HOzQIBCKydxGrOKKjZSfKuu2n+EIgcNGXhMId/vCW/Vk2QaGFvpLUwER
         fNiw==
X-Forwarded-Encrypted: i=1; AJvYcCWuHHyVKVhVxdSwiXJfR9rkAKmzzLHiZ43/aEsjHIJo+yY1GV89V6IUHf/8ewk2XPX6i/Tgqm73NRDYY8zIfmx64+E=@vger.kernel.org, AJvYcCXx8P+BRkK3gye7TtF10JD5Jt2FsI5DHFmF+3JFLXUuaVEkugvVcvzxpglWgtOY/6l6G39E0Mfxu7pImA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhHUzPE5BRsW8jndZU5NNIceiZiGnIjlkgm9N8qYmE+Zgapb7i
	yo1dg/dE2ekN2zYq6H4/DbkVfclQeOadHVXjx3XEjSPWkYeAq3hE
X-Gm-Gg: ASbGnctoxALGxWsrMCM3+JnfvCm1oGof+2HyqtN2DWvkIEzGZv7EGyo5XjMY8ePsI7o
	rQ4urjHYuUL6oIj2mIFezuJVzi8jUeEEyTlADLxkcjWIcYJTJeMt6UAXk/6uL5I2pQoZwZCoPxO
	Am4Qz/xYeA4H/Vh/PksYLJdbpSl/w8J9CL23fd2WIZcLZev0gMYt7TlGF1e/5wBkiBJC2BA8QEe
	J3ibqG6y2TU3F2TsS+Dj8ev/ruKa3Ec0Ety+XhReKfYJ9dV8OQTxgK4KLxu4yDyyBxqu2Cy+5qR
	zQWq60Kdm8pQyVv0DygIEXVl3KN5Pw==
X-Google-Smtp-Source: AGHT+IHoiZwRPLuYSTqA8my20rncpy74PmrSaGzWF3juLoh3u58Y0BkaC3G1GQcGkNxfLUUD9vOaJg==
X-Received: by 2002:a17:90b:2f0d:b0:2ea:83a0:47a5 with SMTP id 98e67ed59e1d1-2f452def236mr4959878a91.4.1734708205444;
        Fri, 20 Dec 2024 07:23:25 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f4478a9108sm3772373a91.43.2024.12.20.07.23.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 07:23:24 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6dd9970f-3a26-4088-a64f-3d10f6f43ef3@roeck-us.net>
Date: Fri, 20 Dec 2024 07:23:23 -0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 2/5] hwmon: (spd5118) Use generic parity calculation
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org
Cc: Yury Norov <yury.norov@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kuan-Wei Chiu <visitorckw@gmail.com>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org
References: <20241220113000.17537-1-wsa+renesas@sang-engineering.com>
 <20241220113000.17537-3-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241220113000.17537-3-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/20/24 03:29, Wolfram Sang wrote:
> Make use of the new generic helper for calculating the parity.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Kuan-Wei Chiu <visitorckw@gmail.com>

For the record:

Acked-by: Guenter Roeck <linux@roeck-us.net>

I don't care about the function name, so please retain the tags if/when
changing it.

Thanks,
Guenter

> ---
>   drivers/hwmon/spd5118.c | 8 +-------
>   1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
> index 6cee48a3e5c3..07ab3a47b00c 100644
> --- a/drivers/hwmon/spd5118.c
> +++ b/drivers/hwmon/spd5118.c
> @@ -291,12 +291,6 @@ static umode_t spd5118_is_visible(const void *_data, enum hwmon_sensor_types typ
>   	}
>   }
>   
> -static inline bool spd5118_parity8(u8 w)
> -{
> -	w ^= w >> 4;
> -	return (0x6996 >> (w & 0xf)) & 1;
> -}
> -
>   /*
>    * Bank and vendor id are 8-bit fields with seven data bits and odd parity.
>    * Vendor IDs 0 and 0x7f are invalid.
> @@ -304,7 +298,7 @@ static inline bool spd5118_parity8(u8 w)
>    */
>   static bool spd5118_vendor_valid(u8 bank, u8 id)
>   {
> -	if (!spd5118_parity8(bank) || !spd5118_parity8(id))
> +	if (get_parity8(bank) == 0 || get_parity8(id) == 0)
>   		return false;
>   
>   	id &= 0x7f;



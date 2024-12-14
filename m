Return-Path: <linux-renesas-soc+bounces-11344-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 285089F1F3C
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Dec 2024 15:19:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8535D18868B4
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Dec 2024 14:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F718191F66;
	Sat, 14 Dec 2024 14:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CPqz+uA2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F9C653;
	Sat, 14 Dec 2024 14:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734185961; cv=none; b=c8J+ODr/VoxKo6t9CMky1kiLkIB2E/D7AqwGjfz1b1HWE3ZkP3fwGMLebTjFrNb+ueh2jCMop7NoLRikQfByGAnO34Bz1xl6hDeG+zJkRa7PeZ/EhEsYIHXt0u76kIRZ9Jjk86Pg1VonhYMKQI1f2YwvWXGzLhBrWhFz5EjIpDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734185961; c=relaxed/simple;
	bh=25RasokLyChhOVVT2Chv9e9Q+gGQ31N19UM+0O9sjZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gG+nPideSgI6BUx2Mt9HBUcXDgQFrYednK+SpXEZt3zLEkl67U22HX4jEWCn5pwN28Rokvbr4nzlpig76md76gP7CG3ziumdNaqcz91heEivYT8/61dfE1+lJX6Yd0YC6giD1+3x0itQOZkx1w2nSz5oSHg3lSSmaI8cj6PiUvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CPqz+uA2; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ee86a1a92dso1811033a91.1;
        Sat, 14 Dec 2024 06:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734185959; x=1734790759; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=yk5XBAk/i7wDHB6m8Y4uJ3Q0G9Do6PD2px0diyjbZA8=;
        b=CPqz+uA2tzw4Qtsz1OGy6n+FE281K73h5M/EQkGUqwCJQPcXgX2sP+WHEM987zcfJ+
         4cNqQLx4lDC1m6tOqt1iw2DY6mxmQWNRZU/JEjrF6YAEtHNuqcOhWbUPL3IXFpzAUxwZ
         JFqb6yJBv8p+cd2Hm3nV+wlvdJe3pK7H2+Pu8T6OKAA4nEb1ti5WBgDBy5Dz8onClTPJ
         ZTdxLPZZE3nagaN4G7nIQHOu1b34NQ7cLeMEyBiIQVowDzIZMJZi50debf5cpPiYM1PA
         dcseffXhc7UGwAA5Chxe/490FWCZRtN2fZXklv4QVjXuA/jhamLQKnKWsEHHRvj0HZaI
         VhoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734185959; x=1734790759;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yk5XBAk/i7wDHB6m8Y4uJ3Q0G9Do6PD2px0diyjbZA8=;
        b=ZKrJ8J3XWtHh+xllMUBZQ3Qfz4SkpLI3HQfQnOauzFyC3vU5ycLnKcKpxv9i1ope5P
         /N8MzKYOyqenv9nfEM+5UVL2Z6Fdcf58JzhQXuozMAbYW8dZZGUuEQQUM//3O5MHhfjD
         k2Dx4gCX6NPVNogsEMly9O0VM5aNjAzHwAPwZdbwoMckWvlhh/bi0rfIcWjdNh1orLe4
         DHWuu7k75c2kEHlWGHCr0ZAhzIA3RF4plxiI1/1KHJz2XJ+3DKbtVyqL55WRfVcePruK
         w4N46kZOsxc/9n4fjipXYQK3wc0wHzN8qjq8T1c1eNjx0mnKUFjFel72+kzCqr1uXQHL
         S3gw==
X-Forwarded-Encrypted: i=1; AJvYcCUlssUctWqitYK/OsFf/cFdA7vGOyGMbVmZxqXSehS2UwctyTD5G3sm0rJfAsrE04TYmRWl0fRyQaJ5t29VTB8GblM=@vger.kernel.org, AJvYcCXuKIcevXrcq43S/+fB/hzQcbfVpaxCPDgDpMVeRD6kHbvE2ICBRJJ/c/+/tC5flU28fG0KmxgQ7j30sQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1ybkfI2Y2Je0SQIzcfmVQalh7BuNRR2JWCxFyTDUzJRZTt73a
	Tq/TAHzfbBTryblSGF7RgxnBlUsam8TINGKSWVeOgLjiM6qYkUpt
X-Gm-Gg: ASbGncunwCqafJggsCpO1Pu9h3LfSXrhYDw5IfsSdcv+5hNOHtaun5uoIa5MHMCQ7vy
	xQIoKV9wn31akrZ9HXTGiV3I7V9OX4H2kMVuuq6Q0DmDcrKxT5XMYDZ+aCN8RK1iTN2pnibqvKn
	DA8r8lRGMAHTd01cuQZKGVdO/QQt0R4W0jz3MqhwxDO2L+GCAtwTr89GPYNOz3/6NCE2r5kNmAg
	I7hJsWaHvnZxEryxna98vE7BCnDX5EOcW14Bz/CskuVAkcu8NDLtkAaF+FAdRJFLRRMDZfvUzMj
	kFW51wV/jXJmcMKlTSAVD0hNAp3aTQ==
X-Google-Smtp-Source: AGHT+IEr3b421LIOwuq1Y2750TJ9EKSitYSrdGFp/R/ZrY0Ek2xjNdcszYxoifj35YNgK1fUXs7PdQ==
X-Received: by 2002:a17:90b:1c8f:b0:2ee:7a4f:9265 with SMTP id 98e67ed59e1d1-2f28fb6e8d0mr10476603a91.15.1734185959014;
        Sat, 14 Dec 2024 06:19:19 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142d90bbdsm4895387a91.1.2024.12.14.06.19.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Dec 2024 06:19:18 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6fec7aa8-32b4-47de-8fb5-4ab6890c1f46@roeck-us.net>
Date: Sat, 14 Dec 2024 06:19:16 -0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] bitops: add generic parity calculation for u8
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>
References: <20241214085833.8695-1-wsa+renesas@sang-engineering.com>
 <20241214085833.8695-2-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241214085833.8695-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/14/24 00:58, Wolfram Sang wrote:
> There are multiple open coded implementations for getting the parity of
> a byte in the kernel, even using different approaches. Take the pretty
> efficient version from SPD5118 driver and make it generally available by
> putting it into the bitops header. As long as there is just one parity
> calculation helper, the creation of a distinct 'parity.h' header was
> discarded. Also, the usage of hweight8() for architectures having a
> popcnt instruction is postponed until a use case within hot paths is
> desired. The motivation for this patch is the frequent use of odd parity
> in the I3C specification and to simplify drivers there.
> 
> Changes compared to the original SPD5118 version are the addition of
> kernel documentation, switching the return type from bool to int, and
> renaming the argument of the function.
> 

Curious: Why not bool ?

Thanks,
Guenter



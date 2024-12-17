Return-Path: <linux-renesas-soc+bounces-11467-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD8B9F4C29
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 14:28:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB753188118C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 13:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C7461F8EF4;
	Tue, 17 Dec 2024 13:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kTgZCAZC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FDE1F4263;
	Tue, 17 Dec 2024 13:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734441011; cv=none; b=oqSgBBw9dDmtdFVvX3fElxdgPEBrE7FIhWH7B+HBrtgxG0gPZ/zCeyHw5gTtjcPj71aQVMTbR27Ii7OpmAZ7qh9ipUhTEYw+Dz+MviiJF+zuTVwnpEQc/xFF1eEWIzmoo8heR3PGsoA+bKzsjNG7CKDs8oJl9OpCJuy0rB+jlvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734441011; c=relaxed/simple;
	bh=paE04F04/cMXXu+dIHzXBrCj5yuwcBZ9KEXGEcHwLQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fvZf0T+O/0dTvukWGIfkHq+mbanqThyX0cnTz51TDsttshCnB7GffDrMagYh0dDFzOfm6Saqvelb3y4DyhgVFX7I67vLGe4L2N5T+joAbH2BlwNr70BhrVg7uXSac3ZDuwob2s09sAD/SOE10JzNGyHo1oBh9fQUL1LLGPDmTbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kTgZCAZC; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7fd51285746so3071436a12.3;
        Tue, 17 Dec 2024 05:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734441009; x=1735045809; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=vuwM37PGyW3dpn6f1I1xO5BjNXaZCo2RQ40ZeUDh/Lk=;
        b=kTgZCAZCPPdhMwbSDMjiiBJt2Q66RMZFYiGCuqXjyvialH2KP0UD/fWdL4mwlJZleJ
         icNbTI3yuagBOHEJvVWrM3Sh5Yd4/lKFWKzZEc0aMMUNoTCZTN70PmIZPl5VdjJ3GBSs
         DvdkMjCc2NBs9ovk1qDLWuNUd1lEoNpfleKinrBYa8N9hbdnKFPguBivk6Hveo/0etiz
         T8BdMAHA5yb+POAyaosyD9eRae7ajZIbmVCjaEHt5PgH2bm1RSR7BFd0Rd4vK9ygsBdP
         OUR3IwB0B+IOdIvBxxvewUV1qzJaYg3Ft+Z/A+bf3ksv58ChekAhRwE03GdfBVhlvjj0
         c9Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734441009; x=1735045809;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vuwM37PGyW3dpn6f1I1xO5BjNXaZCo2RQ40ZeUDh/Lk=;
        b=ECJkYu4B0wvXqm7jVaibpnoFmSYR7chQynek6V9NxVW20dphrdssAZMSTn5z/KRwpX
         e927c+RFFPnwKCwigPgg52E529ovctQe3oFN3F2VoiXRC81kXxBN2K8I7ev9c3UbDI1t
         62LmMUO8pXSkpOaTLzygfiEnREa3jX+Vf9Xi7g35vWpCZx2+O7tB9RFDtBhBMhE126ED
         syzGjfg+wdRrvH10cmqnqSQqhj/DXhUtfZhzVScqXuNWdQZXKj1n+GtzeL6a0pMvdhjQ
         SiTbb7tvWcYBLL/MmAXSh25EBBnEHqXdJGpJfGFMWemY3Jdnfk3Q8UBTQ4oNsW0WiKhg
         6xkw==
X-Forwarded-Encrypted: i=1; AJvYcCUUcDfybrCtOEn2rNYf5zZv8BaQAQ6YzLF6QOg4xcxq0smGu1gTCw/B1Ul+zY0cyI8OkAl5K5ZRt91QNwhryKtZsdc=@vger.kernel.org, AJvYcCW0xtqu6oW3Y/D0pLR2Cw27a/aDff7EGhMJXPcKTxAeythDJYSGPbnEeg6gDFwmW/uuT4r/Lka2thOKsPxE@vger.kernel.org, AJvYcCWHYkA1ia5/ihmEZ4gQ92I9X/0064knh2LmCGYmyUJIZZYQDKCcLBL+G0LGsmLrORRCXYiD0DvlKZIJ+w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9ETslbInnZ2j/uHUMV/S/nuMiImvmsx1MZx1YWl9d6BxsgJP5
	eSx+grmpFYBlviUG7mb1MmK/w72FYCDklE9PalLQ7naTKgv6pwom
X-Gm-Gg: ASbGncvqhJtamhE07iEcj+5NC9aF7nudIiuliTmcz7ddX/ztaJkNqCv5FPPbdWYfOqW
	w/fsZoK/pKHv5+zDqE5Ujp92I6NWnQKpOMXMx2CaSOh8hINaQIMg6WkLzU6st2jc3Vt5ScBA8fu
	iYmKsTbTtazDjIh+hoc8ycnG68vto6teQY+cZ9ML7P6kL66nPgHuq+FXV4/cf3yNyQ/OBjT7uMb
	Og638mL0krudJ2jP2oDne57og9s+hj5iPQGgLIv4mBKEiBSiJxBKg/TTv5TH2KMx8/YZitUkOKE
	gPaYLcJptVgy2gnWJ+KVsF8eng+S/A==
X-Google-Smtp-Source: AGHT+IFs7iYnpHzhII7DyXtM+SJa+uo+d2nGrCyzNzEbqGFI8j/3acCSCuj+Ep+1f2tP3gAnoSiJNg==
X-Received: by 2002:a17:90b:1810:b0:2ee:d9f5:cfb4 with SMTP id 98e67ed59e1d1-2f2901b2674mr20378325a91.36.1734441008555;
        Tue, 17 Dec 2024 05:10:08 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142fa1cd5sm9898118a91.34.2024.12.17.05.10.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 05:10:07 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f9d4aeab-56a4-4935-96a3-50b9b3b5a1cc@roeck-us.net>
Date: Tue, 17 Dec 2024 05:10:06 -0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] bitops: add generic parity calculation for u8
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Yury Norov <yury.norov@gmail.com>, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>
References: <20241214085833.8695-1-wsa+renesas@sang-engineering.com>
 <20241214085833.8695-2-wsa+renesas@sang-engineering.com>
 <Z2Dg6ydwN6CfxgTe@yury-ThinkPad> <Z2ESttIzF4kX7JA-@shikoro>
 <Z2E5H3-vNIi2_6oT@shikoro>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <Z2E5H3-vNIi2_6oT@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/17/24 00:41, Wolfram Sang wrote:
> 
>> I hope that both patches can be applied in one go to avoid a dependency.
>> I'd think the hwmon-tree is a tad more suitable, but I am also fine with
>> bitmap as long as both patches go in. What do you maintainers thing?
> 
> Second thought, we can ask I3C to take it. Together with the cleanups
> for the I3C drivers I would add then.
> 
> If this is not to your likings, then an immutable branch for I3C to pull
> in would be helpful, though.
> 

Anything is fine with me. No need for an immutable branch from my perspective.

Guenter



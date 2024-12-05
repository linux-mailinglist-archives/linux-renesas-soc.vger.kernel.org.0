Return-Path: <linux-renesas-soc+bounces-10939-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 641819E503E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 09:51:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 417DF168B38
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 08:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52ECB1D4607;
	Thu,  5 Dec 2024 08:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ZigRGVxg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780721D0E26
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Dec 2024 08:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733388707; cv=none; b=QXKja1F6QV2hiQvS91PtBBghvqVfgfXiZSXmYSqNledqIDOJ+SyRH3me2UM+/CLaKmN6+8qXmCbq1uCnlJfY/M//tqIm8wWlaYaixDNUm0jCaY/cYL9vywhFpAfXscF8spfDXDRvkNOgkQrQtdwfzDnkZulVNNlowbNj6Pm3UhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733388707; c=relaxed/simple;
	bh=fiqkj+GRvZeuFOzolqiFGreSPgcdv0TDsi5dd2Towps=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=cpWAKA+x4Bxvehv7yn6UNeo6qQ1+hJRsOzMyO4HFIqCHSph/szL7r3cRiBFNBOLfykozbvQd9Q/pHTy/yaz8CLik1JvU1Xxt+RFg73CT09He/hYTgxCjkZiFY4qbh96WDzkCB3zHPXvfnHdf5rpqLtziQH7ARd42X10MBbe+jHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ZigRGVxg; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-385ef8b64b3so597996f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Dec 2024 00:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733388704; x=1733993504; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bu+BjISWLkOjToTmmpDVh9uIKwI+akwDpSA5Z73Jrm4=;
        b=ZigRGVxggyVTIVSZqINO1vdP34ggLGFkV9u7KMUIeTdeXZoW2BZlnIgsFhbl/kSAAf
         USWscXPqzXmunwlKidYk4SWuDx1FjSHdRgLU8YYngUNJOgBnUWXnP+35b1vkr8BrAj7C
         IdZqXctQzTyFwPpa1FC2RkArIqWsnF1Oky/SbFsl4fmL8e60a89jPjQoM4cC6mltHBrG
         YIeE0kzr4k3q72KMzOvIM6Xdl8gWOV3fVSsMQU963ygBOvGR3WzJVMhd71T0Gps6Uaij
         Sz8o/B0acJSJC3ad7kOIsTDsr9Q3/JJpWb9sGsjHE3mQQNUCNy1FV+NXeDdwR+J4MRXT
         oBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733388704; x=1733993504;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bu+BjISWLkOjToTmmpDVh9uIKwI+akwDpSA5Z73Jrm4=;
        b=cVT4GgH2CbBOpFK6ymZjz3+TsjZuvOy2tybtUJGWG9rV8H/xJGkERCuK6uYGKZG7+R
         J1Xf7j5EUL7XIdn8WBYeOp8+s831vDgcUTwO7I3P45qTZ6mvD/Cst9ed3R5zQ6u9yQSl
         xcgajRs8mBntYKQnKeq+URVQy4AiiHPVIeyh0+ARRGpzg+hbhcpf8eI0CyOExJD8vCys
         W8Yc6dJwGVkZ1vHnKZecR3g3ecvnr6/DsH0ghliGSj+gqhxa+fjXJ9w0laPBOtZcJPMs
         Z2v89GRrGEMeqqSJblEtfcfjGZIQ08QJR2NijME443Kd7+wWf+4h+dYrY9Z70DIoqyqt
         WUcQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9a8C7Y806k9yGMHNHib68bz/XCT2zaWaUS5n8TLxfPmtwDzekeRKCjsa9d8G9es5ybe5eWvm30KtSXaAxV1zgZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yysz4AqQUzgM9gCu3301bm7Gw9k/OIGuTQ3VyNMUPpSPXLJKTjg
	BY4B+TAFx5gJTl1KZk7AZD3kLzfSsCUPwaVvW2k3NYJqa13Q5N0RuqPowifa158=
X-Gm-Gg: ASbGncuqFl4JQYkEaaeH0dkeOYc1Oi26xParN966I02xr4hGdADJ5fEer1bX6bQuRKD
	sorRqvlyorxUfxbCgjASnRvKQ8Gkn34uo9qkINq1Vtp0GxLyAG8zp8gSfZfaq4Xq5LpLqrEBAm2
	RuT7Ga4Y3k2uUun7LYKpWs4lWHG/18Q05uJ20BwAAkxHNsFMlEaGgLKNEE6rPDdPPK8v2x7Zqvw
	DzlC3hj5djfzENcEG9Ea3uqluXMTey9jJNQ9LGyaXebi/NGRBBJf6SmnWg=
X-Google-Smtp-Source: AGHT+IEOpwQyKT2ZzfkreqlTf5liiEt9p2jfLaHmcGM387ZkeDSElvomTcEaXCXFcRKTLDZIbgydFg==
X-Received: by 2002:a05:6000:1446:b0:385:ee3f:5cc6 with SMTP id ffacd0b85a97d-385fd4395c7mr6706652f8f.58.1733388703231;
        Thu, 05 Dec 2024 00:51:43 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38621fbbe50sm1326046f8f.99.2024.12.05.00.51.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 00:51:42 -0800 (PST)
Message-ID: <1d8ea5f9-deb1-4236-ad64-d29a69a44aa2@tuxon.dev>
Date: Thu, 5 Dec 2024 10:51:41 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 0/6] serial: sh-sci: Fixes for earlycon and
 keep_bootcon
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, geert+renesas@glider.be,
 prabhakar.mahadev-lad.rj@bp.renesas.com, lethal@linux-sh.org,
 g.liakhovetski@gmx.de, groeck@chromium.org, mka@chromium.org,
 ulrich.hecht+renesas@gmail.com, ysato@users.sourceforge.jp,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20241204155806.3781200-1-claudiu.beznea.uj@bp.renesas.com>
 <Z1DLyQdzUzJzRUJJ@shikoro> <b6c7b4d3-021c-4a4b-9e91-316603b348c1@tuxon.dev>
In-Reply-To: <b6c7b4d3-021c-4a4b-9e91-316603b348c1@tuxon.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Wolfram,

On 05.12.2024 10:39, Claudiu Beznea wrote:
> Hi, Wolfram,
> 
> On 04.12.2024 23:38, Wolfram Sang wrote:
>> Hi Claudiu,
>>
>>> in the following scenarios:
>>>
>>> 1/ "earlycon keep_bootcon" were present in bootargs
>>> 2/ only "earlycon" was present in bootargs
>>> 3/ none of the "earlycon" or "earlycon keep_bootcon" were present in
>>>    bootargs
>> ...
>>> Please give it a try on your devices as well.
>>
>> Will happily do so. Is there something to look for? Except for "it
>> works"?

Sorry, I noticed I missed to provide a clear answer your question: if boot
works for this scenarios we should be OK.

> 
> As this code touches the earlycon functionality, of interest are the 3
> cases highlighted above:
> 
> 1/ "earlycon keep_bootcon" are both present in bootargs
> 2/ only "earlycon" is present in bootargs
> 3/ none of the "earlycon" or "earlycon keep_bootcon" are present in
>    bootargs
> 
> One other thing, that I was currently able to test only on RZ/G3S, is to
> see how it behaves when the debug serial is described in DT with an alias
> other than zero. E.g., on [1] the debug serial alias on RZ/G3S was changed
> from 0 to 3. With the new alias (3) there were issues that I've tried to
> fix with this series.

If you can also check:
- it boots in this case and
- the serial device with alias zero and the debug serial are both working
  (tx, rx are working) after boot

then we can declare it OK as well.

Thank you,
Claudiu

> 
> Thank you for checking it,
> Claudiu
> 
> [1]
> https://lore.kernel.org/all/20241115134401.3893008-6-claudiu.beznea.uj@bp.renesas.com/
> 
>>
>> Happy hacking,
>>
>>    Wolfram
>>


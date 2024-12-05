Return-Path: <linux-renesas-soc+bounces-10937-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7229E4FEF
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 09:39:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99E251652DE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 08:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 556301CB332;
	Thu,  5 Dec 2024 08:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ktIPXkFK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B3D11187
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Dec 2024 08:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733387992; cv=none; b=RurjIcU/blRetVwvtWbi+HNaICSIDicBIVTYNTuuSL/5CdGIUG7erD7t5VGPwMtpXKDHrHn6JzPO53Ikxt3LTNE2DFDpfqUWebosM3BxUl45YI9H97Qt6NPuZwKilApyi3pc8ycgNKt/MmyL0pClOwzdg0Sxgtvq2DrtOaaRUGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733387992; c=relaxed/simple;
	bh=zIX9HOzLoLL86nvi6qHvpdCdGJ7n5hslz6z/r6JsUWA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nYSO0tTfUdJwjyW6sceNjVmflq26KnJwy1OOJOf588D8NSiWcT8uB3FHoado+xspmP1VQEmRNkOJVBH4KkUvW/wx+12OUAKw2Zr7fLgp0RC0tWj4Gq64R2QeqdaHbteHKfyFqmRoTAnkmb3GNQ+nuNDt+oSr1nrstGi2x6IJODY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ktIPXkFK; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-385ed7f6605so294883f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Dec 2024 00:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733387988; x=1733992788; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R0FprQ4ddVvDh8O4I/zcWPdzZ7UNHiopsB4Wgd5Dy+A=;
        b=ktIPXkFKJejstHpsGxWK6jwiAfgQ2DEGwpE4f6aRaMde6IUB0Vm5mpgCQIvv4D/fz7
         5zzVZnPUKMF/uQa1A59PO8mBN46xX1dSk2Ytb8VP20dTifNqEDtxGB6SFF4reD74sZUJ
         P9HxiaezQi01ZFdP/i78821/ycdejLKNIyDrioDM046/j4Cx1eQY5OiumNHTV68IDtBs
         khO+nBJ7PdWFHLyPn/ndI3ZEOUb+6hmyKPFL9XzbkJNatHTvrtKdEE0bgSQ2g9G4wOp1
         aTArfTrKANgSlCEUTJrl34QTl0VFd4X4i27kPFknJsnbf1SdTyIUSXQIY3+Ms3BXNHzu
         Wp2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733387988; x=1733992788;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R0FprQ4ddVvDh8O4I/zcWPdzZ7UNHiopsB4Wgd5Dy+A=;
        b=DvOYcZ3CZ91W30VhjhyLwxKerm42xbFFRtsg/605THka2br3BwVsx8V2wMl6WjVZTm
         lqeJHpnOCSkjkoO4vb+sppic/jUVdoYK/hNnp1XDypK9G45jogugeFVm1AkRXLCVFVCP
         4qqOjxDugUevwf3hpUM0xrvvuNy5N1sI+xTydHCr8JMCqg3WzNZAP0STzdJnzBeN+F21
         7nNV3oGcCKUTb9OePN4T2RVxeb2LB3QT0Ifr2pyVXx28C02i/TzrcbQ/xZfmLssVjKmU
         7BEnNsSEAoQ1xpuqb2+nV1aXBXzq/YziMtYtVeBCMGmmsBAPM/28aakQ56z0dC43XCiY
         2q8A==
X-Forwarded-Encrypted: i=1; AJvYcCXSwNzqlndBalK03tqoWQ9c1U2D6AtaVIwOME3fKDrsRDhWJkmlH2LFyRNjxEOV6/XWFRBeWwUd9DYaxtyTRcC5qg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNIWuWz9XQsQPPBpzTrVtayWqikauNBQ/N2hw5aahS+rAg9JQG
	xPWn+kJBcFtrPpmHASVWDJ2MyIWmooX6VLS/CmNGRwV1VjrYIIhMJMOwe7gJ0zg=
X-Gm-Gg: ASbGncvHnGQDep7J6LyG5pAffavscd/bNTDqm4T37kJYK0cmEh9TjvDUp7jSrWjnlW0
	QRGVu8cMyjnxrW8h+xH9rOySTTyUF0SGs7KHBZCptaqd2XeFDg811baAiGVcqqTub7nxnOKnfbw
	CsLfCFkU/TpKNBeNJLxFvMVzOr7FaeZGz61V1aBqBZN9rrxgnGV9BKiJwSucEQFP3KkKprA6Fpa
	KtZdZ7C8GIRXhV47ynOYFQ8Q5v81ep2m2hTVUZbmqbmFHsIUgBB8VRNif4=
X-Google-Smtp-Source: AGHT+IGnZ7w6xd/QD+wR9VSNkMT3nkF3hb0p5H4CwWD//yDe7dAOOR+2eVQ3kcyOhsrMoo8tkX43PQ==
X-Received: by 2002:a05:6000:1acd:b0:385:de67:2297 with SMTP id ffacd0b85a97d-385fd532bdcmr6260267f8f.54.1733387988319;
        Thu, 05 Dec 2024 00:39:48 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-386221a4ae9sm1288223f8f.98.2024.12.05.00.39.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 00:39:47 -0800 (PST)
Message-ID: <b6c7b4d3-021c-4a4b-9e91-316603b348c1@tuxon.dev>
Date: Thu, 5 Dec 2024 10:39:45 +0200
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
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, geert+renesas@glider.be,
 prabhakar.mahadev-lad.rj@bp.renesas.com, lethal@linux-sh.org,
 g.liakhovetski@gmx.de, groeck@chromium.org, mka@chromium.org,
 ulrich.hecht+renesas@gmail.com, ysato@users.sourceforge.jp,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20241204155806.3781200-1-claudiu.beznea.uj@bp.renesas.com>
 <Z1DLyQdzUzJzRUJJ@shikoro>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <Z1DLyQdzUzJzRUJJ@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Wolfram,

On 04.12.2024 23:38, Wolfram Sang wrote:
> Hi Claudiu,
> 
>> in the following scenarios:
>>
>> 1/ "earlycon keep_bootcon" were present in bootargs
>> 2/ only "earlycon" was present in bootargs
>> 3/ none of the "earlycon" or "earlycon keep_bootcon" were present in
>>    bootargs
> ...
>> Please give it a try on your devices as well.
> 
> Will happily do so. Is there something to look for? Except for "it
> works"?

As this code touches the earlycon functionality, of interest are the 3
cases highlighted above:

1/ "earlycon keep_bootcon" are both present in bootargs
2/ only "earlycon" is present in bootargs
3/ none of the "earlycon" or "earlycon keep_bootcon" are present in
   bootargs

One other thing, that I was currently able to test only on RZ/G3S, is to
see how it behaves when the debug serial is described in DT with an alias
other than zero. E.g., on [1] the debug serial alias on RZ/G3S was changed
from 0 to 3. With the new alias (3) there were issues that I've tried to
fix with this series.

Thank you for checking it,
Claudiu

[1]
https://lore.kernel.org/all/20241115134401.3893008-6-claudiu.beznea.uj@bp.renesas.com/

> 
> Happy hacking,
> 
>    Wolfram
> 


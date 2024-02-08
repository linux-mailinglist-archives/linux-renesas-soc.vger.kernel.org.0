Return-Path: <linux-renesas-soc+bounces-2494-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0ECD84E4C4
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Feb 2024 17:12:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 753A91F225F7
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Feb 2024 16:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46DFB7E78D;
	Thu,  8 Feb 2024 16:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="abngXb4v"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81657D410
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Feb 2024 16:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707408702; cv=none; b=pcebkyLKn94zLWH95YvPZqRWuaOYwSvOqdjLy16aRNdB2pPD7GKyuT+jkIGDi/D2OugPnAYYrV95v4yclfaxNW4C2zpjezpnvgcqeJR3biKhXUYYzUr9op7hAKNGT1YGixVFUOnDwjFXLtevZTilAR7hd68JGgTUJIHTPAdJavU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707408702; c=relaxed/simple;
	bh=cWTgoqU7fKZA8BhxehN7Fk4Nd65sWiM55lgOVVf+Zao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aM5IvyBURMiMRMblR/Z+DOmfS00/SwOYeb9wI6PHLH+ULbnndSQ3Kh9wfwrqEW1mErlQFDAp9QiioQoLi/UyaJ/EcSjtNDaXGfjNc2p3RNbndwSqwjxN38tBsGU2iFwJsCINilGUWU5J1uFFa5U6mHSz07FxN/GRZd8SqnQexM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=abngXb4v; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d0d798a33fso328771fa.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Feb 2024 08:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707408697; x=1708013497; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NG4oPoKOQKy+o5+bEySCHk6cc22upqmzFvBUacEPxcY=;
        b=abngXb4vNsvyMLhezzANFWD1PYSJJRZOklkpx0P5HkvtBVKRCCGkkwfcmYNp6qpN+k
         Th/jibZUgvR49tAscC4aKyJQw+2uqNqNGbbINx63EfR/om8zfwATtsY1H4TiMFEpG1Oj
         RmReAIh+lcXch9EeQQrrI2zOb0+OUyoY+xrmQ7vQdENJI8eIjGSy5CvM/PHAHwVDk96L
         lS8z+HMs+gW9YtXL4bhfeR6xuyHoR47lDLF9T773OzDa0NO6k++hibI4WkiXiEpulgq4
         CqtfVM4cZhSXujdSmJdVfVOMRzrg8jqgvUnXXIvtiJrdERKsoU85ItcGO1vgr4Z8yqD8
         ARoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707408697; x=1708013497;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NG4oPoKOQKy+o5+bEySCHk6cc22upqmzFvBUacEPxcY=;
        b=MN58Y/ueOEI4gRSWV18kweXvSn7MtLwtC/jV/ntFrp6jE9lONGRs2Ik13rvVvGQPGR
         p9Kgmx50lmYERuBC0JV3uT7l78bpJJ+i6GaRNYJBhLZkedEgYa8NoxqJhC6weAUtgOpr
         E5uDqAWGZ3/QhBUqjyV7iMm2Wz9WG4DpjX3XNvDTkYb6+2WXhSktnZWvai+V69zJuRuk
         Sc75DZLDhtvofBWK7IP84JXUTHjHt/oBouzyVP91kV5dFskIFbNkHKzL8NoNlEHwO5Rw
         Ug4JdmvRHOBvBvBEY/HHtjihJJKpPnhenHF4uArZajV81XFwVdGGgxfrBMWMSlmuH1i6
         AvOw==
X-Forwarded-Encrypted: i=1; AJvYcCUYz9RhxYq6uj7IGb15m+DhBBW56NIaLmB39y3hR01dejKPrBkhE7Dwz+k7Gc/reSgbzxxusdQaZFg3vA9PlxpwfYbpajXu6IgIUvX+pdwuKFM=
X-Gm-Message-State: AOJu0YwJ7SjYDUx4jPRYg1gt004mkFnyB7pQJ86NCginPG6aNaQaKQ12
	ypWgjZv+diPlPeAGHjBiPnWtt05eBsGi6fx1+qz6a9aKl/QLaDRPShjB4bpSsVw=
X-Google-Smtp-Source: AGHT+IE/ZHP9/CZGYr5vSh05z2v+idxqaCPOmz6Zoi/9FgOTKp+Qtno5s3Gwklmnu2m5kkxiYYd5Cw==
X-Received: by 2002:a2e:b24d:0:b0:2d0:908e:d825 with SMTP id n13-20020a2eb24d000000b002d0908ed825mr6525245ljm.21.1707408696828;
        Thu, 08 Feb 2024 08:11:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVYmG5ePPIRG4hWIMZIDpk/ukfhSXLR4iAj9vF2lng21pdqbASmaiLEbLoPdxqI6T9WFP+7dkUwFJAM53EZ46M/2YEpcWce+MZtNRr0GqRdMYUMtgTd4vpP4erj7blx/NwSXoEnBUEa0wW+KzW5prIwegoI5+tFqpCaFiN4HNOhOa/0clk7rjcjbHTTFf2xC5KRsjQO/EPvYisj0XHnmBd+GXzFqn313HiVADvoDckLNh0jzTpuMFRTF38aVYNJkZCg/x/3orRbtIY+EJQNSfh1e2O664sUk4NHH7XaR9jd/cAse9lEoLPkgrnw/HpT7aG/Ia8zvboliQI=
Received: from [192.168.50.4] ([82.78.167.45])
        by smtp.gmail.com with ESMTPSA id iv6-20020a05600c548600b0040ef3ae26cdsm2048079wmb.37.2024.02.08.08.11.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Feb 2024 08:11:36 -0800 (PST)
Message-ID: <cf24ed20-c2c1-4f36-a747-e01f5a36b61d@tuxon.dev>
Date: Thu, 8 Feb 2024 18:11:35 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 4/5] net: ravb: Do not apply RX checksum settings
 to hardware if the interface is down
Content-Language: en-US
To: Sergey Shtylyov <s.shtylyov@omp.ru>, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240207120733.1746920-1-claudiu.beznea.uj@bp.renesas.com>
 <20240207120733.1746920-5-claudiu.beznea.uj@bp.renesas.com>
 <82a95cae-29bc-06c1-0fab-5fa6302b4654@omp.ru>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <82a95cae-29bc-06c1-0fab-5fa6302b4654@omp.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 07.02.2024 22:50, Sergey Shtylyov wrote:
> On 2/7/24 3:07 PM, Claudiu wrote:
> 
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Do not apply the RX checksum settings to hardware if the interface is down.
>> In case runtime PM is enabled, and while the interface is down, the IP will
>> be in reset mode (as for some platforms disabling the clocks will switch
>> the IP to reset mode, which will lead to losing registers content) and
> 
>    The register contents? I thought I'd pointed out all of these...
> 
>> applying settings in reset mode is not an option. Instead, cache the RX
>> checksum settings and apply them in ravb_open() through ravb_emac_init().
>> This has been solved by introducing pm_runtime_active() check. The device
>> runtime PM usage counter has been incremented to avoid disabling the device
>> clocks while the check is in progress (if any).
>>
>> Commit prepares for the addition of runtime PM.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> 
>    I'm afraid such check now needs to be added to ravb_set_features_gbeth()
> that's populated by Biju Das' checksum patches (which I've already ACKed)...

Yes, it's on my radar. I'll check it and update it (if any) in the next
version.

Thank you,
Claudiu Beznea

> 
> [...]
> 
> MBR, Sergey


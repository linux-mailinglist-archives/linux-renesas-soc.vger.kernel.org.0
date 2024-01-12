Return-Path: <linux-renesas-soc+bounces-1509-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A31D782BCA1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jan 2024 10:04:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C27C41C24F88
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jan 2024 09:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0F8454F9A;
	Fri, 12 Jan 2024 09:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="J+QCA1+J"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5694056760
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jan 2024 09:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2cca8eb0509so76586341fa.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jan 2024 01:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1705050261; x=1705655061; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FMOEBUTyrxAFteCOdbuePmYjjamQBShc/8fenoo2NDg=;
        b=J+QCA1+J4EIlik86ZsMQxwOCMJINQ3x7UWwiv2oNz9Mys+I0qE3JEPdzZ56W9Nhgle
         ejOZeqq5gR1SDyBJimpQKODwoTWvvU/WBzXY0LY0qkOnSJSrkbHpx3/KgKxQszlEADwB
         2364fw0E0ESQ27LrFnFR2wSoYE5LnlYAy2Mmh4kJpElCuFXbs87DmvRgXFPLRplNfJbZ
         V10AtQ/+hALNf3RNC+/JpDr9Z5jaDuaIXMurEQLXCD7H7jJHKMD5dFXXYY82XXLSjdil
         DNMMI81eTqvJ6vcVpBJBv89CaebJTyVnPbPZddCsTnXhRMpkLtPkn6jkao24UV/5VeVq
         W59w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705050261; x=1705655061;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FMOEBUTyrxAFteCOdbuePmYjjamQBShc/8fenoo2NDg=;
        b=mqC9E79DhY/vgIUdPm0Tn6y2T0psNYX+dDH1f84XLxqQc1DmWJGIKbY6t2TdVUBWA5
         I34t8UVQEyW/D30N9/ZjXsmeiXBTl13sf8D19Y9Mw0kZn65ZH5i+Zyr0EDw6wjaI9uE8
         +X4OTEIqpUrYo5uOvul/Xi4GBzeWzomXsNTyqQC2FSs8XdwU/sAUpzn8z9adjXfeOU6E
         tsi89sgkxmNlQndQNtgx99v8eH1ZACkYJx15o2k2FN/AE/S7VPHotDHp4FLLm+OHHwzy
         rruyj/GRWiMAD8p1EO5IM0gdVIpoQkal+7dnuqQu+xNkMwWF091Ehwv7t+PxWErocR0O
         0tug==
X-Gm-Message-State: AOJu0YwaHUyL5ogPymU59CwsAzNOR/vHcxaojblU+TknR3wTDGi75Ex0
	et7RtZJkJM/6/mcd+euDBXeqLwzXoMzDqQ==
X-Google-Smtp-Source: AGHT+IHdDV0zW9ct7lpVWRmoAkfRX62ksO05UlwuC1BnHaNkmnr0sx8vh+sbrHII1V73V2ewYYk8gA==
X-Received: by 2002:a2e:6e03:0:b0:2cd:8ce7:71e1 with SMTP id j3-20020a2e6e03000000b002cd8ce771e1mr483215ljc.4.1705050260789;
        Fri, 12 Jan 2024 01:04:20 -0800 (PST)
Received: from [192.168.0.104] ([91.231.66.25])
        by smtp.gmail.com with ESMTPSA id n26-20020a2e86da000000b002ccdb0a00bcsm403541ljj.54.2024.01.12.01.04.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jan 2024 01:04:20 -0800 (PST)
Message-ID: <804a4586-1909-44ee-a40c-d9cb615f75ad@cogentembedded.com>
Date: Fri, 12 Jan 2024 15:04:17 +0600
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: ethernet: ravb: fix dma mapping failure handling
Content-Language: en-US, ru-RU
To: Denis Kirjanov <dkirjanov@suse.de>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240112050639.405784-1-nikita.yoush@cogentembedded.com>
 <64deebbd-93d0-47dc-835e-f719655e076c@suse.de>
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
In-Reply-To: <64deebbd-93d0-47dc-835e-f719655e076c@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



12.01.2024 14:56, Denis Kirjanov wrote:
> 
> 
> On 1/12/24 08:06, Nikita Yushchenko wrote:
>> dma_mapping_error() depends on getting full 64-bit dma_addr_t and does
>> not work correctly if 32-bit value is passed instead.
>>
>> Fix handling of dma_map_single() failures on Rx ring entries:
>> - do not store return value of dma_map_signle() in 32-bit variable,
>> - do not use dma_mapping_error() against 32-bit descriptor field when
>>    checking if unmap is needed, check for zero size instead.
> 
> Hmm, something is wrong here since you're mixing DMA api and forced 32bit values.
> if dma uses 32bit addresses then dma_addr_t need only be 32 bits wide

dma_addr_t is arch-wide type and it is 64bit on arm64

Still, some devices use 32-bit dma addresses.
Proper setting of dma masks and/of configuring iommu ensures that in no error case, dma address fits 
into 32 bits.
Still, in error case dma_map_single() returns ~((dma_addr_t)0) which uses fill dma_addr_t width and gets 
corrupted if assigned to 32-bit value, then later call to dma_mapping_error() does not recognize it. The 
patch fixes exactly this issue.



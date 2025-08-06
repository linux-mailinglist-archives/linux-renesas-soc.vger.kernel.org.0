Return-Path: <linux-renesas-soc+bounces-20033-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6742BB1C477
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Aug 2025 12:40:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 84F4918A37C1
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Aug 2025 10:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94CB928A1E7;
	Wed,  6 Aug 2025 10:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="kSDSihro"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871DA224B1B
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 Aug 2025 10:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754476802; cv=none; b=Q3XOw1ne+WZzFIP3ybqiT0AhaEEfa5JOOShf8FDRs9drrGDDzYqJXVelI4g9aYStR/gCTFpSRHheTybxaf0AS0L5liTD7sXJNiLzlHfHgdXebJG6RCf+fBzWXOhDyvGGt+sauK++qIDQEXWjIbkhmGDjcl+xLxGnNr2rzVkvycQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754476802; c=relaxed/simple;
	bh=TX2tAJkEQZa9XTS0GPqnY4OvS1tTNgim1be15DkJGB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=chCIxt3jP54YtKKMiWmHEA+mMvgdjxPAh5SGlD3EO+1jS/WlvGljDxzcvCF9SuXIt5U41AE49E+JCOU12R1j9K4bLaV0keV4h2eRNFER0oXl7QgZNG8eKu4aRFmhW6cmIWqIWPNdJUQi8aFe0Ga+yvrRDjoAt/75Q6p4WaIArHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=kSDSihro; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-615756b1e99so8087259a12.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Aug 2025 03:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1754476799; x=1755081599; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=titscQ6aOjVW0NGtGerXnOmFu+BatzV4STGkNMkUG44=;
        b=kSDSihroNU9KLyb51iEBR892IPwE7QJaHnMmI35eTT65DPrxY3zb4QDbJc+DyrCY4Z
         V9GhntQslcDiIEOJ7THreD4U0e+vpjcG7tS2/0ZYfgMKI8drTYYUPH9RsJuCAxDz/CPs
         Jrpqr4FHGIwu7iOi/6hBJO19Np3YIB4DtlG6mQzy/Ch4g2DBWKb0zOu5znUFYskVKveT
         gG26h1FmUEZ6j6z3qwgjIiOnzGZquCA69FDnAn+SiMuBN2z5EZpwbkd2EZB1f/EweuE4
         PVq3kYXUgDXPj/jiX9bmvxErwSspLGYaJfz/VvVdMu3BQHGdNzASE3/Ba4IgrnzOYvN9
         Iiww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754476799; x=1755081599;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=titscQ6aOjVW0NGtGerXnOmFu+BatzV4STGkNMkUG44=;
        b=w5/Eq5RR/qJqXIEOUnGXan/xZdjezvwRrwpNwLVfUu0OQUlRGCoXLzwFXI80PfYWmf
         7ihNO77y1+FLfIJjsiMbFp006k6+zktzFKz3ATcAPOVRTbI0q00q/lxJPtCYjm6LA2Zj
         eOr87mZ/WCsQkSr5RQAr1r+esWli7ZfPQZg3WldJmlsJHNXx/jjZwiHlwdlI1pGsjaAC
         7wC+SdzYASld2pIfqpDMjg1y90aBnE9EKDthOLnNEPsdMUH9Sn9qxXt16gSE/I6/CxNo
         cFAoRzFGv+8Ri1n4lQ3tMm6aecTKK3t6F6SM5Bt7IcdMlTyktHDCwd0MCHyR4BAJoTrz
         xNFA==
X-Forwarded-Encrypted: i=1; AJvYcCXudp3gxgELpA6vRHKE5+wQCNB7WOd9GGDHe6Wmcbz5GY+csp7yCnJWbotpMX7hCPNxdsUU3HAXuh78i7m2A3KW0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YypM1yjGziVR89LG4ajjCTUiTF8qBSQQ1MJ/Q51PPepZUbw7VBt
	oST2yzMEGUMRYHJMEnkK2g7QpY80SEPjOVtrz+M5Wk5Nny74dQR2+mdnxY1NPnKnOqg=
X-Gm-Gg: ASbGncslN6FFlNRxcuhnZDfqNh9hxmQ9Ka27lTf1XGYF5iBqA2MMegSfR+1XktXi76N
	NA9xlT5V4YijS8DoYwT7aZn9QcIJie9CtCglPdpZiZOzTecI6auUinClJEg8dhs4iGC2oqcFvZR
	Mbf0YM/TJM0Qc2Mv8LpwuVOYasJQV67gTXdnyRkM0WnH2+GCorq0pEbIElsua/nQoNtmMdV9Z71
	YMyP67yOOE/9oe5e9MuOvHAMbjfSe9QyTCqoF1nxUHMHUyUT+2ZhoROuRePiSySE9zeWtZZhex5
	PrOcS/T2LmwALj5veptWKWHdxFP6qESLVS7AO0ByAagPcXRNGvBTIoYVdc2MlREyG80FPN/0d/e
	gRu6UdZMmg3ICBw4zS4+rMi1A9oDg+rqFtB4LkhMP8g==
X-Google-Smtp-Source: AGHT+IHqnoMWs0fFU538b4C2IwDWUyKcR2dFyHunG3+0ppcR4vMBGndqEfDbUwOBbxO3i0Wbbgx9Zg==
X-Received: by 2002:a05:6402:2692:b0:615:5229:1d61 with SMTP id 4fb4d7f45d1cf-61797c96ac8mr1865037a12.3.1754476798802;
        Wed, 06 Aug 2025 03:39:58 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.188])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f2b892sm10089403a12.25.2025.08.06.03.39.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 03:39:58 -0700 (PDT)
Message-ID: <3134db13-5fd6-4cf9-a8d7-97a5a39971d5@tuxon.dev>
Date: Wed, 6 Aug 2025 13:39:57 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] clk: renesas: r9a07g043: Add MSTOP for RZ/G2UL
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250806092129.621194-1-claudiu.beznea.uj@bp.renesas.com>
 <20250806092129.621194-4-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdXtdgxX3xVALj2t1cOQ7+2rEA3x=J=M4VkenMdqnHhNag@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAMuHMdXtdgxX3xVALj2t1cOQ7+2rEA3x=J=M4VkenMdqnHhNag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Geert,

On 06.08.2025 12:48, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> Thanks for the update!
> 
> On Wed, 6 Aug 2025 at 11:21, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Add MSTOP configuration for all the module clocks on the RZ/G2UL
>> based SoCs (RZ/G2UL, RZ/V2L, RZ/Five).
> RZ/V2L is handled by r9a07g044-cpg.c, so I will move this comment
> to [PATCH v2 2/4] while applying.

Thank you!



Return-Path: <linux-renesas-soc+bounces-11213-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4641B9ECAA3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2024 11:50:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 499341696D4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2024 10:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA5BF239BC5;
	Wed, 11 Dec 2024 10:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="aIaVL2ZT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32351EC4EA
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Dec 2024 10:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733914244; cv=none; b=HmSo38rstLZdi28Y6WHFf8ZYvYOJov05KyYEINHp4jH6b2OB/2JGtKgsRTK6ZvGTZPILy2rEvrRtSAshwuboiWA9HX99fYpe7NJFzmUFC3NRWPR0/n3QiBJj958Zh712nR4v0agBm2C4+WuMdlAPv2R8ee/h0LpkhNQMB59C8ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733914244; c=relaxed/simple;
	bh=83IKX2ACj6MG1iwn5040sUxhxKeKXmtr+kfA2OBidGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gs0RccQv5EkJONT2dw0IhxPSlaG0o4GDsO2/50wCp5wvBaxUdRQdgQgJVJFsmotAT8IV/i1JOew7GutWimzAu0e42Sypx4ODymM1Az0xL72gHij7Qm1YnBHqqQXT8HGjvFUe9eyfaM2YKWPN2aDcKZs3Pz4h0kMYR+p3cpdAcIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=aIaVL2ZT; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5cedf5fe237so10319519a12.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Dec 2024 02:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733914240; x=1734519040; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Y8njlP7LsGVb9kxDxnrRdURSlrkZgl27jEGhSqeYyQ=;
        b=aIaVL2ZT8tI41L2LzjZP0xyuWG2zCa4XfWl5HVYsYjPJNTjjfDJ5tqmKqFk43o0kA2
         R9PZZHljqRewSjz6gs+rp8e4JY2s7LvV+HM2NbGLJfYf26/pUGptVEHYnr66cUwmEz+V
         oDWWDhVVcZBWDwq/bfQIVi9CnlYaQfJk9W1M71UlCJlVZrvhaLUP7rndxRZJDbVWzCJu
         d+YzZGhEzuwds84Ung1HAj+BEVZZoqI/nwrrUOx7tsuFprWx1GhLMW49tdLImF6MxMBo
         6og5rgyxYwd9t3qqCnzIfPEbHsEGyp6dt2I34eKrtnSNM/IQpB4UGprDzAwMqz/LZECF
         hR0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733914240; x=1734519040;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Y8njlP7LsGVb9kxDxnrRdURSlrkZgl27jEGhSqeYyQ=;
        b=X14mhTmCaO4BixVHNsQESIARfudgtVnS+9RfcoAyDNE2SFaLOLtfhMmmnBrEMOaXO8
         0v+pPRrFPSBhMjVLBbhCOKrTTyI8qiOCX62Jede4aQWPI4KPA/JbeFd+aU2vXkVkIEN5
         jqJjdO1t6qh4q4D0cm93Vw8E7MoBcgA14Qy6UcVFR89I4gRQVUAgsIrmjSN1VHQpDM0X
         HUC10PQejG1qcBDmuhWMwD+rgq/7EoSmS6672YpKfndeSLdnC7kksDNlCoLUkzpdTKXq
         iujuBvpgRYHZa5S7BWkJS7IgWOLDGVf0bqjg5wgOsVKTwToOE8rPoew4UhBVOa5BuTlW
         DFnA==
X-Forwarded-Encrypted: i=1; AJvYcCVZJ2SfsrXPl3Baboc7zHknslam4IWjVchOWYJHDkeJQdm5RrYNnCPgC9aoNPPMEundPAcm9+lsc7DpzwUqiaxqAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4Nht7dyYKmi8FCBNEIiA3Jz4AFZcUk48nf/x9GFmCTdcXz2Ao
	wFMsjZlVeU/rE+BMDU/DhQI+Bj/MOU7XNAqFilq6znpiWkLT3xNvvOw7xIcnWb57UsFrG/nfoRo
	U
X-Gm-Gg: ASbGncu8ATV9kTLAcMPXTInj05PzIN2PyCc4mnLCG0qzIl4KgBXdJxsT7ztybuqUybD
	L32M9gJdsKHIHB1CtD1MOcB39bzXS86LHVHRu/yT+or21f6owx/A1CsmD9rEWH6TRoJYAejN6TY
	jc8HtU1mwTTpcgofkWPc74Jm5ZS5s68eqWqRoQtK1dR679HKVdH+Sn/xGoBI1pMFEj7hP9vi+d3
	/L6ZjR6AnWDZFqH+4u7HApnjThpRUze47OUnovD3npZ4DYsbuY1GMda+Pg77zg=
X-Google-Smtp-Source: AGHT+IE3ug4r7LsUmk8McDRInWzkTaVZpznCtb2SmbeZOgpxZz5NZUAREifnl9FpXa/ZmpNshEjJZQ==
X-Received: by 2002:a05:6402:3806:b0:5d3:d917:dd90 with SMTP id 4fb4d7f45d1cf-5d433048b25mr2102350a12.6.1733914240144;
        Wed, 11 Dec 2024 02:50:40 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3ebbd67c0sm5444007a12.46.2024.12.11.02.50.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 02:50:39 -0800 (PST)
Message-ID: <a1b60809-cf72-4d4d-91f4-468a47900ca5@tuxon.dev>
Date: Wed, 11 Dec 2024 12:50:37 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/8] arm64: dts: renesas: r9a08g045: Update
 #power-domain-cells = <1>
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, magnus.damm@gmail.com, ulf.hansson@linaro.org,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240422105355.1622177-1-claudiu.beznea.uj@bp.renesas.com>
 <20240422105355.1622177-9-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdWhRRdfoqg_o6bU7jjt5_Di0=z7MJ4fMh=MJ0m8=u4tgg@mail.gmail.com>
 <80d56236-2499-4c89-8044-6a271e47515d@tuxon.dev>
 <CAMuHMdXOztsoKp=9-TDXirJN8voRy0O5mYXcVy=Uz-GX0B2N_Q@mail.gmail.com>
 <CAMuHMdXXTRUiToA3r8+xgS0uUrrfOF8iZA58_na0V9+JB6hg6Q@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdXXTRUiToA3r8+xgS0uUrrfOF8iZA58_na0V9+JB6hg6Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Geert,

On 11.12.2024 12:31, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Thu, Aug 1, 2024 at 7:34 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> On Thu, Aug 1, 2024 at 7:28 PM claudiu beznea <claudiu.beznea@tuxon.dev> wrote:
>>> On 01.08.2024 19:13, Geert Uytterhoeven wrote:
>>>> On Mon, Apr 22, 2024 at 12:54 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>
>>>>> Update CPG #power-domain-cells = <1> and move all the IPs to be part of the
>>>>> IP specific power domain as the driver has been modified to support
>>>>> multiple power domains.
>>>>>
>>>>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>
>>>> Now the watchdog fixes are in v6.11-rc1, I will queue this in
>>>> renesas-devel for v6.12.
>>>
>>> Only the RZ/G3S support has been merged.
>>>
>>> The watchdog fixes that allows us to use this patch were submitted as RFC
>>> but got no input from Ulf, yet.
>>
>> Oops, postponing.
> 
> The watchdog fix is now commit bad201b2ac4e238c ("watchdog: rzg2l_wdt:
> Power on the watchdog domain in the restart handler") in v6.13-rc2,
> so it is time to revisit this (and rebase my renesas-dts-for-v6.1
> branch to v6.13-rc2)?

In the meantime, we got some input from HW team that particular order might
need to be followed b/w MSTOP and CPG setup that doesn't align with having
MSTOP handled through power domains. There are some contradictions (AFAICT)
b/w that and the conclusions that one might draw from the HW manual, so we
are in the process of clarifying.

For that I would propose to postpone it until further clarifications.

Thank you,
Claudiu

> 
> Thanks!
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 


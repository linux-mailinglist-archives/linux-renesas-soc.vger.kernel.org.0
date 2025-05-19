Return-Path: <linux-renesas-soc+bounces-17189-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAC3ABBA82
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 12:02:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88168189944D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 10:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 041A51C700D;
	Mon, 19 May 2025 09:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="RrUci1Lw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1453A1DE4FB
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 May 2025 09:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747648784; cv=none; b=e4ERlLdS+zZr2HycOuEcT2FiSvGAAcP9NwDYV7ES3EFeIYJis8Ple0EoH1UfObMVZYAt8JmdJs5A6cbiXGf1P+xKUz3ylXKl4Y3YJfem3P7IMrR2lT8F069CLaWGzUD7aYGB8KP4zM42CRWIheb8f2b4nKM8e70IUcBD6Bmjhh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747648784; c=relaxed/simple;
	bh=dSxij7d3UNEnc03Iwv5weNptcq49Yp5Ww8xB0LEZHn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZyO38nM4m9s6tPJp8Uaekt13DTRa9UAwUb8LJDRs4DEviE2dEF3s3jsvxmvKuR8DGKG3P3wFwXXodcjm//O8r1xmANwiGcZInDNiJg7iK/j9uJH6Fd8u8KZ76kmZW6jZMGva1WsP/fRk1oTbt1AevYxsY3qoM5gbLl0jq1MDBZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=RrUci1Lw; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5fbfdf7d353so5590400a12.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 May 2025 02:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747648780; x=1748253580; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=squm7R0/ZL3X4Ww4+m9myAtwPnq33Yj6/51YuPwNRrA=;
        b=RrUci1Lwi50rXkdR60SsIy/4BWKSs449RUNskN/0F7yQQ284T0Pg9I7Nk2SLs2pbGR
         010wn37lrErfrn9nvFQ8aDWAV2O3ZVXMt4vadNttWUWrQwlPX6/l7VyXT26ypEmeyYqZ
         gXWh28MgocwIIBwmocOGfJUaHq5GYQKIk6HqNCSNOqJU/j8dX58TWPMw0EdtBWCbYBsp
         ChujWVVmcdT4/2BNiHPGtR6g2Ob22JtgkpjT/JZjehmqI+OP3P20x1m3hGQdn0xXpp3a
         t/ZpIVBCy6bRrHMFKMoL8Tx5M522CKRdpyS/NIK4ik9MaItdfWakh5Gz8sGExprdbOT2
         VwHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747648780; x=1748253580;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=squm7R0/ZL3X4Ww4+m9myAtwPnq33Yj6/51YuPwNRrA=;
        b=vlMEzMg/oEwsrxh9FM/wtcwx8tlQBe5lLVYM+3iC172Jd6pnER+CpsKBx7jGBbaVS0
         Dx4Ro8VA3o9soOazw1Obcaexe6IkL6qNt8W4nBaS6ZPqUa2CYrYUn3HZep5P5aXZofGs
         DSosN9zaFEyrPulJXsU2jZtyNo4UXFZHCu9H+fRg52/tJXjN9V80ZizpqSP0GZKPPdhe
         qI0m/UPWCa3U5PvVmqCMk+v4TfMwsO5u3vQKIYSavDmJPOU+dpt9mv4IadZaWKAPMtg5
         HaeJxSqgPJjK5q8GJhDljAgIdLF3Sl+zFflW+bI1800HhUZsUpavysAtxSLoNnk3e4fz
         ARzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpRjXNu9rNpe8p9JSxpfXKOGPqui+Rs7obE42DuLOR7FL/Zgrr/bkSSq0d3Ii8FOds8a9YHHU/PmQKfn4Jid2L8g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz2YwiMZOzZWajQZjNpck6DIZAhpECgLcwLDSXGE3LrCOXoIZX
	hbsk1YnXg+FhZci38UQWZsiYOnumWTUJxdaSZIok2l9ABSHSy6QArO7twLVezBo5s8E=
X-Gm-Gg: ASbGncsu5DatHgFR38cX/Zwf5TpmWhjp98KBfx0rSKDcRPgDWj7P//jLM0uky2e8On2
	jBfoksl9MeLh+aJ6O4vNez8v3PYUyvmc0TjfOk8lYq51P4mMpS3lCiUx9fZ0DfW5Y7ge3ZYnkht
	POlRUNFrO39YEa0bFAgWcQMAwDbwvfWOrgPO4drfpFweuexKUWPb1HLeJvWTC4EKNJ/R4baz9MF
	VgSJYdKjXkJNFwOJ8LWW7VZRb7mW6IFCD5Wzsb3rdC8nNB+S47BsGM02KOAukSQSdl1FZNf2QJx
	sO8lBYUvxOYZdWfxMDaTULyKM1/sHCvJVfoN6jBVtVuNNx4f4KrOr+HUFbU=
X-Google-Smtp-Source: AGHT+IGOf1zbVEfv3sqxO0+3n3nY9cx70R8hKHEv43EChu67h7Euqo+U4eNL1rpDVaHinhCtY9Q/Ag==
X-Received: by 2002:a17:907:72d5:b0:ad5:2077:7a71 with SMTP id a640c23a62f3a-ad52d557911mr1094441466b.30.1747648779618;
        Mon, 19 May 2025 02:59:39 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d498f18sm562159966b.150.2025.05.19.02.59.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 02:59:39 -0700 (PDT)
Message-ID: <42ae4511-43db-4896-99b3-f203d52433e3@tuxon.dev>
Date: Mon, 19 May 2025 12:59:37 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] iio: rzg2l_adc: Cleanups for rzg2l_adc driver
To: Jonathan Cameron <jic23@kernel.org>, Greg KH <gregkh@linuxfoundation.org>
Cc: prabhakar.mahadev-lad.rj@bp.renesas.com, lars@metafoo.de,
 linux-iio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, rafael@kernel.org,
 ulf.hansson@linaro.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Bjorn Helgaas <helgaas@kernel.org>
References: <20250324122627.32336-1-claudiu.beznea.uj@bp.renesas.com>
 <20250327153845.6ab73574@jic23-huawei>
 <2025032703-genre-excitable-9473@gregkh>
 <20250330163627.152d76ef@jic23-huawei>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250330163627.152d76ef@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Jonathan, Daniel,

On 30.03.2025 18:36, Jonathan Cameron wrote:
> On Thu, 27 Mar 2025 17:22:20 +0100
> Greg KH <gregkh@linuxfoundation.org> wrote:
> 
>> On Thu, Mar 27, 2025 at 03:38:45PM +0000, Jonathan Cameron wrote:
>>> On Mon, 24 Mar 2025 14:26:25 +0200
>>> Claudiu <claudiu.beznea@tuxon.dev> wrote:
>>>   
>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>
>>>> Hi,
>>>>
>>>> Series adds some cleanups for the RZ/G2L ADC driver after the support
>>>> for the RZ/G3S SoC.  
>>>
>>> This doesn't address Dmitry's comment or highlight the outstanding
>>> question he had to Greg KH on v3.  
>>> I appreciate you want to get this fixed but I'd rather we got
>>> it 'right' first time!
>>>
>>> Also, please make sure to +CC anyone who engaged with an earlier version.
>>>
>>> For reference of Greg if he sees this, Dmitry was expressing view that
>>> the fix belongs in the bus layer not the individual drivers.
>>> FWIW that feels like the right layer to me as well.
>>>
>>> https://lore.kernel.org/all/Z8k8lDxA53gUJa0n@google.com/#t  
>>
>> As this is a PM question, Rafael would be the best to ask.
> 
> Sure. Perhaps Rafael missed previous discussion, so I've messaged
> him directly to draw his attention to the series.
> 
> Claudiu, please include all relevant people in +CC.  Don't trim
> it down to those effected by a particular solution as has happened
> here. +CC Rafael, Daniel and Ulf.

As the discussion [1] is progressing very slowly:

Jonathan: do you consider having this series as a temporary solution?

Daniel: do you consider having the fix in [2] as a temporary solution (of
course, with the adjustments suggested by Geert)?

There is also [3] for which a similar approach was proposed. From what I
understood from the discussions on [3], Bjorn is OK with the current solution.

I am taking the responsibility to do the necessary adjustments to all these
drivers once there is a resolution for [1].

Thank you,
Claudiu

[1]
https://lore.kernel.org/all/20250215130849.227812-1-claudiu.beznea.uj@bp.renesas.com/
[2]
https://lore.kernel.org/all/20250324135701.179827-3-claudiu.beznea.uj@bp.renesas.com/
[3]
https://lore.kernel.org/all/20250430103236.3511989-6-claudiu.beznea.uj@bp.renesas.com/




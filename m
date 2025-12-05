Return-Path: <linux-renesas-soc+bounces-25598-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 96980CA7BE1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Dec 2025 14:22:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2421B330A851
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Dec 2025 10:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D62FE32938F;
	Fri,  5 Dec 2025 10:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="UaujPE97"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2244C329384
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Dec 2025 10:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764931600; cv=none; b=ZGst0h0W5IBLckm5WYF76RXb2p4oCPalHhpkdkKCcudEg9396EnPhEo8S6xpXhEjiswPH5aLKQkh4NmMwCHA8/eRONfwCcizFIo6ancW3g0BA48++5H9QynkCzn7PM+MfPMXZBj0iQZ2ot7HXXkTS7Vb/fAlCJ9gM3Yo64Bg4hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764931600; c=relaxed/simple;
	bh=LPWk95iQFmcP0hcJ8pERb04dODWJ5TuKA90Pq5cOqPo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k/rftRlizHMgROQBA0dfdpWYk5u+HtaL1O8Sf5stxw3wJPjPvFvHwwljS7CcSPgZAwwmSawVV4yzEFRxdVfzcapai0sF41S6kooY2bL2RE32vwdn/Bzt5wAJaWriF3m5Wr0KLToXaLIVpeEROBobBsrOz8hNEErXoXWtU1KGk14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=UaujPE97; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42e2ba54a6fso770575f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Dec 2025 02:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1764931594; x=1765536394; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZeldCe6qYZPyimdkGND69jIgl2NoiABZkiWKJp/7s2Y=;
        b=UaujPE97biv08bm9KrLA50JDxDOUUOTZR/D2uILHi76EtonicGmJbgGn8P+8TCJI51
         JFvZyVSiL2UrEVzmEzQq6fKChuMEjUlPJyXHd67jpo5u0VAVWLRDioe/RgQvGs7Tjw9b
         v1zRbRq6ixE3btdwMkUX77vtV84NSRFg6I67iTf4siSzuhDQvmJJ+PPE6wEPi62m0gEW
         BtC5QzyQqpWj9CG/OCVX/J1wNdryVxg5ez/dsn8q6OzQKD1iotDSJVPszJXkX2GrgPW6
         u2timRtxB7HnncqYLGDWgQcYkZr/f2R2PXNA18kZ1ycBJv5P4+pBmanQBKo++4nF2ob3
         la3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764931594; x=1765536394;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZeldCe6qYZPyimdkGND69jIgl2NoiABZkiWKJp/7s2Y=;
        b=QpDwLWt/pDWBChwvyQp/J0JLv4hPnwA9ubT+WeMXMCqovOxsWZErK+OeEo77t+uFJR
         EMkMJcq2o7rM/Uxqgb+A3NUyXLlKzrz7HqiY4tks5cYI7jV2XVJuwcZ+UBM9H3jPXQz0
         99s9NAisQoVa03//0FWqVjES10fYYEJSAnHDnX+X4PnJhzDaM05Ls/sztAzPXYCzg/J+
         8vZ7OrKHi5aqS4uO5viqAdSaCzZy+dy/hGAZX93WovZuYxBzJBj3P236SFjjjmkZXn93
         CEKK7XUk2OGjvt6VE68Nq6Nh3n5Oy8+CAiVBqmjw3m9K7cBoKhxXi2WcFXXC6sJBjRyR
         QOng==
X-Forwarded-Encrypted: i=1; AJvYcCVGjQsaxK2OAgXCfcpgkHvHe+8/0Rctdp45WFAH+iAqDsUViqRpcN0OYBVHzWyWpCwsYtw4Z3qT+M3fCFpBuQuOmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxunloFZsDJYrH9j/GrXCNFAeA6FR4ux9cIHcHbQqGRcjonvfmI
	ZJJQ4mJ4DzMEMZHbFqc3nKsU+PshzkXX1bB6tPrFgp0K+ueYo1AQcn2R1WSqH0ryQ+4=
X-Gm-Gg: ASbGnctmqe4K6wzG5wEytrk+wKnvX872aSARaNvgHPg6u6O5fNqwkqiIFZMnQO3BlYO
	fG+MmJTnUDsowTndNYqDWSxv9Mda3oN6pgcekSL5OAGEuAmsMy+gIizopNCG4oPQPMmqk1n3fwO
	ewbKCR0Ah+bqXap4hzgzXFSrpJ8A/iVuVVr5QsljwjhJZ7ioQIXUJ/D3UUFJY8/B6G7r4BQPBQr
	MJh1vkHb6F+SKyfODEleddza50Dsi6MDaxXFVcCE1NY0gIZUYHCw7cv6ZFrg20ROXkoVDbiD2cu
	LXDdkEudYyR2NBqBpdfABZ0M4BXBp7KwfHmgjBGyHbPMoF11zltFCY9V7axbFaxq2ceEVj/daAm
	vZxNOqUxRfJWJ/a6cd12uc4diB4nTr3WXspCyPYHzx/Qn6rCBBbX7+cUOT/beGAazuxrtX3Cl/q
	sO6bR85e/n1RErdbu6e64=
X-Google-Smtp-Source: AGHT+IFIqZ4oqaUOkvmJjCCjfKdUugdnEYMgHTyQPe+66ruGorS99ygL8INX3s8oKlDQsbc9oof0vQ==
X-Received: by 2002:a05:6000:1887:b0:42b:2f90:bd05 with SMTP id ffacd0b85a97d-42f731c3290mr9374011f8f.45.1764931593110;
        Fri, 05 Dec 2025 02:46:33 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d353c9esm7727765f8f.40.2025.12.05.02.46.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 02:46:32 -0800 (PST)
Message-ID: <da64005a-e6fb-4bbb-a97c-e6c3ada8aff1@tuxon.dev>
Date: Fri, 5 Dec 2025 12:46:30 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] reset: rzg2l-usbphy-ctrl: Add suspend to RAM
 support
To: Biju Das <biju.das.jz@bp.renesas.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20251110132715.724084-1-claudiu.beznea.uj@bp.renesas.com>
 <19fda177-6c11-45d6-9dab-3f75edceda4e@tuxon.dev>
 <TY3PR01MB11346F5E49BF172AE78C55EAE86A7A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <50937606-46fd-4202-ad4b-9ede5bff76fc@tuxon.dev>
 <TY3PR01MB11346625CD598704CC36C63AE86A7A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <TY3PR01MB11346625CD598704CC36C63AE86A7A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/5/25 12:17, Biju Das wrote:
> 
> 
>> -----Original Message-----
>> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>> Sent: 05 December 2025 10:00
>> To: Biju Das <biju.das.jz@bp.renesas.com>; p.zabel@pengutronix.de
>> Cc: linux-kernel@vger.kernel.org; linux-renesas-soc@vger.kernel.org; Claudiu Beznea
>> <claudiu.beznea.uj@bp.renesas.com>
>> Subject: Re: [PATCH v2 0/2] reset: rzg2l-usbphy-ctrl: Add suspend to RAM support
>>
>> Hi, Biju,
>>
>> On 12/5/25 10:53, Biju Das wrote:
>>>
>>>
>>> Hi Claudiu,
>>>
>>>> -----Original Message-----
>>>> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>>>> Sent: 04 December 2025 18:26
>>>> Subject: Re: [PATCH v2 0/2] reset: rzg2l-usbphy-ctrl: Add suspend to
>>>> RAM support
>>>>
>>>> Hi, Philipp,
>>>>
>>>> Could you please let me know if there's anything I should do for this series?
>>>
>>> If rzg2l_usbphy_ctrl_suspend() fails, What is the probability that it
>>> will suspend again without any issue
>>
>> How can I measure this?
>>
>> The idea with this code was the following: if any instruction of suspend fails, the suspend is
>> aborted, thus code in rzg2l_usbphy_ctrl_suspend() is trying to restore the runtime state of the HW so
>> that no runtime users of it to be affected. This is also how core suspend code is doing, e.g.
>> suspend_devices_and_enter().
> 
> The entire system suspend is aborted.

Isn't this the current general approach across different drivers?

Also, take into account that this code will still be executed for suspend
to idle, where power is not lost.

Also, for general case: if we ignore any failure, just because we may
resume from a power down state (where Linux state is preserved in RAM and
most of the SoC parts are powered off), there are resources that are
reference counted (e.g., clocks, some resets). Ignoring failures in those
cases wouldn't necessary make them work after resume just because the
system resumes from a power down state. The reference counters may not have
the right values for the proper registers to be updated.

> See the case 2 in logs[1] and system keeps draining the power.

Case 2 in the pointed logs seems related to resume, are we talk about
suspend, resume or both?

Also, case 2 points to a resume function that returns error w/o taking it
into account. The resume code proposed here takes into account any errors
on the resume path and put the HW in a power saving state as otherwise it
can't be runtime recovered.

> 
> Again, if system tries to do shut down

I guess, here you are talking about suspend with power cut.

> the same device will fail again in similar way and 
> The system will never enter into suspend state.

From my previous experience with suspend/resume implementations, I can say
restoring the system in failure cases in suspend/resume or not, is up to
the subsystem maintainer. So, I'll let Philipp to decide how he wants to go
with it in this driver.

> 
> [1] https://lore.kernel.org/all/TY3PR01MB11346A7B16CB3267F1A57302B86DBA@TY3PR01MB11346.jpnprd01.prod.outlook.com/
> 
> 
> 
>>
>>> as currently we abort system suspend
>>> and enable clocks/deassert reset which keep draining the power.
>> The code is restoring the clocks and resets to their previous runtime state so that any users of it to
>> not be affected. Later, at runtime, if any power needs to be saved the runtime PM framework will do
>> its job.
> 
> The system is enters into suspend state for saving power. Not to consume because of failure.
> Our SoCs will power down during suspend and device reset will happen during wakeup
> So everything will work as usual if there is device specific failures during suspend.
> See case 3 in logs[1]

They are still supporting suspend to idle, where power is maintained,
right? Shouldn't we cover this case?

Thank you,
Claudiu


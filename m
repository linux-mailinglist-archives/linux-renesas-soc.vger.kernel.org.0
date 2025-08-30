Return-Path: <linux-renesas-soc+bounces-21089-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90619B3CA8D
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 Aug 2025 13:29:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 493587C84EF
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 Aug 2025 11:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47BFE26980B;
	Sat, 30 Aug 2025 11:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="RyNjVKTn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712E1253F21
	for <linux-renesas-soc@vger.kernel.org>; Sat, 30 Aug 2025 11:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756553362; cv=none; b=QTgWq+3hS8y2BMkvJbxVQmqOa+k870NVLn3sZv67z2ytWsnWUIhizZejXJakeXA/jigJ9AcCzGvBc0rfXphiCGi0XBAelpLuF+38yLwrCsHl1QokgIAOIjd3Uf1c6BI10ntAP2EsvFJ9UAJKWQA32L+o6nFvmiyUZVFMhprohdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756553362; c=relaxed/simple;
	bh=MEIKQClUViPg7Ze3mAk4LZ/4ncPdqmvZTMfe39UVozo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D+zDZ6o5OtWehze53Flkr5zPSDipJOIAQc7BO9r/9F8F5RSRE1pkWtQlUbKHOsBOPMtvMuSO7ESJ4xNBK7lU32RKHuOUPZJ8D5UGbxylspAI+inO+w4uCwbhM41ubTuDrlUigSpuUwv+jJSKobzTrA7cysZpUgendEil4AFgcyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=RyNjVKTn; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45a1b065d59so19927185e9.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 30 Aug 2025 04:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1756553359; x=1757158159; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uueiXNXZTNf1xQdqp2NNONyv03FSw+XsD3EN6MNABTs=;
        b=RyNjVKTnnGL7uMc1i7QELhx7LXQnAa8swQMUZ5vakbxuDcmV7qQ2opUnApGP+KwiwH
         jUGv50dALnWI8Cz2EwFYTOZjyjkatadOEMYJUDKo3myedezXbWIatgdmkvo7eEJLr7mh
         CpwbYkMTpqiCQiU74d1KOrSbx1fxRj8iMAEzIASn12G3wApJh3KmQkcDcuYxOYL26Ai7
         Rx5Vb9gLmxXYeAvcFNYNGfO5eAaHd2e8mVXPXxOwgpeWyW7KFC3atD1nXiH6p9iM26X3
         kAW9HfatLRe2a/S6yU0DVMOEN3j6MY7MhduCtBSW4WsQ+Gn4ukV8UInp/3CZs0qKGNSe
         Js+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756553359; x=1757158159;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uueiXNXZTNf1xQdqp2NNONyv03FSw+XsD3EN6MNABTs=;
        b=jDOWcdtPDc9LSLjQcq3SR0u0m3bkZ5Eb/06RbsMWljcPu9XYkN8QbwkQUyHkjTexUP
         35sbHKvzjN2PjdwARollNWbBIXmO1hr9zQQfQVIoZUfmJngWJopfOx40Sd1r9mHmeHTh
         ROSzHNhxisDh5umXC7jvLBzu8OSNZvvt5kQEcFO1ntWJvYPdRyJJApSnr9BuEG7xEdJK
         P6VfjPc0O7e/CsuliKd1nkPHWgE2dS3oVhkeGHP8jIp4+hGqxtzplFvRJZVo/r0s7fwn
         ha3xC/BGI24TLvkOxMd2ZyCATzFyQoOBR1c8I7TGVQTQPQsrrxDtMxoRsFd30c/52XW0
         FX5g==
X-Forwarded-Encrypted: i=1; AJvYcCW/7jyjHdxdoaAIz78zulA8/QYJ0TOynuyFIvYgXq6e4KlLUkSz9bog6zmx4WTgpOyWb3pCBF1izZmEpw+3TPhzKw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf3ucJi1cYz9wxzI87JMZgQineKWwhtzLpWcQACcUzqLDxPcYw
	6eso20nn/R3HmThQPRQ39AZwkty4whGUan2z55hYBOWC2mspxhRC4iusC7cD855X1bI=
X-Gm-Gg: ASbGncs9vZumjmzHURNumgUjRIMhAgjoaLORrbpkOlXzn4nvJEzYa4IqSONmFXN99ku
	VehZGBRlfwE7EMVrki4zbZPDzet+QoFtKF2LhW2A9Ixo2ZgOoUdOHr8cMwkfEWMjfZ8BVuX1wW6
	P7fYU4uLg3G2kvg1y4yWWmO7vHssVnwafyiXQoAN64fsRCjLZcCTkuqwfr85SEMcUfUhohUEwhv
	RlzOayFTfGPGxLi9yQIaRny0paVnpdr+TRrLAcwW5mmm/zOmhL22iDFjhCsGo2cc6vbu1rd3KLY
	FNZ0AnbDlUnFCxByY38ufFJMDX1/W50sMs1TorkqUF72+PZ9n3iFfljYfIWWaXOrNC1mHVb0BLb
	Y9PXIn+zIH0tvXGuCyYlsL5Wc7caXt+0=
X-Google-Smtp-Source: AGHT+IH7PPaiMEqmOZP6nRGeQaHOVjXxgYPNKD9nk3y6xLqZS0hlG/uTqTLFCXog9cpjfTh7D6DADA==
X-Received: by 2002:a05:600c:a59c:b0:459:d645:bff7 with SMTP id 5b1f17b1804b1-45b8556a7b7mr7706855e9.12.1756553358753;
        Sat, 30 Aug 2025 04:29:18 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e7d1319sm81613565e9.5.2025.08.30.04.29.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Aug 2025 04:29:18 -0700 (PDT)
Message-ID: <785d826f-232c-482f-a54c-e6baad39f502@tuxon.dev>
Date: Sat, 30 Aug 2025 14:29:16 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] clk: renesas: rzg2l: Disable unused clocks after
 resume
To: Brian Masney <bmasney@redhat.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, geert+renesas@glider.be,
 linux@armlinux.org.uk, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250821080333.27049-1-claudiu.beznea.uj@bp.renesas.com>
 <aKyX4YJswZLuqA6Y@x1> <0d71269f-1c78-4732-8235-5640bf340d00@tuxon.dev>
 <aK2gE0CysSWisFwB@x1>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <aK2gE0CysSWisFwB@x1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Stephen,

On 26.08.2025 14:52, Brian Masney wrote:
> Hi Claudiu,
> 
> On Tue, Aug 26, 2025 at 02:01:56PM +0300, claudiu beznea wrote:
>> On 8/25/25 20:05, Brian Masney wrote:
>>> On Thu, Aug 21, 2025 at 11:03:30AM +0300, Claudiu wrote:
>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>> This series disables clocks that remain unused after resume.
>>>> This is necessary when the resume process is done with the help of the
>>>> bootloader, as the bootloader enables various clocks when returning from
>>>> resume.
>>>>
>>>> On the RZ/G3S SoC (where this series was tested), the bootloader enables
>>>> the SDHI clocks (for all SDHI modules, of which 2 are used by Linux and
>>>> 1 is unused) and the clocks for a serial IP (unused by Linux).
>>>>
>>>> Testing was done on the RZ/G3S SMARC Carrier II board.
>>>
>>> Do you think that other boards would also benefit from this change? If
>>> so, what do you think about putting the call to register_pm_notifier()
>>> inside an __init block in clk.c so that this same change doesn't have to
>>> be implemented across various clk drivers?
>>
>> Yes, that was my other approach I was thinking about. I wanted to see how
>> other people consider this version.
>>
>>>
>>> Alternatively, if this is board specific, could this be fixed in the
>>> boot loader so that the clock that's not used by Linus is properly shut
>>> down on resume?
>>
>> As a result of your request I did some more investigations on my side, I can
>> say that, yes, in theory that could be also handled by bootloader.
>>
>> I can drop this and try to do it in bootloader, if any. Please let me know
>> if you still consider this (or the variant that implements it in a generic
>> way) necessary.
> 
> Personally I would go the route of fixing this in the bootloader for
> this particular platform.
> 
> If this issue affects other platforms, particularly across multiple
> SoC vendors, then I think it would be worthwhile to have a discussion
> about adding this functionality to the clk core.
> 

Could you please let us know if you prefer a mechanism like
clk_disable_unused() in Linux for resume path?

Thank you,
Claudiu


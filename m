Return-Path: <linux-renesas-soc+bounces-10466-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 040B29C50FA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Nov 2024 09:42:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B3E21B28958
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Nov 2024 08:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FB5B20BB21;
	Tue, 12 Nov 2024 08:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="kEn/K0Rj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98A820BB48
	for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Nov 2024 08:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731400520; cv=none; b=ByOdgmy6bW5gotIhJhdGRSY5yzS9q2On23pip6Ru7rjGx3lw4LHCVZSlI2s99M57YJNq/q37HwC/55dxqdghwNKS1c1p8fmRcMqO/Xme+vBLVwUyDV4I1kGen2Ur+0MA6ZyYx16pLENS1ntpQnlDV1YakItkkUNS0igvqfewtHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731400520; c=relaxed/simple;
	bh=q1kY2sQYlq+hOddVsv3T5fQZjCOWNt9cci/DeyYLwq0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=cPjjE0Z6Yex0+l/L3G8RZrmmwsg6tlDQNQR7Fg9e2mXmqT5C2XYKqFZoVt5JbabTyAYhf3o7kflCMVZIAS+ufiIv4OKWb9fYPXiQ6oRXsbvuoSASFWej4VIluNenHX0PbZ8PIpof945t+lT5RaEIJhQ5IBR+L3V4e/l7KBZj+c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=kEn/K0Rj; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-37d63a79bb6so3566118f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Nov 2024 00:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731400517; x=1732005317; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PL5GeOh28TysV9Lqq7NP7GxRHBqQLXUN1hL7aKNKaMk=;
        b=kEn/K0RjlE+vo2+wilIXoOGshXRTmUj5jJzpPKaziwXLy3w2vpPI9jRqIfliqu78wX
         /lbqNpiWnJ29DWxcxBxMd2XNBmqipUIucxkPUhxHzvM58sSX2ytJefViUYzoJwiZknQl
         d0wB8Oahp9BIlG/SG3uAe3JSf7fvhKlKlg4AHhFyXA/D4gKHztN0fTwoCpRsTDtr0nlN
         HCBmTd40S6uF3I+kVj2DMtycdJ22GZwWuDDVDp43PGBmbfddimWTbaEvtWXL10jWaqAQ
         6hJDTAAC49PPP8JNYV7rMZEtdVY8Amat8VbGKYCscxRW4sRVn7PKRQlv8mVAzeTutznf
         QV2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731400517; x=1732005317;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PL5GeOh28TysV9Lqq7NP7GxRHBqQLXUN1hL7aKNKaMk=;
        b=U7bt/MHDVm5q1r97UVnV0XJsuv5XOtqNXUMrTecW0RUIXXktLhPpG1knyrqmECM2Ee
         Ztt7vjI8asMmT29/jybHV8iMXRYPLI6Rf8pet+s1LaVyUkkYP7pl5V72qVIhFWX1guiG
         ED/a7++IpmUOHU6oBKK9UGjSNZyWSmmoGyUjywJkJOnZFT10SwTRH83By3CioWIH1peT
         U/nx2upZq7WLQ0r+f538OxH0v3W/JmsLdOBm+ywU+RuTXzdYdVlIDQDwMhvx8gzFStXC
         ZCwHyofBQkVFEC8iCE7rbsnYz0Bxzz/7pp5Ti4bKfUFlwDuGCjKgoy/aQRCri+zy9ADt
         NnAA==
X-Gm-Message-State: AOJu0YzEF+X+ycxWOC8ch6hLEYcmP/GvcU0VLjZO5lvVlI3QQdbsPPKv
	peAM8pDhDq990tFkP4W9vXFhExBdm4OrSSvdDUg87WQYqMY2aaa8yqfNjQNvHgw=
X-Google-Smtp-Source: AGHT+IFa1LixkOeiL8eI5oMGEu2ThX65XIYTJoURm9f8rPbRKT4O56MDA08ZH8xosIwK+pODYwTchA==
X-Received: by 2002:a05:6000:178d:b0:368:37ac:3f95 with SMTP id ffacd0b85a97d-381f17255b9mr12724481f8f.31.1731400516852;
        Tue, 12 Nov 2024 00:35:16 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed97f544sm14918813f8f.40.2024.11.12.00.35.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 00:35:16 -0800 (PST)
Message-ID: <d19d12e7-aabb-460c-a37c-6cbd3fe4e459@tuxon.dev>
Date: Tue, 12 Nov 2024 10:35:13 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] serial: sh-sci: Check if TX data was written to
 device in .tx_empty()
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: Jiri Slaby <jirislaby@kernel.org>, geert+renesas@glider.be,
 magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 gregkh@linuxfoundation.org, p.zabel@pengutronix.de, g.liakhovetski@gmx.de,
 lethal@linux-sh.org
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-serial@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org
References: <20241108100513.2814957-1-claudiu.beznea.uj@bp.renesas.com>
 <20241108100513.2814957-3-claudiu.beznea.uj@bp.renesas.com>
 <530f4a8e-b71a-4db1-a2cc-df1fcfa132ec@kernel.org>
 <3711546e-a551-4cc9-a378-17aab5b426ef@tuxon.dev>
In-Reply-To: <3711546e-a551-4cc9-a378-17aab5b426ef@tuxon.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Jiri,

On 08.11.2024 14:19, Claudiu Beznea wrote:
>>> @@ -885,6 +887,7 @@ static void sci_transmit_chars(struct uart_port *port)
>>>           }
>>>             sci_serial_out(port, SCxTDR, c);
>>> +        s->first_time_tx = true;
>>>             port->icount.tx++;
>>>       } while (--count > 0);
>>> @@ -1241,6 +1244,8 @@ static void sci_dma_tx_complete(void *arg)
>>>       if (kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS)
>>>           uart_write_wakeup(port);
>>>   +    s->first_time_tx = true;
>> This is too late IMO. The first in-flight dma won't be accounted in
>> sci_tx_empty(). From DMA submit up to now.
> If it's in-flight we can't determine it's status anyway with one variable.
> We can set this variable later but it wouldn't tell the truth as the TX
> might be in progress anyway or may have been finished?
> 
> The hardware might help with this though the TEND bit. According to the HW
> manual, the TEND bit has the following meaning:
> 
> 0: Transmission is in the waiting state or in progress.
> 1: Transmission is completed.
> 
> But the problem, from my point of view, is that the 0 has double meaning.
> 
> I noticed the tx_empty() is called in kernel multiple times before
> declaring TX is empty or not. E.g., uart_suspend_port() call it 3 times,
> uart_wait_until_sent() call it in a while () look with a timeout. There is
> the uart_ioctl() which calls it though uart_get_lsr_info() only one time
> but I presumed the user space might implement the same multiple trials
> approach before declaring it empty.
> 
> Because of this I considered it wouldn't be harmful for the scenario you
> described "The first in-flight dma won't be accounted in sci_tx_empty()"
> as the user may try again later to check the status. For this reason I also
> chose to have no extra locking around this variable.
> 
> Please let me know if you consider otherwise.

With the above explanation, can you please let me know if you still
consider I should change the approach for this patch?

Thank you,
Claudiu Beznea



Return-Path: <linux-renesas-soc+bounces-10922-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE8D9E3F60
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 17:12:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B76F281189
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 16:12:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 821C02941C;
	Wed,  4 Dec 2024 16:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="WBedOOG/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C95015B10D
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Dec 2024 16:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733328775; cv=none; b=YaiGmxcHbll3ZZ3cEHw1NMdhyxSkuNw34TXBC8xVtCFY2ewXVTzG7GDQP6pB0Jdop6IBcvnYUrM5JAkhtgvPIhpGyAs8d/z7MWP/LQ//p3Bgt5T2FPgdXtohHW+IB3evnWEgnMcRQYCornJCm5javXN3IBb3JAlGOaF4QGRIyMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733328775; c=relaxed/simple;
	bh=WMotf16BNP2hl+VFEpZRiKSDivn8XEcTtqQ7ghZ/DsY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EJuQ/VNeIymygFVqiv7f8x6M8UeyAk/xlxb49fflTnol/hpSM5fuhYGYPWvzY5pl0aKAmrd0G3xIeYRS5K8xvPTS0Mmg9mhSnSl2Nacu9MTZJz1ttRXJPqiEhBWV7YXtghsXYn9YuY5olOyF1G0Ua7ZwVZhZZ3GY3YVsoP4Z8Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=WBedOOG/; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-434a2f3bae4so64936815e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Dec 2024 08:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733328771; x=1733933571; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hQTQKeCKhE7MCIO8rjYyScRAwZVqxhfCtHNY0N/EVfU=;
        b=WBedOOG/+cUqDyNvxcPeikjnyJG+pPqA8DckCC0q0CIKPZWjBx5842PCKtvmVNA9Di
         d5CtgrbUrbJCWw6VBQodsnNaQxYilSxj/l5C+PGyQs+Meih5jpzZ7ZmqPXQU6MkwAkWm
         Dr7lbIirLOZxq8XN4sFN3LpBvGL+afxcw51SYWc6hud4nrDpkgO2CJ5mtkojNoLH7C4z
         nQqJEcquknH3baW1JWspGUPPFcCMSH8DCMWPGneTwfcMoq7ASaMlGVdimQcvrlEsIZS8
         zGHX1/eGn2nRAgQw8zgQoV2bcgabENqChk9FKLWKqQfFpy4XctzjZtWQN3/9ejOSEuC0
         BDoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733328771; x=1733933571;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hQTQKeCKhE7MCIO8rjYyScRAwZVqxhfCtHNY0N/EVfU=;
        b=fT6ay/rjU8JInArHziK8ggCTI9E5mceoIDuev9zWi19C6SHA6p8HHYt8Vzdk+pruqM
         CfuplpQEaKzhMmQChMxie4vw2ZwviM57MdQa+W1RXOsq0O7cn52zYHTc3wBUA+t5CE6W
         mj82bexOCHjrzNJfljyix5PXqQV7aYYSh60I/pkdDZxA3cjTcY9mIfNsZ2OBvZRj5JWZ
         7I/0U8ZIszcFZiEaYGtX5Da9fi4Fj7tQ4zlPmAFwjOnbpyAHLcod1EvEiVSg4aycTf7T
         me77xH1ZCA/gQO+pheb832m38X7tg6sI41OCRF26XrVCkFAb+b5VdKqG4JRg8CILj/zs
         Al+A==
X-Forwarded-Encrypted: i=1; AJvYcCVyeJ4ZRe+XAvBL2l7hEHe1qq+jWwHMywkfsRJK8qQ7yCdHpSG7sSitesC40pG77p1teM206gE1DlzOu/V8cugxFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJq/SKk7kp3Ncu5Q0jx4leikhabXiRWJUZuOpSzgJTfWIOLbSJ
	qexMPpVKQGIJQ+jERveOILDgLPrX0dHInuk5XcQ9cdy6cbWJ9Xk5TNIJkqkmB+4=
X-Gm-Gg: ASbGncsYVhBvmax91SlwiCQ05oOKXIvJe6ewD3hnYofbCv7bK4cFzHcbiNuS66sUZui
	WLy3JtQ4LxujC4ApavHoVnnFo38iisigz92JvQiqHBZUcFQrTBWZ1F3c2wYi+wG4wZWIW5UkZZ2
	nG4oLGfuMkoyhfJ9PoR9oqvhIoPyQdDztv2U3VIbMfYK9WXRFo/k8Vpf9RzKDqeogTJQsrJF/1X
	FZG8cdMi7T3xfp3YqFFhF4ECNzcBN6Y7AakfWs2nv/a0QVAlARmNd47w44=
X-Google-Smtp-Source: AGHT+IHSduioKZEL8oXnhOPYaiOLYjsifTz/WCnsJQmND2DTXtSP9onkHLbSag5wfD9W0f7uppzcdg==
X-Received: by 2002:a05:600c:3550:b0:434:a781:f5d5 with SMTP id 5b1f17b1804b1-434d0a15047mr70591065e9.30.1733328770818;
        Wed, 04 Dec 2024 08:12:50 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e3b99249sm13430700f8f.88.2024.12.04.08.12.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 08:12:50 -0800 (PST)
Message-ID: <ae80262c-82c6-466f-bbcf-90ba3551dabc@tuxon.dev>
Date: Wed, 4 Dec 2024 18:12:49 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] serial: sh-sci: Use plain struct copy in
 early_console_setup()
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-sh@vger.kernel.org
References: <e097e5c11afe5bd4c01135779c9a40e707ef6374.1733243287.git.geert+renesas@glider.be>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <e097e5c11afe5bd4c01135779c9a40e707ef6374.1733243287.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Geert,

On 03.12.2024 18:30, Geert Uytterhoeven wrote:
> Using memcpy() prevents the compiler from doing any checking on the
> types of the passed pointer parameters.  Copy the structure using struct
> assignment instead, to increase type-safety.
> 
> No change in generated code on all relevant architectures
> (arm/arm64/riscv/sh).
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

I've tested this on RZ/G3S on top of series at [1] and device tree + clock
patches from [2], with renesas_defconfig and with upstream config, in the
following scenarios:

1/ "earlycon keep_bootcon" in bootargs
2/ "earlycon" in bootargs
3/ none of the "earlycon keep_bootcon", "earlycon" in bootargs

All good!

Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thank you,
Claudiu

[1]
https://lore.kernel.org/all/20241204155806.3781200-1-claudiu.beznea.uj@bp.renesas.com/
[2]
https://lore.kernel.org/all/20241115134401.3893008-1-claudiu.beznea.uj@bp.renesas.com/

> ---
>  drivers/tty/serial/sh-sci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index df523c7444230836..1ed13ce2c2952547 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -3542,7 +3542,7 @@ static int __init early_console_setup(struct earlycon_device *device,
>  		return -ENODEV;
>  
>  	device->port.type = type;
> -	memcpy(&sci_ports[0].port, &device->port, sizeof(struct uart_port));
> +	sci_ports[0].port = device->port;
>  	port_cfg.type = type;
>  	sci_ports[0].cfg = &port_cfg;
>  	sci_ports[0].params = sci_probe_regmap(&port_cfg);


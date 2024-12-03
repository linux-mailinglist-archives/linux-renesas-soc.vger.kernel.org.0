Return-Path: <linux-renesas-soc+bounces-10859-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7199B9E27FC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 17:47:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3669D1695D2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 16:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3CB71FC10C;
	Tue,  3 Dec 2024 16:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="jLsMPxXg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86FC1FBCAD
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Dec 2024 16:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733244351; cv=none; b=HSUwggamCE13ma63Q6MBVKJ8dF3tRoZqtjeBqLLCFlOGkaGLzHt/gaK0fd2cdYJKkyrQhn3Fx5jATvGizg687vzj6QRIU4nFTBHyle3Ppi8zpGVRwyr6LpUXbd4lBxOhbNUsB+mqoPuMPVmdnnQaaF5LedYpkibMAUQ6y4Xxteo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733244351; c=relaxed/simple;
	bh=HFhimR3f3IJBGPJ8Z6XUIgJiKfqHLCliyUL95uhgTJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bwzB52jHR+E2Xv4ajNX9N2sSGO1p7G+BSi9i5zZGXfSA0xDqMZ7V2J04BO03lc6P5PFAp4OjsM0oNW3WxK5URiaOs//N7LvRyBx/g/+3B5gR7Ygt578q57131XZHx7SfotVKmtzG1G6m2ucaXEJIJIo9Cl4+sjKjXVr8lvb3ezE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=jLsMPxXg; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-382610c7116so3811392f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Dec 2024 08:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733244346; x=1733849146; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L8CkHKyEiZMda1eN794jIca+GC74Y9jUyCzeSzIcNNw=;
        b=jLsMPxXg6a/0SQak+pOsfSShyoIJxgBBf3kqL29Jksu1HRvlBL5BxZtfIv5cAfmoZ3
         qVzLdL/QdQDkkDAaxbarhRDSfVIKJpiYXHZw2HvnwvRaUixqWISaZeX9gDQ9mjELfPDY
         Dx7/LH6H4EAHiLttoh3SePv8sPzXM8JH06BKT+FVGldLGhokb8xzXXfKcsdRnRrU5GdP
         XVj/QAEVy7UwnClJrpLsElPLEFjJAgBpld62FCSrQzLWTCW80mWcKGNHb+Ldi8aKvDD7
         eLwHUNcJ95Hewvp85t9QpaYPTwd4rVqT+UkftWz5+JMTXuwcS9NDvcty2vDGay9jEh+i
         h2Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733244346; x=1733849146;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L8CkHKyEiZMda1eN794jIca+GC74Y9jUyCzeSzIcNNw=;
        b=cINen857X2O/+bCcm4U/iivNios6iEwtC+GYqyxsxdRhglJhufJt6WjD8Is7TCmNj8
         D+6bVSsVp0veCmvr3kqSrPy1DI6x2w0LSTHmjQ6BnQ+Xg//OkULuYK5HTJF0gVzvFKj3
         pMCqZHGTWTDqvx6SfVp5p8Y7WW4AF4rQr4RoAxYxiGNsoAPEbFLupST/mFnjUW5irAN5
         P/eIkAzyjdL2m388pkQi51qdGO2h+bO6ZaggSaaNlXvWgX6IInl67I4UmYNbEuSrCvHZ
         rNuHVzZ29NLQqe5bdeblWraxBAuyGtAxDHz5abpJ/lduW8wUwzr2iMaRWIIRJKaLB6rC
         aDWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJ/Et0JAJyHYXw2PDBt9VUQ8g3JusOPc14gsJG2pUu2pxagPkozbrAgidL0zi+IRf36RHJ5Iout3DCS9kSHUjmVA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0DQaG88JBa1PZAhd49aIe1hJnQycmnU6bSAYRjwtuiNstCWLR
	gX4UM9hwTsjIk4pxPB2peGyfzxxos5l2gv/j6oBGeeOqq3zd1tZAsc/aIP0TnxE=
X-Gm-Gg: ASbGncuqAuB3ew3lW/weXeS52ox+ydoXbohQTvTg25dJYnG1VJsEsZaOlszBPDFa/X+
	FaRqSv4NQKnS694gEr1IQNwVKIMjJV9WPnf/NWEF0WI6IlF6V8IoJFbTqEv16ohsAyLBaDNkidX
	71nPRBgw9Vb4t9rFcI6Vbb+0O24jr9laLpgvAfk4RHUZiMOiragplnKnKF7NaGSmYxM8NCUWMVB
	fbcckhdwS4B/+3LqyHynAPRZxQFfiyfHeU3FaKB553eOBZr46qDekGF4OY=
X-Google-Smtp-Source: AGHT+IFpdovFyMu7yZWafskTqVsOEzqiVm8QmP60EveHuCZ5asumljo9Ljy+25DKByrk/biF+Y7Nhg==
X-Received: by 2002:a05:6000:698:b0:385:f092:e1a with SMTP id ffacd0b85a97d-385fd3ce99bmr3020873f8f.11.1733244346076;
        Tue, 03 Dec 2024 08:45:46 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e3cbe250sm10449499f8f.94.2024.12.03.08.45.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 08:45:45 -0800 (PST)
Message-ID: <b71bb27e-003f-4b5d-8654-c7639b105e29@tuxon.dev>
Date: Tue, 3 Dec 2024 18:45:44 +0200
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

Not sure, do you think it should carry a fixes tag?

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

I'm currently preparing my fixes around this code. I think I should rebase
on top of your patch :)


Thank you,
Claudiu

>  	port_cfg.type = type;
>  	sci_ports[0].cfg = &port_cfg;
>  	sci_ports[0].params = sci_probe_regmap(&port_cfg);


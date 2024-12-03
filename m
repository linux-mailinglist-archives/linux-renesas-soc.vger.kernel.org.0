Return-Path: <linux-renesas-soc+bounces-10860-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4323D9E2806
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 17:49:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 111DE28B2D9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 16:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADEAC1F8AD8;
	Tue,  3 Dec 2024 16:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Ach9vGgf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA1E1DFE2A
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Dec 2024 16:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733244581; cv=none; b=b9j3G+EYU1u6fbHmD8iD3VzjQRNT7S8HUBs5u1VLfw9teq4VPmCj6Liw+SqR6am8JSBq/WwkqRbxMUf3+mJwdKJPTzEDdeZAnWj1MLEE0nR2zQyGfJSCFl5FvNkLiR0d/yl49PN/09H3Bb2ir6hPMEJfot80PTRU29tFPmqg258=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733244581; c=relaxed/simple;
	bh=rP8WCl9KXwWdYzRKyzkCki01UNdVN/Fpb3/lyUZgLZI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=o+69MnFIgFRMy+utCmgxPxG5qwOlD9AbVmdEiT3CyZbeevJ7WOiX7nlVNejhvDqaZ7Nb8wypfep7ImCzbGhgU3zFWLv/nLWe7WbD9eVsRL7V3UYntG8EYA31h6Pp4M6KjM3Tsv4tU9P20jRy1OVwrysYbIZuVLRmjZ9cpQS/ugw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Ach9vGgf; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-434a752140eso48643345e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Dec 2024 08:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733244578; x=1733849378; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q4VmWrSSj/7zXUbh+NYZqbK4S1QOexkNE0xeEkErR8w=;
        b=Ach9vGgf/u6uxfR6dU2XDHlUC8GI+QM96hayjxlKOTD7SJvuzQgGp6zfP0Cf1gO1Dt
         gny5FfOITvm9sd1j1RN60Vn/mmvQcgboLXJXp/C8hGYrn63mT1eDsdwVLAVLpsCF9i2Q
         56hcK00o6/AX4JdwnrzZ3p9Pzw5lIl18ByuOyyA+h+yO7Cbm3OX325V3ZN1euVa429xu
         vZmCrx7oClF9yZ/Hd1878GBCOFvRZ/8Wuz4Di+/iwObHAXwj11mZ8sUvRofr86kdO+kV
         uKIhVMCCsY+OF4/TeETKT1ZY0OZx7KfqadALAPwkagEtSUPBnSZs5nOPK4f+1RoBZadB
         uQxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733244578; x=1733849378;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q4VmWrSSj/7zXUbh+NYZqbK4S1QOexkNE0xeEkErR8w=;
        b=W6/4rEiD6TcZOLUDlyyJyGLXLNHkRl0QIdgTSumlWqaqKBQiVtkakHKY/X5y35WBak
         hIH+CTDh3kC5p44U2J2PstJkOX+8Iz/CVxQJpIcMqfkFmwHbhSd1DBFU1i0YOD1adFrW
         u+G6P+CYAydfU+fqdHVb4MsmTLG3K9cRBo/rxB+6DVGgfS0nZLBt5jLAvt6HIyZOBRGu
         tpJ3DRWvsBoys58jjuM3R3TQ14YAIWgBLK6RQ1B/XxfxSAI8IUdjlHJtJhNEzQVeePHr
         4jhrZTSplC7QRdq42p0YOd+gduFe2MysgXvxjGgTFVwpdCx02ZiW2JzfTwU6ONK8RnaJ
         faZw==
X-Forwarded-Encrypted: i=1; AJvYcCW1Y32kPOJaGnSZ5KOLYjQcuJYLoKoJnbmjABl05lmVE1hYMKWAOmgl9wTCCUtkYLk7nlinz4JonljtRohDJ1BJDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYbroX1xSEsgjaqOMH6LE6IrSbdo8HAZFfcUDcyjmREOjEdiny
	tOAT/MInjyhbXbGFve28QFJUah1u8V8JQVH71Sr5ndaN2m4VD+zbykdJnD4ryJI=
X-Gm-Gg: ASbGncsk3h9tvMKbapjMzCoqZ0hwETQPpvSXn4vxBI9nEnRmP2Rkt5lLDlstx571rNt
	UOCBeYdP5+d2GB2BlE9vYH+YbAAJf/T7hDRosUFxyaT83NuwlZyXm7Jc0a86Bf2bBRiI3qO6Zd7
	LfSVyyYRsjT77U2AiWZ3UBX/2vlijXIUNVYA5OQWvFFVeErW3QkkuicYjZu0R9mIlAWQJgGSF4V
	9e5v5X5HBheamScpCOGuFzGvVR8yCO+kKlTu/yQs1tZmebLxUx0osWiK70=
X-Google-Smtp-Source: AGHT+IF8xk5YUKpQ2WS30TSsE/BDo+SYDlLam0pZbOL1ZMMuaAzGwoSuG1kxkRYwJbZKPJNXTkGqJg==
X-Received: by 2002:a05:600c:3108:b0:434:a27c:b864 with SMTP id 5b1f17b1804b1-434d0a1cf53mr25519705e9.33.1733244578277;
        Tue, 03 Dec 2024 08:49:38 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0f70d91sm192897255e9.39.2024.12.03.08.49.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 08:49:37 -0800 (PST)
Message-ID: <1eebe854-9e33-43d8-b3be-abaa5b71cd18@tuxon.dev>
Date: Tue, 3 Dec 2024 18:49:36 +0200
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
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-sh@vger.kernel.org
References: <e097e5c11afe5bd4c01135779c9a40e707ef6374.1733243287.git.geert+renesas@glider.be>
 <b71bb27e-003f-4b5d-8654-c7639b105e29@tuxon.dev>
In-Reply-To: <b71bb27e-003f-4b5d-8654-c7639b105e29@tuxon.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 03.12.2024 18:45, Claudiu Beznea wrote:
> Hi, Geert,
> 
> On 03.12.2024 18:30, Geert Uytterhoeven wrote:
>> Using memcpy() prevents the compiler from doing any checking on the
>> types of the passed pointer parameters.  Copy the structure using struct
>> assignment instead, to increase type-safety.
>>
>> No change in generated code on all relevant architectures
>> (arm/arm64/riscv/sh).
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Not sure, do you think it should carry a fixes tag?
> 
>> ---
>>  drivers/tty/serial/sh-sci.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
>> index df523c7444230836..1ed13ce2c2952547 100644
>> --- a/drivers/tty/serial/sh-sci.c
>> +++ b/drivers/tty/serial/sh-sci.c
>> @@ -3542,7 +3542,7 @@ static int __init early_console_setup(struct earlycon_device *device,
>>  		return -ENODEV;
>>  
>>  	device->port.type = type;
>> -	memcpy(&sci_ports[0].port, &device->port, sizeof(struct uart_port));
>> +	sci_ports[0].port = device->port;
> 
> I'm currently preparing my fixes around this code. I think I should rebase

s/I think/I'm not sure if/g

> on top of your patch :)
> 
> 
> Thank you,
> Claudiu
> 
>>  	port_cfg.type = type;
>>  	sci_ports[0].cfg = &port_cfg;
>>  	sci_ports[0].params = sci_probe_regmap(&port_cfg);


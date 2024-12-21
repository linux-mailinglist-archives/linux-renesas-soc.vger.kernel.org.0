Return-Path: <linux-renesas-soc+bounces-11671-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E81729F9FC4
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Dec 2024 10:21:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 174E3188AA0B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Dec 2024 09:21:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3800F1F0E4A;
	Sat, 21 Dec 2024 09:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Sw+01yZA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6AD1DEFF8
	for <linux-renesas-soc@vger.kernel.org>; Sat, 21 Dec 2024 09:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734772858; cv=none; b=jMiOGsOhiX8awjkSXhyi9go+nZ7ORTdqQKl3iQh6nCOHg7kcKRRv/vuM2t70/8CgQ2VqkLog3c1ubrqqNS+zt04rqM7mKcBLZO1GS5tLE3e5MgBjz2PXCHpclAuUPoQBFfULF6wotTK7hUIu94zXQnYXS5Bp3LBzmXcVnhJ5QCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734772858; c=relaxed/simple;
	bh=VHnZv4XouvakSLRVDy7IS8oaB15YN6IWvRDzQGCuB9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ss6mUW5rCJ2v3U9RLMFFnQA8eiVMEOiB2WLIEeVKza24zNh4kl7HvsXwqk93xuXxww3pTBj3aZxVO8nKFflfiUQkO3a/tzrXN5oAe3tLpxziwkHIzDce+hNeqLJkc2TiK8VFCJ46WZagH+d2nHhuugn5U56nusxY/MUliyzqJ10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Sw+01yZA; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38632b8ae71so2024368f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 21 Dec 2024 01:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1734772854; x=1735377654; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e0De87n2R9OMl1pqS66ZPnGoUWbdTS9Pio0ovVmKAmI=;
        b=Sw+01yZAH2gypGA3QP2U/FmENIH+WKZJHdZmwyul3tce+qA2uD3Avqe09a0YxRb+y7
         nyi/WJkqUx1p+XOxrave3xE2UDLDY6Kg3t/Bi7tNnzpK6sEVFRkOJ81j9qoMN5e+LJJ0
         oDL/Y5ZuT5oBb/wenLHErX9ubcDwAh0aoyNSYRB4PRKKEVCyxAVAkYTcTFlEAfiNfOYS
         EIN4lJNuLkXXiGJZ/YKQQBdh4EQNcNRF+D8YQ+r/H2PvbGvGMZ0uMFti8/w5kuS+JBHy
         qrIYWjUNbZGrnN/F1K79hZMzK6DayNIxj/OLkLSOWBSxb3PgCkWK5U4TBJGpitjOEyHb
         z4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734772854; x=1735377654;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e0De87n2R9OMl1pqS66ZPnGoUWbdTS9Pio0ovVmKAmI=;
        b=Ko2m1YBG0EzVuj3Hqc4IAxt55BZXVQJqY2B9qm3R273hIPLCA0+PDOuPU6084QHnbi
         yKdOjfNrHx7GSJP5Luq2e7N1xB0XZYRXLtd1PPD8aOZK00ch4Dk/OOMSmDNPHfQTALW+
         NioOwcH3RegvskXskfUc47r6H6mFjhLlXfSh5/lnwBtci8lDEhyvjmUX7wC4oIX07Ydw
         v+LmzG9KLPdcTpNrMJqZUJDWy3BpgJBXv8JoD/Pgu2o6hWWFQvxbzfFUyZNOamFNJUw2
         zdwhpNxaTaf9hhq/WGEWTMJvCAU1M0i1AAjJ3goWVNPSN7CmhkGsnGiEO9jXg8rk8FoP
         x5uw==
X-Forwarded-Encrypted: i=1; AJvYcCU6RLoMrnSOM1OpXxZk59s2F/oUF5/6sVTbeyFbi8KkiaNqzAB0pAH1ecI+P2Er9k2duVLnqw39ug1NqfyyI0G1ow==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/dwPuDnLzGPXim9We6afR/sQvkPV712TDBL65f2r+ht6XvPj5
	iKb7xthwZNl11IMZy0zbn9Mci3Ei+oq6PLch4iRF8htKdlOpzloHgo2Bd/pq1us=
X-Gm-Gg: ASbGncsxDnTBxpc6dKy4Dk0/50I3rzuCuf3ntm9zP0rvz0C9FJcgt4W69wCr99TMMf5
	pG4p4hOKC7H+nn5HwPaWqF421C1O73UZPY3jntoeurGJf5W5s/1E5mE3qOK7NINDZeNEYKu65rc
	RF3Rdy6MuDY50zvamt3Jf+hSdzDOhGeqnY6mXU0hKNr/p3ySIv8nVQOHCSbAsH9EuzDkKLnaQI7
	x3AOIXi9u1YK9OQwxI1s7QFPzPchwTMEyaTnXAyXZ00/qf3PTaVodcadkTi9xdBHw==
X-Google-Smtp-Source: AGHT+IHSawxlzvKqoAwoM2xEIw/46BhuVjzkLBsLv+6XyaH9hxc35l2vQOjv8VzuN9mJzjfLSVNtuw==
X-Received: by 2002:a05:6000:70a:b0:385:e176:4420 with SMTP id ffacd0b85a97d-38a221e2c89mr5559230f8f.10.1734772853650;
        Sat, 21 Dec 2024 01:20:53 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656af6c25sm104008455e9.8.2024.12.21.01.20.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Dec 2024 01:20:52 -0800 (PST)
Message-ID: <7685c7a7-3bba-4709-bdb2-1dba22af9146@tuxon.dev>
Date: Sat, 21 Dec 2024 11:20:51 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 3/6] serial: sh-sci: Move runtime PM enable to
 sci_probe_single()
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 wsa+renesas@sang-engineering.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 lethal@linux-sh.org, g.liakhovetski@gmx.de, groeck@chromium.org,
 mka@chromium.org, ulrich.hecht+renesas@gmail.com,
 ysato@users.sourceforge.jp, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20241204155806.3781200-1-claudiu.beznea.uj@bp.renesas.com>
 <20241204155806.3781200-4-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdWQ_kHd3qi3j4D4keyxbaKE5MS6ZzDwJBaNJ4b5skr1QA@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAMuHMdWQ_kHd3qi3j4D4keyxbaKE5MS6ZzDwJBaNJ4b5skr1QA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 19.12.2024 12:18, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Wed, Dec 4, 2024 at 4:58 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Relocate the runtime PM enable operation to sci_probe_single(). This change
>> prepares the codebase for upcoming fixes.
>>
>> While at it, replace the existing logic with a direct call to
>> devm_pm_runtime_enable() and remove sci_cleanup_single(). The
>> devm_pm_runtime_enable() function automatically handles disabling runtime
>> PM during driver removal.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
>> --- a/drivers/tty/serial/sh-sci.c
>> +++ b/drivers/tty/serial/sh-sci.c
>> @@ -3440,7 +3434,6 @@ static int sci_probe_single(struct platform_device *dev,
>>
>>         ret = uart_add_one_port(&sci_uart_driver, &sciport->port);
>>         if (ret) {
>> -               sci_cleanup_single(sciport);
>>                 return ret;
>>         }
> 
> Next line is:
> 
>     return 0;
> 
> so please just merge that into
> 
>     return uart_add_one_port(&sci_uart_driver, &sciport->port);
> 

You're right with these.

> Actually [PATCH 5/6] makes that change, but there is no reason not
> to do that here.

I remember I chose to keep it like this as I had the impression that if I
format the patches as proposed by you the 5/6 will just revert what I will
have been done in this patch. But I think I was wrong.

Thank you,
Claudiu

> 
> For the logical changes:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 



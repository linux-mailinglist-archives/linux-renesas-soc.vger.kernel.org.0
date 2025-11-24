Return-Path: <linux-renesas-soc+bounces-25072-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD6DC80B24
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 14:15:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D8EDE4E431B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 13:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C526F153598;
	Mon, 24 Nov 2025 13:15:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330637260A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 13:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763990129; cv=none; b=XCjGSCmFK1zD7AxPwOVn3CXTiCvlZVg7hen1SjF9CSwWTphQLPJVV58ZEFaSW6I84EdbtIo7pp2Czl5aw7m1lJIcwyblyB4szyMQTKmQ0iFRZxX2O+jSaP4LE/bXupaMBRqZjqp1WBUC6Yc+g0EuCWp2gQzG4L24dHs1YLYb5rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763990129; c=relaxed/simple;
	bh=MQGhd/wYEtvBqgNHeSYomI/dq1FlZj0IQ+KSiyBBbYc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kjQTmPbWvKGPMkWRrFIX8BVr1s//wh5uk3/EeM+JwlmH7b1vVLcxdkm1gQmJRx8kX3qdqMbLA8qsvZ3cE/Jw2Vf0uOUnpgL0anHkn+iS0qaCaYGr1DLoX6EKAeNgHo4eBTUjgI8RyTkgStts2AFOIUvcxAazXg1OAY3NeSOIzAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-55ad466ad1eso1208327e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 05:15:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763990127; x=1764594927;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=soCuFW1lK02VvdSOiFkFf8JUU0Wwfd7dxHdww8TkIzg=;
        b=ktmzdohBpLjRv0ceMRvBVerq15Dlqj5UjF9Pa55QkX4lHHA2o1ccWDQKFEOfPoZf2G
         psbHUzO/QqvL+oAHSvAuVpvZRr7WH+/nJiBzN3SDvuzf+CrUSeV1w+uxGKremkeTPxSn
         BUkpAyHxCm5cjIOBX3m0/n/9K73ebY7R0HznXzlDbwbREPf5MwE31vCXlNwITcRA+cR5
         j4WBzGcDeCmWJKP5Q466w8QKqgRGF+N+U4AG6hw87zcxhuirconhtVYyt3jiflotWTmo
         yK/BpdHB63LybvG4HO+QAXwkM+G7x/lDvwOt+G4co4nVimdeYHukpV1TsTTwzhxlEWmk
         otYA==
X-Forwarded-Encrypted: i=1; AJvYcCVN4i6TopN46iqE+NXjsbLHBVgUylY2l1BzvWwd9J/Rzf/9zhPL86AS3+jaSF9pVaDrACD4rkS+mThq5EYjEkje4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/4UGmKZsvgDLzzwogmk0XbCOFqwDn/ZymB8QysevtBw9LEfiS
	LaLZlRnCJCBlMTjvu66GP8nazml6RdDKhREGAntwubtNEen0+n5L5vfxQX0bRZMY
X-Gm-Gg: ASbGncvCtCk3GCwcjGbN8MrfeeI0sG0/Qmlr0rC5prMe1i+bw4Feb50q4P6nwWGF22v
	XWrak7n3vPSOzdFFWY5Css7g7WOAIstmQWaihwdUVf0ImKunS9kMF0PUTFWFSN/P3W0+YDd8qOW
	cs3pB7Nri+MjiP5QSVbjoHxOPgBAOhZdwkP/Am9cStbZypYNFtD9KUi/iD8PNJNBYmbaA7MLJ4r
	CF0e1KruiJkmmWp0jg2/EBeLYHreAlNwt6yd/PWYM5FPvNKiqk8+Zu8+VCGOPhpvagld0SHmLMw
	2gNTFQ5Mysob5C+Ya2VZyaJ/ms8SNhJWl43q7okgQqE2L9Wo246z/HQqUYc6OIKxjdNHdzyzh6P
	DW+DYFvfjbg+H7+XFyKFBAZUOPmN6vvcYQNsoJ77dY3cC9985aTvIe5N/CVLtJD/VQTXw65dnPD
	60J8QgK8U28aGjmiSFr4zd6fEWH2Ki8n20/A9BkrwQfC3r+yQLieqZ
X-Google-Smtp-Source: AGHT+IESAnaNnKW0YwiD0nnLyFB0/+DpM42Ym4AfRcKgGC7gayU04F96sdbMiji+5UDafJ6tfgbPuA==
X-Received: by 2002:a05:6122:871c:b0:55b:1938:9183 with SMTP id 71dfb90a1353d-55b8d6ad78dmr1777749e0c.4.1763990126771;
        Mon, 24 Nov 2025 05:15:26 -0800 (PST)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b7f76e8c9sm5400457e0c.10.2025.11.24.05.15.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 05:15:26 -0800 (PST)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-55b104727c8so1206674e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 05:15:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV5P/uBBndPoawABgob4Lb/gQJPXArc1gkgcmUOaQT5JBharD4N95Bq3qH00PiItLXbeieMaSeGZ8JON8CwRUCBMQ==@vger.kernel.org
X-Received: by 2002:a05:6102:5a97:b0:5df:b3ed:2c8b with SMTP id
 ada2fe7eead31-5e1de33a139mr2634114137.38.1763990125677; Mon, 24 Nov 2025
 05:15:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124022215.1619-1-vulab@iscas.ac.cn>
In-Reply-To: <20251124022215.1619-1-vulab@iscas.ac.cn>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Nov 2025 14:15:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUSPSjh4nQ1B6NJdYZw3qW30Tx5zci6vy_9Hy6BS64FWQ@mail.gmail.com>
X-Gm-Features: AWmQ_bkWnGddT5IPWJ7j2KDmRRv2OOSJWDBHGySpxG2emYd2sxgjdMXeB8UqIMw
Message-ID: <CAMuHMdUSPSjh4nQ1B6NJdYZw3qW30Tx5zci6vy_9Hy6BS64FWQ@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: renesas_usbf: Handle devm_pm_runtime_enable()
 errors
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: herve.codina@bootlin.com, gregkh@linuxfoundation.org, 
	linux-renesas-soc@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Haotian,

On Mon, 24 Nov 2025 at 03:24, Haotian Zhang <vulab@iscas.ac.cn> wrote:
> devm_pm_runtime_enable() can fail due to memory allocation.
> The current code ignores its return value, potentially causing
> pm_runtime_resume_and_get() to operate on uninitialized runtime
> PM state.
>
> Check the return value of devm_pm_runtime_enable() and return on failure.
>
> Fixes: 3e6e14ffdea4 ("usb: gadget: udc: add Renesas RZ/N1 USBF controller support")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>

Thanks for your patch!

> --- a/drivers/usb/gadget/udc/renesas_usbf.c
> +++ b/drivers/usb/gadget/udc/renesas_usbf.c
> @@ -3262,7 +3262,9 @@ static int usbf_probe(struct platform_device *pdev)
>         if (IS_ERR(udc->regs))
>                 return PTR_ERR(udc->regs);
>
> -       devm_pm_runtime_enable(&pdev->dev);
> +       ret = devm_pm_runtime_enable(&pdev->dev);
> +       if (ret)
> +               return ret;

Perhaps insert a blank line here?

>         ret = pm_runtime_resume_and_get(&pdev->dev);
>         if (ret < 0)
>                 return ret;

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


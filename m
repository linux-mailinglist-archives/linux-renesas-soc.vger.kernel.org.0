Return-Path: <linux-renesas-soc+bounces-25071-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 382E2C80B1B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 14:14:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A0D84345712
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 13:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B0B4304BBF;
	Mon, 24 Nov 2025 13:14:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007C22EB86C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 13:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763990063; cv=none; b=TVj0GWor4jEiKoNBbFIvQ31QRLUPXvXkuhGtWeln1Qxxof6S27cNseql0Bmqvj1Mga0ZTmiQiPHrSO17cAKMKzP/RgbIsag6jQLDyl1oJF1WcjQvzbSP3l3la53l6FbIPpVLw7vIU7noj/ORLkHIUv3F4vXXFNkduLkX3Qriy9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763990063; c=relaxed/simple;
	bh=RjCJSM6uaiN501DyRkZ8p/eEhM3M7GazRT0iwHnGoBk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HtOLBCVSEX036Zvm2ofsvX75KVSrdrIpqhdpuC03AdYvNHBelTSvF4s24FLMV5PR4Ku+mc49DJymKN5qIYsu4nHnpSvxBM8sioBF8YBo8TOd7VVIdA1rTYAYjk6AAuTE3BPrwA9mvuOuysY1dfedgESFmpsotDuUjuqi6UaFU44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-55b1dde0961so2903827e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 05:14:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763990060; x=1764594860;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1bHE9e9lyhwQFjGP9yIqci5PhFl7iYu+8qK6gTUGgmE=;
        b=lPfloQY1IapNXDyOr3IU5tYo1CEY6c88WryC4sSfbYR8lIbfMRe+GzDZK9AMWjY3Jw
         xcUdYpz0O5GqRdnwGy2zR0CbicAt+aUaQ5Aisno46Nnzinx893Io3gEBUwQjga8Sf3pB
         pS7mXy8Ua0a/XiU3lfspSX+JqReCt7fJYqxGNbtwmK5Cb5PqUNQp4cuILu5e0e/3AmQO
         Pg1gxPzSlmgHTFAnRtxbi5bAbznmLvJy44ubZZvYgm4q31aaxEVYu2aRSwhKyiX+ccUK
         Upiql+1QCb2ymwpkPJCgI2wdf6Ssbwi4fiyQTovlU6BGgIeaHu0ukLQizIIfmP3L4SIW
         p+Vw==
X-Forwarded-Encrypted: i=1; AJvYcCVKeQiPOrtkX/kKQK2w8qf2V6SzxIJSHPvRsxBDGaYFAQ2PiJqOzpZ/Ppw0qqWqHIX+jHGele867DEUIRrphGA66A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrPQcuLozl0x7+aSINuvh368gLq7GLNELyXzFwHBkzvOab0XDm
	L6iOcTvpIbQdvLlT35/pJf0cTuHL9Fe/KF8QrB7PYjxLdJVXxt8k9lTOkKAJOhY8
X-Gm-Gg: ASbGncuZ/uet5feB0VPOnTl4GsOOU3Axh4qDLt/6qiWd/UKelGsChI5FQigrv6HMTEa
	6lDGU7V7CvXyT2nRlq/CQZdHcV1q8S3pvOMgmFt3j7A068J3AVf00cBlRsYkfZUG8QGwMXA0Ioi
	ULN2p+AsTa/iPOt6gV6m/kYKpWMR7yTFk+9IhufLti3dPHblz4DjWVIm++DDaEfmvH0NfFpHYlr
	xp4YZvEFnVO7O3uHX2hS0YDoY9DK8iWjeyypWUFg7BdEIsAu3UMeMf2+sBDnNm8Bej4sFqKEONI
	qlJ5vwkAg3Jv0g8woFWGkbAfmeUdW5R4wcQpTqE775hkjC7MJBCHZs44BzHAE8LIghX6VcjIwbB
	LpfdTfLI7t6X+e4F4Zz8RBXL9QeHbiNuuz5JUUW1DiY3828lGQmxC9MoEZWncW0etel1treRDnI
	ngIU305+2yJd0nDoL8AucrjhKODpeg4lup5+LRZVaHsyTQlgu2tKo2D4d7cJ8=
X-Google-Smtp-Source: AGHT+IGEWFwtHZ9rmZBKHtDIy68rW43U4AfDUC8G00ypqUOnK9kRitnFgNrP5SD0cZhlgt9QuSjOIg==
X-Received: by 2002:a05:6122:7cb:b0:55b:305b:4e34 with SMTP id 71dfb90a1353d-55b8d80ca12mr3573708e0c.20.1763990059776;
        Mon, 24 Nov 2025 05:14:19 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b7f60308csm5469845e0c.2.2025.11.24.05.14.18
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 05:14:19 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5e18598b9b1so3039186137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 05:14:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWp1S6vE1iaALVLudso9pXve0pySFHepOEw8R92s3roMXjhXgTJxDRhCfRPEj3SQmIXrOcHeORxF/ejsEx0l+j/4Q==@vger.kernel.org
X-Received: by 2002:a05:6102:418c:b0:5dd:b2a0:ac6a with SMTP id
 ada2fe7eead31-5e1de0099ccmr3268164137.9.1763990058356; Mon, 24 Nov 2025
 05:14:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251123163551.1781-1-vulab@iscas.ac.cn>
In-Reply-To: <20251123163551.1781-1-vulab@iscas.ac.cn>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Nov 2025 14:14:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUP+8ZWsTP-PHBOuNSTL7jeRHsXwf5Gg21vHL1=St-cxQ@mail.gmail.com>
X-Gm-Features: AWmQ_blEpUB3KHQH888MRi9b9TpaEf5WWmlFZbr6ESxPlHyyvt-aFINqUoOx-oo
Message-ID: <CAMuHMdUP+8ZWsTP-PHBOuNSTL7jeRHsXwf5Gg21vHL1=St-cxQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: renesas: Handle devm_pm_runtime_enable() errors
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
	linux-mtd@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Haotian,

On Sun, 23 Nov 2025 at 17:36, Haotian Zhang <vulab@iscas.ac.cn> wrote:
> devm_pm_runtime_enable() can fail due to memory allocation failures.
> The current code ignores its return value and proceeds with
> pm_runtime_resume_and_get(), which may operate on incorrectly
> initialized runtime PM state.
>
> Check the return value of devm_pm_runtime_enable() and return the
> error code if it fails.
>
> Fixes: 6a2277a0ebe7 ("mtd: rawnand: renesas: Use runtime PM instead of the raw clock API")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>

Thanks for your patch!

> --- a/drivers/mtd/nand/raw/renesas-nand-controller.c
> +++ b/drivers/mtd/nand/raw/renesas-nand-controller.c
> @@ -1336,7 +1336,9 @@ static int rnandc_probe(struct platform_device *pdev)
>         if (IS_ERR(rnandc->regs))
>                 return PTR_ERR(rnandc->regs);
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


Return-Path: <linux-renesas-soc+bounces-15494-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 254CAA7E5F6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 18:17:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE8DA17C7E4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 16:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10BA5209F33;
	Mon,  7 Apr 2025 16:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qNNEfvCJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67376154C00
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Apr 2025 16:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744041927; cv=none; b=oUYHcqrey3lpsiI6OxiDxefn8wZzDJlOC72Jmcz3e+5vGH554s5lK2XUTYgrMRaO3JNqiX+BSuvTaCcfqP1BnttDwe7ndFCZqrGquACOUOf0vOc0NluGsz5zEWCxDyh+sEAnq/q/EjrpUORmrlyqq4by5/hS3CnBGjFOJVuXVag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744041927; c=relaxed/simple;
	bh=CRYlMNWz3u/08ZIs/XIMA8AZpRqVPaRQC/zaOHLZvkE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QIQt8NsuR9fyVyMM07+P6Wzf6oAyPbXNePAv/Ajr+LZZj/1dAQzCzzsNlTLhorz6LXpDw7LsSAVk+Sni+rl74q9F1xtu8L3AoGH7f5TiCU7NbmCIb/aA2kXfp5dAU1cyaU4Ch4IzFirCX3uVRIYHHjsyqdMyNQOYawSFlH3u4c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qNNEfvCJ; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6febf391132so41909267b3.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Apr 2025 09:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744041923; x=1744646723; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MYl7YIVWVZsKQC/OOQAULpw8JbGgIFbvz1XDkCe8Zvc=;
        b=qNNEfvCJ77BEr+qxk88q7kddJCYuJMdKPc35csvyh+BiIgIBr/70ARVjlORU4Rh5zo
         CWUtDMZNqJfZCKKmY7kT7wAIcA4GJPQw46oPzm3zBgUfSsSODsWIThFB8ax+YI389Ioh
         5SF9hn4k9DoSaOpAIJ7jPLygSBBqGrfFz8Twb27QcuAJ9xnF+5a54GCKr0pNYw+0FHFX
         sxjYFZMlj4vCSiMwa/a9zOWfnhIUyxXkaaRDjMjHQFKbLIrSbVSfm7Mj3q5SiqhIj3EW
         PTsvhpy3Y/3mmGJjzIFuuMa60uuvlWWfqAey56geF69WjjL9Wt3ZCB+Un13q8vKK4GjU
         ui+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744041923; x=1744646723;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MYl7YIVWVZsKQC/OOQAULpw8JbGgIFbvz1XDkCe8Zvc=;
        b=GlIi9O5JgihpwILiu5w7gXw3/zjprwEm4eAi1mlD/GRmIup6rCAtMUZryXjiegglUK
         lh6ZbQsug/Igk3DnlVJd/LHJRQXi35rrAZ4quGpEkfh9iBWtIhn4yJaP8NJGGxWUVW2W
         o/86KciX8rCFnOZdLMH5WqQayllTnfliDFcowUGKriwMBEA4QT9E7RaTx3Sn4phspyEK
         LNOkYWCH0081L5iwedP0gMnfX/1CM6Ge8CvM1aNg8Zd8uZcV6zGICD2PgeQXIc6jb6S6
         eSGImB2/WU4zKImxtlDfoXYv7cuA5eNU8JwhscBE02IsD7Y1zmxyG0uS4KO0bGe6Kdvy
         W1iQ==
X-Forwarded-Encrypted: i=1; AJvYcCWz7MneFXrHlnpnkiPhmKUunYs4Oy6aznZ+WcszxYt/VUNPyy+i63NrUVhIgTE8BsTAnkPUsSlCzAmY5GR+Eh4j4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzf7NLvjXxZgNz5Q3HO8fKdzRHy2dan0jvG+CSnl1H/EJjFzhU
	+DMBPt4MxM/OEi0T9Y48MugkPhkMTJ3EWmQyi0ObSpurDmJnsW70tQCBMi8kzZtvK0D98rZtnJq
	PtKJ8roBSAqwfbynl3BIritp9ELsIhBDcPB+CLg==
X-Gm-Gg: ASbGncuGpI1ff8arH7sKdLkjbLnWVm5hll55JuuoN+PRMzpEnXl+DLhZVImXyXZUIvm
	8kx52qnMo71qHgp96+lFRN3Oh6ZmYc5vZVEqiqxXjNI0AdcAcPpYRhjgB4GeR3NE+/Sc1G9jrLq
	VEF8aldXgpZLRTO/oeMdZEX3cXDlRY1VCR/UQgrg==
X-Google-Smtp-Source: AGHT+IGDxc9ZlPb6nb5Z2zd90PGYLT3LmyVgNtNoQN7ui3U6zwBCuP16mCNDz0Fmuae4RzFpi7mdoWPuoFtnsuh24n0=
X-Received: by 2002:a05:690c:4d01:b0:701:fa3e:83f5 with SMTP id
 00721157ae682-703e3357338mr248959627b3.35.1744041923239; Mon, 07 Apr 2025
 09:05:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326220638.460083-1-ruslan.piasetskyi@gmail.com>
In-Reply-To: <20250326220638.460083-1-ruslan.piasetskyi@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 7 Apr 2025 18:04:46 +0200
X-Gm-Features: ATxdqUEMjWbobTx2vMpoyw4W4dRlizG6XIsBx3n4NggtPSnHg8-j2sy33AaH5wo
Message-ID: <CAPDyKFoMdp6b2p4jWi+K9nDUV_cQhkWjSmQoOmX25LfQx3AehA@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: Fix error handling in renesas_sdhi_probe
To: Ruslan Piasetskyi <ruslan.piasetskyi@gmail.com>
Cc: wsa+renesas@sang-engineering.com, salauyou.ihar@gmail.com, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Mar 2025 at 23:08, Ruslan Piasetskyi
<ruslan.piasetskyi@gmail.com> wrote:
>
> After moving tmio_mmc_host_probe down, error handling has to be
> adjusted.
>
> Fixes: 74f45de394d9 ("mmc: renesas_sdhi: register irqs before registering controller")
> Reviewed-by: Ihar Salauyou <salauyou.ihar@gmail.com>
> Signed-off-by: Ruslan Piasetskyi <ruslan.piasetskyi@gmail.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/renesas_sdhi_core.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index f73b84bae0c4..6ebb3d1eeb4d 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -1112,26 +1112,26 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>         num_irqs = platform_irq_count(pdev);
>         if (num_irqs < 0) {
>                 ret = num_irqs;
> -               goto eirq;
> +               goto edisclk;
>         }
>
>         /* There must be at least one IRQ source */
>         if (!num_irqs) {
>                 ret = -ENXIO;
> -               goto eirq;
> +               goto edisclk;
>         }
>
>         for (i = 0; i < num_irqs; i++) {
>                 irq = platform_get_irq(pdev, i);
>                 if (irq < 0) {
>                         ret = irq;
> -                       goto eirq;
> +                       goto edisclk;
>                 }
>
>                 ret = devm_request_irq(&pdev->dev, irq, tmio_mmc_irq, 0,
>                                        dev_name(&pdev->dev), host);
>                 if (ret)
> -                       goto eirq;
> +                       goto edisclk;
>         }
>
>         ret = tmio_mmc_host_probe(host);
> @@ -1143,8 +1143,6 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>
>         return ret;
>
> -eirq:
> -       tmio_mmc_host_remove(host);
>  edisclk:
>         renesas_sdhi_clk_disable(host);
>  efree:
> --
> 2.34.1
>


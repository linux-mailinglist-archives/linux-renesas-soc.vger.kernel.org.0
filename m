Return-Path: <linux-renesas-soc+bounces-27070-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 441DED3B734
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 20:23:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AD2EB300E434
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 19:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7A86287502;
	Mon, 19 Jan 2026 19:23:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3556E29BD90
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 19:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768850618; cv=none; b=k9Azqn5gDNO1g/XGVQiEQJos6z2dG0Vo56nTiE3k8SjuDVfmJDxD76PhDa0TGrGhM74z06o16ZAQpWol9+nQnfIdYmCro2azVFDyiIbkLSuj/5fauTVC5qoUmxDOfqTBbz5H8a+JqDZeLCJcS3fiOdwxkgQ6tF9TNR4TCqOgQEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768850618; c=relaxed/simple;
	bh=mMp6iFxraRTP7W2rjXz9S3lRqN19hV6viOdRrtle5z0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lYEsSgR/uOaemqCm+yXxBb7Bbf2nl/l5rrVO+Gk7zBGwECxHvID0fEjOBu9qh5YPCgynH0Rdq+dwgu6Y7qzPiE8mV2UPmYtrzd2Q5ZS2LWNLoOphxcPmTacfozP9WAf3jziFhlAMFIf4Zp9VoYfpnGgRPhKQ/fT/eFERQ1cDp0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-563686df549so3627866e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 11:23:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768850613; x=1769455413;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DCb1Q/eNGJuZWnaSy0QMCWG02dACV3WSdsoPlEt9HTE=;
        b=mfminUXo8TIhN2X6Vl2dxeDEAc8SiNDR4NWJu6PQhqnLb2ZZsctQMRtWBxyLYcllGB
         /VxGtbLfBHpmJqUXA3M26CFJdtJHsrkYrh/8cizynEZFPLKdfLo941gk53Y3gz0GIk7m
         CLMrYs7N9kvwRlPwpdqiGMy6J8zeIfNZtciQA8pg2E5f0iQNTSqz1iJUYU+oevovIgJq
         5BpeUM52xDeg8QwubFYTr1ZFjNoqxNDYBFJUtGoyPR9/9NEtFzKcCV8sGO1ZvP8JsUzH
         KgxlDt8U9kjbMrLW0kRWfDSBe7/8XnK6qxnply905vmX1so76LVWQuxyqUa/iS6SDQtx
         CWEg==
X-Forwarded-Encrypted: i=1; AJvYcCWYU83MZugLhQtRVM6XL9dA7A+2okWVWO0NMA9mBzGWnl863lKFDxSprmPonYdCQxsAeXBaw2WPeAnjknoYvZwnbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnFeCfzeSSUaotm9OY0j1n1yJKDZOoEirSjrPglKbbp6doTjSQ
	kWdGSxOro6L0cMDxxmCE7f/zQ4wOPYhpvLT5QtYcSjEk2RPOv4X17TNHTBny0BNf
X-Gm-Gg: AY/fxX6J27NuMk1WEnWF/gz4UQVg3spXFL8Rf+3GRPcIE2AExWAjn6q7DtP9qTgwi/k
	BrsVpfoXq22zANcZcWHYh+ku9SYoDDmaeppK6gz5nSZBfDT+havgCZwYU8iSppPjOGdw0xmojrM
	mHwuR9dCb/t0UE/dyx4eHxEIQzekx2SI71B4cUIo9vnvRZ57qkUlhoXCkn4+z9uMYZ3oH08vo5G
	n6gkPB9wep7Ua8KEuTt3aWEWQOl7v/PLckieUW3CMnqBzSye/J6UWSUZpifMrCER+UEndob2C8T
	cRTaEoqc+RjQtAK4YPjkv3fDuYzkFjD6BHeaSMmvoXNADhP19P93Ifp4SQFhLfuXfpxAzFHaCTW
	iU6huaX2Jg/Xc+5J1OML9ToXL5uHh8q52LDjNbFfhqOsQKO2E1L0uJqQfD+6TZAbH+4GfbGfiC0
	++Ljtzs+xQa1G9zYfNKJLlYK79xsbMw9CPQnSfmgfcxziWSU8UwzTb+T4BQJc=
X-Received: by 2002:a05:6122:2093:b0:55a:ab0d:bf74 with SMTP id 71dfb90a1353d-563b5c681f7mr3477246e0c.13.1768850613073;
        Mon, 19 Jan 2026 11:23:33 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-563b71197easm2951214e0c.19.2026.01.19.11.23.32
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 11:23:32 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-941063da73eso3011868241.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 11:23:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVSA+rm6CY7+PpmfMVeqIftaDeBFDQMwvdkAi3vIjg/93qeMVzGJRoOLOTnDBFs5xx5hzEIZqFdtPHr1Afq2mANZg==@vger.kernel.org
X-Received: by 2002:a05:6102:44d2:10b0:5f1:c453:b5ab with SMTP id
 ada2fe7eead31-5f1c453b6acmr1782180137.13.1768850612507; Mon, 19 Jan 2026
 11:23:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com> <20260119-soc-of-root-v1-3-32a0fa9a78b4@oss.qualcomm.com>
In-Reply-To: <20260119-soc-of-root-v1-3-32a0fa9a78b4@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Jan 2026 20:23:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXt69AywBVsY3DKH+cS52=Cw1xsvvBDBV3MXirZ+LYj+A@mail.gmail.com>
X-Gm-Features: AZwV_Qja2okCrIX9za1x2Adx7NBF3Qx2Xd3iJQm2I4PbFkiFeek_zkUKX3woR2E
Message-ID: <CAMuHMdXt69AywBVsY3DKH+cS52=Cw1xsvvBDBV3MXirZ+LYj+A@mail.gmail.com>
Subject: Re: [PATCH 3/8] base: soc: export soc_device_get_machine()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

On Mon, 19 Jan 2026 at 11:40, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> Some SoC drivers reimplement the functionality of
> soc_device_get_machine(). Make this function accessible through the
> sys_soc.h header. Rework it slightly to return a negative error number
> on failure to read the machine string (SoC core can keep on ignoring
> it). While at it: make it use the __free() helper from cleanup.h.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Thanks for your patch!

> --- a/drivers/base/soc.c
> +++ b/drivers/base/soc.c
> @@ -5,6 +5,7 @@
>   * Author: Lee Jones <lee.jones@linaro.org> for ST-Ericsson.
>   */
>
> +#include <linux/cleanup.h>
>  #include <linux/err.h>
>  #include <linux/glob.h>
>  #include <linux/idr.h>
> @@ -111,17 +112,18 @@ static void soc_release(struct device *dev)
>         kfree(soc_dev);
>  }
>
> -static void soc_device_get_machine(struct soc_device_attribute *soc_dev_attr)
> +int soc_device_get_machine(struct soc_device_attribute *soc_dev_attr)
>  {
> -       struct device_node *np;
> -
>         if (soc_dev_attr->machine)
> -               return;
> +               return -EBUSY;
> +
> +       struct device_node *np __free(device_node) = of_find_node_by_path("/");
> +       if (!np)
> +               return -ENOENT;
>
> -       np = of_find_node_by_path("/");
> -       of_property_read_string(np, "model", &soc_dev_attr->machine);
> -       of_node_put(np);
> +       return of_property_read_string(np, "model", &soc_dev_attr->machine);

I am not so fond of these of_find_node_by_path("/") + something replacements.
What about adding an of_machine_get_model() helper?

>  }
> +EXPORT_SYMBOL_GPL(soc_device_get_machine);
>
>  static struct soc_device_attribute *early_soc_dev_attr;
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


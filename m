Return-Path: <linux-renesas-soc+bounces-12777-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB70A23BAD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Jan 2025 10:53:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 280161889FDC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Jan 2025 09:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90BC51A08B5;
	Fri, 31 Jan 2025 09:53:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7525D199223;
	Fri, 31 Jan 2025 09:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738317209; cv=none; b=PKX7bAiAu26RfPlEX6pNgaTNM/Nwcbemjt1lFz0LJMyBGM0CRsIiJj9RQylE2ukTzrdI9SzMwZ/vUEhjVUTKT9H4gyMJejOERSyROgOOaRJVGJNpPfsSnzdvad+Twl/epWQ//q9qnpvMrJaD3BtwFlRkj6a5+59ImtOUXaOsdTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738317209; c=relaxed/simple;
	bh=OJ9M0fx8f061oFJ5AwEPS5f50xIUEZg/bNTDXpQnMKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Thgdkkr9xfKhFVqmbUYq4j/UeA1bKn06ju33BpumG/gD7TeuxOPuMoUIPjQmSXrYHvYsqREhnBuiqyg7atE7kFV2ufb0EbVijwPMmu9Up3gay5ZHudonFV2kvSm4rv09Tr8+AIrZhw4pCJ22snGZLR+UGQF6gvGi+iqTYr/aY1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5187f0b893dso557477e0c.3;
        Fri, 31 Jan 2025 01:53:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738317205; x=1738922005;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o58uTMMNFS4Q0L85ZfDPFylZSbgHXx097G7NyDQv2i8=;
        b=q7BR/WrdVXMUT0rTsb3FpNKZFnvFyEx3+gNV7RRn4WjHQpAV9s5Hab5pB3KA641GA2
         Msq0PXrhKj4f+i14ctFlMP8i1fSkJ717SVYc03N2/SQhZCHEJG0iFGNbEJiMkorDLl7n
         6tYz+0SeklDdTMf3m++dHJo04qzH27D2j0xiEnQrZoHUlS+0XwSzdZlQaZMgVg5kczI8
         zAyPoGoYJ9SoFLE4aL+kCjGvRaKF3shJgSYsKvW5nX1Mld3s1grPbaHnv8kzLTY/XtT6
         foKL9Rjj0B1SPV7lT1zWohpU9fo9QbPx4lgW9RAH2J0OZGoCkHCYli/II/h3Jgkg6R6y
         1JNw==
X-Forwarded-Encrypted: i=1; AJvYcCVJCh7vM0hBsVQdze2sEXITpUHnndkQtHtKm07J3p5Tis0ol4HH865XQz39+ODy3pM5dxxkR0NzDoqe@vger.kernel.org, AJvYcCWDFgA7t10RoU33fs3pWLKMpJHWX+kVMoNLpetySvLxBJ+6suiCJI7wNjhNrbWArYcbXyO1N/POxU7KNFCMYrH6v8M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCcMM7mjA11b7e+xYUh8NSO7F22CnoP45xAfAAsqwNu6nfgu/x
	FYp6oZeNHUgaMLo1JHbfH8Fz8A48hTtr9yman3k4JWAJlGV2p2UknUdJ+x2updU=
X-Gm-Gg: ASbGncskZw6tZTYfX9QXaNlmrLV4ZdtMn34I0MrVU3nKkn83tu/ez3U4XpP6c1/nvtm
	SCKbyrQOBn8B4DKPNXwQO8yq2e2x5XvegMUWMU/aVRgPkze4XwkDFip6p3V4+zQkzDgnursTAGu
	QIXciYwO5U3JML3YNiupTciJ2IyW3AsnGPQA/ZYaPkGv6IsLCSUnSawuKXxdq5dpFD6BMgMGRDj
	xDCI4GnuVsHxQqsYPrEv/NjAZPKwna7/ISKl5/brfeWD8Aq3Ky8SOTZ0Z355Z8seCdr+J/Wmv5J
	QU9xHdsOj0o10IaHs0zXcjTN+A/aUjjH7jW46i0MfPIz59MMny1l4w==
X-Google-Smtp-Source: AGHT+IE1WlxdUMwaUnS0laEw9w1wmuW0YDLBoeF9pTg5u1dDHlCxc+whaFLD1NcllQhdjSnOzT8GBg==
X-Received: by 2002:a05:6122:238c:b0:50d:5e21:ef39 with SMTP id 71dfb90a1353d-51e9e3e8c6fmr7649659e0c.1.1738317205094;
        Fri, 31 Jan 2025 01:53:25 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51eb1be84ddsm473752e0c.9.2025.01.31.01.53.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 01:53:24 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-85c4c9349b3so474783241.3;
        Fri, 31 Jan 2025 01:53:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX8qT8GzGPA2NTupU1ZofGRWYe4ui3gfu0DLuZ68wiDnZdrBjVUkQRxUzWHhJ6YnoT4jMg9Mp/uRgLX@vger.kernel.org, AJvYcCXXiwSqCcckUCPZs4t9O9D9JMDBOwBjXYqCIenZ/6z5mCc/Dgp4RW6OW897R4RhG3Fb6x1t+Sd1Egmk1u1ZKKB1miU=@vger.kernel.org
X-Received: by 2002:a05:6102:3ed5:b0:4b2:5d10:2cc6 with SMTP id
 ada2fe7eead31-4b9a4f23e07mr7603457137.6.1738317204143; Fri, 31 Jan 2025
 01:53:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250131094812.118340-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250131094812.118340-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 31 Jan 2025 10:53:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWyEEPLTc7y+3PP2xWH8e0Ho-fxpO2=SgxW0O6+S0pAAQ@mail.gmail.com>
X-Gm-Features: AWEUYZmGjIbMT5HT7Ryhuh9-zuTjarNP4o4GHQiQZq3NCHMcWFbcty6bTmSHSqI
Message-ID: <CAMuHMdWyEEPLTc7y+3PP2xWH8e0Ho-fxpO2=SgxW0O6+S0pAAQ@mail.gmail.com>
Subject: Re: [PATCH] of: base: Add of_get_available_child_by_name()
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Fri, 31 Jan 2025 at 10:48, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> There are lot of drivers using of_get_child_by_name() followed
> by of_device_is_available() to check the child node availabilty
> by name for a given parent. Provide a helper for these users to
> simplify the code.
>
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -824,6 +824,34 @@ struct device_node *of_get_child_by_name(const struct device_node *node,
>  }
>  EXPORT_SYMBOL(of_get_child_by_name);
>
> +/**
> + * of_get_available_child_by_name - Find the child node availabilty by name for a given parent

available child node?

> + * @node:      parent node
> + * @name:      child name to look for.
> + *
> + * This function looks for child node for given matching name and check the

checks

> + * device availability for use.

device's

> + *
> + * Return: A node pointer if found, with refcount incremented, use
> + * of_node_put() on it when done.
> + * Returns NULL if node is not found.
> + */
> +struct device_node *of_get_available_child_by_name(const struct device_node *node,
> +                                                  const char *name)
> +{
> +       struct device_node *child;
> +
> +       for_each_child_of_node(node, child)
> +               if (of_node_name_eq(child, name))
> +                       break;

child = of_get_child_by_name(node, name);

> +
> +       if (child && !of_device_is_available(child))
> +               of_node_put(child);

Missing return NULL.

> +
> +       return child;
> +}
> +EXPORT_SYMBOL(of_get_available_child_by_name);
> +
>  struct device_node *__of_find_node_by_path(const struct device_node *parent,
>                                                 const char *path)
>  {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


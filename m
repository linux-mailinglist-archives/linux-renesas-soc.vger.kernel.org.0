Return-Path: <linux-renesas-soc+bounces-14371-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA68A611F6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Mar 2025 14:04:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E90BA1B62AE7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Mar 2025 13:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD9951FF1D4;
	Fri, 14 Mar 2025 13:04:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80181F130E;
	Fri, 14 Mar 2025 13:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741957475; cv=none; b=mU18nOEcZB/osgGO1mHi/Xa2yYPgFClLFT2jG5bWUUOHT35urFZf20I2Tox+rvlTf9vcbNjeBKtP41hE8IbiFc3HO95XNVc8uUHOyW8nnVP7gNsYSjjRj40Ttnb4/v18W2u/Tl5yAI3TC6VFrZD2rVTvGpfjq1q9Y0hLYjTa2sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741957475; c=relaxed/simple;
	bh=bVfaM4S7euKltLXfWQBe119rJoD+30fakO6Y9ADN0jw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BPoSC1X05xYesuYATF5ydKWVckT7rbE1hyOpBtcbheq1aPzti1B6SqWEslIh2ziliiy5VW+EpzaE0+/sid5A+75/0LXPus7qFMU/l+mfH/ouaXCZIZgxGD/e9hDollLYsWgwOUmkoKgfB7nY6v9CAoaGy5wC5CRpP0lxc+UNnZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6dd01781b56so26481726d6.0;
        Fri, 14 Mar 2025 06:04:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741957472; x=1742562272;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PhGVsuA5CT9u8xsJRxxk8XXjhVy20k+vHhGYdzJeyyI=;
        b=cCgmeFNYZLS738BnjazzMs5LigdfcnzVmSauaEg/CZhLIppKUommkiQy2iAl2y8q4z
         bDAlZOfim3d1mDs6v2TsigaJ4QSTTCH6qcUWBww6eHFFFLo3HM+cRUrkUVGuZkhHpRqq
         AGTaGvoA8nfKliM5D2EzBLutuLSdfchtdZuJTyXKdpZnhCMHRIpgOT3+GWXCuqbaEPT9
         BsxjajziSVUGO6thGIn7LOf+SoFuWpntR1/YGdBIT9Z3MQ5JcUhRi7bi4Gso16MkCbdu
         8VgWonfX3Y3k0FLQ1k9Iq2mNN6q3rQMOhXAfeB84C/Ut6WLx+rV4UVlnkn5W+0vhyKBY
         q4wg==
X-Forwarded-Encrypted: i=1; AJvYcCUwVguodaJ9q6Mc1nQKCioo41tFYowjifvRoI/1XE4oMUUuyOUe70yrfXygi2i8sSTIPUMsiRlvlG4HiACZjef1C7s=@vger.kernel.org, AJvYcCV47Vi+PTDpwTd3f0QhSFgG0rkthKku6FXpmI28vEpjDj1Hs5Mh9ireiXgRSsbIsLullyECvvApkAU=@vger.kernel.org, AJvYcCVMfWlzC8OYLI7pDuVC0PoJNGG6bw741Q/D/SefTnUbYugXB/xLud7uj8WuX+hyNm22RjKzzUmtOqFLX6HD@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ7v7nYnXZ0GcdN89mhPa52imlMtOhxUf4M16ejdWJMGaszREu
	GjigggavGBstKj5qdnlm4+gly13AnzyUMJmamJpytiMH855yRXq/50s3fgwXnVU=
X-Gm-Gg: ASbGncskqtYna+zsMUHUuwcFXNuCIrsiegnSQnYpQ3xBCHopbKc78pmrgrgh2wTYGmd
	+OYd9Wvv+oBnGkUKCEXw3Ooho0L1B/TnQWLAB7zR1qkmeF2kHk30FC8jk/PBpNb1IFLvGQ+xjSg
	3MsOkW/QOKvmhYMalzhFQ0Tb4Oogkpm36gIGem4bPqCEjuOY/E5FABVzgd5ywsxTUti5tlo97F6
	xQ0sZVsBarcxuW1z9YxValclYSAgIYpTfidBw1f3rdrpctozehdhpeTfAJrbebpMpru+UssH6lV
	kUtY34leOKANpDE54k3w0P3M65aEze3NxIpLXRqLWJFuJd6AHtTp1zHYOU4B9IitwB+1LdBJR59
	ownKdRdZNOOg=
X-Google-Smtp-Source: AGHT+IHLBTeBmZMCKyn3gRpnuO0X1rBngeEC3sFl7/1vBspepZ73SLFYrFdWR5C84kwPNmx9oVhnJw==
X-Received: by 2002:a05:6214:202b:b0:6e8:fa38:46aa with SMTP id 6a1803df08f44-6eaeaa9d01cmr29288566d6.33.1741957471746;
        Fri, 14 Mar 2025 06:04:31 -0700 (PDT)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com. [209.85.222.175])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eade24d7f1sm23384476d6.54.2025.03.14.06.04.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 06:04:31 -0700 (PDT)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c0155af484so281152785a.0;
        Fri, 14 Mar 2025 06:04:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV1/Fi2dzrJudcjVbUr8djHXaLfmj3udszl7httOW9ul5CnGmRfcLMHO+MqjuOicLfGz1fBp3YGLcw=@vger.kernel.org, AJvYcCWPm89+ytwobbsfnFR+3/erJXj1AtppGD0A5h2TL0n7nhFhSlF5vm5Tv7LN7OzeCs+oarhhHHosGoiTOzK9@vger.kernel.org, AJvYcCXOOo0UCDc7QpKuJzEZZntQptBUn4GxyHSDPvsJfSF3xeFJBL6iVjD+WoOcRYzxe263FVMKpZi5xvKa+eyfGUwAOps=@vger.kernel.org
X-Received: by 2002:a05:620a:2787:b0:7c5:431f:f5eb with SMTP id
 af79cd13be357-7c57c7d6ccamr267628485a.20.1741957471269; Fri, 14 Mar 2025
 06:04:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250309211402.80886-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250309211402.80886-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250309211402.80886-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Mar 2025 14:04:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU5tr2sNZQtVkT922sJd_7Lbt=nYUujX0WtnrzkWOJqiQ@mail.gmail.com>
X-Gm-Features: AQ5f1JrWpj5EMfqGnEa9ZPso7-fQV6lKkk6CyOSlSHuEHppV3ja1dOF1Fn7DheE
Message-ID: <CAMuHMdU5tr2sNZQtVkT922sJd_7Lbt=nYUujX0WtnrzkWOJqiQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] clk: renesas: rzv2h: Refactor PLL configuration handling
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Sun, 9 Mar 2025 at 22:14, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Refactor PLL handling by introducing a `struct pll` to encapsulate PLL
> configuration parameters, ensuring consistency with the existing dynamic
> divider structure.
>
> Introduce the `PLL_PACK()` macro to simplify PLL structure initialization
> and update the `DEF_PLL()` macro to use the new `pll` structure. Modify
> relevant clock register functions to utilize the structured PLL data
> instead of raw configuration values.
>
> This refactoring improves code readability, maintainability, and
> alignment with the existing clock configuration approach.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.16.

> --- a/drivers/clk/renesas/rzv2h-cpg.h
> +++ b/drivers/clk/renesas/rzv2h-cpg.h
> @@ -10,6 +10,25 @@
>
>  #include <linux/bitfield.h>
>
> +/**
> + * struct pll - Structure for PLL configuration
> + *
> + * @offset: STBY register offset
> + * @clk: Flag to indicate if CLK1/2 are accessible or not

If you don't mind, I'll rename this to "has_clkn" while applying.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


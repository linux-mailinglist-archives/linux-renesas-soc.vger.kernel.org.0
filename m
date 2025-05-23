Return-Path: <linux-renesas-soc+bounces-17424-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB717AC206C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 12:02:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DC4F188BFA2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 10:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2152227EB9;
	Fri, 23 May 2025 09:57:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B16226D09;
	Fri, 23 May 2025 09:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747994275; cv=none; b=ILiGfk1q44+8ecbro3zuh6yz+N7wjJHZCHoXeyjNDHCo++FeExm2MV+6dNbxs8Di3oJ5rW25SgP5M31ji0/UFTf2Nbo+DNbHYRTxlY3b0FUC2kamptYbZQ22qq05RYMWMe8fSHCMqL2VfxiaLv1FiRr2XlHGVFGGKl6CVQDQ1fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747994275; c=relaxed/simple;
	bh=o3+U2pTjpoLy4VBlboNFSpKjjYw/1Y9CbZlyI6v5MxI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Itsjk/RzHJ0Nu593JPB3bwovKMvo2MeZSu9DY448wmEaFHRzuIXnj+1UMRVqfaw+u+cag4hI8wD/vzaANFe6xT3APUfbzJUIs1URCUPZaa2/qXw3DhKB+8zIHLftnslPuQGIk+bvffjzPaS9fyQ9NfMeiW/gfChEtc+Xfxtixxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4e2b5ffb932so1067454137.0;
        Fri, 23 May 2025 02:57:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747994271; x=1748599071;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dOpTsqxLWECKPkArKUXl99v0o7bZ+EJjw6Rtwx3j45U=;
        b=lue3UFOrrSSSSC+zEej3jV+eWKVg0Qin64rbFFMuswF4F8Jtwhs5MB0mQZCmkBXG16
         aB1BaFB0699+jYBf5iwXosUtH2u4CoyMAJyoFMCjAMp/KjONn8VeSy5FZ6JSaO2X1Jdx
         a4flWTqxxR7toM4uKAi+abE+vmh3OW5pwt2MyA13FbPXlJk1JlPm94X5PqjMjPIJ4fWQ
         +tJiKihWE2bf2BJcS/Jmgh3LISolzVaWIyV4B9ejgAOjdepDXf1Cp/4SIhOAtf6xF9Bk
         mpSPMfWnVx8zNWqgk0PYmuWxk/PDyzbTO05XVT2Iq9jYea3PsC8ZSmIcKR7zArWeyNb5
         826Q==
X-Forwarded-Encrypted: i=1; AJvYcCVZBolRXZHmP3fvDLKprd8uk3dM/7tj+z97ni6nn6YIYjjR+XlZ2XfG/J1NQFQm1WiolLRlwb60AeCjsew=@vger.kernel.org, AJvYcCWpPD1W2Dej+UULo+3gUVWHeo7OUA3sGp5UpsrlCEtUt0kNMr+aKIyQnemBKneY17dfZmk/dvuCAYFmaMh7Kqdzkrg=@vger.kernel.org, AJvYcCXDVsyzfxa8K89LZpeHnLsKWPlVh/GnzuSGvv8mk2LS3V6kV4Ov6uL34V/0rGj2E5xDmd/LZFMT6+hddhpQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2MHV3gNbOdfZq+3ZfjiU8lBAXqmfDVnasfnPbyfrZUkqcNoz6
	FC0ymlmjikLV60jtW/rOUinN/AYY/xSAtODCH7ivzLPywnifoc4g9VwBHmDq4GBH
X-Gm-Gg: ASbGncv7YLNiEFH+qn/M8Eu0ubsnvbVTrWEDt64OIW6G26IyBA9AsNnhuKj7BgZeSs8
	uKDnnn8f5rvkqcb90ujyp03HEdj3qAmFgqUqKCaGuIZW+qUW2pU4adq/Xfzk/SPRTJ3iLQPakTS
	p6r/gvJJBEhyNX0vjrOSv0I9nV5F0eZbm2FSxvTfeA7VSZHEIkyJOrT8BsOk2Ploh8KXfW71nEV
	BFc9NUhaXaH5AE3RKfNOXpOKU94nICtpXeUoUaYlRRDPH1mO0v+y3fxPd1yfa8NtmiTQ1hbW7yU
	dbXNCxbqUdQ0eiOGFjCro16d/vG/Du31Y4+BENIDKUnlh81m0kLlEYqEcGXaG4DgS8I/UbyouO4
	WckenA4KU7M+CwerWXQ==
X-Google-Smtp-Source: AGHT+IErEm1p66emtG23zmtX6IYikVXCh98rO9xeqwquTjV91rWvkBqKHgVLffSQ8t4REJVocOMIyQ==
X-Received: by 2002:a05:6102:50a4:b0:4bb:e5bf:9c7d with SMTP id ada2fe7eead31-4dfa6c31c98mr25458123137.17.1747994270671;
        Fri, 23 May 2025 02:57:50 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4dfa66e2910sm12328267137.13.2025.05.23.02.57.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 02:57:50 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-52dc826204eso2317494e0c.1;
        Fri, 23 May 2025 02:57:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU/p6oGcOuCpHsZBJJG32iwhLE+bSwW9GxAjzu5vRHX8Ne+pCFQ2X8MqoaLyhQKmq+BNhqsuHlWJ6IYzkV4@vger.kernel.org, AJvYcCW9+/q/DUjN3QVREvJDt3ai1pI9h1b+WERkVO9LmxLPdiPJIUalLlQdcaS8Q6fFVSaLJKaxqwux4MRgH+A=@vger.kernel.org, AJvYcCXrHI8T841FT6tN7YEolXpYuoxS9puwcgIebpOtOQX/wPc6rIkVbu5+nYs/jyUL5ScYblF6uzttZc8scYfM2LuaYm4=@vger.kernel.org
X-Received: by 2002:a05:6122:2529:b0:52a:791f:7e20 with SMTP id
 71dfb90a1353d-52dba80d3e3mr25830440e0c.4.1747994269866; Fri, 23 May 2025
 02:57:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515141828.43444-1-thierry.bultel.yh@bp.renesas.com> <20250515141828.43444-8-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250515141828.43444-8-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 May 2025 11:57:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWhq+o18hgBO7Kg_Rsq47WsEwV7-DWYcyJCM0h1wsMshg@mail.gmail.com>
X-Gm-Features: AX0GCFutLZp2NjdVwF0AAwLhMEAFa6NnDGxnoo0-7WDTAMJFZVVCBRJ3x6pp41o
Message-ID: <CAMuHMdWhq+o18hgBO7Kg_Rsq47WsEwV7-DWYcyJCM0h1wsMshg@mail.gmail.com>
Subject: Re: [PATCH v9 07/10] serial: sh-sci: Add support for RZ/T2H SCI
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org, 
	paul.barker.ct@bp.renesas.com, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thierry,

On Thu, 15 May 2025 at 16:19, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> Define a new RSCI port type, and the RSCI 32 bits registers set.
> The RZ/T2H SCI has a a fifo, and a quite different set of registers
> from the original SH SCI ones.
> DMA is not supported yet.
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> ---
> Changes v8->v9:
>   - Fixed some code formatting
>   - Renamed rzt2_sci_uart_ops to rsci_uart_ops
>   - Renamed of_sci_r9a09g077_data to of_sci_rsci_data
>   - Added EXPORT_SYMBOL for public functions
>   - Added MODULE_LICENSE & MODULE_DESCRIPTION
>   - Fixed RSCI clock names
>   - Fixed SCI_PORT_RSCI using BIT(7)

Thanks for the update!

> --- /dev/null
> +++ b/drivers/tty/serial/rsci.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef __RSCI_H__
> +#define __RSCI_H__
> +
> +#include "sh-sci-common.h"
> +
> +#ifdef CONFIG_SERIAL_RSCI
> +extern struct sci_of_data of_sci_rsci_data;
> +#endif

The #ifdef isn't really needed.

> +
> +#endif /* __RSCI_H__ */

> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c

> @@ -2977,14 +2987,27 @@ static int sci_init_clocks(struct sci_port *sci_port, struct device *dev)
>         struct clk *clk;
>         unsigned int i;
>
> -       if (sci_port->type == PORT_HSCIF)
> +       if (sci_port->type == PORT_HSCIF) {
>                 clk_names[SCI_SCK] = "hsck";
> +       } else if (sci_port->type == SCI_PORT_RSCI) {
> +               clk_names[SCI_FCK] = "operation";
> +               clk_names[SCI_BRG_INT] = "bus";
> +       }
>
>         for (i = 0; i < SCI_NUM_CLKS; i++) {
> -               clk = devm_clk_get_optional(dev, clk_names[i]);
> +               const char *name = clk_names[i];
> +
> +               clk = devm_clk_get_optional(dev, name);
>                 if (IS_ERR(clk))
>                         return PTR_ERR(clk);
>
> +               if (!clk && sci_port->type == SCI_PORT_RSCI &&
> +                   (i == SCI_FCK || i == SCI_BRG_INT)) {
> +                       return dev_err_probe(dev, -ENODEV,
> +                                            "failed to get '%s' clock\n",

I would make the error message identical to the other cases below,
so the format string can be shared by the compiler.

> +                                            name);
> +               }
> +
>                 if (!clk && i == SCI_FCK) {
>                         /*
>                          * Not all SH platforms declare a clock lookup entry
> @@ -2995,13 +3018,13 @@ static int sci_init_clocks(struct sci_port *sci_port, struct device *dev)
>                         if (IS_ERR(clk))
>                                 return dev_err_probe(dev, PTR_ERR(clk),
>                                                      "failed to get %s\n",
> -                                                    clk_names[i]);
> +                                                    name);
>                 }
>
>                 if (!clk)
> -                       dev_dbg(dev, "failed to get %s\n", clk_names[i]);
> +                       dev_dbg(dev, "failed to get %s\n", name);
>                 else
> -                       dev_dbg(dev, "clk %s is %pC rate %lu\n", clk_names[i],
> +                       dev_dbg(dev, "clk %s is %pC rate %lu\n", name,
>                                 clk, clk_get_rate(clk));
>                 sci_port->clks[i] = clk;
>         }

The rest of the (generic; I didn't look at the RSCI low-level details)
changes LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


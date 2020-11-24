Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F1202C2BA2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Nov 2020 16:43:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389653AbgKXPnE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Nov 2020 10:43:04 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:45209 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389529AbgKXPnE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Nov 2020 10:43:04 -0500
Received: by mail-ot1-f66.google.com with SMTP id k3so19721228otp.12;
        Tue, 24 Nov 2020 07:43:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wGQAm/Habl7BLWd6IdQBk99pbaAhlMirh4N9+XF5FO4=;
        b=jRBI85/ik5ZhX0H1lSDYU7Ofc4BaNpjTonvBs+UBoLZ2LkUrm33IciRnhkncW7XVHs
         Y6RN+Dsdkl53p1lIhIJTl87HCSr7gQXjnliWeBrahekcaG9W0EVyCWz7bC+2rCWoXflQ
         /j75okeCTn7s3hXTHaER3t5iMUkIHZFZnHZSjaZX7bcISpdP6aN9OVmtXObu2qo6CIWh
         KaZAXvIYltdsM9sVnJ7a/DkvzvefttO3PR4HzhMv59P/ZtTEPCP8cVRNhrghSU47EiY4
         Vicy5j7AxuVPROXeLU+UYfnd8X+S168fVMP0MCi4cJQuWtVmZ4/h17X+uUqx0iQfddIi
         pB8A==
X-Gm-Message-State: AOAM5321KCrj07O9theDu2cGTYm8u8mcbCm6xBzqtt0/DAbOP7WCN2Pm
        COqZimxkW4z/0XKwWGnzXXmb85WwSmyMcPpPtZ0=
X-Google-Smtp-Source: ABdhPJxx4mOYcdNxFA+yVyffgNbk2C9v4K201yvdM4+e75s1ZyTs7WLqg4qKp1dArDLWTTOp3JccLLLShI9Mq4OHeiA=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr3727469otc.145.1606232583214;
 Tue, 24 Nov 2020 07:43:03 -0800 (PST)
MIME-Version: 1.0
References: <20201124112552.26377-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20201124112552.26377-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20201124112552.26377-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 24 Nov 2020 16:42:52 +0100
Message-ID: <CAMuHMdVkbMbKdY76XGDGxGwCsY_oHZfF=v9XMLZSjLMN+jKe_Q@mail.gmail.com>
Subject: Re: [PATCH 2/5] memory: renesas-rpc-if: Make rpcif_enable/disable_rpm()
 as static inline
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jiri Kosina <trivial@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Tue, Nov 24, 2020 at 12:27 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Define rpcif_enable_rpm() and rpcif_disable_rpm() as static
> inline in the header instead of exporting it.
>
> Suggested-by: Pavel Machek <pavel@denx.de>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch, which is an improvement.

> --- a/include/memory/renesas-rpc-if.h
> +++ b/include/memory/renesas-rpc-if.h
> @@ -10,6 +10,7 @@
>  #ifndef __RENESAS_RPC_IF_H
>  #define __RENESAS_RPC_IF_H
>
> +#include <linux/pm_runtime.h>
>  #include <linux/types.h>
>
>  enum rpcif_data_dir {
> @@ -77,11 +78,19 @@ struct      rpcif {
>
>  int  rpcif_sw_init(struct rpcif *rpc, struct device *dev);
>  void rpcif_hw_init(struct rpcif *rpc, bool hyperflash);
> -void rpcif_enable_rpm(struct rpcif *rpc);
> -void rpcif_disable_rpm(struct rpcif *rpc);
>  void rpcif_prepare(struct rpcif *rpc, const struct rpcif_op *op, u64 *offs,
>                    size_t *len);
>  int rpcif_manual_xfer(struct rpcif *rpc);
>  ssize_t rpcif_dirmap_read(struct rpcif *rpc, u64 offs, size_t len, void *buf);
>
> +static inline void rpcif_enable_rpm(struct rpcif *rpc)
> +{
> +       pm_runtime_enable(rpc->dev);
> +}
> +
> +static inline void rpcif_disable_rpm(struct rpcif *rpc)
> +{
> +       pm_runtime_put_sync(rpc->dev);

Looking at how this is used, this should call pm_runtime_disable()
instead.

And probably this should be moved inside the core RPC-IF driver:
  1. pm_runtime_enable() could be called from rpcif_sw_init(),
  2. pm_runtime_put_sync() can be called from a new rpc_sw_deinit()
     function, to be called by the SPI and MTD drivers on probe failure
     and on remove.

> +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

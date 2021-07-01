Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 649E73B9186
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Jul 2021 14:16:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236328AbhGAMSs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Jul 2021 08:18:48 -0400
Received: from mail-vs1-f44.google.com ([209.85.217.44]:41524 "EHLO
        mail-vs1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236192AbhGAMSr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Jul 2021 08:18:47 -0400
Received: by mail-vs1-f44.google.com with SMTP id c26so3665315vso.8;
        Thu, 01 Jul 2021 05:16:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0ZwXwkzI4cMeR70rauGu/lDBYf0pn55GSU9Mr3EQf/s=;
        b=Tsz97O68HRcPHRmBBlZUX5t9Q0OFHgaNEIqnCZjydYQcDoK0Uc+zsTA1QtlFovfTL5
         fSiKk9KTdTBIKOseRIFBr1Kb1CT67a3RMmiGXdmjbP5D+xKXqmcdfmpsWEC39XIaf4P6
         B6zdVcVQ+hncspaGCBVmY9cTo6DbmfIo9MXN/7JQeviQY+pDLdR3QD/O1KlAMB64Laq8
         9M0pSVfPchOlSYl2t+Wn/1qRx1p+3qWxKGG2PVC3Ez3PcDrJbNFGCDtJbozns6ec4JZj
         74j4EkYalOvkhtEQDPsXTvz7J5RBGW4o12FaVnc4d3b3SvGN6fC3H33rw8JbzD+rhfQY
         tXww==
X-Gm-Message-State: AOAM530wjB02mVHxESX6HOS1FioH5FQwkG5gYsn6bv8MWoM7AL3TT4AR
        yMJPcPIuzT1E/Rek3PRlonPNCt8OKdgd4jERrHY1iodQTKo=
X-Google-Smtp-Source: ABdhPJz6ehTG6ZDUCW6FzjBW7R3HbJ2WHUbjc60udrqfS5IadIT5wOjJ2MaugSjcRPJW+N1KFIcaODUZQSon+ra7nFU=
X-Received: by 2002:a67:770d:: with SMTP id s13mr24027176vsc.40.1625141776985;
 Thu, 01 Jul 2021 05:16:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210630073013.22415-1-biju.das.jz@bp.renesas.com> <20210630073013.22415-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210630073013.22415-5-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 1 Jul 2021 14:16:05 +0200
Message-ID: <CAMuHMdV8sH6LnBXmVWO7ua+bHOqhbvmQ4XUbv-_UGCwfa83WOg@mail.gmail.com>
Subject: Re: [PATCH v3 04/11] drivers: clk: renesas: r9a07g044-cpg: Add USB clocks/resets
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Wed, Jun 30, 2021 at 9:30 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add clock/reset entries for USB PHY control, USB2.0 host and device.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->V3:
>  * Added reset entries.

Thanks for the update!

> --- a/drivers/clk/renesas/r9a07g044-cpg.c
> +++ b/drivers/clk/renesas/r9a07g044-cpg.c
> @@ -96,6 +96,14 @@ static struct rzg2l_mod_clk r9a07g044_mod_clks[] = {
>                                 0x52c, 0),
>         DEF_MOD("dmac_pclk",    R9A07G044_DMAC_PCLK, CLK_P1_DIV2,
>                                 0x52c, 1),
> +       DEF_MOD("usb0_host",    R9A07G044_USB_U2H0_HCLK, R9A07G044_CLK_P1,
> +                               0x578, 0),
> +       DEF_MOD("usb1_host",    R9A07G044_USB_U2H1_HCLK, R9A07G044_CLK_P1,
> +                               0x578, 1),
> +       DEF_MOD("usb0_device",  R9A07G044_USB_U2P_EXR_CPUCLK, R9A07G044_CLK_P1,
> +                               0x578, 2),

The names are not really used, but the lock list spreadsheet describes
this clock as the usb0 function clock, so perhaps "usb0_func" is
more appropriate?

Apart from that:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

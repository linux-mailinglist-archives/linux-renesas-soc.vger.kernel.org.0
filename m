Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24A49995F8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2019 16:10:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733186AbfHVOKj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 22 Aug 2019 10:10:39 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:41629 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733177AbfHVOKj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Aug 2019 10:10:39 -0400
Received: by mail-vs1-f65.google.com with SMTP id m62so3864676vsc.8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Aug 2019 07:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s4qsaTLi2kYiuB1BsdFKQ6VHfpTMiAfISBukGRH2y18=;
        b=XYLV0EYiyYDc8s7d75ilZ8PjaHOndaLQTUE0E7ySTCaMwvG5dWLeTqVTqFcqHoJ0Qs
         ALlKvFqPNwpy8qCZijb7lDAn8DfCXm9O83FzPWLQ8gWKTk/HH5CroOe8VQ1SJFDlcN5O
         fvWr00oFdi5LUzSTZg3RtGE7PKRblpBcp5MuxRykoaA9RxAHjh+IvmKimqZI4Gk97tRX
         5LQ3AyDExqa9O+Oy36W4UWmmcGjFvMRnT5Kw3PNH5FbhKG/QDrRUUfN2Du8Wardq8ndH
         xYuvnqyLJP0vJ0VTPzYDDUyOOhJ1JfNVeF0UMAx4dJa6oqS/2eI/IirgWZH1G6kRuHtG
         lEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s4qsaTLi2kYiuB1BsdFKQ6VHfpTMiAfISBukGRH2y18=;
        b=E+kdX8xhFbHhCYQwL6x+vDEo9nuIaMxBc6A6Xy1pqrRyzu0WHbMVNyY5Y+/23ChwL1
         c1kjgies+ZaOyS0KXewuvr2zrHdkJEpAWktBWak/73EMSfijdn6qrlwfjw/DNo3rq8ri
         m8Rjoi5aAJdQuRUbcVaC03/fWXnxMRYymUINlR3q2/5TMqwTobOIPyW8VtKe5BmOY0Y0
         wpB74AMlLDb8TPfTGwyDlgRsU7qJix6x4mkoWs/muXntL9RJwttzs5LY7rJ5JYq0aR13
         SR87G5Zu4JUSNNQcLn1wPLUA21yz8tQ9EsRp5IpCZRqgbl3lPO8DR33v/R9u7GpRedds
         twKw==
X-Gm-Message-State: APjAAAW20EzXgK+/8/0PLGcBu0T4fkRFMvjSawiVeoFIqkG6yzpNzPwG
        rRxCWLMFbLY6QsC+nMLiMl10sI7mPdr+ehZMxsGvMQ==
X-Google-Smtp-Source: APXvYqzWHLzJBoRyccWmyR+94+wWQB2KGb5t2+zjUNnXJGLYmtNfu/FkNMpdMoN5NRgOPYvF4jON5lAwZXA6GzPg3bw=
X-Received: by 2002:a67:e287:: with SMTP id g7mr24196946vsf.200.1566483037730;
 Thu, 22 Aug 2019 07:10:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190816124106.15383-1-geert+renesas@glider.be>
In-Reply-To: <20190816124106.15383-1-geert+renesas@glider.be>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 22 Aug 2019 16:10:01 +0200
Message-ID: <CAPDyKFpbEZLnBH-bQ=9zgWP7Xng1Ft+DRFu6zRov4tbm0yC0OA@mail.gmail.com>
Subject: Re: [PATCH] soc: renesas: rmobile-sysc: Set GENPD_FLAG_ALWAYS_ON for
 always-on domain
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 16 Aug 2019 at 14:41, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Currently the R-Mobile "always-on" PM Domain is implemented by returning
> -EBUSY from the generic_pm_domain.power_off() callback, and doing
> nothing in the generic_pm_domain.power_on() callback.  However, this
> means the PM Domain core code is not aware of the semantics of this
> special domain, leading to boot warnings like the following on
> SH/R-Mobile SoCs:
>
>     sh_cmt e6130000.timer: PM domain c5 will not be powered off
>
> Fix this by making the always-on nature of the domain explicit instead,
> by setting the GENPD_FLAG_ALWAYS_ON flag.  This removes the need for the
> domain to provide power control callbacks.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
> To be queued in renesas-devel for v5.4.
>
>  drivers/soc/renesas/rmobile-sysc.c | 31 +++++++++++++++---------------
>  1 file changed, 16 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/soc/renesas/rmobile-sysc.c b/drivers/soc/renesas/rmobile-sysc.c
> index 444c97f84ea5a76e..caecc24d5d68739c 100644
> --- a/drivers/soc/renesas/rmobile-sysc.c
> +++ b/drivers/soc/renesas/rmobile-sysc.c
> @@ -48,12 +48,8 @@ struct rmobile_pm_domain *to_rmobile_pd(struct generic_pm_domain *d)
>  static int rmobile_pd_power_down(struct generic_pm_domain *genpd)
>  {
>         struct rmobile_pm_domain *rmobile_pd = to_rmobile_pd(genpd);
> -       unsigned int mask;
> +       unsigned int mask = BIT(rmobile_pd->bit_shift);
>
> -       if (rmobile_pd->bit_shift == ~0)
> -               return -EBUSY;
> -
> -       mask = BIT(rmobile_pd->bit_shift);
>         if (rmobile_pd->suspend) {
>                 int ret = rmobile_pd->suspend();
>
> @@ -80,14 +76,10 @@ static int rmobile_pd_power_down(struct generic_pm_domain *genpd)
>
>  static int __rmobile_pd_power_up(struct rmobile_pm_domain *rmobile_pd)
>  {
> -       unsigned int mask;
> +       unsigned int mask = BIT(rmobile_pd->bit_shift);
>         unsigned int retry_count;
>         int ret = 0;
>
> -       if (rmobile_pd->bit_shift == ~0)
> -               return 0;
> -
> -       mask = BIT(rmobile_pd->bit_shift);
>         if (__raw_readl(rmobile_pd->base + PSTR) & mask)
>                 return ret;
>
> @@ -122,11 +114,15 @@ static void rmobile_init_pm_domain(struct rmobile_pm_domain *rmobile_pd)
>         struct dev_power_governor *gov = rmobile_pd->gov;
>
>         genpd->flags |= GENPD_FLAG_PM_CLK | GENPD_FLAG_ACTIVE_WAKEUP;
> -       genpd->power_off                = rmobile_pd_power_down;
> -       genpd->power_on                 = rmobile_pd_power_up;
> -       genpd->attach_dev               = cpg_mstp_attach_dev;
> -       genpd->detach_dev               = cpg_mstp_detach_dev;
> -       __rmobile_pd_power_up(rmobile_pd);
> +       genpd->attach_dev = cpg_mstp_attach_dev;
> +       genpd->detach_dev = cpg_mstp_detach_dev;
> +
> +       if (!(genpd->flags & GENPD_FLAG_ALWAYS_ON)) {
> +               genpd->power_off = rmobile_pd_power_down;
> +               genpd->power_on = rmobile_pd_power_up;
> +               __rmobile_pd_power_up(rmobile_pd);
> +       }
> +
>         pm_genpd_init(genpd, gov ? : &simple_qos_governor, false);
>  }
>
> @@ -270,6 +266,11 @@ static void __init rmobile_setup_pm_domain(struct device_node *np,
>                 break;
>
>         case PD_NORMAL:
> +               if (pd->bit_shift == ~0) {
> +                       /* Top-level always-on domain */
> +                       pr_debug("PM domain %s is always-on domain\n", name);
> +                       pd->genpd.flags |= GENPD_FLAG_ALWAYS_ON;
> +               }
>                 break;
>         }
>
> --
> 2.17.1
>

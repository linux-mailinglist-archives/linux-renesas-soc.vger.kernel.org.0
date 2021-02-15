Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2300931BBBC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Feb 2021 16:01:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230158AbhBOPAm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Feb 2021 10:00:42 -0500
Received: from mail-oi1-f170.google.com ([209.85.167.170]:42037 "EHLO
        mail-oi1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230382AbhBOO7t (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Feb 2021 09:59:49 -0500
Received: by mail-oi1-f170.google.com with SMTP id u66so7962810oig.9;
        Mon, 15 Feb 2021 06:59:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1WJpZ9O/FoeicwL4UCLrmDh0RgytifRYxcFX1UoCRxE=;
        b=BC3zpJKGcRQIpdScxn9naf2Ps6uqBtIlD45mDs+6iZziX6XMF1BEHwzxnGNQGz0NUQ
         YHX+JAh1TsCwztgMo3wpKgTUcCnBaE52jil+/ODIKeAlnoaIjKO3nFXHyg2fZWy+LU7C
         0vBTQYLo4K4I2pbk5AQozkEpeKgqJsbuH5JG3tCreR1kDI5RsZm5ucaIMXtF740DUFio
         cz+r+3m4SoWCnfvz1MGE5ykxTL3IaqU8ltkQ4sWlEBhX3yrkHVkcd/Vvl/1LHWH1Zsmd
         yJFS9aNRy+9BXgXRvBLa6VrM02CxJTb82q4ytxz2evNZkfM+8/KMqOzf9+zcdVCSOn6t
         4phA==
X-Gm-Message-State: AOAM532R89fuVG9lQhxn0OjFTncLTtXR8Yc01HhZ2G58u2A4sRZARyzp
        IhFACm/2QvnKVhX6hwxc0shSau2I714rSahQR3Q=
X-Google-Smtp-Source: ABdhPJxd8tpEbuaPWJqYrslxV6jJQ6R8HT+eQvaK/uBUprXuVs1u1BjcQP0r7Mzi+i10csNjwDuL4s1KenrxQTdo7DI=
X-Received: by 2002:a05:6808:5cf:: with SMTP id d15mr8201933oij.69.1613401147730;
 Mon, 15 Feb 2021 06:59:07 -0800 (PST)
MIME-Version: 1.0
References: <20210215111619.2385030-1-geert+renesas@glider.be>
In-Reply-To: <20210215111619.2385030-1-geert+renesas@glider.be>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Mon, 15 Feb 2021 15:58:52 +0100
Message-ID: <CAJZ5v0ikVbMX0R9e_=wOxKfJX5X322AipmpWy-7wVnWE7Ogc9A@mail.gmail.com>
Subject: Re: [PATCH] driver core: Fix double failed probing with fw_devlink=on
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Saravana Kannan <saravanak@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Feb 15, 2021 at 12:16 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> With fw_devlink=permissive, devices are added to the deferred probe
> pending list if their driver's .probe() method returns -EPROBE_DEFER.
>
> With fw_devlink=on, devices are added to the deferred probe pending list
> if they are determined to be a consumer, which happens before their
> driver's .probe() method is called.  If the actual probe fails later
> (real failure, not -EPROBE_DEFER), the device will still be on the
> deferred probe pending list, and it will be probed again when deferred
> probing kicks in, which is futile.
>
> Fix this by explicitly removing the device from the deferred probe
> pending list in case of probe failures.
>
> Fixes: e590474768f1cc04 ("driver core: Set fw_devlink=on by default")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Good catch:

Reviewed-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

> ---
> Seen on various Renesas R-Car platforms, cfr.
> https://lore.kernel.org/linux-acpi/CAMuHMdVL-1RKJ5u-HDVA4F4w_+8yGvQQuJQBcZMsdV4yXzzfcw@mail.gmail.com
> ---
>  drivers/base/dd.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> index 9179825ff646f4e3..91c4181093c43709 100644
> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -639,11 +639,13 @@ static int really_probe(struct device *dev, struct device_driver *drv)
>         case -ENXIO:
>                 pr_debug("%s: probe of %s rejects match %d\n",
>                          drv->name, dev_name(dev), ret);
> +               driver_deferred_probe_del(dev);
>                 break;
>         default:
>                 /* driver matched but the probe failed */
>                 pr_warn("%s: probe of %s failed with error %d\n",
>                         drv->name, dev_name(dev), ret);
> +               driver_deferred_probe_del(dev);
>         }
>         /*
>          * Ignore errors returned by ->probe so that the next driver can try
> --
> 2.25.1
>

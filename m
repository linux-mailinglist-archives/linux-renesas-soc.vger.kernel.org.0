Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3309B346AD2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Mar 2021 22:10:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233476AbhCWVJc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Mar 2021 17:09:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233464AbhCWVJJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Mar 2021 17:09:09 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCDC1C061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Mar 2021 14:09:08 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id g15so15976405qkl.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Mar 2021 14:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R6mQdnEARm1sAkmYShTds7N7GTJB2n9WdYHs9Cf06Co=;
        b=V09PADpD5GGpnsg3INGoRaC/YKlb5As6pETN2ZCkLcLvYIdd8Uu9K8EmBsCXOm+Qej
         dAn3LAAbQNMUJPy4ANT2eGCP1vhRPyaSYFe3t9DRGOWa//7T7sFla9VvZMpqgZWkQ80p
         RT8M2rEUL2nPLlafNVFpmiPFSPf8x9JHHFC+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R6mQdnEARm1sAkmYShTds7N7GTJB2n9WdYHs9Cf06Co=;
        b=ZqaVd3suL5lI5QYYDJAMQCyh0vWUBoelYqCDkPn9RBVk1o46Ka8elzlCXglTiRX/X6
         uWoqE3tSV7xCjSgFikHAJol7my6tJtPautywYc+fZsXMa+xFd5r0F+6fEacvWNQXpVCE
         3XUlQ1in1Tz2J3rcoqBeMcjgDgTixj9OOvW89QQVrsHNN21+E2YVsdQkUmxoQT1r6YJ6
         b3yiQHKg3BZsJMaJQyS2vlDO4OzCAwQAnCPcB4xgGf5mMACGoCeSQXGkZQT6uXpm/wd/
         lmEPLXEoCy8nTkwk7ITpnunVap37O9x3I+LZnbjw9ZRcgb3N9Y3cW+Qjl3c8nQmmbPD1
         5wdw==
X-Gm-Message-State: AOAM530rs95ul1oaztEUHpk9Cre5gS9IQomvq+robQ/EvWXE6ZB1Lx1B
        qiIAY0cVFGgUh46nPPUR8+qKcFykrqnvcA==
X-Google-Smtp-Source: ABdhPJyIUT4ZYq1oq5hwyc0EVaAHvnQMHFY91RXYM3UHPUyERuvzzRjuZJXMMdDt0hycIU5CImk8gA==
X-Received: by 2002:a05:620a:13db:: with SMTP id g27mr7581432qkl.367.1616533747441;
        Tue, 23 Mar 2021 14:09:07 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id j129sm59095qkf.110.2021.03.23.14.09.06
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Mar 2021 14:09:06 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id j198so11832590ybj.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Mar 2021 14:09:06 -0700 (PDT)
X-Received: by 2002:a25:69c1:: with SMTP id e184mr207933ybc.345.1616533746366;
 Tue, 23 Mar 2021 14:09:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com> <20210322030128.2283-5-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20210322030128.2283-5-laurent.pinchart+renesas@ideasonboard.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 23 Mar 2021 14:08:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UDd9LC-sMEk0hn10roeM+Cz6VNekcZomkQXLhfw0-4wA@mail.gmail.com>
Message-ID: <CAD=FV=UDd9LC-sMEk0hn10roeM+Cz6VNekcZomkQXLhfw0-4wA@mail.gmail.com>
Subject: Re: [RFC PATCH 04/11] drm/bridge: ti-sn65dsi86: Use bitmask to store
 valid rates
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On Sun, Mar 21, 2021 at 8:02 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> The valid rates are stored in an array of 8 booleans. Replace it with a
> bitmask to save space.

I'm curious: do you have evidence that this does anything useful? I
guess you're expecting it to save .text space, right? Stack usage and
execution time differences should be irrelevant--it's not in a
critical section and the difference should be tiny anyway. As far as
.text segment goes, it's not obvious to me that the compiler will use
fewer instructions to manipulate bits compared to booleans.

Doing a super simple "ls -ah" on vmlinux (unstripped):

Before: 224820232 bytes
After: 224820376 bytes

...so your change made it _bigger_.   OK, so running "strip
--strip-debug" on those:

Before: 26599464 bytes
After: 26599464 bytes

...so exactly the same. I tried finding some evidence using "readelf -ah":

Before:
  [ 2] .text             PROGBITS         ffffffc010010000  00020000
       0000000000b03508  0000000000000000 WAX       0     0     65536
  [ 3] .rodata           PROGBITS         ffffffc010b20000  00b30000
       00000000002e84b3  0000000000000000 WAMS       0     0     4096

After:
  [ 2] .text             PROGBITS         ffffffc010010000  00020000
       0000000000b03508  0000000000000000 WAX       0     0     65536
  [ 3] .rodata           PROGBITS         ffffffc010b20000  00b30000
       00000000002e84b3  0000000000000000 WAMS       0     0     4096

Maybe you have some evidence showing an improvement? Ah, OK. I
disassembled ti_sn_bridge_enable() and your patch saves 12 bytes, but
I guess maybe alignment washes it out in reality...


In terms of readability / conventions, I personally find this change a
bit of a wash. I mean, I guess I originally implemented it as an array
and I thought that was the most readable, but I like bitfields fine
too. If everyone loves it then I won't object, but to me it feels like
touching lines of code for something that's personal preference. ;-)


> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index c45420a50e73..1d1be791d5ba 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -557,9 +557,9 @@ static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn_bridge *pdata)
>         return i;
>  }
>
> -static void ti_sn_bridge_read_valid_rates(struct ti_sn_bridge *pdata,
> -                                         bool rate_valid[])
> +static unsigned int ti_sn_bridge_read_valid_rates(struct ti_sn_bridge *pdata)
>  {
> +       unsigned int valid_rates = 0;
>         unsigned int rate_per_200khz;
>         unsigned int rate_mhz;
>         u8 dpcd_val;
> @@ -599,13 +599,13 @@ static void ti_sn_bridge_read_valid_rates(struct ti_sn_bridge *pdata,
>                              j < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut);
>                              j++) {
>                                 if (ti_sn_bridge_dp_rate_lut[j] == rate_mhz)
> -                                       rate_valid[j] = true;
> +                                       valid_rates |= BIT(j);
>                         }
>                 }
>
>                 for (i = 0; i < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut); i++) {
> -                       if (rate_valid[i])
> -                               return;
> +                       if (valid_rates & BIT(i))
> +                               return valid_rates;
>                 }
>                 DRM_DEV_ERROR(pdata->dev,
>                               "No matching eDP rates in table; falling back\n");
> @@ -627,15 +627,17 @@ static void ti_sn_bridge_read_valid_rates(struct ti_sn_bridge *pdata,
>                               (int)dpcd_val);
>                 fallthrough;
>         case DP_LINK_BW_5_4:
> -               rate_valid[7] = 1;
> +               valid_rates |= BIT(7);
>                 fallthrough;
>         case DP_LINK_BW_2_7:
> -               rate_valid[4] = 1;
> +               valid_rates |= BIT(4);
>                 fallthrough;
>         case DP_LINK_BW_1_62:
> -               rate_valid[1] = 1;
> +               valid_rates |= BIT(1);
>                 break;
>         }
> +
> +       return valid_rates;
>  }
>
>  static void ti_sn_bridge_set_video_timings(struct ti_sn_bridge *pdata)
> @@ -753,8 +755,8 @@ static int ti_sn_link_training(struct ti_sn_bridge *pdata, int dp_rate_idx,
>  static void ti_sn_bridge_enable(struct drm_bridge *bridge)
>  {
>         struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
> -       bool rate_valid[ARRAY_SIZE(ti_sn_bridge_dp_rate_lut)] = { };
>         const char *last_err_str = "No supported DP rate";
> +       unsigned int valid_rates;
>         int dp_rate_idx;
>         unsigned int val;
>         int ret = -EINVAL;
> @@ -793,13 +795,13 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
>         regmap_update_bits(pdata->regmap, SN_SSC_CONFIG_REG, DP_NUM_LANES_MASK,
>                            val);
>
> -       ti_sn_bridge_read_valid_rates(pdata, rate_valid);
> +       valid_rates = ti_sn_bridge_read_valid_rates(pdata);
>
>         /* Train until we run out of rates */
>         for (dp_rate_idx = ti_sn_bridge_calc_min_dp_rate_idx(pdata);
>              dp_rate_idx < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut);
>              dp_rate_idx++) {
> -               if (!rate_valid[dp_rate_idx])
> +               if (!(valid_rates & BIT(dp_rate_idx)))
>                         continue;
>
>                 ret = ti_sn_link_training(pdata, dp_rate_idx, &last_err_str);

In any case, since it does save 12 bytes:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

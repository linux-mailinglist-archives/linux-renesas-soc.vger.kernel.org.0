Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07FCF39F784
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jun 2021 15:17:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232792AbhFHNTn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Jun 2021 09:19:43 -0400
Received: from mail-ua1-f47.google.com ([209.85.222.47]:40466 "EHLO
        mail-ua1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232876AbhFHNTm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Jun 2021 09:19:42 -0400
Received: by mail-ua1-f47.google.com with SMTP id d18so314943ual.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Jun 2021 06:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4sO61Fkn/5IZX7W/Hmal8+XrneLbVYOvRH8YqKEmick=;
        b=u5X7PMHHxL3yE7d6dDQP52QGHBPyUln/TF1+tYPm7hIJV5NS/siaFMa+EJvG5B6SUv
         9uWqqz1mLMoL9FiF0M8alQtkXuCYj7Ak4B2NjW8L2fZ5fthcJdI0alkX2JaQ8hpFBuCd
         roWb/7b6b5KtalM2aHBlCnUP1FjtpZmC6P4lfu8fOUKqmTZfCxGHCySaGXM6SLN9l1ov
         KY7RdtDwBuhsCYifz5RpCYX9ZA3cxGRvFdocWq971svs+ClMMn5A3kurizygj9cVYJME
         wcbdjgJ5cDNYoTZnyddLArCEAJ/k0jDU4lztqSKQPjnUH8hZ2Z9GdI7ZLNQD/hlvJ63c
         hR9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4sO61Fkn/5IZX7W/Hmal8+XrneLbVYOvRH8YqKEmick=;
        b=bOsGft/FS8OlIQwB00+WQ6q6fwhxNQTiiLl2mjfKawyTOmbZ/0P7XjuPhYmucBXnuz
         Zs1YD7T+pB7oeLcY3v8BaC9UebnNZ+rtq8/ZtPmCdl+prhsBa9hc7vPMLC+Q6UTUYj9L
         GO9HMgfWSCAgt+dnoJSliZwAZGuzgq6aG0iYBI/qXmR8Ra7zNdf0m3Lb/kVmPplCDUE7
         sJEjtNpgLmSIYl2cLs8oPztvGgD+cEJndAIxAf4DOTme1ypSkTqp73vrTwMc9jBZDIfs
         +4BVKGLwix1AtxEGKZAmXD3pbSAjrMXjfAe1bK+DOd0ObV5gElvHm0EK7BJDD3EjluC8
         NGvA==
X-Gm-Message-State: AOAM533E0HcapuTG5ECTAbwCU0QPoynkNhJ2iBI5MaEhPfmn59mS8o8T
        YDI097yWva0wvwUD+SvbvC/jjRt4BGqMzh33HBP+RA==
X-Google-Smtp-Source: ABdhPJxbw2jKLpHRrw+vUe65U9pKZtC9zHtDLfFBHJxqmwFLCCreieH+pOXs86lypO+JJcM7bCuwjtDO0H6EO9ZZjVU=
X-Received: by 2002:ab0:d8f:: with SMTP id i15mr12633857uak.104.1623158209542;
 Tue, 08 Jun 2021 06:16:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210602073435.5955-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210602073435.5955-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 8 Jun 2021 15:16:12 +0200
Message-ID: <CAPDyKFo0jP-0yZd-89J7v4xdcBnH5H5yGa_s4a-hw=mkHxOrxg@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: abort tuning when timeout detected
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 2 Jun 2021 at 09:34, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> We have to bring the eMMC from sending-data state back to transfer state
> once we detected a CRC error (timeout) during tuning. So, send a stop
> command via mmc_abort_tuning().
>
> Fixes: 4f11997773b6 ("mmc: tmio: Add tuning support")
> Reported-by Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied for fixes and by adding a stable tag, thanks!

> ---
>
> Ulf, I'd think that mmc_abort_tuning() should be named
> mmc_abort_tuning_cmd() instead. Because we don't actually abort the
> tuning as a whole in this function. What do you think? I can prepare a
> patch if you agree.

Good point.

I have no strong opinion, but perhaps mmc_send_abort_tuning() is more
consistent with other function names?

Kind regards
Uffe


>
>  drivers/mmc/host/renesas_sdhi_core.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index 635bf31a6735..9029308c4a0f 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -692,14 +692,19 @@ static int renesas_sdhi_execute_tuning(struct mmc_host *mmc, u32 opcode)
>
>         /* Issue CMD19 twice for each tap */
>         for (i = 0; i < 2 * priv->tap_num; i++) {
> +               int cmd_error;
> +
>                 /* Set sampling clock position */
>                 sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TAPSET, i % priv->tap_num);
>
> -               if (mmc_send_tuning(mmc, opcode, NULL) == 0)
> +               if (mmc_send_tuning(mmc, opcode, &cmd_error) == 0)
>                         set_bit(i, priv->taps);
>
>                 if (sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_SMPCMP) == 0)
>                         set_bit(i, priv->smpcmp);
> +
> +               if (cmd_error)
> +                       mmc_abort_tuning(mmc, opcode);
>         }
>
>         ret = renesas_sdhi_select_tuning(host);
> --
> 2.30.2
>

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADB8426531C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Sep 2020 23:28:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728209AbgIJV2r convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Sep 2020 17:28:47 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:37896 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730927AbgIJODj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Sep 2020 10:03:39 -0400
Received: by mail-ot1-f66.google.com with SMTP id y5so5432502otg.5;
        Thu, 10 Sep 2020 07:02:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=S1AS4D7+TzEM9YB2BLRLjVrQg/AK99BD7N5eL5TtU6A=;
        b=lMiAmQMh7JFOBOaWpJNcrDgv8ttnef9npVyF+plXwcEmajMhHplJFVVsOGjNhVSEVx
         tDOxTXFP1RhNvQgECm2GAPh3xmM3ksPEokDzxpQsODBk+jnzdn4fpzFw5J5n8a0ujJhl
         hPQbS32b4CiliwqDNM9rmA5/RrJtfFaM7FLnUGbovzH9oRVkNASJ03L5rO0drNmBmxNu
         lyPuGsze5411yWQ0SOe8qwxd77RoZAmYMxYA1uu1lDa+5BVR74d0XhhLUsMjHicetOps
         DkUixJWaO64q5b0eepos2RiHpBCqyPlK/DQgfuxY+OKBjGi36T4BbpO4UT98NKs8/skh
         ieVw==
X-Gm-Message-State: AOAM532Lm2JJM6fwOS9ejikPf4wZtoUkrxvPXVtRCxkSdWOEMojX0wA5
        4/z7EMmNXg78zAIPGA8yleGm74Vsenuw5hMWShBpHm1kUgY=
X-Google-Smtp-Source: ABdhPJxsPKH9fn/cxgat7+C/+3gRuYwjv90BweqfrMZ7A7qjQlzSZSboHmvVGqX+2WXKKe72cE6hbjDwWXSCGoyCZDk=
X-Received: by 2002:a05:6830:1008:: with SMTP id a8mr3727510otp.107.1599746060347;
 Thu, 10 Sep 2020 06:54:20 -0700 (PDT)
MIME-Version: 1.0
References: <1599739372-30669-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1599739372-30669-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1599739372-30669-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Sep 2020 15:54:09 +0200
Message-ID: <CAMuHMdXt4V7n6wY2H4OxHoSADQ=TqvHBo=Qd8JM5Y7vR=VXPQw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] soc: renesas: r8a779a0-sysc: Add r8a779a0 support
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Thu, Sep 10, 2020 at 2:03 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add support for R-Car V3U (R8A779A0) SoC power areas and
> register access, because register specification differs
> from R-Car Gen2/3.
>
> Inspired by patches in the BSP by Tho Vu.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for the update!

> --- /dev/null
> +++ b/drivers/soc/renesas/r8a779a0-sysc.c

> +#define R8A779A0_PD_ALWAYS_ON  64      /* Always-on power area */

This can be dropped, as it's already defined in the bindings header.

> +static int r8a779a0_sysc_pwr_on_off(u8 pdr, bool on)
> +{
> +       unsigned int reg_offs;
> +       u32 val;
> +       int ret;
> +
> +       if (on)
> +               reg_offs = PDRONCR(pdr);
> +       else
> +               reg_offs = PDROFFCR(pdr);
> +
> +       /* Wait until SYSC is ready to accept a power request */
> +       ret = readl_poll_timeout_atomic(r8a779a0_sysc_base + SYSCSR, val,
> +                                       (val & SYSCSR_BUSY) == SYSCSR_BUSY,
> +                                       SYSCSR_DELAY_US, SYSCSR_RETRIES);

Please note the semantics of SYSCSR_RETRIES have changed,
compared to the old loop.
Before, it was the maximum number of retries of 10 µs each.
Now it is the maximum timeout in µs.
Perhaps

    #define SYSCSR_RETRIES          1000

should be replaced by

    #define SYSCSR_TIMEOUT          10000

?

Same for SYSCISR_RETRIES.

The rest looks good to me, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9368C198B4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 May 2019 09:07:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727018AbfEJHHU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 May 2019 03:07:20 -0400
Received: from mail-vk1-f193.google.com ([209.85.221.193]:44038 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726934AbfEJHHU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 May 2019 03:07:20 -0400
Received: by mail-vk1-f193.google.com with SMTP id q189so1225535vkq.11;
        Fri, 10 May 2019 00:07:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gXpQUb3x7wghnJ50k9J8PnVFEH6yXB8dlTGF8Lc43Ow=;
        b=CGKUSpX8qrmIkP3c2rfrw9Gd15cKGvg6LeJaiFFFPoEXe4Mq9rouQI1ZEUHGwpQjLd
         EgScsBJJdTuCX6wGXXlnIOHUmfeGhui2/PfQMwULgVNgpmWzW1wneSIjPY+JJj6zDmTJ
         lnjIEHuZUByrgp8sTj6YoMHvX8+0fjRR9cNlbQypHMZX53Ae+ORcR9qn/6ZBIY1tFRD0
         yBHgDxOwNyhhjr+tv2ZZcPbVII04jeaLRB5V0E5TcY0MMnYZMWt2/ZCMFCC3Nb+YFLgf
         tiqjbq+g25SaQsBbvfXIPLP+NQCLpsRvFfcJLNKzPF6Iuny9enz7gSNLmSnU0tekhemf
         wkDg==
X-Gm-Message-State: APjAAAUjuGodSxGlh3YYaVPyra16Xed/sYvdY/u4yOxL+CzXE0gNY0Sl
        KLMOO3RSBmGmSq796NMba6FPR9lURo37PGLuaRk=
X-Google-Smtp-Source: APXvYqz+RhHqEZGF6j89SL27lav0IcmyxBqR2CeYKaqFnER+DWFO+HsRImpqMdmbk2zDkr2dfXSvntOAN3sqlfIRSIM=
X-Received: by 2002:a1f:c2c1:: with SMTP id s184mr4376709vkf.65.1557472039480;
 Fri, 10 May 2019 00:07:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190509201142.10543-1-chris.brandt@renesas.com> <20190509201142.10543-12-chris.brandt@renesas.com>
In-Reply-To: <20190509201142.10543-12-chris.brandt@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 10 May 2019 09:07:07 +0200
Message-ID: <CAMuHMdV7aQd-g1t_t27d8ge69e3VZnG7nQ7Lzre=qrJ1UrUuuA@mail.gmail.com>
Subject: Re: [PATCH v2 11/15] usb: renesas_usbhs: Add support for RZ/A2
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        USB list <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Chris,

On Thu, May 9, 2019 at 10:14 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> The RZ/A2 is similar to the R-Car Gen3 with some small differences.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Thanks for your patch!

> --- a/drivers/usb/renesas_usbhs/common.c
> +++ b/drivers/usb/renesas_usbhs/common.c

> @@ -614,7 +618,8 @@ static struct renesas_usbhs_platform_info *usbhs_parse_dt(struct device *dev)
>                 dparam->pipe_size = ARRAY_SIZE(usbhsc_new_pipe);
>         }
>
> -       if (dparam->type == USBHS_TYPE_RZA1) {
> +       if (dparam->type == USBHS_TYPE_RZA1 ||
> +           dparam->type == USBHS_TYPE_RZA2) {
>                 dparam->pipe_configs = usbhsc_new_pipe;
>                 dparam->pipe_size = ARRAY_SIZE(usbhsc_new_pipe);

The above two lines are also present in the block for R-Car Gen2/3 above.
Perhaps they can just be moved out, and executed unconditionally?
That leaves R-Car with just the has_usb_dmac feature flag.

BTW, this driver uses a mix of feature checking using USBHS_TYPE_*
enums, and a parameter block/callback struct
(renesas_usbhs_platform_callback).  Perhaps the feature flags can just
be moved to the struct, and the various structs referenced from
of_device_id.data?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

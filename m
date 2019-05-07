Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1CC415EC1
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 May 2019 10:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726224AbfEGICI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 May 2019 04:02:08 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:45082 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726085AbfEGICI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 May 2019 04:02:08 -0400
Received: by mail-vs1-f67.google.com with SMTP id o10so9787885vsp.12;
        Tue, 07 May 2019 01:02:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=43ZU946SQ92CMpYex7l7cURwZU0nmkJIjZBNyh5A/iw=;
        b=poUcP7Cs/qYiyG+4VynBvqvOmEoulaXsmyO6YKiBK82cj0aq3EyV/cZk5v/LDPfaJl
         lRJoxbzvHOEiZZyRIbM1WsyKvxuVAdvxFSByfIHyVUWHjgHwqhqGg+LLbF4QndR1qwqH
         u9OQVVuTPEH/FJI8nmJR/TuGRQTymAi27T25wghuMupC6FTVH2DrL947W5qvBqe7vWFd
         5vIN3xj/T7s+Uk/auUB3da2eu0tp1w1uJIpjwX8HuwPqm5yNKDYdL9iGy/1n6VZ6J9Pz
         kyRcEhlTbTCZ6cwq+FGw6Rr9C/GfzV1f89g/zJDftAmlHy/Ng3j5r9nLpMGW+s9yVELs
         L1Cw==
X-Gm-Message-State: APjAAAVv36286GwomNaVvCL0Yjv7THl7RfV5LQgZv4vXP3eKuDrgYj4n
        nMAZa53preTbcWLP1ioBgbSU0IBieVNF3wI7l38=
X-Google-Smtp-Source: APXvYqxyWwXpdASz9ehwyctNLAOr+5D/eECRWmWTQy1RWxuuNHMHLAK/raEq/fOx3i/5SMseULHQa4EzlJV+FzNHVP8=
X-Received: by 2002:a67:e2ca:: with SMTP id i10mr8188079vsm.96.1557216127141;
 Tue, 07 May 2019 01:02:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190506234631.113226-1-chris.brandt@renesas.com> <20190506234631.113226-2-chris.brandt@renesas.com>
In-Reply-To: <20190506234631.113226-2-chris.brandt@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 May 2019 10:01:55 +0200
Message-ID: <CAMuHMdV3yW44Y1D2Vn1mNJK8pNF3db20An9Sde8=18r8y7m9LQ@mail.gmail.com>
Subject: Re: [PATCH 01/10] phy: renesas: rcar-gen3-usb2: Add uses_usb_x1 option
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
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

On Tue, May 7, 2019 at 1:47 AM Chris Brandt <chris.brandt@renesas.com> wrote:
> The RZ/A2 has optional dedicated 48MHz crystal inputs, which adds a new
> register setting when used.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Thanks for your patch!

> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c

> @@ -630,6 +635,9 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
>                 }
>         }
>
> +       if (of_property_read_bool(dev->of_node, "renesas,uses_usb_x1"))
> +               channel->uses_usb_x1 = true;
> +

Perhaps this can be checked some other way (e.g. by checking for a non-zero
clock rate of the USB_X1 clock referenced from DT), thus removing the need for
adding a custom property?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

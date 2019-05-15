Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37ED21E9A3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2019 09:59:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbfEOH73 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 May 2019 03:59:29 -0400
Received: from mail-ua1-f66.google.com ([209.85.222.66]:44751 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725929AbfEOH73 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 May 2019 03:59:29 -0400
Received: by mail-ua1-f66.google.com with SMTP id p13so661290uaa.11;
        Wed, 15 May 2019 00:59:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6DsE25q54DtPjX5kVxyr5mwAoYVc8gQOWY01m1m1RHk=;
        b=rNixEEoNzajxqrQ2xa1nF6xT4CfwI9FhSaRC5Grode8tgtgnXU8UxEFnatstrLu1mS
         4MvhRg8MquUzhB376HzaulSrNyunpx11ZrYY1nU/lbY5pfuB0UJzHB4GZnEFfxEoIG7x
         gqO4B4aDELDXpQ803XxUTtkStVhFUndd571gTi7RMvLx2QdBQj0b26PZi5qCwDRpwod9
         7TKIwCj9PUC2PwT3Ii4gT0eqUo7tudfcFqk6PlenTUyQbJXnmQwaymmN1RvK9aMpVppY
         Dw0uXssND0fMPwUzMGHWaYpqPGqvoL6IrtVmDQPYt/URujvxALwsDZo+cKeKdVQhd0T/
         LVIQ==
X-Gm-Message-State: APjAAAXpPSXE2uNeuQ0VgnHUPgXJheXNuV+AlAdnRqrGrWtMTC+vqJuP
        vz0oyqz53JgkeCBaN+alob4ISDTyfO/QwoFxct4=
X-Google-Smtp-Source: APXvYqzetvG2HGb+7geViDicxwmbAkyZJ0xzX10uPOB2V3oYiGlPaxhoCsJI+i/FkK9myvp/gLz4ge6Ob5Ehw2vPzJE=
X-Received: by 2002:ab0:45e9:: with SMTP id u96mr1214916uau.75.1557907168414;
 Wed, 15 May 2019 00:59:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190514145605.19112-1-chris.brandt@renesas.com> <20190514145605.19112-14-chris.brandt@renesas.com>
In-Reply-To: <20190514145605.19112-14-chris.brandt@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 May 2019 09:59:16 +0200
Message-ID: <CAMuHMdUU3EBFXHpvw8y_yYf3L1qNNH6HJw+RHP_ioSFwJcd3Vg@mail.gmail.com>
Subject: Re: [PATCH v3 13/15] ARM: dts: r7s9210: Add USB Host support
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
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

On Tue, May 14, 2019 at 4:58 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Add EHCI and OHCI host support for RZ/A2.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

> --- a/arch/arm/boot/dts/r7s9210.dtsi
> +++ b/arch/arm/boot/dts/r7s9210.dtsi

> +               usb2_phy0: usb-phy@e8218200 {
> +                       compatible = "renesas,usb2-phy-r7s9210", "renesas,rcar-gen3-usb2-phy";
> +                       reg = <0xe8218200 0x10>;

What about the other registers?
On R-Car Gen3, size is 0x700.
Same for usb2_phy1.

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

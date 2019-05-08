Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66828171F8
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2019 08:59:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726464AbfEHG7r (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 May 2019 02:59:47 -0400
Received: from mail-vk1-f194.google.com ([209.85.221.194]:36392 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbfEHG7r (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 May 2019 02:59:47 -0400
Received: by mail-vk1-f194.google.com with SMTP id d74so4707797vka.3;
        Tue, 07 May 2019 23:59:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hb3fPf5B0g2t3lQ+CxtsUvfMJ5uLadXuXQz78ww3fYU=;
        b=G7QEGx7GDDKHzNKCTQgVo1xdT5l5jA8HnO0Lb5xhAZRokOEALifEnhY2APdS3XVR3n
         uwn3kRwE1GADfAV1B07F4wIONZrTYGiQHTbUtTTSoix+Ci92IjKahK+jwFIUvF41dGMz
         Kra0KVz55NW7xU0xjxRPJ0yoAgaJETk6vFMuYiMpBZ72Wn8S/wpiCobtIwR0CrpFty7m
         CFXiyHZanCw8hqLA4p8sax3hfBV8ezXrm+rB9hbnUWJn8ad0H8aILXHuRAoR/7AwEjeb
         fLLwnbskRMNDKGwdqCb/WqiHddsp/WP9t6TTOxnf3KUwmDEZdkfIGctmeFn3kHZV6ALt
         n/Tg==
X-Gm-Message-State: APjAAAVUMiIKAoyuqnkxk/ZFgU2VnjTZXq0FFjYVNI0GhdnKe/sHjJev
        aTcm4wFJC8rxh/PPaOXDPqzGxvgykrHDPJuagQE=
X-Google-Smtp-Source: APXvYqzDHFkWbgySn+FGkvYLb5zdM4esJpytVoVC/45AAGMJR0HiALWM3MGwMRiitZNx7TU69wuIUv49l3BaA9SVOfQ=
X-Received: by 2002:a1f:ff0b:: with SMTP id p11mr12708100vki.83.1557298786234;
 Tue, 07 May 2019 23:59:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190506234631.113226-1-chris.brandt@renesas.com>
 <20190506234631.113226-2-chris.brandt@renesas.com> <CAMuHMdV3yW44Y1D2Vn1mNJK8pNF3db20An9Sde8=18r8y7m9LQ@mail.gmail.com>
 <TY1PR01MB15621F21D3A3F1F550D85CD68A310@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <CAMuHMdWBR-069LJZ12pe1azystGp7egzYjKYFVkuRwMoukvzrQ@mail.gmail.com> <TY1PR01MB1562A5D204AD0104862D09FE8A310@TY1PR01MB1562.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB1562A5D204AD0104862D09FE8A310@TY1PR01MB1562.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 8 May 2019 08:59:33 +0200
Message-ID: <CAMuHMdXyuXOGxa=xVwEFWRWB_yHLGG4kLs-ECesSnoD2ctEVRQ@mail.gmail.com>
Subject: Re: [PATCH 01/10] phy: renesas: rcar-gen3-usb2: Add uses_usb_x1 option
To:     Chris Brandt <Chris.Brandt@renesas.com>
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

On Tue, May 7, 2019 at 10:27 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Tue, May 07, 2019 1, Geert Uytterhoeven wrote:
> > > So with that said, does a uses-usb-x1 property make more sense?
> >
> > No ;-)
>
> So....
>
> I guess the first patch in the series needs to add this to the .dtsi:
>
>         usb_x1_clk: usb_x1 {
>                 #clock-cells = <0>;
>                 compatible = "fixed-clock";
>                 /* If clk present, value must be set by board */
>                 clock-frequency = <0>;
>         };
>
> Then I can reference "usb_x1" in the driver and see if it is set to
> non-zero.
>
> What do you think?

Exactly!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 095D3361063
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Apr 2021 18:48:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232759AbhDOQsY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Apr 2021 12:48:24 -0400
Received: from mail-ua1-f42.google.com ([209.85.222.42]:46852 "EHLO
        mail-ua1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231137AbhDOQsX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Apr 2021 12:48:23 -0400
Received: by mail-ua1-f42.google.com with SMTP id v23so7666483uaq.13;
        Thu, 15 Apr 2021 09:48:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VhOHyEkJWSCegG8VqaGpE9OM1BwPr0/49vR9DHNMwQU=;
        b=WV7xSGVTiDwrq31QYUqHhMC1hVu9QhKS/o5VplO3x31Wfw0goT2FA5/3Jd6E0G98yY
         MOMOLeSBawce81Nk1Qty3J0fseGdcqselxglzPRVtrdU2gPPMqBXWOBe7k1d8rJ/SJj+
         4n/qCJxv6SFghNyHF2rVAlGEwW0YY4SiD6SHZzhPDS4m0hfB/teU+IEPabcnWvEswf6z
         UTYLVpuyn9WnAChuHAJj6ZufhjcGxm7KiI0WML1HC3eL6znpMapV0frOHYwmgkCfScfd
         kJIC/DLnPFDjaV+kA2mb1Jvprjz0I2hsr/w0ZN2A6dOEOLpBQ8xupzz+XscYEtvhI/qz
         vLQw==
X-Gm-Message-State: AOAM5333UWNvBBkPqNJ7UDsgUk4xMi12ZC9BhFAnLW1IqbGKZKqGxeda
        3AoJRSVSoPUATe+j/qWERDhX+K5EZGdPym4pA3U=
X-Google-Smtp-Source: ABdhPJy4XhcdlU/Mzd5/oe+kRlCGdzAOK95Pj8Cfh3/I6gQ3zXgI+WQ3j0tPVOWGRXcyo8ADu78ENCG3l5wjTFl5O0w=
X-Received: by 2002:a9f:262c:: with SMTP id 41mr2962732uag.4.1618505279787;
 Thu, 15 Apr 2021 09:47:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210415122602.87697-1-jacopo+renesas@jmondi.org>
 <20210415122602.87697-5-jacopo+renesas@jmondi.org> <YHhR/YR6Ecp6yU4D@pendragon.ideasonboard.com>
In-Reply-To: <YHhR/YR6Ecp6yU4D@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 15 Apr 2021 18:47:48 +0200
Message-ID: <CAMuHMdWXM=0W_GbJpOqCUhTKzjaYu9S81M9u=j+8KM0sFG7Atw@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] arm64: dts: renesas: r8a77970: Add csi40 port@0
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Thu, Apr 15, 2021 at 4:47 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Thu, Apr 15, 2021 at 02:25:59PM +0200, Jacopo Mondi wrote:
> > Declare port@0 in the csi40 device node and leave it un-connected.
> > Each board .dts file will connect the port as it requires.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>
> The port exists at the hardware level, so including it here sounds good.
> The DT binding even makes the port mandatory :-)

But the latter is subject to change?

[PATCH] media: dt-bindings: media: renesas,csi2: Node port@0 is not mandatory
https://lore.kernel.org/linux-devicetree/20210413155346.2471776-1-niklas.soderlund+renesas@ragnatech.se/

> > --- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> > @@ -1106,6 +1106,10 @@ ports {
> >                               #address-cells = <1>;
> >                               #size-cells = <0>;
> >
> > +                             port@0 {
> > +                                     reg = <0>;
> > +                             };
> > +
> >                               port@1 {
> >                                       #address-cells = <1>;
> >                                       #size-cells = <0>;
\
Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 261303ACA9A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Jun 2021 14:08:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232215AbhFRMKK convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Jun 2021 08:10:10 -0400
Received: from mail-vk1-f175.google.com ([209.85.221.175]:37660 "EHLO
        mail-vk1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231193AbhFRMKK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jun 2021 08:10:10 -0400
Received: by mail-vk1-f175.google.com with SMTP id o198so226147vkc.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Jun 2021 05:08:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BWpHxnwWChGemmePQzRRe55IzqHF/QjA8/q1FplWBtc=;
        b=baD76ogxpYEnqJ5ifi+ZRb0x4Aq6DaRDcuxpG4QPnDcZl/K41JTk1T07Ku498TWJWU
         AkQbDfZtIXBnlgFMXa8oeMMLUSqRaZQgCHiqJ+aICz1qKi13xmOwMJ8/qIJZGCAV2ty1
         YcZ/E1nqprf3/AR2RSyhJttRKEVsLGInS/99q1PvUgN43lw2gBnrlJNqxba02DLqug4D
         VVY+a0WsFBocnXzeLRJSKjn4Z7tOXyAGtLPPn13GS8XAVPV1wX/MpYaDpTFZswyH5k/6
         y2ykWYhjx7JfWfRmX7uAIcYWgY9IVzLZxeNDEP9eAal3oISi2K6hzGMJWoe8NTd6V0qh
         7s/A==
X-Gm-Message-State: AOAM531NlnWDTgQrdfFQ0aNnewEoBoxtoeVWbBjvaYPexKnpSVEoqUir
        /7njYL+EK+FcDE4Puoz25ESE6eP6uQ+YzSUrcto=
X-Google-Smtp-Source: ABdhPJzgKUly3mXApupxuzUlTfQPwYFw/s621EvFTzuIutv/wOfPXn31KXB2pV7UW5CutyH/KTjeqn3y26NAai8OGRw=
X-Received: by 2002:a1f:1a41:: with SMTP id a62mr5683778vka.5.1624018079433;
 Fri, 18 Jun 2021 05:07:59 -0700 (PDT)
MIME-Version: 1.0
References: <20180925163337.31212-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180925163337.31212-5-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdWX+HxXMB63BKpHcCh7fXAJRt9LfMFjbqM+zEvrK31MfQ@mail.gmail.com> <1451402408.292378.1624017668638@webmail.strato.com>
In-Reply-To: <1451402408.292378.1624017668638@webmail.strato.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 18 Jun 2021 14:07:48 +0200
Message-ID: <CAMuHMdV6TWUVwbBOfeDGTE28DUY609Nfd2bV3WU9+G4Ei-VfAA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: renesas: r8a77995: draak: Enable HDMI
 display output
To:     Ulrich Hecht <uli@fpond.eu>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Uli,

On Fri, Jun 18, 2021 at 2:01 PM Ulrich Hecht <uli@fpond.eu> wrote:
> > On 06/18/2021 10:05 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Tue, Sep 25, 2018 at 6:34 PM Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com> wrote:
> > > From: Ulrich Hecht <uli+renesas@fpond.eu>
> > >
> > > Adds LVDS decoder, HDMI encoder and connector for the Draak board.
> > >
> > > The LVDS0 and LVDS1 encoders can use the DU_DOTCLKIN0, DU_DOTCLKIN1 and
> > > EXTAL externals clocks. Two of them are provided to the SoC on the Draak
> > > board, hook them up in DT.
> > >
> > > Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >
> > > --- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> > > +++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> >
> > > @@ -190,6 +225,43 @@
> > >
> > >         };
> > >
> > > +       hdmi-encoder@39 {
> > > +               compatible = "adi,adv7511w";
> > > +               reg = <0x39>, <0x3f>, <0x38>, <0x3c>;
> > > +               reg-names = "main", "edid", "packet", "cec";
> > > +               interrupt-parent = <&gpio1>;
> > > +               interrupts = <28 IRQ_TYPE_LEVEL_LOW>;
> > > +
> > > +               /* Depends on LVDS */
> > > +               max-clock = <135000000>;
> > > +               min-vrefresh = <50>;
> >
> > Where do these two come from? They fail to validate with commit
> > cfe34bb7a770c5d8 ("dt-bindings: drm: bridge: adi,adv7511.txt: convert
> > to yaml").
> > I can't find where it is used in the driver, nor in the driver history.
>
> I have found a prototype patch in my archives that uses these properties. I guess the patch itself didn't make it into the final series, but the properties inadvertently did. I vaguely remember this was supposed to work around an issue with modes that use a higher clock than supported by one of the parts in the display pipeline.

Thanks, I already suspected something like that...

> I would say that if there are no issues with HDMI output, both the patch and the properties are obsolete.

Anyone with a Draak to verify?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

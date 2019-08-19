Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A48869256E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2019 15:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727512AbfHSNqH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Aug 2019 09:46:07 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:40887 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727424AbfHSNqG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Aug 2019 09:46:06 -0400
Received: by mail-ot1-f66.google.com with SMTP id c34so1682838otb.7;
        Mon, 19 Aug 2019 06:46:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NxuAOsH0gITRNJN9OBpJxbvDlqYTby07AVpQXXeyCGI=;
        b=qW5UGIhjw6BC1QTz7MUT25gI4akGmfL/NavwKlJXWQGdE8xhsvr63W6VGWgpOrsoT0
         XGJhsvRXWQbCbCKeANKYBGvlAr9LWkriSE7bafR8473ZUo1ggAW0APYZm1FxU/Z4aHp8
         hF6SGzCzaSjqfYYUR+R8Tk/vKbYqH78ftAHvaj6hk7vKAUie22pWp/McXCeJRFXlJRZP
         +cyMpGW0jJbcmw3l233UYWVR4pi32UWlaVTLUaOs3wQoZYFx4kTodTHibau/3KApRkhv
         FYh7/+jiaj5pp+KQKhQED8qcZaWxX2C4zTRQLVQFAS2HSByKo8DsSjtzDZpIXt96NXq9
         tAQA==
X-Gm-Message-State: APjAAAU4gblVPzqcSzTW6LRhdp2zFoPIDTnfElPOgFUugCzPVKUEyXJo
        G3rwOTXyrrNMHfh5vXzqRpxxwy2+/wxHun/enPw=
X-Google-Smtp-Source: APXvYqzgYstlVA652TlqSPbEjGg5VRStiuwas2W4EMQF6pqOxYXBuRXCDn2aIXatACWciHFWW+VeDtlXD+c2OkPoXLQ=
X-Received: by 2002:a9d:7a90:: with SMTP id l16mr18936397otn.297.1566222365556;
 Mon, 19 Aug 2019 06:46:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
 <20190706140746.29132-2-jacopo+renesas@jmondi.org> <CAMuHMdWVzm8yoZSoKZh3MJsaX4jCRXQCbn2x2LAu4UWtb1yYjw@mail.gmail.com>
In-Reply-To: <CAMuHMdWVzm8yoZSoKZh3MJsaX4jCRXQCbn2x2LAu4UWtb1yYjw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 19 Aug 2019 15:45:54 +0200
Message-ID: <CAMuHMdWFHDGPSZt2_H_sC9rCKDYBR0XDLn0TGxzPRxZsrOTEHw@mail.gmail.com>
Subject: Re: [PATCH v2 01/19] dt-bindings: display: renesas,cmm: Add R-Car CMM documentation
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On Mon, Jul 8, 2019 at 9:58 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Sat, Jul 6, 2019 at 4:07 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> > Add device tree bindings documentation for the Renesas R-Car Display
> > Unit Color Management Module.
> >
> > CMM is the image enhancement module available on each R-Car DU video
> > channel on R-Car Gen2 and Gen3 SoCs (V3H and V3M excluded).
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> Thanks for your patch!
>
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/renesas,cmm.txt
> > @@ -0,0 +1,25 @@
> > +* Renesas R-Car Color Management Module (CMM)
> > +
> > +Renesas R-Car image enhancement module connected to R-Car DU video channels.
> > +
> > +Required properties:
> > + - compatible: shall be one of:
> > +   - "renesas,rcar-gen3-cmm"
> > +   - "renesas,rcar-gen2-cmm"
>
> Why do you think you do not need SoC-specific compatible values?
> What if you discover a different across the R-Car Gen3 line tomorrow?
> Does the IP block have a version register?

Do you have an answer to these questions?
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

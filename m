Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 715D523C77A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Aug 2020 10:13:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728087AbgHEIFi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Aug 2020 04:05:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728109AbgHEIE4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Aug 2020 04:04:56 -0400
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com [IPv6:2607:f8b0:4864:20::b42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 049F5C061757;
        Wed,  5 Aug 2020 01:04:32 -0700 (PDT)
Received: by mail-yb1-xb42.google.com with SMTP id e14so9497608ybf.4;
        Wed, 05 Aug 2020 01:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BiuuPtVTD0TIdLTlFbDmr4GJPdBHQfsmJUkSiUv0PmQ=;
        b=fMTw7nHAmyojNDsyhXH2aNqC8O1PkqTHzVO/PnUwikGnJZK2hKak0OUyUzjx7VlP+S
         HiiabgNJLGQ7dHfvKgHWb+ICEXl2kfFYqGoVM6u+FGD2Gl05sugti/x6k1XH19zn+hjr
         /ZR5xkO31XqfJ++52Hx3pLgJpJhFnl1sW2hbqPIhUCO6edCHWPQiKzXwHWTGqwCiIQ4X
         g0BV886F3c1y3po2yVxQSrcrv9WEGa9m5RpQvv/e6IAuZ9g1LJ6UIftUWBJeonEeAX/D
         WYby2otwKWiWhW7mxVYcScSZ86lDJXcNCI4HMmSAHrERp2yv0aNNWBuuU3spM2EhBbRf
         C9TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BiuuPtVTD0TIdLTlFbDmr4GJPdBHQfsmJUkSiUv0PmQ=;
        b=TlqptdNgGfFcz+BXueeZPtumVYmXZxuqaYZbixGfIKfHbm+Z4g0Irgi0o9/8EKgkjY
         9IaiCQTge5lMRJkAnF44Hemu4bGTI1fgw+sn75D6A2PBQ7OiV6CJM3f//jU1x3i9WZih
         zo7QauLyKvBqKcmiDUKSGK4HT4ipNJ335X4y950MXMrwy6C3MzN655hxH+Db/uMXPgXJ
         eKHZj8OznKxGapdqcnQInujJmxP+9t7n0YbW+wgITs7Uun7cFM8GFtADCQqkAsV+jQhO
         oRCPv0mXm/DOc7/oyxKh8/SYGlI6lY6dBl9y+xZukNesIq0CzkihdxIphR3At/hly0KK
         H1yQ==
X-Gm-Message-State: AOAM533eL0qZvISCKDGz4PPamOGMf9zQeoLC/cxIJEsMSqilf8yhzZu1
        Mbv244efvC1bmaqIawIoVXaMRw07Cep9Ese0fpU=
X-Google-Smtp-Source: ABdhPJysh3lsTewqog7MiMBZa3uhA597rnIHVhPuIrHcPba7M8AIp8ClLZSH9skBUgGReuophzgnmo6NBEDS8+kuO3s=
X-Received: by 2002:a25:4b01:: with SMTP id y1mr2768364yba.395.1596614671325;
 Wed, 05 Aug 2020 01:04:31 -0700 (PDT)
MIME-Version: 1.0
References: <1594230511-24790-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594230511-24790-5-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAPDyKFqeiEUeajprG=Bx3Nion8bGpVrDOuM7q6-kLDpOMY-QbQ@mail.gmail.com>
In-Reply-To: <CAPDyKFqeiEUeajprG=Bx3Nion8bGpVrDOuM7q6-kLDpOMY-QbQ@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 5 Aug 2020 09:04:05 +0100
Message-ID: <CA+V-a8txuETixBOg7iLRN_uYmSDpwpQJq=o83ewYAs6w9uHC0Q@mail.gmail.com>
Subject: Re: [PATCH 4/8] dt-bindings: mmc: renesas,sdhi: Add r8a774e1 support
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Ulf,

On Wed, Aug 5, 2020 at 7:32 AM Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Wed, 8 Jul 2020 at 19:48, Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> >
> > Document SDHI controller for RZ/G2H (R8A774E1) SoC, which is compatible
> > with R-Car Gen3 SoC family.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
>
> Sorry, but this doesn't apply as the DT doc has been converted to
> YAML. Can you please rebase and respin.
>
Sure will respin it.

Cheers,
Prabhakar

> Kind regards
> Uffe
>
>
>
> > ---
> >  Documentation/devicetree/bindings/mmc/renesas,sdhi.txt | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.txt b/Documentation/devicetree/bindings/mmc/renesas,sdhi.txt
> > index 0ca9a622cce0..779e484fa3ef 100644
> > --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.txt
> > +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.txt
> > @@ -14,6 +14,7 @@ Required properties:
> >                 "renesas,sdhi-r8a774a1" - SDHI IP on R8A774A1 SoC
> >                 "renesas,sdhi-r8a774b1" - SDHI IP on R8A774B1 SoC
> >                 "renesas,sdhi-r8a774c0" - SDHI IP on R8A774C0 SoC
> > +               "renesas,sdhi-r8a774e1" - SDHI IP on R8A774E1 SoC
> >                 "renesas,sdhi-r8a77470" - SDHI IP on R8A77470 SoC
> >                 "renesas,sdhi-mmc-r8a77470" - SDHI/MMC IP on R8A77470 SoC
> >                 "renesas,sdhi-r8a7778" - SDHI IP on R8A7778 SoC
> > --
> > 2.17.1
> >

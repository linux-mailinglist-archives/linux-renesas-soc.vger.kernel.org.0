Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE40E203014
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2020 09:06:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731307AbgFVHGS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Jun 2020 03:06:18 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:44830 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726843AbgFVHGR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Jun 2020 03:06:17 -0400
Received: by mail-ot1-f65.google.com with SMTP id e5so12218979ote.11;
        Mon, 22 Jun 2020 00:06:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/moNm0JhqFf7N9xf8shxCLSCHkTyX5Q4ojQ7yxsOhLw=;
        b=eOn6lmpbAJon480UCuRk6Gxva2F38Ci43UQ+9ruDmTN9V3c5KKgD1rSypkQd4r+UjU
         JUcxsmMUEf/rOeOxrF/94ECoSyX3rvzQyYVsJMb0Xhy+7TJQdW8H8Aen9vijW5SYLbf3
         wgaP8dNVKZtO++5CaXiuR1tW+vUun1Y6kJ1mlgFUNNe15EYfmikJD5+nxVujrrznex2k
         KbaKCU41QGT/bKKPx1WsgBsfgUhyG5zxbuo08BhIp2f5x+wTopR1vbplqVA2tT+bRBjg
         7kD0kcgRUIdT9JXGFyuAdz6xdymKcOUlLlgLM4qNRO6lpHJ6hu1PO/qP5hWh8TXC9F3K
         +cmw==
X-Gm-Message-State: AOAM532GH/ggwADG7Cv71uwwAgquDp2tDzqR8QGYoBxYpLIk4yWRXOay
        03OKasCGyG4TlkwXvEoUI6Yw69a87m7TbQ+kAt84Ig==
X-Google-Smtp-Source: ABdhPJz/42Fp1d5uFwEcgKoZG7C2YDazzY66i/rhyg/YaPqYCQgL8Dqt1/1v3jZVeLZSe5K8PYmzCAMHOO9OKKNC60U=
X-Received: by 2002:a05:6830:141a:: with SMTP id v26mr12956410otp.250.1592809576767;
 Mon, 22 Jun 2020 00:06:16 -0700 (PDT)
MIME-Version: 1.0
References: <1592219989-28631-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdWd_nRhYZoHGdC+OJuB3edNUZ=pcNERDRkOwr+n=43Yeg@mail.gmail.com> <TY2PR01MB369258B26BD909D9E0E3615ED8970@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB369258B26BD909D9E0E3615ED8970@TY2PR01MB3692.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 22 Jun 2020 09:06:05 +0200
Message-ID: <CAMuHMdU03451pdTyAFTXcjadZUbF_1An6smqkB12WvvY1tzezA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: renesas,usb-xhci: convert to YAML
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        USB list <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Mon, Jun 22, 2020 at 7:21 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Thursday, June 18, 2020 4:52 PM
> > On Mon, Jun 15, 2020 at 1:21 PM Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > Convert renesas related part of usb-xhci to YAML.
> > >
> > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

> > So you're just extracting the Renesas parts...
> >
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml
> >
> > ... and putting them in a separate file.
>
> Yes.
>
> > Would it make sense to keep them combined in a single document?
> > Or are there too many differences?
>
> I thought there were too many differences. At first, I had converted all to
> a single document [1]. But, I was thinking there was a not good way in validation
> point of view because some properties needed to adjust for all platforms.
> Also, unfortunately, some compatibles and specific properties
> are not documented... So, I had extracted the Renesas parts only.
>
> [1]
> Please refer to the end of this email.

OK. Makes sense, as the Renesas parts are not compatible with generic-xhci.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

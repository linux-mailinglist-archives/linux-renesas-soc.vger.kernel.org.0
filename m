Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34227A684E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2019 14:11:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728679AbfICMKr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Sep 2019 08:10:47 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:33308 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727077AbfICMKr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Sep 2019 08:10:47 -0400
Received: by mail-oi1-f194.google.com with SMTP id l2so12592375oil.0;
        Tue, 03 Sep 2019 05:10:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NnWycdpPV9wEb5pbBdWv59BfIu5ikMwIJmgO/R0Olww=;
        b=ptF1HjJMYWTgGGbLNIL5eOHnWkz1rp0/bjnYPX0lQnBd3zHTfmnySrl0dEXAQKX2wO
         rljm1SiRZhO5eXn1tYr2MeHkI9+/Rc/kLxDecravvrqnyn8odkUpFExjIXe/vkcltzFx
         bSmfkEif+x8/XQWNRJijX1cZvuz1PVqVxYNBblznX3xk0L6b91HcetYj/ErGS4tH7Y9K
         Z6s0kTE5Hx2aNgjhrUoPNsFH1FovK8mj92E/yT6lUgrQ2GFni5UmTLo1CPLrpNjQpZ1x
         +M5YFUM/tJPWpdJY5uzab+jm1//U58FnYXpfBLwPEXPZWyc8ekZ3v+rPHNr6VydNbtfO
         z5kQ==
X-Gm-Message-State: APjAAAVunyudxMBkwidQDxn3Vmo0uPMmy8+WjazrAQMQ33s0w8v6SfBA
        kTdXPi7fxO0eerJRWqjgrQ6cZ4F0IoV/a2if/4U=
X-Google-Smtp-Source: APXvYqxB5KVSRRROkrCKyWIsunmCl/xzLdaafYQEN9wenFIdvdmUwcoiz7//vS6AmVBbz6QriNfp8nZTBOEneDZXuFw=
X-Received: by 2002:aca:ea82:: with SMTP id i124mr21664779oih.153.1567512645854;
 Tue, 03 Sep 2019 05:10:45 -0700 (PDT)
MIME-Version: 1.0
References: <1560258401-9517-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1560258401-9517-6-git-send-email-fabrizio.castro@bp.renesas.com>
 <TY1PR01MB1770BF952221F50BBCDF3765C0BD0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20190902083224.mn5agbxf5akhhoqg@verge.net.au> <CAMuHMdVuj1w_bQVPySpspk4OJPN1cNSF-JW6XKExTEdZbtALgw@mail.gmail.com>
 <244ca7ac-54d1-d07d-762f-e832b0e2a267@linaro.org>
In-Reply-To: <244ca7ac-54d1-d07d-762f-e832b0e2a267@linaro.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 3 Sep 2019 14:10:34 +0200
Message-ID: <CAMuHMdWQaieUpLFDiWXTywXXi+QQfsjC+VacFMrqkw=O_ridxQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] dt-bindings: timer: renesas: tmu: Document r8a774a1 bindings
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     Simon Horman <horms@verge.net.au>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Daniel,

On Mon, Sep 2, 2019 at 10:42 AM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
> On 02/09/2019 10:39, Geert Uytterhoeven wrote:
> > On Mon, Sep 2, 2019 at 10:32 AM Simon Horman <horms@verge.net.au> wrote:
> >> On Fri, Aug 30, 2019 at 10:37:54AM +0000, Fabrizio Castro wrote:
> >>> This patch has been reviewed by Geert, Simon, and Rob, so I think it's ok to apply.
> >>> Is anybody willing to take this patch?
> >>
> >> <2c> I think Geert can take this </2c>
> >
> > If the timer people won't take it for v5.4, I can queue it in renesas-devel
> > for v5.5, in my branch for DT binding updates for subsystems that are
> > less DT-centric.
>
> Please do, thanks
>
> Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Thanks, queued.


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

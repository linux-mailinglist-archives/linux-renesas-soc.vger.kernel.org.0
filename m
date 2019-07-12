Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF27967058
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2019 15:43:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726887AbfGLNnq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Jul 2019 09:43:46 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:39034 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726776AbfGLNnp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Jul 2019 09:43:45 -0400
Received: by mail-oi1-f196.google.com with SMTP id m202so7307805oig.6;
        Fri, 12 Jul 2019 06:43:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wlOi3sKXtkvGGzTuNmz0VruMJGLzSkGM/SsKL+SivPo=;
        b=cgypLfu6nd5X+huEZmT5fBu9C0prXCUK+O761J6Q86XFktHi1Qx6M0G0+wa1hDiDWi
         5iqFwsu66phIdKPdj401H0gIecYVKMtsNXo0lc8/cu7Woga7aqEBzHs3RU6BJBHQm8uN
         TWul66V9p7qbvoZW3WgJVpFslFUr4qwgaU/zOD75bUHK9p4CjK/UsLhaIU/d9h6fLiIS
         CrC3EMT01C5IXaERdWwdaJbQEy98D75jCkCN+Bxf+QX7FkLvDVdXVM2+jIIVI/2xhr11
         Lu7AnZ1hjX+i7qG7bQIu7+Ib0j5/tnlqjgE0d6S0tBa+V6lvlyzvoYGUEjdlFPhfjVIm
         3C0g==
X-Gm-Message-State: APjAAAWRbl33gJt+sEUMkJD7hIkpURJkT656q2fm21wtisBd/eCzU84+
        vz9oslhzgQ82disGgMZvf86YByJry9zHRlqCh5gzQg==
X-Google-Smtp-Source: APXvYqxGHCb3OuJitMJwbnRCqhIjTfH6n0R/3mlGVzniQTALMgvUqegropXz/ytrRF2qzMMCeLN2rqDGb/f3GQBxYr4=
X-Received: by 2002:a05:6808:3c5:: with SMTP id o5mr5978591oie.102.1562939024801;
 Fri, 12 Jul 2019 06:43:44 -0700 (PDT)
MIME-Version: 1.0
References: <1562321720-18735-1-git-send-email-biju.das@bp.renesas.com>
 <1562321720-18735-2-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdU79JQfEH5hY=wjyknE+sLpS6i3GeXYZ5Z=uzWkWDC-DA@mail.gmail.com> <TYAPR01MB2111E5F445AC1CEA0C720BD9B8F20@TYAPR01MB2111.jpnprd01.prod.outlook.com>
In-Reply-To: <TYAPR01MB2111E5F445AC1CEA0C720BD9B8F20@TYAPR01MB2111.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Jul 2019 15:43:33 +0200
Message-ID: <CAMuHMdWZqQWB+49=FXzKLDOW=phtLSrbvvH1zatdmgf0u8qirA@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: hihope-common: Add PCA9654 I/O expander
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Fri, Jul 12, 2019 at 3:22 PM Biju Das <biju.das@bp.renesas.com> wrote:
> > Subject: Re: [PATCH 1/3] arm64: dts: renesas: hihope-common: Add PCA9654 I/O expander
> > On Fri, Jul 5, 2019 at 12:20 PM Biju Das <biju.das@bp.renesas.com> wrote:
> > > Enable PCA9654 GPIO expander, so that we can configure its GPIOs later.
> > >
> > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> >
> > > --- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> > > @@ -162,6 +162,13 @@
> > >         clock-frequency = <400000>;
> > >         status = "okay";
> > >
> > > +       gpio_expander: gpio@20 {
> > > +               compatible = "onnn,pca9654";
> > > +               reg = <0x20>;
> > > +               gpio-controller;
> > > +               #gpio-cells = <2>;
> >
> > You may want to describe that the interrupt output is tied to GP5_25?
>
> BT_REG_ON and WLAN_REG_ON are output pins. That is the reason, I haven't described the interrupt output.
> If needed, I can add this. Please let me know.

OK, it's fine for me (for now).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

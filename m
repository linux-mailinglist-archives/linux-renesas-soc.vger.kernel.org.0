Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9465449F09
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 13:19:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729581AbfFRLTS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 07:19:18 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44677 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729110AbfFRLTS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 07:19:18 -0400
Received: by mail-lj1-f196.google.com with SMTP id k18so12650687ljc.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Jun 2019 04:19:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4qoZlqk786u0ouo5C1bSIhLOmlf/OwDifTle645F2Ao=;
        b=jUpzwhxrrq+n5hvjciS5xUkqyeyq7143V4uSr2/ubtlZVVdV+POzZDGFtlTfECGALj
         IAJwJPwAH4VAuJZOiyAO/kPgPDB8lR1BxtRP2CepgrpyieUTZqbSWH76c7XR4osX9c3L
         tlf2ovGCTAmiVyrMFdswCsfqXhOHHRpvSR2oBDOejhFx9Ov6gIkCPPiNCtWjQ4avLzw+
         78p3QSgyuG+RjQmtykiPTPNj4A1R/UBhzXoo2Cosjd/IbCRvPq9JQxOXtPdlBLrjXfVj
         1mVYgq6pLcehpXYybmui2DMneG/YQ/AK9U3es8Rl33QKyErq273mblSnHU3hcxJsvdlM
         g+zg==
X-Gm-Message-State: APjAAAUUVhm59HO0EpDi6SnofX2yIuWNW2Jp81WlTZp2xQyfxfu5AdM2
        O5KtMGX98ukseUp4rmYdcLC9sbP0QTJqZLsjuxk=
X-Google-Smtp-Source: APXvYqyaAsONWcgbY2o5yFZeMPs1jPVCvqjLmSUQYkv8lHgrbhoZJSavDZReKMqZGPesSXIq2YQ7Bz2IfCq51tvkl/0=
X-Received: by 2002:a2e:2b57:: with SMTP id q84mr15735189lje.105.1560856755698;
 Tue, 18 Jun 2019 04:19:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190617083704.3941-1-horms+renesas@verge.net.au>
 <20190617083704.3941-2-horms+renesas@verge.net.au> <CAMuHMdUu2T2+Ri_xEq+Nr1qD_Dm067TDkfxTDpduX4xia2FGDQ@mail.gmail.com>
 <20190618104455.72jyrvwf2vut76hy@verge.net.au>
In-Reply-To: <20190618104455.72jyrvwf2vut76hy@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 18 Jun 2019 13:19:02 +0200
Message-ID: <CAMuHMdVFn+sTXhbsM_tUsqSPeAG4b=zbUne=FaQedZgCBo4_oQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: renesas: r8a77990: Add cpg reset for
 LVDS Interface
To:     Simon Horman <horms@verge.net.au>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On Tue, Jun 18, 2019 at 12:45 PM Simon Horman <horms@verge.net.au> wrote:
> On Mon, Jun 17, 2019 at 10:43:09AM +0200, Geert Uytterhoeven wrote:
> > On Mon, Jun 17, 2019 at 10:37 AM Simon Horman
> > <horms+renesas@verge.net.au> wrote:
> > > From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > >
> > > It is necessary to reset the LVDS Interface according to display on/off.
> >
> > This is not the LVDS interface.
> > The LVDS interface has its own device node.
>
> Thanks, how about a changelog more like this?
>
> arm64: dts: renesas: r8a77990: Add cpg reset for DU
>
> Add CPG reset properties to DU node of E3 (r8a77990) SoC.

Thanks, much better.

> According to Laurent Pinchart, R-Car Gen3 reset is handled at the group
> level so specifying one reset entry per group is sufficient. For this
> reason <&cpg 724> is not listed as a reset for "du.1" as was the case in an
> earlier revision of this patch.

Do we need this last sentence?

Note that "dt-bindings: display: renesas: du: Document optional reset
properties"
hasn't been accepted in -next yet.

> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
>
> > > Therefore, this patch adds CPG reset properties in DU device node
> > > for the R8A77990 SoC.
> > >
> > > According to Laurent Pinchart, R-Car Gen3 reset is handled at the group
> > > level so specifying one reset entry per group is sufficient. For this
> > > reason <&cpg 724> is not listed as a reset for "du.1" as was the case in an
> > > earlier revision of this patch.
> > >
> > > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > > Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> > > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > > ---
> > > v2 [Simon Horman]
> > > - only add one reset entry per group

> > > --- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> > > @@ -1766,6 +1766,8 @@
> > >                         clocks = <&cpg CPG_MOD 724>,
> > >                                  <&cpg CPG_MOD 723>;
> > >                         clock-names = "du.0", "du.1";
> > > +                       resets = <&cpg 724>;
> > > +                       reset-names = "du.0";
> > >                         vsps = <&vspd0 0 &vspd1 0>;
> > >                         status = "disabled";

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

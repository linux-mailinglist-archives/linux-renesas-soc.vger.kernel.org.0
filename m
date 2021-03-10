Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36174333AC1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Mar 2021 11:55:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232007AbhCJKzN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Mar 2021 05:55:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231828AbhCJKzM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Mar 2021 05:55:12 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75546C061760
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Mar 2021 02:55:12 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id r25so24949365ljk.11
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Mar 2021 02:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=PUVtKUPoduvs7l6B3SzeJOq8YvhYmZWRJ9L2/UTDBME=;
        b=YfQD7GLPIUgmhkGoLSgl3sEOlNDEuAF+HVsFENuK65Wd4qjJmP2tESgaqGHa4wRBId
         6azc5Sc29D8vD7VcRyPPgCwU231GW8uUQTUFvO3vIwgP7pnthpV9vIDS7SUbGAEcWuLR
         FU4ni9ewhBCekj9qYXaJtwAtcSzHfUx7+FZfVpGsPDULdAh/iInpjCyxHea2KE3STUkT
         u1FaoJopFfYDrsHmXDCZLCt9XbMU3odXR1PR9c5shiNME5TlCTEJMCHulg8ic3vnhVEr
         C3+QWfAh+S6RGOAsQY/IJAqnc0SIoBGjV34a8nHA7NVh8gREQP5rzD8RncWGGvObXDvu
         Zgug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=PUVtKUPoduvs7l6B3SzeJOq8YvhYmZWRJ9L2/UTDBME=;
        b=mZfALNtfeD0now7kyUzH+CkaFbOyla3P2HoLXlw7eqmbbAybZpDFQpHUYblkGNAHCo
         kQDu7Ff2rF44e+x88Bno3ozrvvB7vnktK3eFItlL4EXsC12DGpEeUPysYxkwb/3v+jkJ
         I9DjI+42eyNhyY8Zmi9SQIEyLnkfv1FxsWDaWDux/yogD9yWwCOHymuytQb6xmA86ieA
         N2r8kRt2+nBHtt1DvF6ayLZFUF5Ez/OaKnkxIrZqzuTL1b6B6QESgSrh2jBMkdE4g+DX
         a1Je7ey4jp4unBp429V/3nxZIysSO+YtvxKzGFBqw+3UYB9LhE2Zs0J6GDn1SobU0Cfy
         JZZA==
X-Gm-Message-State: AOAM533fmdH9R8WTMBa+oJ1cmXLwgPMMKPAAN3Z0RywQE1ctLX3qE/9d
        JIpL/rqjZWPRcqSOii6jyvweduuzWJKbMA==
X-Google-Smtp-Source: ABdhPJyxnT9NynGS7lLoOcce3sPI7mfxZJs4bOy4oMiIOU+1zy+sb9kfiqJs/i6VqsK73U7NZP0GWw==
X-Received: by 2002:a2e:9a04:: with SMTP id o4mr1483604lji.123.1615373710862;
        Wed, 10 Mar 2021 02:55:10 -0800 (PST)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id p1sm2767352lfg.29.2021.03.10.02.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 02:55:10 -0800 (PST)
Date:   Wed, 10 Mar 2021 11:55:09 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: thermal: rcar-gen3-thermal: Support five
 TSC nodes on r8a779a0
Message-ID: <YEiljX2ULug2yOFa@oden.dyn.berto.se>
References: <20210309162205.2619943-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdX_s3Hsj2C7C2SEhRxySsj589W3Htn3d3=7Fnqk9RuJ-A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdX_s3Hsj2C7C2SEhRxySsj589W3Htn3d3=7Fnqk9RuJ-A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your feedback.

On 2021-03-10 11:06:16 +0100, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Tue, Mar 9, 2021 at 5:24 PM Niklas S�derlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > When adding support for V3U (r8a779a0) it was incorrectly recorded it
> > supports four nodes, while in fact it supports five. The fifth node is
> > named TSC0 and breaks the existing naming schema starting at 1. Work
> > around this by separately defining the reg property for V3U and others.
> >
> > Restore the maximum number of nodes to three for other compatibles as
> > it was before erroneously increasing it for V3U.
> >
> > Fixes: d7fdfb6541f3be88 ("dt-bindings: thermal: rcar-gen3-thermal: Add r8a779a0 support")
> > Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Thanks for your patch!
> 
> > --- a/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.yaml
> > +++ b/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.yaml
> 
> > @@ -111,3 +121,20 @@ examples:
> >                      };
> >              };
> >      };
> > +  - |
> > +    #include <dt-bindings/clock/r8a779a0-cpg-mssr.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/power/r8a779a0-sysc.h>
> > +
> > +    tsc_r8a779a0: thermal@e6190000 {
> > +            compatible = "renesas,r8a779a0-thermal";
> > +            reg = <0xe6190000 0x100>,
> 
> 0x200, for all register blocks?

You are correct the V3U has more registers then previous SoCs but are 
not used (yet) by the driver, thanks for spotting this! Will respin this 
and the DTS.

> 
> > +                  <0xe6198000 0x100>,
> > +                  <0xe61a0000 0x100>,
> > +                  <0xe61a8000 0x100>,
> > +                  <0xe61b8000 0x100>;
> 
> 0xe61b0000
> 
> > +            clocks = <&cpg CPG_MOD 919>;
> > +            power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> > +            resets = <&cpg 919>;
> > +            #thermal-sensor-cells = <1>;
> > +    };
> 
> The rest looks good to me.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Regards,
Niklas S�derlund

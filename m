Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95666288572
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Oct 2020 10:41:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732588AbgJIIl5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Oct 2020 04:41:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729347AbgJIIl4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Oct 2020 04:41:56 -0400
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com [IPv6:2607:f8b0:4864:20::b43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B332DC0613D2;
        Fri,  9 Oct 2020 01:41:56 -0700 (PDT)
Received: by mail-yb1-xb43.google.com with SMTP id x20so6662635ybs.8;
        Fri, 09 Oct 2020 01:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pWRP8OPHPDiX0yGCyQ3J0h/q/llirJbt+mqaV/WGwCI=;
        b=OB3axd98zHIsRnDSu/UtTEPGs47EBcf4Y4koXk28s84hO2oWgDLzMM6W08DQFtFL64
         mxjE8A7HDcigDW/izDXy3Eav1yN467U/rqtwMWGTNKAVJGajkM3eN/n4BiJmPgwJWEvQ
         3Id3ZueLBSOdl604SVqobVIGmfQKw9fUW6Hd8PjODje6hV6e617VVH3zt3gKewJmd+Nk
         euLtLARbeV3PLkdEOh4SqWUwkR5XqP4oSxLMrPcW2ZbNV8tA9OGRj4tZfVOhT5Cogyg6
         tSNxwNECCGQ/mLpwOzb31hm6BkSeXu6F3DE2pv+r3aEcN6cPPUnqtq6FirEcoVLVjy2U
         MBAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pWRP8OPHPDiX0yGCyQ3J0h/q/llirJbt+mqaV/WGwCI=;
        b=S06xQSBkPK5zgioq5x/OzjEMOXdQbV/H5+nmuFtJOEmzl73KPAsmDbYNdhgCwjBA3R
         k6ddni8AeS8GrShP4ckDfLPmSCk1HnHggJgL5QN1XYp0GI4HPMGrg3P9JMFG3S+X1Fbk
         f8OYwd23cDPY8mVGeJiCkehgELLrPNzfSiyQRkE/cdnlpJX5ttd8LmUtelQWoFTbrG5I
         6t007pkzzE9eBxgDPTmsKVvJUQ+M6FYHFkWKj2ZHTOK8i7agKW7P5Ji/xs0J9voXlLAD
         q2ivvhpeQLRu+49nD4lSXr7pAb5FNeVodfq9692xF/dGvCx2AnluDfv8FYZGbLBI+5fq
         89ig==
X-Gm-Message-State: AOAM532fzwZic+DRaxQvNcqbFVQqOfxE5jOHmZoqrOjRcpuvpyNb/sp6
        YINRZUahnv5CQ4a7PjGSQeFxb/KtbSfoH3YXBHE=
X-Google-Smtp-Source: ABdhPJz0JVUhDD/zJs0nsn0utlR+VgQJg6uPI+zxcTJA1LBqbdXee85q9E4iPysbq7EaWVNJvRMfv+CpCz525f26zMg=
X-Received: by 2002:a25:ce81:: with SMTP id x123mr17387616ybe.445.1602232915836;
 Fri, 09 Oct 2020 01:41:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200907155541.2011-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200907155541.2011-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <20201009073349.GD10335@amd>
In-Reply-To: <20201009073349.GD10335@amd>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 9 Oct 2020 09:41:29 +0100
Message-ID: <CA+V-a8tEtQwfz=NstFdBXdJiSy4-QJDoT5HjOh1kgUbuFpgs4g@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: r8a7742-iwg21d-q7: Enable SD2 LED indication
To:     Pavel Machek <pavel@denx.de>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Pavel,

Thank you for the review.

On Fri, Oct 9, 2020 at 8:33 AM Pavel Machek <pavel@denx.de> wrote:
>
> Hi!
>
> > +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
> > @@ -63,6 +63,16 @@
> >               enable-gpios = <&gpio3 11 GPIO_ACTIVE_HIGH>;
> >       };
> >
> > +     leds {
> > +             compatible = "gpio-leds";
> > +
> > +             sdhi2_led {
> > +                     label = "sdio-led";
>
> This should use appropriate label... probably mmc1:green:activity.
>
$ grep -nr mmc | grep -i activity
$ grep -nr  sd | grep -i activity

Results in 0 outputs in dts folder.

Cheers,
Prabhakar

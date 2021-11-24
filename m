Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D69145CB1A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Nov 2021 18:35:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235868AbhKXRif (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Nov 2021 12:38:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235810AbhKXRie (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Nov 2021 12:38:34 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5278CC06173E
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Nov 2021 09:35:24 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id r25so13875515edq.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Nov 2021 09:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VIzR8IOa6EfRIfwMPK/5HHQ202RzR4bvuMordnpXv5M=;
        b=tNIVwl6lGRxeF3ACJrOO3bsDPT5/oaq889qSjoXeNSkw01hN4119lpORpBlHRwZq0j
         IPYYHCYpa6Mg+7qNtSAGy29v2gNTCbm6w7gIFHsv42B7+eg/XbUdvp8HCaS9klXsEbx0
         l2HnubZe+PZJ3Igx49P1iWkrUZ8/uPtLzV15fPs74o3HLQWPYp0DSwz+FU3BFse5ZeVO
         8QMPmkuRuAQRSLYaBnpWfG0ypvtaLhmsfk7rTZwthuvvO1Sbbzhhsb162t4ynitwNEm3
         tPOVY6Yl5jjCP3RBkItUMBRNo1WWon7rSXBYOsOZjoR4ED40/v85ZhF25lOMGN54m6eO
         CsbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VIzR8IOa6EfRIfwMPK/5HHQ202RzR4bvuMordnpXv5M=;
        b=70meCpv0gsBvYLSzSx212doO+XJ/AkYAlH8h29FYkLL9NcNajtoTSYuWTSa4FEO2wQ
         Ez5hhdtw93E6Tc9cWJjrpasrV9vsOGVjsX7uxE0ALGF5ZSkfRjMQ0AoKMEt8N0Y4ExEZ
         7n3tpNI2WR2s6dLcS4JskIIjLRWSmE2sK4s7/YwMrDErmvSEE1Owk9V8M8Y13cady7dd
         eGB9nQtfZNHFpFlJzDRyn1CXMLJJ4kqpwj5rNDCRpsvFSy5DW9+tR6p05kUDDN//90xP
         EZEaoVvIRyQ+kZCJpnxzwTPqiWFrbRSiZoyP2lGPpIntU6IH0A972qLWkZPJ3gc5+3Cy
         lq2A==
X-Gm-Message-State: AOAM533RaYPCImaHbsuCmBe/XfCWzgNx+KpXyrXmmVViL5gwvsdemyHp
        AR901dEXxfMTRkSffh6kuAAs5chrqMZ65TFNmYj04MO2hJQ=
X-Google-Smtp-Source: ABdhPJxYYGd93NuWHPVWBFCVEFHobFnLt4UDeaZwEBC5AdrJnoH/OuOsk9ByxZ8GjFmAHpPXtsWNJ/MivZ3P6TIQGt8=
X-Received: by 2002:a50:da4e:: with SMTP id a14mr28152488edk.154.1637775322864;
 Wed, 24 Nov 2021 09:35:22 -0800 (PST)
MIME-Version: 1.0
References: <20211115135032.129227-1-julien.massot@iot.bzh>
 <20211115135032.129227-4-julien.massot@iot.bzh> <20211122183758.GC2686563@p14s>
 <8f3f6316-f2fd-4762-83ce-ccd9ce223472@iot.bzh>
In-Reply-To: <8f3f6316-f2fd-4762-83ce-ccd9ce223472@iot.bzh>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Wed, 24 Nov 2021 10:35:11 -0700
Message-ID: <CANLsYkxmo9KHCFiVP0f9k4sFqO6EAm-Ow=swXZ_UrDgY+yk20A@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] remoteproc: Add Renesas rcar driver
To:     Julien Massot <julien.massot@iot.bzh>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org,
        geert+renesas@glider.be, linux-renesas-soc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 24 Nov 2021 at 04:07, Julien Massot <julien.massot@iot.bzh> wrote:
>
> Hi Mathieu,
> Thanks for the review !
>
> >> +config RCAR_REMOTEPROC
> >> +    tristate "Renesas R-CAR Gen3 remoteproc support"
> >> +    depends on ARCH_RENESAS
> >> +    depends on REMOTEPROC
> >
> > You should be able to remove the dependency on REMOTEPROC since this is already in
> > the "if REMOTEPROC" block.
> Will fix.
>
> ...
> >
> >> +
> >> +    dev_dbg(dev, "map memory: %pa+%lx\n", &mem->dma, mem->len);
> >> +    va = ioremap_wc(mem->dma, mem->len);
> >> +    if (IS_ERR_OR_NULL(va)) {
> >> +            dev_err(dev, "Unable to map memory region: %pa+%lx\n",
> >
> > The sparse checker doesn't like %lx so probably be better to go with just %x.
> > Apologies for suggesting to use %lx.
>
> With %x gcc complains on arm64 build will go back to %zx.

Ok

>
> >
> >> +                    &mem->dma, mem->len);
> >> +            return -ENOMEM;
> >> +    }
> >> +
> >> +    /* Update memory entry va */
> >> +    mem->va = va;
> >
> > Talking about the sparse checker, you will see complaints about @va not being of
> > type "void __iomem *".  You can ignore those as this would likely require to
> > refactor the rproc_mem_entry structure, which is outside the scope of this work.
>
> Ok, to be honest, I was not aware of the sparse tool, thanks a lot to point me to
> this tool.
>
> >
> > This set is just as clean as the RFC.  If it wasn't for the DTS bindings that
> > need to be ack'ed by Rob, I probably would have made the above modifications and
> > applied this patch.
> >
> > Thanks,
> > Mathieu
>
> No problem will send a v2.
>
> Regards,
> Julien
> --
> Julien Massot [IoT.bzh]
>

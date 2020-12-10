Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E9C52D5F49
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Dec 2020 16:15:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389957AbgLJPPg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Dec 2020 10:15:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389902AbgLJPPU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Dec 2020 10:15:20 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2957C0613D6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Dec 2020 07:14:39 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id a1so7083422ljq.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Dec 2020 07:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=/ulnZAtjGJxX8gmm9BABs3m4KK+lTwdydUOSCM0JfMk=;
        b=GDLZXZyecN7wmOVNfe5Mn1KJEK46XN8wR/5ulJa/TaTIDHjJU5y3NnfUzVcqI5DPDF
         ROFmydHOCPFg86FJ1LaUaQtgXKqnagt/sglrIJ9zSBy9x+dq0hpawgbbfOLsB+gLF7yl
         a5jRXle39AXL/5JbLIWRNCCAiooMa3nouih2m0L4ffIocEuUnmDhXMMIh/bV8SksQuMU
         0VQyCSDS9QUakIBnRF1ps+z6fZiBlJdyvJdVk2YGPxkLEX7B/TcpM03pQBE5Llma6a2/
         XNkqxeMU8tiyeRvn2i5P1LdvIMMdhkmS9TkfKWJT82obCKVC68CPn5fUvc41/3Wx3p0f
         POSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=/ulnZAtjGJxX8gmm9BABs3m4KK+lTwdydUOSCM0JfMk=;
        b=NwZlrvnoNV3cyDNE81vpoikqhfVvlvXk8oaMtteeJda1MwSAZxQu9+TDHT7h+PJT/E
         SQKel4bdrRPHOVa/kI9KA4abeBNR5cZES4RE7DKJqNFPKqMb/z1VyDK/pchQkDpgghxO
         5UJU5rZAtqLffU/+2gdljx1YEGiyyL/StUt24Dhaq5EclnCjuMmWBxHzzma0uKQTHny4
         68WV6aC3DaoUXBJQuT86+idPY892I2FILg5AHIiZBrKc6T8CGbCVmDactrDNq4fRaWpx
         Z/Sp32anIjPy4p2lD3We2gPoHNUpJ/BBnFSncz3DsXXQrMXz81/7rK2IzGEoD3pMdVZV
         /NQA==
X-Gm-Message-State: AOAM532kssiya6BWr7PieERHXQStXQwhAPKbPym4eColDiEDTpVyiMIe
        /ViHquAqgch04Wfudq+KfvFCyg==
X-Google-Smtp-Source: ABdhPJysExCG8OfBNhXw1CmdzFSX4hx/SulFvQO00jCzQQ2Dob7xpX89U6ZWQ/VymnuFnApgjifecg==
X-Received: by 2002:a2e:9dd2:: with SMTP id x18mr3216190ljj.359.1607613278306;
        Thu, 10 Dec 2020 07:14:38 -0800 (PST)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id n12sm632519ljj.82.2020.12.10.07.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 07:14:37 -0800 (PST)
Date:   Thu, 10 Dec 2020 16:14:36 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 1/6] arm64: dts: renesas: r8a77951: Add TMU nodes
Message-ID: <20201210151436.GB4186812@oden.dyn.berto.se>
References: <20201209201950.817566-1-niklas.soderlund+renesas@ragnatech.se>
 <20201209201950.817566-2-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdVHUqSjnVp8fTve1BB=ui5ay=nqNRtnmNKPPbmnN6VBdw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdVHUqSjnVp8fTve1BB=ui5ay=nqNRtnmNKPPbmnN6VBdw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your feedback.

On 2020-12-10 14:10:14 +0100, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Wed, Dec 9, 2020 at 9:20 PM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > Add device nodes for the Timer Unit (TMU) on the Renesas R-Car H3
> > (r8a77951) SoC.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Thanks for your patch!
> 
> > --- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
> 
> > +               tmu4: timer@ffc00000 {
> > +                       compatible = "renesas,tmu-r8a7795", "renesas,tmu";
> > +                       reg = <0 0xffc00000 0 0x30>;
> > +                       interrupts = <GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 440 IRQ_TYPE_LEVEL_HIGH>;
> 
> These interrupt numbers are wrong: they should be 406, 407, and 408.
> The rest looks good to me.
> Same comment for the other 5 patches.

Thanks for spotting this, I feel a bit embarrassed having looked at the 
ID instead of SPI No in the tables :-)

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
Niklas Söderlund

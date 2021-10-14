Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4230142D928
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Oct 2021 14:16:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231144AbhJNMSm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Oct 2021 08:18:42 -0400
Received: from mail-ua1-f53.google.com ([209.85.222.53]:44895 "EHLO
        mail-ua1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230017AbhJNMSl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Oct 2021 08:18:41 -0400
Received: by mail-ua1-f53.google.com with SMTP id e7so10768425ual.11;
        Thu, 14 Oct 2021 05:16:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Lv+vkHGqzWmzedxEMuBmL3E2j3vUbGSejb8Wbt7xQjQ=;
        b=E/Dzj0NHK/7qHLf4AaVNwFVcJDE5Zqqr9ZPdI4KqNVL/OIHb4j7GrIMH/eucGXdNOm
         q1lJ/N0+aqX06TJJJSWia0nA3CpeGQHJ73Vjqr2BnxbEyOpi5CWiNi0H0yLk2Nvkv5ve
         zjbxNmnaT5FGPrgnolvFq7x21ahqUhz0PWiKQBNDPaCZA3PA8xOWHfA3x53T+j1e7s7k
         rUpjIewQlR1tnoywbO/SU8mCIXDtTiITxw6tzBbAYB466BW4WsPFAbe5S0amGt6sh7IJ
         4rNgt3NjrcQJPvc17+gEk7mXGZOZq7qnFfUN32ek4+NuljScS/hyt4I7Kz7T7NA2ce1o
         RjkA==
X-Gm-Message-State: AOAM532TSJWDZNbFzibyHmft/x7COTDOMVZclppsv/s2HmtTQUO7gYB4
        p56OrBlOTQc01YMN0n3voeSWcyKK3fsVIe1GbNs=
X-Google-Smtp-Source: ABdhPJytb1grgGpADeMJOpN6L55FezVAocpFP6q+ahrFSPEWk3sEGcqagbH86QJg0fknDI0IaA3CYQelhZmcKEjwxOk=
X-Received: by 2002:a67:d583:: with SMTP id m3mr6481019vsj.41.1634213796407;
 Thu, 14 Oct 2021 05:16:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210913170436.243-1-alexander.helms.jy@renesas.com>
 <20210913170436.243-2-alexander.helms.jy@renesas.com> <CAMuHMdWZp=7sR+dTL0F8o61weLqqC3k1kkemm_PktvyK8+ONmw@mail.gmail.com>
In-Reply-To: <CAMuHMdWZp=7sR+dTL0F8o61weLqqC3k1kkemm_PktvyK8+ONmw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 14 Oct 2021 14:16:25 +0200
Message-ID: <CAMuHMdXq2NyBf539raFJSoWSGXnwxOAMWcVB_WV-=uf+kOs7rw@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: Add binding for Renesas 8T49N241
To:     Alex Helms <alexander.helms.jy@renesas.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        david.cater.jc@renesas.com, Michal Simek <michal.simek@xilinx.com>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Alex,

On Wed, Oct 13, 2021 at 8:02 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, Sep 13, 2021 at 7:05 PM Alex Helms
> <alexander.helms.jy@renesas.com> wrote:
> > Renesas 8T49N241 has 4 outputs, 1 integral and 3 fractional dividers.
> > The 8T49N241 accepts up to two differential or single-ended input clocks
> > and a fundamental-mode crystal input. The internal PLL can lock to either
> > of the input reference clocks or to the crystal to behave as a frequency
> > synthesizer.
> >
> > Signed-off-by: Alex Helms <alexander.helms.jy@renesas.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
>
> Thanks for your patch!
>
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml

> BTW, do you plan to add interrupt and/or GPIO support later?

To clarify, and I really meant to add:

  interrupts:
    maxItems: 1

to the bindings now, and GPIO-related properties and subnodes later.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

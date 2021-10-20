Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1393C4346B9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Oct 2021 10:20:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbhJTIWt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 20 Oct 2021 04:22:49 -0400
Received: from mail-ua1-f46.google.com ([209.85.222.46]:43732 "EHLO
        mail-ua1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbhJTIWp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Oct 2021 04:22:45 -0400
Received: by mail-ua1-f46.google.com with SMTP id i22so5003393ual.10;
        Wed, 20 Oct 2021 01:20:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G0aFIaG5DuBGUXCrNxzD6HsYeP6ck00oKaqW6SSo6UM=;
        b=dU4M/j1lUkxtAdZUMiy7DM6DJsSqJxYq+CWer7vedooz19e4AV1cGSOdXONGpCkPM8
         bHCdZoE1/2mUseqYPVkg1iHmj3m2INK1DgB+p/FHeQFWXlPgftPzVqZA/WISv2HKuMeH
         HveHLbvybrhKsOFwIBEH8fNeAW9OYlwvZrs65m13xg6nYLm4ro40U1GU4rWPljW/tW1M
         WptkBs45cnpdLk5NjNmg2W0TswBg1dPrRskp3XAkelMLj81dqwPieSTk/17fn2xmcg3A
         AzyKSEpCKdClHWzK988OPIJLoGB/+68gqCROFmpxrAfUD6Lm5zJ7kazCzU4x7CoG2/MP
         0JfQ==
X-Gm-Message-State: AOAM532j0VVsAWDtMxtsPUe3zqunkUeuA53QuIyFkSFuLubhCZirNMYm
        G8/95viENAGKBNQVnxHFJNh+rRHpBWNU0A==
X-Google-Smtp-Source: ABdhPJykNfYZkk0MCjRAYMauZl8i7maJS3L+JJNrpUwPsMzHPi1QtQTjM5YTKgU11oQSngUA4t+SHg==
X-Received: by 2002:a05:6102:3a0d:: with SMTP id b13mr21963342vsu.7.1634718030417;
        Wed, 20 Oct 2021 01:20:30 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id m11sm935964vkp.46.2021.10.20.01.20.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Oct 2021 01:20:29 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id x207so11682215vke.2;
        Wed, 20 Oct 2021 01:20:29 -0700 (PDT)
X-Received: by 2002:a05:6122:a20:: with SMTP id 32mr37163725vkn.15.1634718029542;
 Wed, 20 Oct 2021 01:20:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210913170436.243-1-alexander.helms.jy@renesas.com>
 <20210913170436.243-2-alexander.helms.jy@renesas.com> <CAMuHMdWZp=7sR+dTL0F8o61weLqqC3k1kkemm_PktvyK8+ONmw@mail.gmail.com>
 <CAMuHMdXq2NyBf539raFJSoWSGXnwxOAMWcVB_WV-=uf+kOs7rw@mail.gmail.com> <4f2f81a8-9a79-3211-5ec3-fa679c3e7bb9@renesas.com>
In-Reply-To: <4f2f81a8-9a79-3211-5ec3-fa679c3e7bb9@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 20 Oct 2021 10:20:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXHkeOK+Bg10BCLDvTztV6+y9+OomBUiTAoa1+GCHRnvw@mail.gmail.com>
Message-ID: <CAMuHMdXHkeOK+Bg10BCLDvTztV6+y9+OomBUiTAoa1+GCHRnvw@mail.gmail.com>
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

On Tue, Oct 19, 2021 at 11:53 PM Alex Helms
<alexander.helms.jy@renesas.com> wrote:
> On 10/14/2021 5:16 AM, Geert Uytterhoeven wrote:
> > On Wed, Oct 13, 2021 at 8:02 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >> On Mon, Sep 13, 2021 at 7:05 PM Alex Helms
> >> <alexander.helms.jy@renesas.com> wrote:
> >>> Renesas 8T49N241 has 4 outputs, 1 integral and 3 fractional dividers.
> >>> The 8T49N241 accepts up to two differential or single-ended input clocks
> >>> and a fundamental-mode crystal input. The internal PLL can lock to either
> >>> of the input reference clocks or to the crystal to behave as a frequency
> >>> synthesizer.
> >>>
> >>> Signed-off-by: Alex Helms <alexander.helms.jy@renesas.com>
> >>> Reviewed-by: Rob Herring <robh@kernel.org>
> >>
> >> Thanks for your patch!
> >>
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml
> >
> >> BTW, do you plan to add interrupt and/or GPIO support later?
> >
> > To clarify, and I really meant to add:
> >
> >   interrupts:
> >     maxItems: 1
> >
> > to the bindings now, and GPIO-related properties and subnodes later.
>
> Any additional features such as interrupts and GPIO properties would only be added if there is customer demand for such features. Since there is no interrupt support, does the "interrupts" item still need to be added to the yaml?

DT describes hardware, not software policy (or limitations of the driver).

Arguably that applies to both interrupts and GPIOs, but the latter is
more complex to describe, while the former is a simple "interrupts"
property.  It's not uncommon for board components to have their
interrupt line wired to an SoC, even if the driver doesn't use it.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

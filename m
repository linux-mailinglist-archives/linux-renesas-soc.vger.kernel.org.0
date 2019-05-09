Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF85F18816
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 May 2019 12:01:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725869AbfEIKBN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 May 2019 06:01:13 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:40001 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725847AbfEIKBN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 May 2019 06:01:13 -0400
Received: by mail-vs1-f68.google.com with SMTP id c24so1026806vsp.7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 May 2019 03:01:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DHaRkQ/2vn/U1UsP9TEsDMsu9/0P83T+ZbmCHCRIAYY=;
        b=qSofA96wu5Buiu8j/DDwN06VqeKHflpj4IuhCf3j2p42qhEUvAmRZmfvgPvYv2hHCp
         FpOHd5K5o0tGd5L9l1vAhfjwsCdEQrqtcrGgeHGhEIuUnOmTUwN7ml6qTXNeScHHes29
         wVeHtg25LmNlgb+ZqzVz93ZNFAnCRcTlxCAwWYqqKxxU4FFfTs6WguMGPQYCihdn4+Iz
         PlAJ9DKoOx9Hhhn/G56BdY6OKv41giAkLUywW0+7fjJrUvToShg98cwrK0jQnNSvNijt
         Th8OF27QyWgfOY2PIFFDvaLaWPzd7DTYSwGMUOTIrTSAJJTOgHTU50a0BffwayEtsMFQ
         t94g==
X-Gm-Message-State: APjAAAXUyZxIL7B9jufXJde1NcF9eyQ2pXY0kFiekBV8LB/vPt1POxUV
        8XObm8KY9Hc6N8Tc0SVfA7oHx5ElhfqtLGGk9bE=
X-Google-Smtp-Source: APXvYqxkrBMDoQgl94Xq+EJrYL2SnG8siN7hmwEIbaivmkhjCTkqvNZX7XKZj4XQuWMLvqLnvAh96qBvcWcCdX8klx0=
X-Received: by 2002:a67:ba11:: with SMTP id l17mr1799664vsn.166.1557396072144;
 Thu, 09 May 2019 03:01:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190508115605.13726-1-horms+renesas@verge.net.au>
 <CAMuHMdX3YW0NaDXvN1WjWeNrCH366LALa3UT41REqAHNJk-9JA@mail.gmail.com> <20190509095749.23b2jnvfks4enkpt@verge.net.au>
In-Reply-To: <20190509095749.23b2jnvfks4enkpt@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 9 May 2019 12:00:59 +0200
Message-ID: <CAMuHMdWG4o4EJ3WK1tFqGvQGvTDpSrA-i=fOZ9nJm9eihvJxtg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a7795: Create thermal zone to
 support IPA
To:     Simon Horman <horms@verge.net.au>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On Thu, May 9, 2019 at 11:57 AM Simon Horman <horms@verge.net.au> wrote:
> On Wed, May 08, 2019 at 03:20:03PM +0200, Geert Uytterhoeven wrote:
> > On Wed, May 8, 2019 at 1:56 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> > > --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> > > @@ -155,6 +155,7 @@
> > >                         power-domains = <&sysc R8A7795_PD_CA57_CPU0>;
> > >                         next-level-cache = <&L2_CA57>;
> > >                         enable-method = "psci";
> > > +                       dynamic-power-coefficient = <854>;
> >
> > The dynamic-power-coefficient property is a property of the CPU,
> > documented in Documentation/devicetree/bindings/arm/cpus.yaml,
> > and not directly related to thermal zones.
> >
> > Hence I think its addition should be done in a separate patch.
>
> Sure, can do. Should the coefficient be added to each CPU or only
> to a57_0 and a53_0, as is the case in this patch?
>
> I assume the latter because the A53 coefficient applies to all A53 cores
> and likewise for A57.

The latter, I think.

> > >                         clocks = <&cpg CPG_CORE R8A7795_CLK_Z>;
> > >                         operating-points-v2 = <&cluster0_opp>;
> > >                         capacity-dmips-mhz = <1024>;
> > > @@ -207,6 +208,8 @@
> > >                         power-domains = <&sysc R8A7795_PD_CA53_CPU0>;
> > >                         next-level-cache = <&L2_CA53>;
> > >                         enable-method = "psci";
> > > +                       #cooling-cells = <2>;
> > > +                       dynamic-power-coefficient = <277>;
> >
> > Likewise.
> >
> > >                         clocks = <&cpg CPG_CORE R8A7795_CLK_Z2>;
> > >                         operating-points-v2 = <&cluster1_opp>;
> > >                         capacity-dmips-mhz = <535>;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

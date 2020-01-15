Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFB1F13BA65
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2020 08:39:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726088AbgAOHjn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Jan 2020 02:39:43 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:42870 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbgAOHjm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Jan 2020 02:39:42 -0500
Received: by mail-oi1-f194.google.com with SMTP id 18so14502528oin.9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jan 2020 23:39:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gQgiagsJrBpivSRO3cNNnJuZ6cplPqbaBlhKLaSf2rI=;
        b=i8lW9GJOEpgTbk+w9X2bJtNeS5Somr6TBYGVxYDNpKBKvCOOl2UghdVAcrxJqMkJ55
         h2o+5WynOFqPLPFbarfyAN3mB5pfvHBEDzFY+qoi9wIi86FenCkQMuCIBpLo1b2ZIkMo
         ib3Na7XG9AXaesNWHivVc5Hx2d5FKmpl4SuyQDySvufgXvXs4nUrRkDvBZ7V9EA8wpJQ
         /s8hJJAFUfpdjVXNelwfoYkG4fhYPgypf+9t+y1NxtVaC2INfBtya2/WUmyCffj9y1UA
         pRZv/99dWkD9FxbA8fiORxp1ExR8TcfxZM63WOUyo6p075KH+AHxvktkB86RtOWMFYqM
         XbyA==
X-Gm-Message-State: APjAAAWQxwGGJEcEwnloGn4CQjWAN2mko0shiycp28ZmyC2ZqEMyb4JO
        eORA3MeRDKN2wyUWX8r2+ovBFyKzbYzoKKi8XXY=
X-Google-Smtp-Source: APXvYqzRuT0HM8yM1bFV+Vr8H4zqFzNs++p+wxD1vyFZGkDfxnAXEJURgsGyPxDgTZ0m05wbjHNslRBWSQG6enCwcYI=
X-Received: by 2002:aca:5905:: with SMTP id n5mr20532365oib.54.1579073981787;
 Tue, 14 Jan 2020 23:39:41 -0800 (PST)
MIME-Version: 1.0
References: <20200112191315.118831-1-marek.vasut@gmail.com>
 <CAMuHMdWc97=-9yBF0CJDZpWH9ZGX9uoDY_t6E6TQNc4MO93W_w@mail.gmail.com> <cfb752e0-46b5-1936-c3f1-8c6d781bebb5@gmail.com>
In-Reply-To: <cfb752e0-46b5-1936-c3f1-8c6d781bebb5@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 Jan 2020 08:39:30 +0100
Message-ID: <CAMuHMdWeo3awiD7iAfWFXc01isnmsBc6CuQ6X4s3CO7pNXjfJA@mail.gmail.com>
Subject: Re: [RFC][PATCH] ARM: dts: renesas: Add missing ethernet PHY reset
 GPIO on Gen2 reference boards
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Marek,

On Wed, Jan 15, 2020 at 6:14 AM Marek Vasut <marek.vasut@gmail.com> wrote:
> On 1/13/20 9:58 AM, Geert Uytterhoeven wrote:
> >>  arch/arm/boot/dts/r8a7790-lager.dts   | 1 +
> >>  arch/arm/boot/dts/r8a7790-stout.dts   | 1 +
> >>  arch/arm/boot/dts/r8a7791-koelsch.dts | 1 +
> >>  arch/arm/boot/dts/r8a7791-porter.dts  | 1 +
> >>  arch/arm/boot/dts/r8a7793-gose.dts    | 1 +
> >>  arch/arm/boot/dts/r8a7794-alt.dts     | 1 +
> >>  arch/arm/boot/dts/r8a7794-silk.dts    | 1 +
> >
> > I believe all of the above (except for stout) are available in Magnus' farm...
> >
> > r8a7743-sk-rzg1m.dts and r8a7745-sk-rzg1e.dts need similar changes as
> > r8a7791-porter.dts resp. r8a7794-silk.dts.
>
> Do you have those two boards / can you prepare and test a patch ?

I don't have those boards, and thus can't test them.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

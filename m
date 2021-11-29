Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0F0B461082
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Nov 2021 09:50:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240547AbhK2IxZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Nov 2021 03:53:25 -0500
Received: from mail-vk1-f181.google.com ([209.85.221.181]:34528 "EHLO
        mail-vk1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245462AbhK2IvW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Nov 2021 03:51:22 -0500
Received: by mail-vk1-f181.google.com with SMTP id j1so10519951vkr.1;
        Mon, 29 Nov 2021 00:48:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rqKpMJ4OcC+ncR21cmEvU7b+QmBhZIqAS+TwK/7omqs=;
        b=mIsBF2Q7Ji43TwLxrR3Ug8nBR7eKylbTmrNkvOBxDjRyY5s4ZHeDO46BFV+OYGAaik
         CSLrNaU4kqZPcJHreS41zkoWic8D/EZYyPco1ScyYI0+vXXf8BnBZuzM7Ongw4GdsGcT
         UAau6LgtyhN8ujr4uKGFqtNa7JepJXWOkoR4liTZiDe1Ps7xeCa/RhSL053cHndz99i1
         wYBTGqa9Garh4iPUVkEYPjC2T0MJEmHr5ab0Pcqm4ZTygOdjGM8sQJlJQ+3Wot7Q/MrP
         XWTylmcVzqn7GjrWN4uSD5l4OwdbM8sjE4JUZM6w3ZkZJYgM+tLW2Y2HnoI/qRWaclSz
         gwzw==
X-Gm-Message-State: AOAM530nKiUrmhWiz6JTcA6axIAvUBxK41MIa5ALZU+aXgz02d8Pf6/U
        +CF0zlb81qIqrbS5eEsMwYUEdRwuP0vreA==
X-Google-Smtp-Source: ABdhPJwmhAPsIfuROaXPIS7QidXV7GhgWJELh3k+ED0k7O7ZV60rFvRCEQ1GpfDKoZ5LXclnRb1qCQ==
X-Received: by 2002:a1f:d903:: with SMTP id q3mr29642285vkg.37.1638175684422;
        Mon, 29 Nov 2021 00:48:04 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id p3sm8198259vsr.3.2021.11.29.00.48.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Nov 2021 00:48:04 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id l24so32489770uak.2;
        Mon, 29 Nov 2021 00:48:03 -0800 (PST)
X-Received: by 2002:a05:6102:c89:: with SMTP id f9mr30586811vst.68.1638175683565;
 Mon, 29 Nov 2021 00:48:03 -0800 (PST)
MIME-Version: 1.0
References: <20211116074130.107554-1-yoshihiro.shimoda.uh@renesas.com>
 <20211116074130.107554-13-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdUc4PTbo7Fi962qp3RZStR+04S1trhVcnfdynocpQWvBQ@mail.gmail.com> <TY2PR01MB3692AC815601F9C83E4AA3F3D8669@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB3692AC815601F9C83E4AA3F3D8669@TY2PR01MB3692.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 29 Nov 2021 09:47:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUja-0A3Hh0k+tccdU4f5=uw4eeP3TSWDJYzbLKadA-zQ@mail.gmail.com>
Message-ID: <CAMuHMdUja-0A3Hh0k+tccdU4f5=uw4eeP3TSWDJYzbLKadA-zQ@mail.gmail.com>
Subject: Re: [PATCH 12/16] clk: renesas: cpg-mssr: Add support for R-Car S4-8
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Mon, Nov 29, 2021 at 9:36 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Wednesday, November 24, 2021 10:48 PM
> > On Tue, Nov 16, 2021 at 8:42 AM Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > Initial support for R-Car S4-8 (r8a779f0), including core, module
> > > clocks, resets, and register access, because register specification
> > > differs from R-Car Gen2/3. The register layout of V3U is a similar
> > > with R-Car S4-8 so that renames CLK_REG_LAYOUT_RCAR_V3U as
> > > CLK_REG_LAYOUT_RCAR_GEN4. However, PLL names differ between V3U
> > > and S4-8.
> > >
> > > Inspired by patches in the BSP by LUU HOAI.
> > >
> > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

> > > +
> > > +       DEF_FIXED(".pll1_div2", CLK_PLL1_DIV2,  CLK_PLL1,       2, 1),
> > > +       DEF_FIXED(".pll2_div2", CLK_PLL2_DIV2,  CLK_PLL2,       2, 1),
> > > +       DEF_FIXED(".pll3_div2", CLK_PLL3_DIV2,  CLK_PLL3,       2, 1),
> > > +       DEF_FIXED(".pll5_div2", CLK_PLL5_DIV2,  CLK_PLL5,       2, 1),
> > > +       DEF_FIXED(".pll5_div4", CLK_PLL5_DIV4,  CLK_PLL5_DIV2,  2, 1),
> > > +       DEF_FIXED(".pll6_div2", CLK_PLL6_DIV2,  CLK_PLL6,       2, 1),
> > > +       DEF_FIXED(".s0",        CLK_S0,         CLK_PLL1_DIV2,  2, 1),
> > > +       DEF_FIXED(".sdsrc",     CLK_SDSRC,      CLK_PLL5_DIV2,  2, 1),
> >
> > This relies on the default setting of the SD-IF0 Clock Frequency
> > Control Register 1 (SD0CKCR1)?
>
> You're correct. So, we should not use DEF_FIXED for SDSRC...

You can use DEF_FIXED in the initial version, and add proper SD0CKCR1
support later.
This is similar to the handling of the various PLLs: currently they're
treated as fixed ratio clocks, later they can become programmable by
adding support for the PLLnCR1 registers.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

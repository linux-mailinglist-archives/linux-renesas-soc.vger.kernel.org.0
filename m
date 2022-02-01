Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1579B4A6333
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Feb 2022 19:07:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241800AbiBASHn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Feb 2022 13:07:43 -0500
Received: from mail-ua1-f41.google.com ([209.85.222.41]:33476 "EHLO
        mail-ua1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241746AbiBASHj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Feb 2022 13:07:39 -0500
Received: by mail-ua1-f41.google.com with SMTP id r8so1601958uaj.0;
        Tue, 01 Feb 2022 10:07:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=azgHUmMtD9J2A7oWwrY71VArtcis+wBTzB7jljqji4k=;
        b=PzTg0qe0ZgybNVdOijo3abaSHlcxqeqRVxwe6rsrZ2j+4KNig45DBf5qRnyZ1q9Qln
         mVXhrb7DzEhmRfXK+uBN6GfsqxWnqFf3LcZi2werZzpSHHh4o3C5IIoCbMZIR/RYnJj4
         zvdEt9pf4adto3o83kq3kzeXFzsFbCYdjjOdNDbaJ0MLsM0q/oonCb3jxC0iMHFDb9ni
         gw5CTa4eR+ugSkemi6b22eBrmT3wLUdsHBD9gl2B5nXf4tPswoSlisz8KBAxuS8r6VXI
         Zungd1kDQ49xH9XZxVlaIujqqcfj8BnaE7+XjsJSuT8/4cMyEUAldyDIF9UiQFe5VQ6C
         wwOQ==
X-Gm-Message-State: AOAM530O+N8uK3g2UnwL0ozLPTctF45MihPZPzRayhC0U8YchfZpMHvn
        aydbdf6KwuGIbQ+F0PYpfIC31ux1vnuCew==
X-Google-Smtp-Source: ABdhPJwMSrm4i1B0wt1M/WZakgbm17BLVIXqkPkVYGQ6EHGSJMjv6s5Lxb8cEOTBioZudAuNXYqAoA==
X-Received: by 2002:a67:e04a:: with SMTP id n10mr10822665vsl.80.1643738858968;
        Tue, 01 Feb 2022 10:07:38 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id k16sm4497627vsr.8.2022.02.01.10.07.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Feb 2022 10:07:38 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id p26so6411944uaa.11;
        Tue, 01 Feb 2022 10:07:38 -0800 (PST)
X-Received: by 2002:ab0:44c:: with SMTP id 70mr11173102uav.78.1643738858163;
 Tue, 01 Feb 2022 10:07:38 -0800 (PST)
MIME-Version: 1.0
References: <20220119095245.5611-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdVJD8FFy2aXRpsfvhHL4zTGG8nyGp==q2VzT5k-eNh2pw@mail.gmail.com> <OS0PR01MB59220FC4B38C5C66CE6876EF86269@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59220FC4B38C5C66CE6876EF86269@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 1 Feb 2022 19:07:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUjPi-h_S=ZbvPe5X5pJ7NqqfN+Rr=cziyfhqi=PCzn9g@mail.gmail.com>
Message-ID: <CAMuHMdUjPi-h_S=ZbvPe5X5pJ7NqqfN+Rr=cziyfhqi=PCzn9g@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: renesas: rzg2l-smarc: Add common dtsi file
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Tue, Feb 1, 2022 at 6:10 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH 1/4] arm64: dts: renesas: rzg2l-smarc: Add common dtsi
> > file
> > On Wed, Jan 19, 2022 at 10:52 AM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > RZ/G2L and RZ/G2LC SoC use the same carrier board, but the SoM is
> > > different.
> > >
> > > Different pin mapping is possible on SoM. For eg:- RZ/G2L SMARC EVK
> > > uses SCIF2, whereas RZ/G2LC uses SCIF1 for the serial interface
> > > available on PMOD1.
> > >
> > > This patch adds support for handling the pin mapping differences by
> > > moving definitions common to RZ/G2L and RZ/G2LC to a common dtsi file.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

> > > --- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> > > @@ -1,6 +1,6 @@
> > >  // SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > >  /*
> > > - * Device Tree Source for the RZ/G2L SMARC EVK common parts
> > > + * Device Tree Source for the RZ/G2L SMARC EVK parts
> > >   *
> > >   * Copyright (C) 2021 Renesas Electronics Corp.
> > >   */
> >
> > Note that the above conflicts with "[PATCH v2 11/12] arm64: dts:
> > renesas: Add initial device tree for RZ/V2L SMARC EVK"[1], which I had
> > queued in renesas-devel, but dropped again due to a missing dependency on
> > the clock bindings include file.  In the meantime, the updated clock
> > bindings include file is ready.
> >
> > So, which one has the highest priority: this series, or RZ/V2L?
>
> V2L is higher priority. I will rebase and send V2.

OK, I will make a renesas-devel release tomorrow morning, so you'll
have a fresh base.

Note that the RZ/V2L clock driver is still missing, but that driver
will follow a different upstream path anyway, so it can be done
in parallel.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

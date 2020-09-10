Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24A6B263D62
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Sep 2020 08:28:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727791AbgIJG25 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Sep 2020 02:28:57 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:45581 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726345AbgIJG2v (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Sep 2020 02:28:51 -0400
Received: by mail-ot1-f65.google.com with SMTP id g96so4420233otb.12;
        Wed, 09 Sep 2020 23:28:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KqtdSuTRwMp9QS5pGe926THwPMAioOqNmc/5xqurX1c=;
        b=SX3xduY3nXs1Q2Mp4z+Jlxc20fN/b7OgB5YLIR1+BkpyW39CBrbW2odWogNbLYCLmn
         riSWJzZrrUb/n7JQuCX2LOO3csb8Sr8wRARafe9evvaq0h5V63xyFUkpaaamUftDiU7b
         9rz7OhnMOnIjsUa8QeDmo6Ha6UBCXuVeNlOr7Em0AWsSYNsrmHpxbMhHJgzvGPzWYqJp
         tIitH1oEgjXRqWQ3sDuSH40pF9Kv28gpsrY2+xrOBQRyKKezDik5UZInm8dvzfPGr9BU
         TCiMcHabuTb7NUvXm9Qh9RTnsQ4MnXMCdAmcGQXTTbgiFviWaNWmqoh87dGscUuRDXR/
         SKQA==
X-Gm-Message-State: AOAM533JYLBLIKxDMETbk92tI7sPaRPch96jBv3RfKSK1pRRIoJcY5MS
        5IlOQhrxTADS/hO57gfQsJEtruPuVs4PbDnBxQ8=
X-Google-Smtp-Source: ABdhPJz8XUiox/5ZXXlI+8Pg9NkomON+3KLHXKVnsHq0uMfea1KNhQK3wpXGTl0lUJyvbCz9iRWBrC0+goIxsDmInd0=
X-Received: by 2002:a9d:3b76:: with SMTP id z109mr3073295otb.250.1599719330843;
 Wed, 09 Sep 2020 23:28:50 -0700 (PDT)
MIME-Version: 1.0
References: <1599470390-29719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1599470390-29719-12-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXsOki08u_Kf_xsm0OqddKL6RwmWLX+r+sekWYrgXf83w@mail.gmail.com> <TY2PR01MB3692490B65EB4DFDF9BB5D73D8270@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB3692490B65EB4DFDF9BB5D73D8270@TY2PR01MB3692.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Sep 2020 08:28:38 +0200
Message-ID: <CAMuHMdX6osANqLEybj6LXzB=ZgtsWcsiWxbdD8p0yLN=EOB8cQ@mail.gmail.com>
Subject: Re: [PATCH 11/14] soc: renesas: rcar-rst: Add support for R-Car V3U
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Thu, Sep 10, 2020 at 6:45 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Tuesday, September 8, 2020 8:36 PM
> > On Mon, Sep 7, 2020 at 11:20 AM Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > Add support for R-Car V3U (R8A779A0) to the R-Car RST driver.
> > >
> > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

> > > --- a/drivers/soc/renesas/rcar-rst.c
> > > +++ b/drivers/soc/renesas/rcar-rst.c
> > > @@ -37,6 +37,10 @@ static const struct rst_config rcar_rst_gen3 __initconst = {
> > >         .modemr = 0x60,
> > >  };
> > >
> > > +static const struct rst_config rcar_rst_r8a779a0 __initconst = {
> > > +       .modemr = 0x00,         /* MODEMR0 and it has CPG related bits */
> >
> > Do you need the bits from MODEMR1, too?
> > Perhaps the time is ripe to add rcar_rst_read_mode_pins64(),
> > so users can access more than 32 bits on SoCs that provide it (R-Car
> > V3H and V3U)?
>
> I think so. However, main users of rcar_rst_read_mode_pins()
> are cpg drivers for now. So, perhaps no one uses more than 32 bits for now.

We can always add rcar_rst_read_mode_pins64() when it becomes really
needed.

Hence i.e. will queue this as-is in renesas-devel for v5.10.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

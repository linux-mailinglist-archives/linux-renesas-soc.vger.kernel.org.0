Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A41EABF622
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2019 17:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727355AbfIZPpf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Sep 2019 11:45:35 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:46386 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726845AbfIZPpe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Sep 2019 11:45:34 -0400
Received: by mail-ot1-f66.google.com with SMTP id f21so2379046otl.13;
        Thu, 26 Sep 2019 08:45:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FIWxszgfgisGPP3A+ce1ZeEImOz1s/va5HhSEsRsTJk=;
        b=NnI3F5FHcKlYR2igduA7NCNB/GroR8KATNT5G+ZzjuchrxOC1pmrp+b3eGoBzHWVmf
         l5vhclOlb3fm84+JHV7E5e8DUqNYEnO/a95osLecAFoCosAF+Mlt54ZS90FSf4lqdmvl
         sbLB/eUInK6sFxSLUNFrSZJUSMRLlxzLNBW8phVXT9NBgztJE5AaQWKouhS+kzQU1gKJ
         UPiWGuz/IPWHec6er/U8UyN2xGzyGP3j1NWdN1Lj6HAElqtzMJi4HpV1l9DCYGrPable
         hxXwGDHTa3DPE6psXszlq4Ss68cjpffAFMelXuLVgQfYMuGC641RweW0g1b/sn3VXtL2
         ChUA==
X-Gm-Message-State: APjAAAXrOEYJb4ULnhpfMLTefBj0bmv9g8QGRf2bR8ghMi9/Tfpnl7N1
        jGWqWfmbAZNnL7LVMHl1cNk1Y3Z86dkhZbEOUo8=
X-Google-Smtp-Source: APXvYqzVuOaw6VZQW8p4uOOG8hUo6NV7jxRKRvUIGiQ/XZPsu7G6qBQC0jGmFPp6/MhluRh71PcTM5xga7jtfUWAKFQ=
X-Received: by 2002:a9d:17e6:: with SMTP id j93mr3199131otj.297.1569512733783;
 Thu, 26 Sep 2019 08:45:33 -0700 (PDT)
MIME-Version: 1.0
References: <1569307744-42479-1-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdUsLCciw7KFudSC7pRqfwwaGH5iJSgv906kY342V+6ocQ@mail.gmail.com> <OSBPR01MB21036B8294382D1A7A50816BB8860@OSBPR01MB2103.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB21036B8294382D1A7A50816BB8860@OSBPR01MB2103.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 26 Sep 2019 17:45:22 +0200
Message-ID: <CAMuHMdXq1BaNSrOTqUkE34kS6i1kyEXLXe=S5pMdRiEvkD4fvw@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi_internal_dmac: Add r8a774b1 support
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Thu, Sep 26, 2019 at 5:11 PM Biju Das <biju.das@bp.renesas.com> wrote:
> > Subject: Re: [PATCH] mmc: renesas_sdhi_internal_dmac: Add r8a774b1 support
> > On Tue, Sep 24, 2019 at 8:49 AM Biju Das <biju.das@bp.renesas.com> wrote:
> > > This patch adds SDHI support for RZ/G2N (R8A774B1) SoC.
> > >
> > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > > ---
> > >  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> > > b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> > > index 751fe91..7c6020e 100644
> > > --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> > > +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> > > @@ -308,6 +308,7 @@ static const struct soc_device_attribute
> > soc_whitelist[] = {
> > >           .data = (void *)BIT(SDHI_INTERNAL_DMAC_ONE_RX_ONLY) },
> > >         /* generic ones */
> > >         { .soc_id = "r8a774a1" },
> > > +       { .soc_id = "r8a774b1" },
> > >         { .soc_id = "r8a774c0" },
> > >         { .soc_id = "r8a77470" },
> > >         { .soc_id = "r8a7795" },
> >
> > Is this sufficient?
> > Do you need a tuning quirk entry in sdhi_quirks_match[]?
>
> Do you mean the  "quirks->manual_calibration"  as mentioned in the below patch ?
>
> https://patchwork.kernel.org/patch/11024131/

Exactly. Is RZ/G2N affected?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4052F358BF
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2019 10:39:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726878AbfFEIjS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Jun 2019 04:39:18 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35774 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726841AbfFEIjS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jun 2019 04:39:18 -0400
Received: by mail-lj1-f195.google.com with SMTP id h11so22399348ljb.2;
        Wed, 05 Jun 2019 01:39:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1osJF8B+IV3Hh7srhm3kistzm8+eosf1BTlfJ7E+1tQ=;
        b=KiuxUsgPjETO2wJE2RvRWzlK8ZhBA+VJaA3gtt+Z7PPMKW3A2wiRoKhd+w50pZBmrh
         UbFjwl3wrG5TNR21bKEjbMsoeU1pDt1SV/1OKGE/ltXc6VWa8HpUsl19Ok39qGmh7deJ
         BvZXaqEfDFmkZV2XnfdjE0JkoSrm6Enwvd2DiD4wzcAeOmbZhSRcz/WaoOCxY9fNZlGu
         COX+sFHo09XdqC+QcFG9SW/6DN+vpxFQJjtbvlj/8LmhzIYewXz8cfryWO3AJ/em+WhT
         QA8UAi+v1DOVobRIx9FXDRd1DitkqmhCHS8Wniqr6W/ovUy680bJNJIFswM2vmEIFTmc
         FoZg==
X-Gm-Message-State: APjAAAVh16giMLxzFeEqsfToZVhphX8FX5z8/1qj6+jwVUaRuAXoFpkH
        5jaM4HDs8q+01eB/xJVSIzSgFy5D4N2SNJVbLsU7439h6OY=
X-Google-Smtp-Source: APXvYqy4+48U3sbppTW2ANCWup5U1f6jEY+ny7ODpPNErbtUOtn7o5A89jJSH2nqVZ9776CH/0OEjMc395RiJ/o5NSw=
X-Received: by 2002:a2e:7f15:: with SMTP id a21mr2346171ljd.51.1559723955448;
 Wed, 05 Jun 2019 01:39:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190604151530.7023-1-wsa+renesas@sang-engineering.com>
 <20190604151530.7023-2-wsa+renesas@sang-engineering.com> <TY1PR01MB17702AF5B88A8EC863EA54BAC0160@TY1PR01MB1770.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB17702AF5B88A8EC863EA54BAC0160@TY1PR01MB1770.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 5 Jun 2019 10:39:03 +0200
Message-ID: <CAMuHMdX971LVUJwJ0GpfcLAY9te1SO61y45K5sgzNG1LfqkmkQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] mmc: sdhi: disallow HS400 for M3-W ES1.2 and V3H
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

On Wed, Jun 5, 2019 at 10:31 AM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> > From: linux-renesas-soc-owner@vger.kernel.org <linux-renesas-soc-owner@vger.kernel.org> On Behalf Of Wolfram Sang
> > Sent: 04 June 2019 16:15
> > Subject: [PATCH 1/3] mmc: sdhi: disallow HS400 for M3-W ES1.2 and V3H
> >
> > Our HW engineers informed us that HS400 is not working on these SoC
> > revisions.
> >
> > Fixes: 0f4e2054c971 ("mmc: renesas_sdhi: disable HS400 on H3 ES1.x and M3-W ES1.[012]")
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---
> >
> > This one should go back to stable.
> >
> >  drivers/mmc/host/renesas_sdhi_core.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> > index db73f9f1b186..e98ba6cf6c13 100644
> > --- a/drivers/mmc/host/renesas_sdhi_core.c
> > +++ b/drivers/mmc/host/renesas_sdhi_core.c
> > @@ -620,11 +620,17 @@ static const struct renesas_sdhi_quirks sdhi_quirks_h3_es2 = {
> >       .hs400_4taps = true,
> >  };
> >
> > +static const struct renesas_sdhi_quirks sdhi_quirks_nohs400 = {
> > +     .hs400_disabled = true,
> > +};
> > +
> >  static const struct soc_device_attribute sdhi_quirks_match[]  = {
> >       { .soc_id = "r8a7795", .revision = "ES1.*", .data = &sdhi_quirks_h3_m3w_es1 },
> >       { .soc_id = "r8a7795", .revision = "ES2.0", .data = &sdhi_quirks_h3_es2 },
> >       { .soc_id = "r8a7796", .revision = "ES1.0", .data = &sdhi_quirks_h3_m3w_es1 },
> >       { .soc_id = "r8a7796", .revision = "ES1.1", .data = &sdhi_quirks_h3_m3w_es1 },
> > +     { .soc_id = "r8a7796", .revision = "ES1.2", .data = &sdhi_quirks_h3_m3w_es1 },
>
> Can we actually detect E1.2 on the M3-W? My understanding is that the content of the
> PRR is the same for 1.1 and 1.2 (Geert, could you please jump in?).

Indeed, we cannot detect ES1.2 from the PRR, so technically it is already
covered by the existing check.
However, one day we might find some other way to differentiate between
M3-W ES1.1 and ES1.2 at runtime, and a need or other good reason to
enhance renesas_soc_init() to use that logic.

> Also, the r8a774a1 and r8a7796 are identical (even revision-wise), so I guess we could
> add r8a774a1 to the pile while at it?

Yes, we should.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B69C91B5BAB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2020 14:45:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728202AbgDWMo7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 Apr 2020 08:44:59 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:45640 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726435AbgDWMo7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Apr 2020 08:44:59 -0400
Received: by mail-ot1-f65.google.com with SMTP id e20so5702468otk.12;
        Thu, 23 Apr 2020 05:44:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vgLBBECU6L20FSsFw9oZIVJjruq0LKQT73CZsFM/WCI=;
        b=gCja0I+KPxPXuVfgbVazAPvOI4wyuwn1saWS1yk9h/hMPKF6xlYvwqu2qd2zJas8/M
         +I815GzgD4RuOGZ64P/98XmsCZf2OqymsB+7cO5Zx+P2gHLYjez7XWOfiwhzQwoRN31d
         9UzIvq/ZFXMbjCPo2s0ZSDpDOp/Eu/VE1YL/QIEltgu64dfjfv2Q9UNPwXdCa4QFcAEc
         xoQrWvZ4if28gulRI6ArJpeuqQMJKc7q56MtsPVIws9p58DmdtVLL7vl5UVL/rpHcKZr
         l+Hd6oqEvZeuGzneNCLSvcVOX/svKI+mSrftVRBwU+aXN9YjEd+qoCrzJ2nQVW82m6BT
         OK2w==
X-Gm-Message-State: AGi0PubEl8wk9rUez6e1usJj8caizud8nll0XqHopUBS8T56PDiFZIHG
        mlqF8Ag091BnnXOawumkcW5iygAMjFfMu8gI9vw=
X-Google-Smtp-Source: APiQypKY8csuscyjEgGrsDfD/lyKRZv2dK1Y1W6dDvKK13kaSUeDU44aEMWEtRCrpMFPQeuTioPoZJxwBUUnbbXSpfY=
X-Received: by 2002:a9d:76c7:: with SMTP id p7mr3123764otl.145.1587645898643;
 Thu, 23 Apr 2020 05:44:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200423122448.8099-1-wsa+renesas@sang-engineering.com>
 <20200423122448.8099-2-wsa+renesas@sang-engineering.com> <CAMuHMdW0OuHy4ikQz3oY+koqLskXtcXJkUVLZYqsW+niT1pLDQ@mail.gmail.com>
 <20200423123955.GB1130@ninjato>
In-Reply-To: <20200423123955.GB1130@ninjato>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 23 Apr 2020 14:44:47 +0200
Message-ID: <CAMuHMdUC2w_7sBHUDQ5CHioqNbcc8CgedPzEJF2QgFo6dLF7vw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mmc: renesas_sdhi: handle M3-N ES1.2 and 1.3 revisions
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Thu, Apr 23, 2020 at 2:39 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> > Usually we don't add soc_device_match quirks for unknown future revisions.
>
> I was just following...
>
> > > --- a/drivers/mmc/host/renesas_sdhi_core.c
> > > +++ b/drivers/mmc/host/renesas_sdhi_core.c
> > > @@ -711,11 +711,17 @@ static const struct renesas_sdhi_quirks sdhi_quirks_nohs400 = {
> > >         .hs400_disabled = true,
> > >  };
> > >
> > > +/*
> > > + * Note for r8a7796 / r8a774a1: we can't distinguish ES1.1 and 1.2 as of now.
> > > + * So, we want to treat them equally and only have a match for ES1.2 to enforce
> > > + * this if there ever will be a way to distinguish ES1.2.
> > > + */
> > >  static const struct soc_device_attribute sdhi_quirks_match[]  = {
> > >         { .soc_id = "r8a774a1", .revision = "ES1.[012]", .data = &sdhi_quirks_4tap_nohs400 },
> > >         { .soc_id = "r8a7795", .revision = "ES1.*", .data = &sdhi_quirks_4tap_nohs400 },
>
> ... this example here. This also applies to all future versions (not
> that there will be any), no?

Ah, but r8a7795 already moved to ES3.0, so it's very unlikely a newer
ES1.x will be made. Hence "ES1.*" is assumed to cover all known existing
ES1.x revisions.

For M3-N, we're still at ES1.x, AFAIK.

> > >         { .soc_id = "r8a7795", .revision = "ES2.0", .data = &sdhi_quirks_4tap },
> > >         { .soc_id = "r8a7796", .revision = "ES1.[012]", .data = &sdhi_quirks_4tap_nohs400 },
> > > +       { .soc_id = "r8a7796", .revision = "ES1.*", .data = &sdhi_quirks_4tap },
> >
> > R-Car M3-N is r8a77965, not r8a7796?
>
> Right. $subject should be M3-W :(

OK, that changes my point of view, as M3-W is also at ES3.0 (aka M3-W+ ;-),
so using "ES1.*" is fine.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCB4F3E2B28
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Aug 2021 15:07:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244172AbhHFNIJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Aug 2021 09:08:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240896AbhHFNIJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Aug 2021 09:08:09 -0400
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82C8FC061798
        for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Aug 2021 06:07:52 -0700 (PDT)
Received: by mail-vs1-xe2e.google.com with SMTP id h7so3826931vso.13
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Aug 2021 06:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uFw2B0Tj7u0MMCN+1h4nXAUeJodDleyk9DqMLOOBDJo=;
        b=EB4CCO1jSL33O066gcgUn92xuO/MZi42pHT2uppkZ6GSDK3spnaRKkJZLHShkHrLdN
         c0Iq3AljpoR13uGAdWATa8DUXH1NGRyzPraGyy2yw+wk5jmwEZj40uML1P25eeq2ppdK
         2RX6/EhrZAiVWdGWhJwpvGZo0AABEYVf1zYV9nS83nVAQ+3N+zNEY0jaQep392wy6qKG
         79/zoEh4kttg3cd8AH5ESHcvRHH62UJOOaaKIC5P7vsu5t2BNwO83IX/dDsEHKmQb4n5
         b7eoMnD13gTxmI486lQ7G4WpCmv+gM93zcv3FiSCpOesyoTINCgStbEXE0uLgNmVL6GH
         Cvlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uFw2B0Tj7u0MMCN+1h4nXAUeJodDleyk9DqMLOOBDJo=;
        b=KMYl0FF6ExbTP3Fxy5oBus8/zctr+OStfO1ELKmwnM1me667s1hBh7eMl+WUAUTinO
         sHIR714O8T/JO/bGl7V+pP6RfdFoFfv5TglBdCozhbb/DwLXYYQnl2T3Klr/ABa1BBVm
         eOCYWc8y9yO3TwjLBXFjZ/d8QwbVekIMArK25jrRQdy6dxw+MK2qpmTSvEfzNiiDXPo4
         aKfOFMnRwiVOdtnq+5Kc2qQuuYrd2cX/6BWn5lWvjoCndNVtd14hshk5tp9jrytKhTcF
         zfb7NtKe7YGCCkRj0fcVqjpqVNK24qLeOCVv11j3BiyOCr4oUiK9CI1ShzJPRSKYwteu
         iUYw==
X-Gm-Message-State: AOAM533RmG1qx4POwdwxJb1DfOsXz9BdYH7syiHWC/3R87xmNqNTYO9c
        Jc12qyt+XGcrP1DwDBf0rBj3SLTwczXhC44NYLsEjA==
X-Google-Smtp-Source: ABdhPJzoN5WpPxxiZVqQzSwBY5wT1Kxji1jKQKh+JzQZQhGvofG12XUBiYICOpWe1STNDb31bnpT/g/Y5wO/3KDY/KY=
X-Received: by 2002:a67:3214:: with SMTP id y20mr9015487vsy.19.1628255271721;
 Fri, 06 Aug 2021 06:07:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210630041658.7574-1-wsa+renesas@sang-engineering.com> <610ab795-22b2-1efe-d3a9-2724ec44c8b6@intel.com>
In-Reply-To: <610ab795-22b2-1efe-d3a9-2724ec44c8b6@intel.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 6 Aug 2021 15:07:15 +0200
Message-ID: <CAPDyKFpCV--ngy6AnRqXr4YskLhqYKUyMw6eoBTZ-uH+5BYAZQ@mail.gmail.com>
Subject: Re: [RFC PATCH] mmc: only print retune error when we don't check for
 card removal
To:     Adrian Hunter <adrian.hunter@intel.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 4 Aug 2021 at 09:10, Adrian Hunter <adrian.hunter@intel.com> wrote:
>
> On 30/06/21 7:16 am, Wolfram Sang wrote:
> > Skip printing a retune error when we scan for a removed card because we
> > then expect a failed command.
> >
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> Seems OK to me, but needs re-base. Nevertheless:
>
> Acked-by: Adrian Hunter <adrian.hunter@intel.com>

I did the rebase myself and applied it for next, thanks to both of you!

Kind regards
Uffe


>
> > ---
> >
> > In my tests, detect_change was only set when a card was removed.
> > Inserting a card or resuming from RPM would print an error. Did I
> > overlook somethign or is this good to go?
> >
> >  drivers/mmc/core/core.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
> > index b039dcff17f8..b7e6e5640640 100644
> > --- a/drivers/mmc/core/core.c
> > +++ b/drivers/mmc/core/core.c
> > @@ -937,11 +937,13 @@ int mmc_execute_tuning(struct mmc_card *card)
> >
> >       err = host->ops->execute_tuning(host, opcode);
> >
> > -     if (err)
> > +     if (!err)
> > +             mmc_retune_enable(host);
> > +
> > +     /* Only print error when we don't check for card removal */
> > +     if (err && !host->detect_change)
> >               pr_err("%s: tuning execution failed: %d\n",
> >                       mmc_hostname(host), err);
> > -     else
> > -             mmc_retune_enable(host);
> >
> >       return err;
> >  }
> >
>

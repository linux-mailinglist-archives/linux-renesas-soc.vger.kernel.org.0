Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A78C357BCA
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Apr 2021 07:22:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbhDHFW6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 8 Apr 2021 01:22:58 -0400
Received: from mail-lf1-f54.google.com ([209.85.167.54]:36723 "EHLO
        mail-lf1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbhDHFW5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Apr 2021 01:22:57 -0400
Received: by mail-lf1-f54.google.com with SMTP id n138so1858402lfa.3;
        Wed, 07 Apr 2021 22:22:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:reply-to:to:cc
         :in-reply-to:references:mime-version:date:user-agent
         :content-transfer-encoding;
        bh=LwIkpBbg+hs9AAsq9S1MhcrqF1ZjzaswrunzqqDZ5p0=;
        b=P1jZjeRqJDxuBN7lLfuo1UTNV7H03Q4eMGIVyLlgmD9+jXUleIzY28de6CwpVMw/3e
         FSIMOhaub/SZEIFfnr8oO/2rB+/ee83TYdLAMr5DotOObkXjBWaICv35TwmlQEjXX9LB
         36H0uLfMsxf41sJb2ZNk0DSDpirMvaqec9hAwoRIOPLhKZ6Y2cPGoDkCKMBWPJF3hu7A
         UyT5g06mX1pHZOg9HTZaZUL0t2lRwkt6Mv79DJ706wiMiYJop7XOYrN84/PxKNPv+sjR
         P+MzaWTEUa96niixOAfTz1yRARorBeYTQG6ZFSJBPxranbE/E0xprSbTa0uuZQzModHx
         Ae7w==
X-Gm-Message-State: AOAM531E/jVy4JpPRcmE+dhKrA1S+mlbuNFcddO7HgehncqgMQYQe4c0
        BUclFnF+OEU5QN6e1Z38jyw=
X-Google-Smtp-Source: ABdhPJyIg/bNU1H+W555nMnakz7CQrknh2ELCBr8mh+3eYxc2AoRqYtNnUjOFLTOeaucA6LvXb88dQ==
X-Received: by 2002:a05:6512:3249:: with SMTP id c9mr4990577lfr.5.1617859364958;
        Wed, 07 Apr 2021 22:22:44 -0700 (PDT)
Received: from dc7vkhyyyyyyyyyyyyydy-3.rev.dnainternet.fi (dc7vkhyyyyyyyyyyyyydy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::6])
        by smtp.gmail.com with ESMTPSA id x5sm2709152ljd.128.2021.04.07.22.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 22:22:44 -0700 (PDT)
Message-ID: <7ac9ab85553a5988e4a4db76d66261d01e865d31.camel@fi.rohmeurope.com>
Subject: Re: [PATCH v6 3/8] regulator: IRQ based event/error notification
 helpers
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reply-To: matti.vaittinen@fi.rohmeurope.com
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        linux-arm-msm@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <CAHp75VcHeiQgvZ5e+Dz+gpKghCo5RSTQLsyHGGSgdVQbVu2t+g@mail.gmail.com>
References: <cover.1617789229.git.matti.vaittinen@fi.rohmeurope.com>
         <0862bbb6813891594f56700808d08160b6635bf4.1617789229.git.matti.vaittinen@fi.rohmeurope.com>
         <CAHp75VcHeiQgvZ5e+Dz+gpKghCo5RSTQLsyHGGSgdVQbVu2t+g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Date:   Thu, 08 Apr 2021 08:22:37 +0300
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Andy, All.

On Wed, 2021-04-07 at 16:21 +0300, Andy Shevchenko wrote:
> On Wed, Apr 7, 2021 at 1:04 PM Matti Vaittinen
> <matti.vaittinen@fi.rohmeurope.com> wrote:
> > Provide helper function for IC's implementing regulator
> > notifications
> > when an IRQ fires. The helper also works for IRQs which can not be
> > acked.
> > Helper can be set to disable the IRQ at handler and then re-
> > enabling it
> > on delayed work later. The helper also adds
> > regulator_get_error_flags()
> > errors in cache for the duration of IRQ disabling.
> 
> Thanks for an update, my comments below. After addressing them, feel
> free to add
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> 
> > Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> > 
> >  static int _regulator_get_error_flags(struct regulator_dev *rdev,
> >                                         unsigned int *flags)
> >  {
> > -       int ret;
> > +       int ret, tmpret;
> > 
> >         regulator_lock(rdev);
> > 
> > +       ret = rdev_get_cached_err_flags(rdev);
> > +
> >         /* sanity check */
> > -       if (!rdev->desc->ops->get_error_flags) {
> > +       if (rdev->desc->ops->get_error_flags) {
> > +               tmpret = rdev->desc->ops->get_error_flags(rdev,
> > flags);
> > +               if (tmpret > 0)
> > +                       ret |= tmpret;
> 
> Oh, I don't like this. Easy fix is to rename ret (okay, it's been
> used
> elsewhere, so adding then) to something meaningful, like error_flags,
> then you can easily understand that value should be positive and
> error
> codes are negative.

No wonder if this looks hairy. I think I have got this plain wrong. The
rdev_get_cached_err_flags() is not updating the flags. Looks like just
plain mistake from my side. I think I've mixed the returning flags via
parameter and return value. This must be fixed. Well spotted.


> + */
> > +void *devm_regulator_irq_helper(struct device *dev,
> > +                               const struct regulator_irq_desc *d,
> > int irq,
> > +                               int irq_flags, int common_errs,
> > +                               int *per_rdev_errs,
> > +                               struct regulator_dev **rdev, int
> > rdev_amount)
> 
> I didn't get why you need the ** pointer instead of plain pointer.

We have an array of pointers. And we give a pointer to the first
pointer. Maybe it's the lack of coffee but I don't see why a single
pointer would be correct? rdev structures are not in contagious memory,
pointers to rdevs are. So we need address of first pointer, right?
+#include <linux/device.h>


> > +#include <linux/err.h>
> > +#include <linux/kernel.h>
> > +#include <linux/of_irq.h>
> 
> Not sure how this header is used. I haven't found any direct users of
> it. Perhaps you wanted interrupt.h?

Thanks. I think this specific header may be a leftover from first draft
where I thought I'll use named IRQs. The header was for
 of_irq_get_byname(). That ended up as a mess for everything else but
platform devices :) I'll check the headers, thanks.

> > +#include <linux/regmap.h>
> > +#include <linux/slab.h>
> > +#include <linux/spinlock.h>
> 
> + Blank line? I would separate group of generic headers with
> particular to the subsystem

I don't see this being used in regulator subsystem - and to tell the
truth, I don't really see the value.

> > +#include <linux/regulator/driver.h>

...

> > +
> > +reread:
> > +       if (d->fatal_cnt && h->retry_cnt > d->fatal_cnt) {
> > +               if (d->die)
> > +                       ret = d->die(rid);
> > +               else
> > +                       die_loudly("Regulator HW failure? - no IC
> > recovery");
> > +
> > +               /*
> > +                * If the 'last resort' IC recovery failed we will
> > have
> > +                * nothing else left to do...
> > +                */
> > +               if (ret)
> > +                       die_loudly("Regulator HW failure? - IC
> > recovery failed");
> 
> Looking at the above code this will be executed if and only if
> d->die() is defined, correct?
> In that case, why not
> 
> if (d->die) {
>   ret = ...
>   if (ret)
>    rdev_die_loudly(...);
> } else
>    rdev_die_loudly(...);
> 
> ?

I think this should simply be:

if (!d->die)
	die_loudly("Regulator HW failure? - no IC recovery");

ret = d->die(rdev);
if (ret)
	die_loudly(...);

...

> > +static void init_rdev_errors(struct regulator_irq *h)
> > +{
> > +       int i;
> > +
> > +       for (i = 0; i < h->rdata.num_states; i++) {
> > +               if (h->rdata.states[i].possible_errs)
> > +                       /* Can we trust writing this boolean is
> > atomic? */
> 
> No. boolean is a compiler / platform specific and it may potentially
> be written in a non-atomic way.

Hmm.. I don't think this really is a problem here. We only use the
use_cached_err for true/false evaluation - and if error getting api is
called after the boolean is changed - then cached error is used, if
before, then it is not used. Even if the value of the boolean was read
in the middle of writing it, it will still evaluate either true or
false - there is no 'maybe' state :)

My point, I guess we can do the change without locking here. Please
correct me if I am wrong. I'll just drop this comment.

> 
> re-enable / reenable
> 
> > + *             added to status. If that is the case it may be
> > desirable to
> > + *             return REGULATOR_ERROR_CLEARED and not
> > REGULATOR_ERROR_ON to
> > + *             allow IRQ fire again and to generate notifications
> > also for
> > + *             the new issues.
> > + *
> > + * This structure is passed to map_event and renable for reporting
> > regulator
> 
> Ditto.

the "renable" is referring to the callback function pointer which is
named "renable".


Best Regards
-- Matti Vaittinen


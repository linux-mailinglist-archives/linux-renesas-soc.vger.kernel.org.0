Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 251AC3562D0
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Apr 2021 07:02:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344986AbhDGFCY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 7 Apr 2021 01:02:24 -0400
Received: from mail-lf1-f53.google.com ([209.85.167.53]:45708 "EHLO
        mail-lf1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244465AbhDGFCY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Apr 2021 01:02:24 -0400
Received: by mail-lf1-f53.google.com with SMTP id g8so26347679lfv.12;
        Tue, 06 Apr 2021 22:02:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:reply-to:to:cc
         :in-reply-to:references:mime-version:date:user-agent
         :content-transfer-encoding;
        bh=Y660N962CfSq0r1Gv5yA7k9zDEwgph8j+14Pl9hIqdA=;
        b=XvodzsqrEAJiKZB/PqqO3qA4ZRYxRpspOTT0RRWQzrUAJbQr8HjRhy3xye7CqTz2ZO
         WjpQLYGi5U3YswtHXdYasH0sydYqabVpycw9AlQIDm9sR1fszfQUqahJl71IP8EwcMPz
         YRXcVhHsi+D6u5coKH+vPye+GsU8Cdaf20t9MyuEGH9yzwYaZwVnwllx5fxUiAIHQRIs
         qRAy0/L59sGjYAWPr/gJODiMP3gpO//AI7IiJfHsX9Q7aFiHtSAB2bFI6/Ai//QU9I3B
         I/Now3tD0+MwqRcdsGZi1MU3jnOYvdH6PzpkF7VJk7gMs3r1cOsdHbUfN9JEl3Te2X17
         8d6g==
X-Gm-Message-State: AOAM531tiIq0POx5GMFips9YlEdG6MAWNmqEshY+ELiHJ8nLPPKofZ1S
        rtXy/JnYEEafmaITfSriUx0=
X-Google-Smtp-Source: ABdhPJxUDLjnSysUCjbwr6Gn6YxY6BUuP8kyDq9XwjAZkPvdnpLBkDrgShBuZTBq0hMIDhAX+AUZyw==
X-Received: by 2002:a05:6512:130e:: with SMTP id x14mr1205143lfu.321.1617771733894;
        Tue, 06 Apr 2021 22:02:13 -0700 (PDT)
Received: from dc7vkhyyyyyyyyyyyyydy-3.rev.dnainternet.fi (dc7vkhyyyyyyyyyyyyydy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::6])
        by smtp.gmail.com with ESMTPSA id m24sm2365395lfq.184.2021.04.06.22.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 22:02:13 -0700 (PDT)
Message-ID: <55397166b1c4107efc2a013635f63af142d9b187.camel@fi.rohmeurope.com>
Subject: Re: [PATCH v4 3/7] regulator: IRQ based event/error notification
 helpers
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reply-To: matti.vaittinen@fi.rohmeurope.com
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-power@fi.rohmeurope.com" <linux-power@fi.rohmeurope.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <CAHp75VeoTVNDemV0qRA4BTVqOVfyR9UKGWhHgfeat8zVVGcu_Q@mail.gmail.com>
References: <cover.1617690965.git.matti.vaittinen@fi.rohmeurope.com>
         <2b87b4637fde2225006cc122bc855efca0dcd7f1.1617692184.git.matti.vaittinen@fi.rohmeurope.com>
         <CAHp75VeoTVNDemV0qRA4BTVqOVfyR9UKGWhHgfeat8zVVGcu_Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Date:   Wed, 07 Apr 2021 08:02:04 +0300
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Morning Andy,

Thanks for the review! By the way, is it me or did your mail-client
spill this out using HTML?

On Wed, 2021-04-07 at 01:44 +0300, Andy Shevchenko wrote:
> On Tuesday, April 6, 2021, Matti Vaittinen <
> matti.vaittinen@fi.rohmeurope.com> wrote:

> > +static void die_loudly(const char *msg)
> > +{
> > +       pr_emerg(msg);
> 
> Oh là là, besides build bot complaints, this has serious security
> implications. Never do like this.
 
I'm not even trying to claim that was correct. And I did send a fixup -
sorry for this. I don't intend to do this again.

Now, when this is said - If you have a minute, please educate me.
Assuming we know all the callers and that all the callers use this as

die_loudly("foobarfoo\n");
- what is the exploit mechanism?

> > +       BUG();
> > +}
> > +


> > +/**
> > + * regulator_irq_helper - register IRQ based regulator event/error
> > notifier
> > + *
> > + * @dev:               device to which lifetime the helper's
> > lifetime is
> > + *                     bound.
> > + * @d:                 IRQ helper descriptor.
> > + * @irq:               IRQ used to inform events/errors to be
> > notified.
> > + * @irq_flags:         Extra IRQ flags to be OR's with the default
> > IRQF_ONESHOT
> > + *                     when requesting the (threaded) irq.
> > + * @common_errs:       Errors which can be flagged by this IRQ for
> > all rdevs.
> > + *                     When IRQ is re-enabled these errors will be
> > cleared
> > + *                     from all associated regulators
> > + * @per_rdev_errs:     Optional error flag array describing errors
> > specific
> > + *                     for only some of the regulators. These
> > errors will be
> > + *                     or'ed with common erros. If this is given
> > the array
> > + *                     should contain rdev_amount flags. Can be
> > set to NULL
> > + *                     if there is no regulator specific error
> > flags for this
> > + *                     IRQ.
> > + * @rdev:              Array of regulators associated with this
> > IRQ.
> > + * @rdev_amount:       Amount of regulators associated wit this
> > IRQ.
> > + */
> > +void *regulator_irq_helper(struct device *dev,
> > +                           const struct regulator_irq_desc *d, int
> > irq,
> > +                           int irq_flags, int common_errs, int
> > *per_rdev_errs,
> > +                           struct regulator_dev **rdev, int
> > rdev_amount)
> > +{
> > +       struct regulator_irq *h;
> > +       int ret;
> > +
> > +       if (!rdev_amount || !d || !d->map_event || !d->name)
> > +               return ERR_PTR(-EINVAL);
> > +
> > +       if (irq <= 0) {
> > +               dev_err(dev, "No IRQ\n");
> > +               return ERR_PTR(-EINVAL);
> 
> Why shadowing error code? Negative IRQ is anything but “no IRQ”.

This was a good point. The irq is passed here as parameter. From this
function's perspective the negative irq is invalid parameter - we don't
know how the caller has obtained it. Print could show the value
contained in irq though.

Now that you pointed this out I am unsure if this check is needed here.
If we check it, then I still think we should report -EINVAL for invalid
parameter. Other option is to just call the request_threaded_irq() -
log the IRQ request failure and return what request_threaded_irq()
returns. Do you think that would make sense?

> > +
> > +/**
> > + * regulator_irq_helper_cancel - drop IRQ based regulator
> > event/error notifier
> > + *
> > + * @handle:            Pointer to handle returned by a successful
> > call to
> > + *                     regulator_irq_helper(). Will be NULLed upon
> > return.
> > + *
> > + * The associated IRQ is released and work is cancelled when the
> > function
> > + * returns.
> > + */
> > +void regulator_irq_helper_cancel(void **handle)
> > +{
> > +       if (handle && *handle) {
> 
> Can handle ever be NULL here ? (Yes, I understand that you export
> this)

To tell the truth - I am not sure. I *guess* that if we allow this to
be NULL, then one *could* implement a driver for IC where IRQs are
optional, in a way that when IRQs are supported the pointer to handle
is valid, when IRQs aren't supported the pointer is NULL. (Why) do you
think we should skip the check?

>  
> > +               struct regulator_irq *h = *handle;
> > +
> > +               free_irq(h->irq, h);
> > +               if (h->desc.irq_off_ms)
> > +                       cancel_delayed_work_sync(&h->isr_work);
> > +
> > +               h = NULL;
> > +       }
> > +}
> > +EXPORT_SYMBOL_GPL(regulator_irq_helper_cancel);
> > +
> > +static void regulator_irq_helper_drop(struct device *dev, void
> > *res)
> > +{
> > +       regulator_irq_helper_cancel(res);
> > +}
> > +
> > +void *devm_regulator_irq_helper(struct device *dev,
> > +                                const struct regulator_irq_desc
> > *d, int irq,
> > +                                int irq_flags, int common_errs,
> > +                                int *per_rdev_errs,
> > +                                struct regulator_dev **rdev, int
> > rdev_amount)
> > +{
> > +       void **ptr;
> > +
> > +       ptr = devres_alloc(regulator_irq_helper_drop, sizeof(*ptr),
> > GFP_KERNEL);
> > +       if (!ptr)
> > +               return ERR_PTR(-ENOMEM);
> > +
> > +       *ptr = regulator_irq_helper(dev, d, irq, irq_flags,
> > common_errs,
> > +                                   per_rdev_errs, rdev,
> > rdev_amount);
> > +
> > +       if (IS_ERR(*ptr))
> > +               devres_free(ptr);
> > +       else
> > +               devres_add(dev, ptr);
> > +
> > +       return *ptr;
> 
> Why not to use devm_add_action{_or_reset}()?

I just followed the same approach that has been used in other regulator
functions. (drivers/regulator/devres.c)
OTOH, the devm_add_action makes this little bit simpler so I'll convert
to use it.

Mark, do you have a reason of not using devm_add_action() in devres.c?
Should devm_add_action() be used in some other functions there? And
should this be moved to devres.c?

Best Regards
	Matti Vaittinen



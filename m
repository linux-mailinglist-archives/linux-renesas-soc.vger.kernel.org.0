Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6B3A357DF3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Apr 2021 10:21:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbhDHIVz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 8 Apr 2021 04:21:55 -0400
Received: from mail-lf1-f48.google.com ([209.85.167.48]:46962 "EHLO
        mail-lf1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbhDHIVy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Apr 2021 04:21:54 -0400
Received: by mail-lf1-f48.google.com with SMTP id 12so2468371lfq.13;
        Thu, 08 Apr 2021 01:21:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:reply-to:to:cc
         :in-reply-to:references:mime-version:date:user-agent
         :content-transfer-encoding;
        bh=jzItxJ2CxTj3c6iH3S2M44zuyWAHzz/0wn+lYYep9xk=;
        b=CEZKNWb3CovnBrOhMfI6JNS8XSuDYolN3oHLoIjoUrNp8N+GmWh+SjWjNLTvczFv8c
         FuNhPHZgYX6qA5T1HX7PBBwxRJ5bmWQxPI43ejEmU1DpfvuyFk30xtFgqgtmKLbpKIZF
         3QidTmri47C8XNeYCBS9idfobS0/pJsNL0fK4PXBfIHDqqsSm5M4AHtWbSwNpMc2SF3c
         4xD+7xNFrgEQdDPKWE7zz+tVkwewGqRz0PQqOF3XXlabKce35GP09/wr2pSZN10piB+m
         WAeVqvd19jFfG0qQkquyUy4372m/LNp/2clfbWxF8cNODM1mz1evtuXqtr3bzsZQ+Gfi
         XunQ==
X-Gm-Message-State: AOAM531vzmEJlbKZeXJABhzn9Y7Hiesu4FBXetjfJyvEMkmaJxG0Bguc
        /GaXlksUqwJkNbW2EA6qs4c=
X-Google-Smtp-Source: ABdhPJzixoIgclWtUBc8bQOPfb33XxmdzHge9dlbikIJQZy4L9LiJwGi3K7LUsmqGmbB7+figlfUmg==
X-Received: by 2002:ac2:43c6:: with SMTP id u6mr5416226lfl.341.1617870102448;
        Thu, 08 Apr 2021 01:21:42 -0700 (PDT)
Received: from dc7vkhyyyyyyyyyyyyydy-3.rev.dnainternet.fi (dc7vkhyyyyyyyyyyyyydy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::6])
        by smtp.gmail.com with ESMTPSA id k25sm180092ljc.81.2021.04.08.01.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 01:21:41 -0700 (PDT)
Message-ID: <23c73081365fddce2950c101a51fc2baaaa37aa5.camel@fi.rohmeurope.com>
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
Date:   Thu, 08 Apr 2021 11:21:31 +0300
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Andy,

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

I (eventually) disagreed with couple of points here and haven't changed
those. Please see list below.

I still do think you did a really good job reviewing this - and you
should get the recognition from that work. Thus I'd nevertheless would
like to add your Reviewed-by to the next version. Please let me know if
you think it's ok. (I have the v7 ready but I'll wait until the next
Monday before sending it to see if this brings more discussion).

> > +/**
> > + * devm_regulator_irq_helper - resource managed registration of
> > IRQ based
> > + * regulator event/error notifier
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
> > + *                     or'ed with common errors. If this is given
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
> 
> Can you describe, please, the return value meaning. It will be good
> also to move detailed descriptions (expectations?) of the fields to
> the Description section, here.

I added the return-value documentation as you suggested. For parameter
descriptions I still think the best and clearest place is in parameter
description.

> 
> > + */
> > +void *devm_regulator_irq_helper(struct device *dev,
> > +                               const struct regulator_irq_desc *d,
> > int irq,
> > +                               int irq_flags, int common_errs,
> > +                               int *per_rdev_errs,
> > +                               struct regulator_dev **rdev, int
> > rdev_amount)
> 
> I didn't get why you need the ** pointer instead of plain pointer.
> 

This I replied to earlier - I did change the parameter documentation a
bit to explain this:
"@rdev: Array of pointers to regulators associated with this IRQ"

> > +#include <linux/regmap.h>
> > +#include <linux/slab.h>
> > +#include <linux/spinlock.h>
> 
> + Blank line? I would separate group of generic headers with
> particular to the subsystem

I haven't seen this practice in other parts of regulator subsystem (and
I personally fail to see the value).

> > +/**
> > + * struct regulator_irq_data - regulator error/notification status
> > date
> > + *
> > + * @states:    Status structs for each of the associated
> > regulators.
> > + * @num_states:        Amount of associated regulators.
> > + * @data:      Driver data pointer given at regulator_irq_desc.
> > + * @opaque:    Value storage for IC driver. Core does not update
> > this. ICs
> > + *             may want to store status register value here at
> > map_event and
> > + *             compare contents at renable to see if new problems
> > have been
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

'renable' refers to the callback name. I tried to clarify that in
comments though.
"compare contents at 'renable' callback to see..." and "This structure
is passed to 'map_event' and 'renable' callbacks for..."

Best Regards
	Matti Vaittinen


Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB3EE209726
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jun 2020 01:23:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389077AbgFXXXT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Jun 2020 19:23:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388989AbgFXXXS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Jun 2020 19:23:18 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3C04C061573
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jun 2020 16:23:17 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id w17so2655720oie.6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jun 2020 16:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dGipXZ9X17I+u12oD4DZ2rzNuQVhucODHVNdBawnSmI=;
        b=M1wwfU36UoerE5HtEt7AEffn18uiUdtoM8XXl0AWGojXJGk3IpAdJ2M0usNyP93xIJ
         C4K+tOo4fi/6g4LDkLfnGygf2naXQEjHsl+hfIdob42HpSMDH+RoiClBIpgTZBx++Gwz
         F071ruwPJDr/lHuDqNMAs+amwuavPxIJt1JaWWxFc3xFISohL1QELXY5uKA9Dywb7DaN
         A20RNPw7+ZloQGbS1jfx4jB/8WXiwu33UjOTyKHHu0VlWpJLIrtQtLaEzmdXeT9EE5GB
         owoWOoO1ON0J7TmZDzZtNI5C/NRXNrd0BXcvAjC8iei4HAH1VMd+PspPMOJfibAazSDi
         2QXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dGipXZ9X17I+u12oD4DZ2rzNuQVhucODHVNdBawnSmI=;
        b=YuXQ4UQNJ69kGRx2oQvjUEaJId2NU1zyIg7II9tvSLxBNHOHZwgtP6+QObKGEZCPcR
         JCBp+fSLvmkndNRm+fXDR56QX1SV9r0ilcI/145Y3jSDy+yw6wQWxmUfAtKV6yxW0NTD
         SFXLSqLAsXODrrIN0aDz6rScUhQHet5CYnP1z61JQ6Ki2fpEO9L0fityaMlNz7dHNgBy
         +w9FNg+7yqe//9J/mjXVBM18wWgR5W+kIRz//pGtWYK8gM3nPrxxtQwJRaeOywc8/6eL
         qzkq/yvu5h46vsZdcRPhxF9epBtK9By4qjd6Atmatb+JPpX4rJDD2R6l3RUZIeBPyhWD
         vKWA==
X-Gm-Message-State: AOAM530kSAhFXigl8fUZmPDCFsMBzbAqnpLKYhXvpEotQ1r7gkf2VsC9
        7fBbFKNUdZckrk8xcCyq84oOXsMN4gbUX10wShgigg==
X-Google-Smtp-Source: ABdhPJx5V5Rup3zninLm3/4nlfZ5WpzvvNUIwQf1nRP1tGt6s55UEoBgS6WnEaNkB6yHnFN0OU4E08/nB8eF6a04daw=
X-Received: by 2002:aca:6208:: with SMTP id w8mr126619oib.69.1593040996906;
 Wed, 24 Jun 2020 16:23:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200515053500.215929-1-saravanak@google.com> <20200515053500.215929-5-saravanak@google.com>
 <CAMuHMdUnbDvn6GdK51MN-+5iRp6zYRf-yzKY+OwcQOGrYqOZPA@mail.gmail.com>
 <CAGETcx9JKbNQWQwNah7pO5ppVSAe86R-OmMujZPYNkuTCLwKnQ@mail.gmail.com>
 <CAMuHMdU2gF=aTeVxRvtzAMLGY=GyBDfBwrYZxoRkL1tV7dL56g@mail.gmail.com>
 <CAGETcx-rHFthf-aLb_S-ST6Evozvgis5XX5u0LNxyvfMoJOLKQ@mail.gmail.com>
 <CAMuHMdXW0jM-A5cvYtFVcgc1Gm3tKkvr0+kWpeJqpJDzNOuYeA@mail.gmail.com>
 <CAGETcx8W96KAw-d_siTX4qHB_-7ddk0miYRDQeHE6E0_8qx-6Q@mail.gmail.com>
 <CAGETcx87JNfKEu4brQ3S-9wObv=OwXkAoDBSREQH5dAD68TPsA@mail.gmail.com> <CAMuHMdUsWAQ3XUGh1Jg_Y3LWz4G5aaZfHqL8JjNZv3DrW3TjvQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUsWAQ3XUGh1Jg_Y3LWz4G5aaZfHqL8JjNZv3DrW3TjvQ@mail.gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Wed, 24 Jun 2020 16:22:40 -0700
Message-ID: <CAGETcx_gOQWbxUAS6joxEgLDx_wuXwn3AFqDuio_42XeeG++PQ@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] of: platform: Batch fwnode parsing when adding all
 top level devices
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Len Brown <lenb@kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Ji Luo <ji.luo@nxp.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jun 22, 2020 at 8:49 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Saravana,
>
> On Sat, Jun 20, 2020 at 4:33 AM Saravana Kannan <saravanak@google.com> wrote:
> > On Fri, Jun 19, 2020 at 1:07 PM Saravana Kannan <saravanak@google.com> wrote:
> > > I think instead of deferred_probe_work_func() moving the device to the
> > > end of the dpm_list, I think the device probing successfully is what
> > > should move it to the end of the dpm_list. That way, the dpm_list is
> > > actually ordered by when the devices become functional and not the
> > > random order in DT or random probe order which can get pretty
> > > convoluted with multiple deferred probes. This feels right and will
> > > make suspend/resume more robust against DT ordering -- but I'm not
> > > sure what other wide ranging impact this has for other platforms.
> >
> > If you want to play around with a potential fix to test my hypothesis,
> > I think it's just adding this one line to driver_bound():
> > ============
> > klist_add_tail(&dev->p->knode_driver, &dev->driver->p->klist_devices);
> > device_links_driver_bound(dev);
> > +device_pm_move_to_tail(dev);
> >
> > device_pm_check_callbacks(dev);
> > ============
>
> Thanks, that seems to fix the issue for me, on both affected systems!
> Note that this has quite some impact on the order devices are suspended,
> but this seems harmless.
>
> Will try on more systems later...

Thanks for testing. Maybe I should just send that change as a patch
and see what Greg/Rafael have to say to that.

It's a general fix anyway. So, might as well send it out.

-Saravana

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FE7B31CEAA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Feb 2021 18:09:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229913AbhBPRIo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Feb 2021 12:08:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbhBPRIn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Feb 2021 12:08:43 -0500
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A13D6C06174A
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Feb 2021 09:08:03 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id f4so11089112ybk.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Feb 2021 09:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EOoT/2ZRzWvEXcLxuZ6fIHpjifNSP30Dl3Nv/8J4jR4=;
        b=WdCXyIRke16cMJsDa3zli6lc0UjF1wpzWcCkHwpauoeANh/CWtv98wK+NlR53jpmEX
         fPUsPo82SM1O6aRxFbpsrJT1mwlDapMcy4Qaeqd7Mys422WEBikk+gmxH/XKf9inqEqi
         FZ0g+OW/dTEtg7kiq5XU6pPJjXsFWS196dc0wPOzE7MKFPuMZJy6dzzF7YtZJHmHZLaU
         go80z7YdKCWqvAK4Z+0DLZ40C/Oy1AFuRWSgcJadSe7GXBXTu3iXLx4MepBGcuunexFf
         NL1IghxDsoc71++IbB58tXt/KXrRsnLMW4NBtz4QTQ3eJPKAyPwzoWVj1kFdqZlCmMDP
         zVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EOoT/2ZRzWvEXcLxuZ6fIHpjifNSP30Dl3Nv/8J4jR4=;
        b=AgN5NS4V3NLdX1tn+ACLwluZT6jiq1orFG98tTzt37u9DtbxIofyed0PQuQRg1c4qg
         PoSE2VbKNXANw8NM2pd7B1bYEIoPHUm4aJ4CeHmedavBy2z1WDp3KFDkvdr7YdyjsgSb
         7Uap9d4/nuqPXIFuTy4SQfCN7HXlLkjBvsIVyE1vuXl6cTe/ofbz9AcPyPM+Rnu/9AS3
         xgBJUjToBpaNasXCHgD3bHtLl3ZDEqswkYsi8N2LRfQz9RwpyppwVMP5HOHmokp+xTm1
         q8XNS3rW7QZb2cMZcPRG3K3vPQdEXyHfWHch79vPXegzvgm3alY/0AhAd+WDHv7KRT0E
         r25A==
X-Gm-Message-State: AOAM53108Ihz79a85WXpOf1rJMIFF3KB2ylhlZjMCwKhSiOipN5279tO
        WSIEyMsFk/zDpQbnxXnnQk/iGJF3m1mEjr2R84fzPg==
X-Google-Smtp-Source: ABdhPJzgGS0xYNP+T4mgwBunRSL3eutPscSYXSMk0VP22h8l7fgIH6PBMZ7zYvpr6r2RlDhmuXBtz2bgCfSYUff5nFI=
X-Received: by 2002:a25:3345:: with SMTP id z66mr31002234ybz.466.1613495282718;
 Tue, 16 Feb 2021 09:08:02 -0800 (PST)
MIME-Version: 1.0
References: <20210215111619.2385030-1-geert+renesas@glider.be>
 <CAJZ5v0ikVbMX0R9e_=wOxKfJX5X322AipmpWy-7wVnWE7Ogc9A@mail.gmail.com>
 <CAGETcx94nNjduOuYKVBZOC9Gm4yfyb9x92ddznyxK4BnDby4PA@mail.gmail.com>
 <CAMuHMdWm9FiJHWTzGqqNa-ggt9WTpS6Hg2WthNW86p_WpvPUtw@mail.gmail.com> <CAGETcx8N5QmR5V_mrv5tHmARsnWrLbH+N_Ay_pBqV9HJkpHJzQ@mail.gmail.com>
In-Reply-To: <CAGETcx8N5QmR5V_mrv5tHmARsnWrLbH+N_Ay_pBqV9HJkpHJzQ@mail.gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Tue, 16 Feb 2021 09:07:26 -0800
Message-ID: <CAGETcx8nD7Ak8z7JEM1jUVdRRpUt=8BwGMix0ghv1QeDBLaGwA@mail.gmail.com>
Subject: Re: [PATCH] driver core: Fix double failed probing with fw_devlink=on
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Feb 15, 2021 at 12:59 PM Saravana Kannan <saravanak@google.com> wrote:
>
> On Mon, Feb 15, 2021 at 11:08 AM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> >
> > Hi Saravana,
> >
> > On Mon, Feb 15, 2021 at 7:27 PM Saravana Kannan <saravanak@google.com> wrote:
> > > On Mon, Feb 15, 2021 at 6:59 AM Rafael J. Wysocki <rafael@kernel.org> wrote:
> > > > On Mon, Feb 15, 2021 at 12:16 PM Geert Uytterhoeven
> > > > <geert+renesas@glider.be> wrote:
> > > > > With fw_devlink=permissive, devices are added to the deferred probe
> > > > > pending list if their driver's .probe() method returns -EPROBE_DEFER.
> > > > >
> > > > > With fw_devlink=on, devices are added to the deferred probe pending list
> > > > > if they are determined to be a consumer,
> > >
> > > If they are determined to be a consumer or if they are determined to
> > > have a supplier that hasn't probed yet?
> >
> > When the supplier has probed:
> >
> >     bus: 'platform': driver_probe_device: matched device
> > e6150000.clock-controller with driver renesas-cpg-mssr
> >     bus: 'platform': really_probe: probing driver renesas-cpg-mssr
> > with device e6150000.clock-controller
> >     PM: Added domain provider from /soc/clock-controller@e6150000
> >     driver: 'renesas-cpg-mssr': driver_bound: bound to device
> > 'e6150000.clock-controller'
> >     platform e6055800.gpio: Added to deferred list
> >     [...]
> >     platform e6020000.watchdog: Added to deferred list
> >     [...]
> >     platform fe000000.pcie: Added to deferred list
> >
> > > > > which happens before their
> > > > > driver's .probe() method is called.  If the actual probe fails later
> > > > > (real failure, not -EPROBE_DEFER), the device will still be on the
> > > > > deferred probe pending list, and it will be probed again when deferred
> > > > > probing kicks in, which is futile.
> > > > >
> > > > > Fix this by explicitly removing the device from the deferred probe
> > > > > pending list in case of probe failures.
> > > > >
> > > > > Fixes: e590474768f1cc04 ("driver core: Set fw_devlink=on by default")
> > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > >
> > > > Good catch:
> > > >
> > > > Reviewed-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > >
> > > The issue is real and needs to be fixed. But I'm confused how this can
> > > happen. We won't even enter really_probe() if the driver isn't ready.
> > > We also won't get to run the driver's .probe() if the suppliers aren't
> > > ready. So how does the device get added to the deferred probe list
> > > before the driver is ready? Is this due to device_links_driver_bound()
> > > on the supplier?
> > >
> > > Can you give a more detailed step by step on the case you are hitting?
> >
> > The device is added to the list due to device_links_driver_bound()
> > calling driver_deferred_probe_add() on all consumer devices.
>
> Thanks for the explanation. Maybe add more details like this to the
> commit text or in the code?
>
> For the code:
> Reviewed-by: Saravana Kanna <saravanak@google.com>

Ugh... I just realized that I might have to give this a Nak because of
bad locking in deferred_probe_work_func(). The unlock/lock inside the
loop is a terrible hack. If we add this patch, we can end up modifying
a linked list while it's being traversed and cause a crash or busy
loop (you'll accidentally end up on an "empty list"). I ran into a
similar issue during one of my unrelated refactors.

-Saravana

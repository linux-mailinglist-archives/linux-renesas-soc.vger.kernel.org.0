Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91B70436E74
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Oct 2021 01:43:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231992AbhJUXp2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Oct 2021 19:45:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231614AbhJUXp2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Oct 2021 19:45:28 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92C98C061348
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Oct 2021 16:43:11 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id v7so3151527ybq.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Oct 2021 16:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iItbf96vJqUXBAPNWl/S+u6NWGXbFnqP3nMjz13MqBo=;
        b=TFl4VR+n/Tz2N//3hY0nsO9nfx6KQXwngK5dVh8zYiQrFuwtAtD1xgWfiNqrn4Shvw
         1JUxPOVPbUcuwvhE1OI3HYqKqDLWxoQ1WSOGRdSJw1F8LhaxoEnmEA+oqoS/AmHvrH6z
         UNtKwsU9qRjI38BVq4xkPUsYU/9KeW+o0BzqdsD8AQjEsK8O3Q2ywuMzIV1hvf2knjMr
         V8uyr6rzS0w+sPLRG7eZhp3iBxqsIoVIi/FKzGhcpn9YgjJwPZbRNb3qsN7A3rgwBUnw
         cIaAwWRZZyQIjjsE4+HrK93XFrVxGV0Jog7RENlVKKDwUQGYLm7/Ii/LdwTFhq4eO2X6
         H7zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iItbf96vJqUXBAPNWl/S+u6NWGXbFnqP3nMjz13MqBo=;
        b=oGkY7n70iTNtvOgbeTtvxtoApe8s94FiDNwXIQgw7Rqjw8e1vor7xFJSFHYk5htnYq
         zwk+QQxXr8Yoh+HL/gSyYMEsB7kgNtJbZvEXFZc+/7e3XLKN8Ch1y7HNd8HZh0a1B0Yq
         JEOLsrRx0LOwmdX7+9vl35SzLM/gS4yXcJJ4zqCFZiUpnnB2/imNruF/2HFLDUWWZop3
         ezZbUTPimaRI4DfrDKHeTKnbuXd1JjM+u/+Er2WNC1mK1Zql4ozB9KBEgXSc6jCMdSh1
         0ww22nkLrXIkK9ngiLyVW3ODEhaUHH4TKzruQyldDwgFygZuw0WdMmMK/1oS5VO+UImY
         n7Lg==
X-Gm-Message-State: AOAM5337B5bT5C4+UsN/mYyQXvnzXOXByMg7uRmqfYXrDndizXoC7NWO
        bM0qWaDxKD+8EXBq5umNE+jXSbgvYX0XaFwOtfI0oA==
X-Google-Smtp-Source: ABdhPJzJ2cbj29jDZQ6TyMNq0vcXWUvo5fXcSmk7cGTR2WSWJkF3T2lRwKoKyVFtQHaqRmOMZh+qPbZkggFCxWwOuBw=
X-Received: by 2002:a25:c696:: with SMTP id k144mr8911382ybf.296.1634859790611;
 Thu, 21 Oct 2021 16:43:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210929000735.585237-1-saravanak@google.com> <20210929000735.585237-3-saravanak@google.com>
 <CAMi1Hd0HvPOT277mx8hNTU9NQH2ti7h5qc5+rxOkRWwbfrhyQQ@mail.gmail.com>
In-Reply-To: <CAMi1Hd0HvPOT277mx8hNTU9NQH2ti7h5qc5+rxOkRWwbfrhyQQ@mail.gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Thu, 21 Oct 2021 16:42:34 -0700
Message-ID: <CAGETcx_YZOd05Gg53ZR8mfVhFUzwQWo4MrrWF8JHF_DCwEtunw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] drivers: bus: Delete CONFIG_SIMPLE_PM_BUS
To:     Amit Pundir <amit.pundir@linaro.org>
Cc:     Russell King <linux@armlinux.org.uk>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        linux-arm-kernel@lists.infradead.org,
        lkml <linux-kernel@vger.kernel.org>, linux-oxnas@groups.io,
        linux-renesas-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        John Stultz <john.stultz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Oct 21, 2021 at 4:21 AM Amit Pundir <amit.pundir@linaro.org> wrote:
>
> Hi Saravana,
>
> This patch broke v5.15-rc6 on RB5 (sm8250 | qcom/qrb5165-rb5.dts).
> I can't boot past this point https://www.irccloud.com/pastebin/raw/Nv6ZwHmW.

Amit top posting? How did that happen? :)

The fact you are seeing this issue is super strange though. The driver
literally does nothing other than allowing some sync_state() callbacks
to happen. I also grepped for the occurence of "simple-bus" in
arch/arm64/boot/dts/qcom/ and the only instance for 8250 is for the
soc node.

The only thing I can think of is that without my patch some
sync_state() callbacks weren't getting called and maybe it was masking
some other issue.

Can you try to boot with this log (see log patch below) and see if the
device hangs right after a sync_state() callback? Also, looking at the
different sync_state() implementations in upstream, I'm guessing one
of the devices isn't voting for interconnect bandwidth when it should
have.

Another thing you could do is boot without the simple-bus changes and
then look for all instances of "state_synced" in /sys/devices and then
see if any of them has the value "0" after boot up is complete.

-Saravana

-- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1099,6 +1099,7 @@ static void device_links_flush_sync_list(struct
list_head *list,
                if (dev != dont_lock_dev)
                        device_lock(dev);

+               dev_info(dev, "Calling sync_state()\n");
                if (dev->bus->sync_state)
                        dev->bus->sync_state(dev);
                else if (dev->driver && dev->driver->sync_state)

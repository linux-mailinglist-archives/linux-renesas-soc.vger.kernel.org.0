Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 202E32FA7C2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Jan 2021 18:43:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407226AbhARRkf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 Jan 2021 12:40:35 -0500
Received: from mail-ot1-f48.google.com ([209.85.210.48]:46495 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407199AbhARRkJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Jan 2021 12:40:09 -0500
Received: by mail-ot1-f48.google.com with SMTP id w3so17005010otp.13;
        Mon, 18 Jan 2021 09:39:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TBu9By/8VRPgsqkSVXbZt+m8ccctd/56lGbUNRtH3tI=;
        b=J6pVmnYr9M37tfcBZLsOeNhXDxnQvYM0uAe+L9wWWr1uPxHUxPamXdPt9mqi0YjUcx
         Aq+ypNJp7aJtZ3vZoDw7+B4ek2OCKwUhfHZ9KOZ6c77tsdOzyBoP6oZOZ142qlZE6HmU
         lkgEBB58SadOuB4qxNfnYOwk5QZ02npy1lE3Z1eI/3i1M+Kl8AUp3Wq95cOj3w4LJsUr
         le4ClMM/GZgJno7xGvEj18ZsrHl5LbYXVbpVfMoxtBc2/Clp9d3Bna4NerZCe0JRSZGc
         +p//I5gEB+9MwZL6fl82USiL8Y1QStZTuEKgBfClzz9osWsHOLVB6jjTb7IRvw8nnILA
         Yjrg==
X-Gm-Message-State: AOAM530ASu9aqiR1226g/abQME1rfL1wIj67HuEJR6/j3uce6Z7ZWM+E
        bU3QEaZt46jtkF2MPK3u11N9jDXEKFRNsS+eMB8=
X-Google-Smtp-Source: ABdhPJxUhvwAbVRYw3irl60YU62M+0M0hOssaiRs12vpO3+6daUkruZv7J346RSH/KO6+zjS42brpnTnh56DPMc/u8Q=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr458499otc.145.1610991561344;
 Mon, 18 Jan 2021 09:39:21 -0800 (PST)
MIME-Version: 1.0
References: <20201218031703.3053753-1-saravanak@google.com> <20201218031703.3053753-6-saravanak@google.com>
In-Reply-To: <20201218031703.3053753-6-saravanak@google.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 18 Jan 2021 18:39:10 +0100
Message-ID: <CAMuHMdWDAg6+utMDLunPXmVtnP+13G2s0E-Fcnkc9bkNBs-cEg@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] driver core: Set fw_devlink=on by default
To:     Saravana Kannan <saravanak@google.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Kevin Hilman <khilman@baylibre.com>,
        John Stultz <john.stultz@linaro.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Marc Zyngier <maz@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Saravana,

On Fri, Dec 18, 2020 at 4:34 AM Saravana Kannan <saravanak@google.com> wrote:
> Cyclic dependencies in some firmware was one of the last remaining
> reasons fw_devlink=on couldn't be set by default. Now that cyclic
> dependencies don't block probing, set fw_devlink=on by default.
>
> Setting fw_devlink=on by default brings a bunch of benefits (currently,
> only for systems with device tree firmware):
> * Significantly cuts down deferred probes.
> * Device probe is effectively attempted in graph order.
> * Makes it much easier to load drivers as modules without having to
>   worry about functional dependencies between modules (depmod is still
>   needed for symbol dependencies).
>
> If this patch prevents some devices from probing, it's very likely due
> to the system having one or more device drivers that "probe"/set up a
> device (DT node with compatible property) without creating a struct
> device for it.  If we hit such cases, the device drivers need to be
> fixed so that they populate struct devices and probe them like normal
> device drivers so that the driver core is aware of the devices and their
> status. See [1] for an example of such a case.
>
> [1] - https://lore.kernel.org/lkml/CAGETcx9PiX==mLxB9PO8Myyk6u2vhPVwTMsA5NkD-ywH5xhusw@mail.gmail.com/
> Signed-off-by: Saravana Kannan <saravanak@google.com>

Shimoda-san reported that next-20210111 and later fail to boot
on Renesas R-Car Gen3 platforms. No output is seen, unless earlycon
is enabled.

I have bisected this to commit e590474768f1cc04 ("driver core: Set
fw_devlink=on by default").

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

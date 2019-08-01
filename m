Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9F197D7E3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Aug 2019 10:41:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730905AbfHAIlX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Aug 2019 04:41:23 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:46629 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730313AbfHAIlX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Aug 2019 04:41:23 -0400
Received: by mail-lj1-f194.google.com with SMTP id v24so68656674ljg.13
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Aug 2019 01:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+4DBMF2Zte9lbb8+gtbY6RWDlcSP8w6E9Z0ywxOOvw4=;
        b=YAXRWo8X6F6wz5PKvmW08QL99wEuNQNPC5fMWRNuSkxkey+SRqTz9XGN9NJGP9eqYa
         Q0tF6b9ViA3a5SI3rST4Ne8tyz/WLlCbLKkL5wiimdTe9b+DeXm/7MeRNV65yOKZwcVs
         jUika+QzRTGYMdg8tGJ4oRQmSWd7MRITrJMcjb97yPHoSwKEP48fU32H/asZVahdnK95
         ClDMx1P/8TFgXbIC3P0k4UHKa8gQNXcDCLxQxGYd+HQg10ROWqJmC4WTV0vmXCAV6fMX
         sCUWduO8Raz+EY5MiehROp2QugR+GmK/OY2fxXJ+DmHk4a0nsQy3OgUgj2DWbaAkVSEz
         tbJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+4DBMF2Zte9lbb8+gtbY6RWDlcSP8w6E9Z0ywxOOvw4=;
        b=s7v1zY66joxMx3iZ4rrdThFiqvPe8xzjeixhcRzZm410urDIOrY7o47IHdG93Nv/+Z
         cRYky7/uMb8HIwr0EgNg2E45WFubbrDRdfcDFgyBruyZ9zBx5EChQ5wGzJRcrpHlVdnF
         Rab+rl64B7Bf3g8Vslj1+lBhn3mXBxvnRD/azbTVFoe/XdVTMJUWac2M5TNv4aLipW69
         77Sn+rpfi8WyiAucVQ4+h+yRxxQtnlUcLyG3jMW2SjZs+orJcVuZ31ErbyQW/YF4Sz1X
         mrZ91Cm3WlcQmDxgbmnG60k9jNfkJWQNwF5JDi6k8doSJlDuQ/kjOE+qF5lv49CkbgXd
         O69A==
X-Gm-Message-State: APjAAAX4jg9ah4ohH2bYXeejmj1FOQbeffwGRaQDHJgq+gY1+jqMR5Xh
        engbp7zDgRKBhj96AWtZZpZb9d9Ygs7bgw6cVUIoUA==
X-Google-Smtp-Source: APXvYqxHEo1NnEuEea/EVgMvvV8QMVqO2H6dE9nSCXlcgxLIpX1H4/F1RTRXNMP6rHMR7tplWY1KPvxie4hjSNzYZAo=
X-Received: by 2002:a2e:8756:: with SMTP id q22mr68107000ljj.108.1564648881037;
 Thu, 01 Aug 2019 01:41:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190705160536.12047-1-geert+renesas@glider.be>
In-Reply-To: <20190705160536.12047-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 1 Aug 2019 10:41:09 +0200
Message-ID: <CACRpkdY6qAUkQW4YHN9HskvZS2P-viWYTHSb28ECh1p+itU=4Q@mail.gmail.com>
Subject: Re: [PATCH RFC] gpio: Add Virtual Aggregator GPIO Driver
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Marc Zyngier <marc.zyngier@arm.com>, christoffer.dall@arm.com
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexander Graf <agraf@suse.de>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert!

Thanks for this very interesting patch!

On Fri, Jul 5, 2019 at 6:05 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> GPIO controllers are exported to userspace using /dev/gpiochip*
> character devices.  Access control to these devices is provided by
> standard UNIX file system permissions, on an all-or-nothing basis:
> either a GPIO controller is accessible for a user, or it is not.
> Currently no mechanism exists to control access to individual GPIOs.

Yes, I did that decision deliberately, as the chip is one device
and the base system control is usually on a per-device granularity.
At one point some people were asking for individual GPIO line
permissions in the character device and my argument was something
like why can't I have individual control over the access rights on a block
device or the pixels on a graphics device then.

Jokes aside, filesystems do provide access control over individual
blocks on a block device in a way. So it is further up the stack.

The same goes for this: something above the GPIO chip provide
more granular access control, and as such it fits the need very well.

> Hence add a virtual GPIO driver to aggregate existing GPIOs (up to 32),
> and expose them as a new gpiochip.  This is useful for implementing
> access control, and assigning a set of GPIOs to a specific user.
> Furthermore, it would simplify and harden exporting GPIOs to a virtual
> machine, as the VM can just grab the full virtual GPIO controller, and
> no longer needs to care about which GPIOs to grab and which not,
> reducing the attack surface.

Excellent approach.

I would even go so far as to call it "gpio-virtualization" or
"gpio-virtualized" rather than "gpio-virtual" so it is clear what the
intended usecase is. We have a bit of confusion in the kernel
because people misuse the word "virtual" left and right, like for
"virtual IRQ number" (Linux IRQ numbers) which are just some
random number space, but not really "virtual", it's a semantic
disease similar to the confusion of using the word "manual" in
computer code.

Here it is however used correctly! (Maybe for the first time.)

> Virtual GPIO controllers are instantiated by writing to the "new_device"
> attribute file in sysfs:
>
>     $ echo "<gpiochipA> <gpioA1> [<gpioA2> ...]"
>            "[, <gpiochipB> <gpioB1> [<gpioB2> ...]] ...]"
>             > /sys/bus/platform/drivers/gpio-virt-agg/new_device
>
> Likewise, virtual GPIO controllers can be destroyed after use:
>
>     $ echo gpio-virt-agg.<N> \
>             > /sys/bus/platform/drivers/gpio-virt-agg/delete_device

I suppose this is the right way to use sysfs.

I would check with some virtualization people (paged Marc Zyngier
and Christoffer Dall) so they can say whether this is the way any
virtual machine wants to populate its local GPIO chip for
use with a certain machine.

If QEMU can deal in a simple and straight-forward way with this
I see it quickly becoming a very useful tool for industrial automation
where you want to run each control system in isolation and just
respawn the virtual machine if something goes wrong.

Since this might be very popular we need some scrutiny but the
concept as a whole is very appetizing!

Yours,
Linus Walleij

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0518D11D00D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2019 15:42:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729404AbfLLOmP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Dec 2019 09:42:15 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:43144 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729273AbfLLOmP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Dec 2019 09:42:15 -0500
Received: by mail-lf1-f68.google.com with SMTP id 9so1874216lfq.10
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Dec 2019 06:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tZEozXho8/b7kOqmVnapq/xyhPGY85u/Fazs9Eblm1E=;
        b=cCFmmoTXOmDLfgP+nSgeOYumVAZUrCnARZzWT6kYYgCKF1bePY08qH25uoDIaIHIIP
         xy8kMJ6JQ2UyEvDyewbvtPrrH9UtNKJVImB4NokJIoH/R67zMUh04sKFC2b9DZZNNYUs
         aUGcMes7TUb5SFaiVdEGG5DyRqBgacd0FAD4lAf+ICRsdMe3e2j3QZ8mi0budLFypHnU
         Q9CAtFfX69QmpkYitVwIFJ08foJUmu7rOTj1ckh5yeQ90ov1O2obpxX2rMKf54BvokNm
         ude9UZXPiRBYKsQ2CDcY3DczzV6WI8NM6/9D9PHWpM76xo1IPmfR6iBERCj82PcqPI0L
         ppSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tZEozXho8/b7kOqmVnapq/xyhPGY85u/Fazs9Eblm1E=;
        b=dUKH7BH3Sn4//5EqOh32wqtcTvr4lSLWfnob38AegkV9FtGGJvqP3/Fn4iFTy6l04L
         kbHimVMnMj4wFnTuil3pWFN3lhRK7p75/JKVUrdb7kh3uNj54HrhF/P0yaDc7ffBKt7H
         4pGtVjZjmAQ5oEm00luuYm8F0JE9+ZzyJpq4Zlzs7apNnkdxP5gx1gaL0/pFZ0VbM6yD
         uKgnSGhTdHfc+C4HEdAEMyogDVWbrksBzrOA87EiWdT+tyEXTNHEsQqFJ9ve6FaLIs9v
         qNYIlgxZJ6TkynyPD01fh8hggauuoSVDFxeQUg6lhZSK37850scnOeR7hybFr8uOq3N1
         Qw2w==
X-Gm-Message-State: APjAAAV/2+2rD/BCmIF7elQdCbXGCPXn/cv/ewfgjVgrp5cDX0d18kcZ
        boQF2oe3P3lDoXKF/+SxUUGKkr2SrqOpg0WbkL2Hiw==
X-Google-Smtp-Source: APXvYqzNd5E12+tK1syFHjNwCOV5eMNSPBpGptit7BvfAlgSkslbOpdSmdz3b8GlBGkJlIqKTDmvgy11rgnCB3iAN8w=
X-Received: by 2002:ac2:4945:: with SMTP id o5mr5702467lfi.93.1576161732769;
 Thu, 12 Dec 2019 06:42:12 -0800 (PST)
MIME-Version: 1.0
References: <20191127084253.16356-1-geert+renesas@glider.be> <20191127084253.16356-7-geert+renesas@glider.be>
In-Reply-To: <20191127084253.16356-7-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Dec 2019 15:42:01 +0100
Message-ID: <CACRpkdb1XZAeSThxWmJtnm80T4aPufXV2UvJdVdgnw-TJe3trg@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] docs: gpio: Add GPIO Aggregator/Repeater documentation
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Nov 27, 2019 at 9:43 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> +The GPIO Aggregator allows access control for individual GPIOs, by aggregating
> +them into a new gpio_chip, which can be assigned to a group or user using
> +standard UNIX file ownership and permissions.  Furthermore, this simplifies and
> +hardens exporting GPIOs to a virtual machine, as the VM can just grab the full
> +GPIO controller, and no longer needs to care about which GPIOs to grab and
> +which not, reducing the attack surface.
> +
> +Aggregated GPIO controllers are instantiated and destroyed by writing to
> +write-only attribute files in sysfs.

I suppose virtual machines will have a lengthy config file where
they specify which GPIO lines to pick and use for their GPIO
aggregator, and that will all be fine, the VM starts and the aggregator
is there and we can start executing.

I would perhaps point out a weakness as with all sysfs and with the current
gpio sysfs: if a process creates an aggregator device, and then that
process crashes, what happens when you try to restart the process and
run e.g. your VM again?

Time for a hard reboot? Or should we add some design guidelines for
these machines so that they can cleanly tear down aggregators
previously created by the crashed VM?

Yours,
Linus Walleij

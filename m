Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DEE01949C3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2020 22:08:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727352AbgCZVIF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Mar 2020 17:08:05 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43242 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727444AbgCZVIF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Mar 2020 17:08:05 -0400
Received: by mail-lj1-f193.google.com with SMTP id g27so7957731ljn.10
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2020 14:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qAyBvgO4bOnc2gaynrGXEwwg2q9+bev/7Krv5slmOVU=;
        b=qAM3YCcZs+npTx9BPPePlvKxpXslhpkUmEgugnm4zAlkgCuERkzo5/Ny5AqJKWuNI0
         ee9NxL1Vene0EIe9MIIcEKVSNl3ELO9DzQV1v6OPZG/ymJS0GzpS5HpxEvajOFYGjLg/
         8hTPoBBa+SZXYZv6GDDVEZOCIWiZqN1g2fSUO5WXwcWQv99jmowC0bv5jm8HQyAY9R0W
         WdBbuyvVCJZ2oMFZsQJAT+IreTv93hXErVplWvMb+uKMkrZFThR29bTqy3mIrEYIHPb1
         cOi1OYNIA3oIG4m5I6aUIgAH2xkWc7L3IilysL0bNP6jOWASQMrsZRbeWVUn4aYTPotV
         ivYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qAyBvgO4bOnc2gaynrGXEwwg2q9+bev/7Krv5slmOVU=;
        b=s4wDd7R0Djs7fdLJQzJPO7k2ogokL4EfFpdTrgzN3k6GkaP2kySQqTd9fvWKrSL1JT
         IjmCsE7mr4yQ3pz5l0DkB+YOtAnxc2s62DHKf6POyQJPQHvApCQhzO5zB7CP3D1QC2sE
         n9Trfp89AIw/5U/44r8a5FDZcew4kmKm8g4slP+U3NbZXtcGALVYMvSHZi2VujbUD4V1
         AZQW1s1g7uwac1ZjhbdHwoTL6ZOOMRmPUjvAJUVaxXvSeiRmJzbshXBtAynYKpxlC5g9
         EZa/Hv/XF1yZL8wisZifM1XEJoAgdusz52ZfdPhv9HZJYbumUR21Mzl8M3SwRxKOtgSR
         WyxA==
X-Gm-Message-State: AGi0PuaW8mZ58kc8rDv7EUROJFmp8JR9JhhAS5d0B/XFvswjS2F6bfXy
        QNIAm4gO+dolHhaZp9uABdAbmWj9vly1be8I2MdBxQ==
X-Google-Smtp-Source: APiQypKkTPp+fGz1ypK0j7lnjDyL1kGteAfWqjf8dTuHziw1bMtpKGCBe6kauaYbNGvlyl7GaC+Y5sCmhx3hwF0rDz8=
X-Received: by 2002:a05:651c:28a:: with SMTP id b10mr3830382ljo.223.1585256882978;
 Thu, 26 Mar 2020 14:08:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200324135328.5796-1-geert+renesas@glider.be> <20200324135653.6676-1-geert+renesas@glider.be>
In-Reply-To: <20200324135653.6676-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 26 Mar 2020 22:07:51 +0100
Message-ID: <CACRpkdb=AVvyo6EOigKv+t5L4U=VjJ-16_ERimDvVWuCiU4Mxg@mail.gmail.com>
Subject: Re: [PATCH v6 1/8] ARM: integrator: impd1: Use GPIO_LOOKUP() helper macro
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Mar 24, 2020 at 2:57 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> impd1_probe() fills in the GPIO lookup table by manually populating an
> array of gpiod_lookup structures.  Use the existing GPIO_LOOKUP() helper
> macro instead, to relax a dependency on the gpiod_lookup structure's
> member names.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: linux-arm-kernel@lists.infradead.org
> ---
> While this patch is a dependency for "[PATCH v6 4/8] gpiolib: Add
> support for GPIO lookup by line name", it can be applied independently.
> But an Acked-by would be nice, too.

I simply applied this patch for v5.7 in the GPIO tree since I am the
maintainer of this platform, and I might want to change stuff around
Integrator next cycle so it's good to have this covered.

Yours,
Linus Walleij

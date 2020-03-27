Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84D1C196086
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2020 22:37:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727585AbgC0Vhg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Mar 2020 17:37:36 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:42031 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727593AbgC0Vhf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Mar 2020 17:37:35 -0400
Received: by mail-lf1-f66.google.com with SMTP id t21so9080936lfe.9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Mar 2020 14:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/6P/ugUG8QPN1PLqi6CLq7SxjX8NFnDCuavJA3Wde1E=;
        b=lahDEBVq+V7MEitEv24mEfdDx+ECSXtHN+KA62Gf5ItiJ1T+tDT8IWT4Oy22V9BsXC
         6JaUyn62gDbbeAweC22pKUYqIidnovzsnM7DZS/3dAC/3/rSk5L52uSrG8+ZEpNokRoF
         DAcc3GvLOC/ssSMB8MQ5gqL2f74Gp6tRux0EURwEZRovg6fD33++EMNMJHG8TpO81M7J
         Mt83QcXquqLJVR9ORbRpZm1ECFmS406DJdA7rkOGaLuwywkPfYQtd7G56RMATPaHmnNG
         GJdQYRUgmxyx9hZzmpIXWlpouQK7AOtyGExNg/CAyJqJkZU/svLfvM9MdHzKmMqw3M9X
         2vUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/6P/ugUG8QPN1PLqi6CLq7SxjX8NFnDCuavJA3Wde1E=;
        b=hrtUP2qJavgbzTSPT2lqEcG4jJYSXuCSRzwQ+AllqN2xSexHUeazPzqYp2fl117PqD
         1ilF32jVUsn/77ZWfNQBqy/w4mwGrUzqemoUgzuL6XLJlSoAmS8XKrojXu98gmdfZJgo
         ccYgHoUxxvFsm6ZUXHROTE67IMPx42x3rIHlwW9ZJa7c5nOiVxApIU7wKBYOHTXcB1Pr
         Dbt1UQBpGzm5OI+VN58ofRa3NbA7tqPbwdW6p+ROtUgL4qlXETTS7uSdG6YeYs3dx83s
         gZKi2LOsASfC6Sz8mUwEIZv4Twm1YPFtlNzKgaY7TyiQaLCPGMfacWyTg1au4JF296Ck
         TJbQ==
X-Gm-Message-State: AGi0Puavyt9GKh8RC4pezWvp+kwOAhIcJYyLuC2icADjV2sZsru0+z3g
        85/Ph4Mw4v1EoXDT8ZYMT00K9u6W0WsLRt560NGrLg==
X-Google-Smtp-Source: APiQypLBRjm8m9TRh5E1Wf02gWdM2GuN6ua450wAQk3DBPj55sqZgue9A3EKHJXEe1wTh5T/OQvRR8bY8YYI7pRonwA=
X-Received: by 2002:a05:6512:6c4:: with SMTP id u4mr806577lff.89.1585345054013;
 Fri, 27 Mar 2020 14:37:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200324135328.5796-1-geert+renesas@glider.be>
 <20200324135653.6676-1-geert+renesas@glider.be> <20200324135653.6676-5-geert+renesas@glider.be>
In-Reply-To: <20200324135653.6676-5-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Mar 2020 22:37:22 +0100
Message-ID: <CACRpkda8Uc7fDbV8EsG+EpDGw35-k+9-U7njhaaQVvhY5rwmcg@mail.gmail.com>
Subject: Re: [PATCH v6 5/8] gpiolib: Introduce gpiod_set_config()
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
        QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Mar 24, 2020 at 2:57 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The GPIO Aggregator will need a method to forward a .set_config() call
> to its parent gpiochip.  This requires obtaining the gpio_chip and
> offset for a given gpio_desc.  While gpiod_to_chip() is public,
> gpio_chip_hwgpio() is not, so there is currently no method to obtain the
> needed GPIO offset parameter.
>
> Hence introduce a public gpiod_set_config() helper, which invokes the
> .set_config() callback through a gpio_desc pointer, like is done for
> most other gpio_chip callbacks.
>
> Rewrite the existing gpiod_set_debounce() helper as a wrapper around
> gpiod_set_config(), to avoid duplication.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v6:
>   - New.

Patch applied in preparation for the next kernel cycle
so we get Geert's patch stack down.

Yours,
Linus Walleij

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D92DB194A7F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2020 22:26:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbgCZV0o (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Mar 2020 17:26:44 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:32903 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726260AbgCZV0n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Mar 2020 17:26:43 -0400
Received: by mail-lj1-f193.google.com with SMTP id f20so8093721ljm.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2020 14:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K6HhQ5CXYnVrjzdCb0GiH9KRJ8oDBIqHlDAtHtGoEj0=;
        b=R1ZbV8ZHF2uNrvQMw6yLPcZXYX/L1Bi1ZDegFPmpGCQZQxDo4xJstG1+5lxSGccQjM
         DtHC3HQ/jx2YMTytcd6ultwEU/i0RlVnZivmFm9vimqHtelawlsMju+sVKJ7lHhUFclt
         CAT0JwPBKGwAs7QH0zYIR8ngkUu1HqQt+JNM8LA/bSlIAM7ldYL3U3TWwGQQsnl/Hel9
         6kj0OiO6KeusAjhbIL7po4EZAoa2QzUuNNDHmg7OdxCfj5w04nJlHikrm/4rjGHXVBbt
         BztQyx2aUzDzf8VaHiOVqUzXyYasFaATNZCxsfBVkbIyEnDecxq0KQKBEI2iK76fHmnY
         Nh5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K6HhQ5CXYnVrjzdCb0GiH9KRJ8oDBIqHlDAtHtGoEj0=;
        b=oBvjr3v6C4OjpIw7ML3ZHwxKavlKyMn0HcAa7UijqcZldlsRuwGFt7YQobNZnBC4CU
         SW1giXLJXJPy1vVxrmZeHlM+JQTxMSmfBcpiunkXLPjn2DcPixpZAO0VVegtKRQSs4jl
         snv00q6vATrA6SZtFAhiSTr20LLggLKsfJYpJ2m86P8Vo4JI/KI+h6IBVvPTF0RCF+48
         cBv91PIoJBnqyeliL2iuqMI3uZ2IpaAzbX8FnL38vieVHuLOeJ0dXSRWkFFt8tz/35cq
         r2pTNBsjyvtYan8sNbeeXCEMyXlljQeIC7ml8Ru2gRLDkkCubbppbksLIC/nAlok9cNH
         0bHw==
X-Gm-Message-State: AGi0PuZ+kUi1Qag/9+u347u32CdWVt0VdkbIqYyqL/uKTe3/92ygMT2u
        gvwZjI7KTcENTLWoTpJXbA/db79alPuodSAPI1YktA==
X-Google-Smtp-Source: APiQypLsy28BzQ4YoJJE2i0gYrneALBvsp4MxQ5uVCHUPAjFEGFTMqFCGi01B7eAtiikChneeDns42u4uM1vGmEAXuk=
X-Received: by 2002:a2e:9c48:: with SMTP id t8mr568502ljj.168.1585258002139;
 Thu, 26 Mar 2020 14:26:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200324135328.5796-1-geert+renesas@glider.be>
 <20200324135653.6676-1-geert+renesas@glider.be> <20200324135653.6676-5-geert+renesas@glider.be>
In-Reply-To: <20200324135653.6676-5-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 26 Mar 2020 22:26:30 +0100
Message-ID: <CACRpkdZuQrPqFPyoop9pv6MVwqwz_C6ZNKMxWqSFXdAMkhbsvQ@mail.gmail.com>
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

This is nice, I tried to actually just apply this (you also sent some
two cleanups that I tried to apply) byt Yue's cleanup patch
commit d18fddff061d2796525e6d4a958cb3d30aed8efd
"gpiolib: Remove duplicated function gpio_do_set_config()"
makes none of them apply :/

Yours,
Linus Walleij

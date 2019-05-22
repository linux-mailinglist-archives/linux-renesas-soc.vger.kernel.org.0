Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64DF625EA2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 May 2019 09:21:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728610AbfEVHVw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 May 2019 03:21:52 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:33664 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728424AbfEVHVw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 May 2019 03:21:52 -0400
Received: by mail-vs1-f68.google.com with SMTP id y6so816043vsb.0;
        Wed, 22 May 2019 00:21:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X+htciVyJCEETZZh8S6dmdJOka2sEukH39ojlwyB7Oo=;
        b=s1Ssr5L4oTKzRpfy3s09mZYfbx7sHO7zHEg4ARpRd/LxRUnX76mlQ4U9oTdXEMXMzM
         cOIDD9CpHI3eUjeYVW5P49g9DDeh/0qJlruVN5Z+xa6gslLR8uiYMC4Gl9b5sSrKKbHA
         xk+K9ubfr8csNavcSA6xrDILDA4+TYMxISyvLpa3++LDzCvgU1ePDk2hU6OouqcckiTL
         NTMsPwZs05ztjaJSX4EH1YBgNMPzq40Oeg4YzZT/klA+o5QEhrtXdghJsgdNnLDmJftW
         A54AokdZfNhXiPw+zSJFPYeskVI3GgQG5c1+KwH2A0Xy2ZeuC8zSyj+mrlRwR963ToRw
         nF5Q==
X-Gm-Message-State: APjAAAWnB+EQcrp3SDCcj5ssyo2KSGDwfoop0qMmbQC5KwSME7N3EDrF
        TEHLDlF3wP0KLRMNyMsxEJ3eT+cn7flSZWLqvZU=
X-Google-Smtp-Source: APXvYqyQWgSr/qxroftXFiBMDk9QtVTkDfbjkkGC0tsQ+POzeNBI2O6cxaSDGVpEMoedTLvddEa+4B3wqd+csUnkUxA=
X-Received: by 2002:a67:f303:: with SMTP id p3mr31460348vsf.166.1558509710862;
 Wed, 22 May 2019 00:21:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190521183417.GA121164@gmail.com> <20190521184622.37202-1-ebiggers@kernel.org>
In-Reply-To: <20190521184622.37202-1-ebiggers@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 22 May 2019 09:21:38 +0200
Message-ID: <CAMuHMdVgryYRq7XJ6a_80DNO3fuO363tC_1Tdonr2GcTFO1fUw@mail.gmail.com>
Subject: Re: [PATCH] crypto: jitterentropy - change back to module_init()
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, May 21, 2019 at 8:46 PM Eric Biggers <ebiggers@kernel.org> wrote:
> From: Eric Biggers <ebiggers@google.com>
>
> "jitterentropy_rng" doesn't have any other implementations, nor is it
> tested by the crypto self-tests.  So it was unnecessary to change it to
> subsys_initcall.  Also it depends on the main clocksource being
> initialized, which may happen after subsys_initcall, causing this error:
>
>     jitterentropy: Initialization failed with host not compliant with requirements: 2
>
> Change it back to module_init().
>
> Fixes: c4741b230597 ("crypto: run initcalls for generic implementations earlier")
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

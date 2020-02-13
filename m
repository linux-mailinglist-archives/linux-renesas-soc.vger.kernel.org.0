Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE5A915BA40
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Feb 2020 08:47:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729735AbgBMHru (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Feb 2020 02:47:50 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:36299 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729706AbgBMHru (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Feb 2020 02:47:50 -0500
Received: by mail-oi1-f193.google.com with SMTP id c16so4872642oic.3;
        Wed, 12 Feb 2020 23:47:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eaXkOVitV4pzkv7pyZH2s/sZrsOAKamY9Cp3kewSSw8=;
        b=f0LjdD6F+SaN/Yv0dvWukgnvvkUhh83te3YNHnUpWCxAMGJVvf/7mSKEkXzbIYl413
         wq1CNxb4ALPRqpNDLKheMTqVV2J0yyi1HjxN0nJFgKViR9zbyiTOBmNJk74QUIwBuJ1P
         tLnckDSBkHze0MebSwLbsIIJqzp1kT6BQmOJrQ0YhBnAytu2j5Y/kjQokVZEcXhQd7qq
         1kLY4DbnajB9zYZgJtATX3xIe8ii7TO861XLaaDztA6UkXNLqFs5AuSTRkdl/OPvuMle
         Da8WmVQbZGpFZmGCj/2DzCY0IhIA7a/85TPO2eYYIx9KH35Sx3UFyAf8UdhFzmmeIW6j
         I3Wg==
X-Gm-Message-State: APjAAAV8+gxk4Mpky68ycdbVBXTsbXRlEe4avIrV1D5BRsGjytTa12vH
        jyQGVmq2rPTVzip9og6LGuALL+nKnb4X5ZhuDXM=
X-Google-Smtp-Source: APXvYqwjVAA0wKcVUuWbP5/5hWV14R7qSAjbxpogUjd0jTCJybva+Yfb49v1/wat2vBzHKdPCH8cW0npSV/Oaw0RhHA=
X-Received: by 2002:aca:1a06:: with SMTP id a6mr1965717oia.148.1581580069382;
 Wed, 12 Feb 2020 23:47:49 -0800 (PST)
MIME-Version: 1.0
References: <20200211181928.15178-1-geert+renesas@glider.be> <CAOtvUMfs84VXAecVNShoEg-CU6APjyiVTUBkogpFq_c3fbaX+Q@mail.gmail.com>
In-Reply-To: <CAOtvUMfs84VXAecVNShoEg-CU6APjyiVTUBkogpFq_c3fbaX+Q@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 13 Feb 2020 08:47:38 +0100
Message-ID: <CAMuHMdXfB9R-1Lwm6Jva6+NPrBJnV7bgHdygbxoqyzikqgqqgQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/34] crypto: ccree - miscellaneous fixes and improvements
To:     Gilad Ben-Yossef <gilad@benyossef.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Gilad,

On Thu, Feb 13, 2020 at 7:46 AM Gilad Ben-Yossef <gilad@benyossef.com> wrote:
> On Tuesday, February 11, 2020, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
>> This series contains several fixes, cleanups, and other improvements for
>> the ARM TrustZone CryptoCell driver.
>
>  Thank you so much for doing this Geert.
>
> The whole series looks wonderful. It does not only makes the driver better, it has made me a better programmer - I'm not ashamed to say I've learned some new things about the kernel API  from this series...
>
> I am currently out of the office until mid next week and away from my testing lab.
>
> I'd like to delay formal ACK until I return and run a regression test suite using some of the newer revisions of the hardware which the driver also support, just in case, although I don't forsee any issues. I hope that is ok.

Should be OK, we're only at rc1.
I'm looking forward to the test results on newer hardware revision/
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EFC514C7FC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2020 10:25:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726068AbgA2JZV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Jan 2020 04:25:21 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:46017 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbgA2JZV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Jan 2020 04:25:21 -0500
Received: by mail-oi1-f195.google.com with SMTP id v19so3412340oic.12;
        Wed, 29 Jan 2020 01:25:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oUhjMl/AlmJ59wYzrcHaZFBOUtqm+JrPDdjn+L5sDCE=;
        b=WwbQ5PMnxDs/zds7hXIqFNmiO4owL7qkG96NDylXzaUTBv/o1otCbSutaorMVGRIYF
         hK3iJd5Ot5G6NslSjZYDqhgoyv7WY41N32hrmOx1F/r/pzmobrVNnmA5/lcqqEWm21rL
         zd5fJTlfdrF8D4Q3djNsDCk0p4Jfu6MXIg08+hecOWUfBF/wkz5d90KjgvzzANhEtPKD
         9j7WXvUFTFQ1sukRgcmhdwFy8ndGntZ39ApZIwxObYFgujXLYLt7fiqhrgtMtTEtnnjh
         iRH5Kb/i3qKktNVq9GZf2Zf1BHnet8Uug7JGzRdWF8vS9f1SK9g6ppWSp56Tkhcwgu6o
         EXZQ==
X-Gm-Message-State: APjAAAXCRd9EFXDMj1ZS8b2ZHJn0cm2IsiOaVQMYpnUSYT+/X62Crz+d
        BLU5dpHuY0Odrex2Yb4IrXZLT/Mnogg/AK+yauJEfQ==
X-Google-Smtp-Source: APXvYqxNSUA0NN2VeORoT7Xl02kvoS2AlUoGauJn4GhKLN+jaEFM97hL+bVRis1AQOb8lYCrsdYDM9w6Ul09Olonyxs=
X-Received: by 2002:aca:1a06:: with SMTP id a6mr5573201oia.148.1580289920723;
 Wed, 29 Jan 2020 01:25:20 -0800 (PST)
MIME-Version: 1.0
References: <20200128190913.23086-1-geert+renesas@glider.be> <CAOtvUMfoND5iJi7p9YRb6C3To6FGTKGBSoD+cBhkHnLXSppKEw@mail.gmail.com>
In-Reply-To: <CAOtvUMfoND5iJi7p9YRb6C3To6FGTKGBSoD+cBhkHnLXSppKEw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 29 Jan 2020 10:25:09 +0100
Message-ID: <CAMuHMdXA3omJ+YRVMS6yfj8avsEo47DjpFPADBvQZuT+CfWMtA@mail.gmail.com>
Subject: Re: [PATCH] [RFC] crypto: ccree - fix retry handling in cc_send_sync_request()
To:     Gilad Ben-Yossef <gilad@benyossef.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux kernel mailing list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Gilad,

On Wed, Jan 29, 2020 at 10:11 AM Gilad Ben-Yossef <gilad@benyossef.com> wrote:
> On Tue, Jan 28, 2020 at 9:09 PM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > If cc_queues_status() indicates that the queue is full,
> > cc_send_sync_request() should loop and retry.
> >
> > However, cc_queues_status() returns either 0 (for success), or -ENOSPC
> > (for queue full), while cc_send_sync_request() checks for real errors by
> > comparing with -EAGAIN.  Hence -ENOSPC is always considered a real
> > error, and the code never retries the operation.
> >
> > Fix this by just removing the check, as cc_queues_status() never returns
> > any other error value than -ENOSPC.
>
> Thank you for spotting this!
>
> The error is simply checking for the wrong error value.
> We should be checking for -ENOSPC!
>
> What this does aims to do is wait for the hardware queue to free up if
> we were asked to queue a synchronous request and there was no room in
> the hardware queue.
> The cc_queue_status() function used to return -EAGAIN in this scenario
> and this was missed in the change.
>
> I'm curious as to how you found this - did you run into some problem
> and traced it to this?

I didn't run into a specific problem, but I'm working on cleaning up the driver
a bit.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

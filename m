Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2CCB1832BF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2020 15:21:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727538AbgCLOVr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Mar 2020 10:21:47 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43199 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727486AbgCLOVr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Mar 2020 10:21:47 -0400
Received: by mail-lj1-f193.google.com with SMTP id r7so6631375ljp.10
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Mar 2020 07:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=79OHKgNVg5IiTjP/EryhR/on7yjmd+OeOqFhBOB19Rg=;
        b=hlXc9bv7wKtJYos/CvmIf1aWytTx7tjjvZA7MyZXi7udPi5CdammboSrae1hgCitp/
         MSpq1qvYRN9mFEXkFN/xNTTmmao3V3GjlW0KxdQXRUqYqGp5IwObLZ7yB+renP8z+pfN
         tTWRkIMDIS1GZe95+PfMemVe3rr1Kwnkd636g3iGRWP+yiHdYGH7FrFNCkkgIeRsEdxg
         L1z1MSWPXkvi5ST+LYKisjEtlJI83foQzqkY8AUQk+nrdOaavjVDuTxl3sWpnDBKyxpA
         I+Y+/KkkggsGEGEO3b8x79C2+nvBFhV0SVSG0v4dMd8b9iZmSihZqNyIYhxl61ZhaL+L
         SMHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=79OHKgNVg5IiTjP/EryhR/on7yjmd+OeOqFhBOB19Rg=;
        b=a5xXcmV9Dpd7oHCJOFNnILDa0UjHlA7fewpmTlDNGlDjS4qlSKrws1yT4LzkZ1k54w
         4nj1glMGEjionqgo/93aLfEIX0XbXHS5RIWsTOQrl4Ri7W5PieENch9C6xUeSBwGx4JL
         T4UBG7ffwP14PpcK3b/svj7CP+uo157MwszxW8+XElM4DoacoBmxEHgc/56uhLWTszaA
         kFkHWB0h6UIfKtlj/8wKErJ0+WlbO9aUHAlAsPaaF5wK0L5M13lteKCBuoioQrJcQdLF
         GrNEhQHpaLhiBx5vWpmmL7uirIn1udxBp6XWxbG6Us8qXVPjDN88j2nYRWNx2mmXyjWp
         ZfWQ==
X-Gm-Message-State: ANhLgQ3tCTPRA4WlhnK4abbsEqi46iFTZqeBpZXsun3TEMdq/HjIQtwv
        V7V8z14Iyl0vs3uiIeuEwToqW1SWnYhriOxSis33gg==
X-Google-Smtp-Source: ADFU+vtcIZFKaUxv+zzMf8n7cOQduYtCadrIv8wfIOW4HDImubBu1ngGLVdiQB+7d6huEorOiDcjWc0JqvkBbK9RrNg=
X-Received: by 2002:a05:651c:2c1:: with SMTP id f1mr5239338ljo.125.1584022905409;
 Thu, 12 Mar 2020 07:21:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200218151812.7816-1-geert+renesas@glider.be> <20200218151812.7816-3-geert+renesas@glider.be>
In-Reply-To: <20200218151812.7816-3-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Mar 2020 15:21:34 +0100
Message-ID: <CACRpkda1JAnC=Feb39GeKEEP6q8Qwpsth6J+4OKj6A8S3YAUyQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] gpiolib: Add support for GPIO line table lookup
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

Hi Geert,

I'm sorry for the slow review, it's a large patch set and
takes some time to sit down and review, and see whether my
earlier comments have been addressed.

On Tue, Feb 18, 2020 at 4:18 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Currently GPIOs can only be referred to by GPIO controller and offset in
> GPIO lookup tables.
>
> Add support for looking them up by line name.
> Rename gpiod_lookup.chip_label to gpiod_lookup.key, to make it clear
> that this field can have two meanings, and update the kerneldoc and
> GPIO_LOOKUP*() macros.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
> Reviewed-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> Tested-by: Eugeniu Rosca <erosca@de.adit-jv.com>

I will try to understand why this change is necessary to implement
the gpio aggregator (probablt I will comment that on the other
patches like "aha now I see it" or so, but it would help a lot if the
commit message
would state the technical reason to why we need to do this change,
like what it is that you want to do and why you cannot do it without
this change.

Yours,
Linus Walleij

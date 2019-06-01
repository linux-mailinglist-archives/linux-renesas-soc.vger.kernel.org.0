Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 296DC32038
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  1 Jun 2019 19:48:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726211AbfFARsB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 1 Jun 2019 13:48:01 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42707 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726143AbfFARsB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 1 Jun 2019 13:48:01 -0400
Received: by mail-lj1-f195.google.com with SMTP id t28so1439353lje.9
        for <linux-renesas-soc@vger.kernel.org>; Sat, 01 Jun 2019 10:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nDFWOamDcwclWQ44b4W8wXrrwx4uqY/RgBjU1iNelu8=;
        b=ReIJPFAl33oDUp+o8LjcGF+2oUpFciOZZ26gu2yTUCnCDRM6QCWW5WXKnwx01MPzE7
         b4Y6sXxYUYwY2MZrOoKoKLxzRl9fMloY0B9P/RW04S288V3Jcfk+JxAvH4Uy0UlStfgj
         ZiZ49jxXdNX9Za4kixvZ8dmGH2sRJ2taxlKOXydasxLlO3tPdK4RQw1UhG3R1UZUKOX+
         Z9eTLYVKkENQ8GGUNKK147+xlstt3xQmvEQau8IeooieyaKhtSiL9yoUMXXyt+ilpKIX
         bU19lZelNxeKz+Oo0oGrEWZwl2VGZcJDsaVHJWnbwCZaaGsLPLsWst73Nb1ToWzb2enV
         9aNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nDFWOamDcwclWQ44b4W8wXrrwx4uqY/RgBjU1iNelu8=;
        b=Dd93d7c+fJryQumV90MZWohKdK6J72WgCKjkB7no+/h3dvILHzmDzgFtOyEp10xmQG
         KEOC2pJHsi3wpeMKU9CgyA++cPOi0dVngwqaQdaHl7R3Kt4FHV/pJO9NOUR4K8r2uBkw
         A25Be0IQNz0e5LC5AoO1grj9KeBTNusn+N5/FJWYbk0GrQsoDQ2gYDT4C7pyH3pX0BLn
         omncRvaz2dB6H7j9bFYmxNmgj86xqGURlGKWipRLVQfwkv/53hA2mLyHvjegIrqFbUu8
         ge2YGpjRuxzP1clwBlManiClHMok4MwmiGcWRinUoy74rRU+ABW+CdjeIaEf6+AyDtoC
         MeBQ==
X-Gm-Message-State: APjAAAUEHRXfGazNg1MEF3pnTfPB53yF9HoR0mbemQrfsburOiwK+HoC
        BYWV8tOmbmnLYIQZ09l2Qt0zqDPfzvFdvVh/nbm5SR9Z
X-Google-Smtp-Source: APXvYqy5OpP0IGZrGerI3GIBoPyhV7Km+3aotWslvdxyxcZf0Rb/AYL1m/dQfTtRm33uDghRZao7uhN5aYvLTK/5l3g=
X-Received: by 2002:a2e:5bdd:: with SMTP id m90mr310625lje.46.1559411279300;
 Sat, 01 Jun 2019 10:47:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190527124051.7615-1-geert+renesas@glider.be> <20190527124051.7615-2-geert+renesas@glider.be>
In-Reply-To: <20190527124051.7615-2-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 1 Jun 2019 19:47:48 +0200
Message-ID: <CACRpkdbLfKqs-kwS0NZgU2_k6H53u7B5cJ9VSoHvsxLQEtTdbQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: em: Remove error messages on out-of-memory conditions
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, May 27, 2019 at 2:40 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> There is no need to print error messages when memory allocations or
> related operations fail, as the core will take care of that.
>
> Change the returned error codes to -ENOMEM to match the failure cause
> while at it.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied.

Yours,
Linus Walleij

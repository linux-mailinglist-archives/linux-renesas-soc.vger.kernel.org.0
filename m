Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A194E2CA94
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2019 17:47:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726511AbfE1Prm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 May 2019 11:47:42 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:33710 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726313AbfE1Prm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 May 2019 11:47:42 -0400
Received: by mail-ot1-f68.google.com with SMTP id n18so977355otq.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 May 2019 08:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cpA6X30q1WwappNH8AvwqpCneggPzg+rTJDIacCPxPI=;
        b=M9tB4eZ4GxBhxNQzU1FOBJ/E9KxvDRpoItlOTGlwPFD6ot9vWqEgqgPNbCt2dNt8Fc
         uID3CxHyDqsRSinQ73RrJNpBf//pQUWFCFt7UHAXGtaMRB+nCiOFzRV8gHzoXl2NZie2
         +xf/2ylphafW5+uyyenJgXuDGd1wCy7B6/T7M2INAJ3WbMpfIqXL18XTbUTEae3cGxQm
         7Xrxnz5RRRoqjHwfkinUyQJKl1I/UudFbeFkMCsygmgLPNPjYZyGfm8R1v5VzF3Yj+rE
         BSFfBJIPm8zFkwdnHAk48h2fA7T36IQwSZnyiU1UGDqmkvedkMiLovqd4+PlTpCoESg2
         NRDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cpA6X30q1WwappNH8AvwqpCneggPzg+rTJDIacCPxPI=;
        b=MnRFSfUbbWDay1KRthUPtjFXJZ8Ldahh1tRa3rRJI4Cdtjm/rLpNClMw2P8tjFZM7X
         JZsJklSP5wJQelUPgNxsQVjIgMYuzzQfJwGsewiaNQgQ62Ag1/GUUOUvA3tp140I3NLA
         YdsKiRJPOvA492+eTeRXxhU+qQuiV4sv1CsEr5A+8q9vY194Sdo+hdVJkhOVJvz1P0Dv
         KQgRSh88iPMbuE4xgyzXG3CExDgOHl05vFUGwuXEWEU8EgVpmw15biTxZLEEowwkOxeQ
         MJte0I74Kre6pBqYW0g5MTIY8EH18ClOLSgLdY9wUTix+uF5qbUlEfuexZWt6oLtBjU8
         B/AQ==
X-Gm-Message-State: APjAAAVpNG3m6G7ucO2HH9iwOB6Mmg034KP3c/bUOheiDrElkrY+x12k
        1JqKNeCxn686vrYfboex+0fq/54N0LtfUoSwxOH5Hg==
X-Google-Smtp-Source: APXvYqw2g8eQ+TWa0dz85vWomepOYgqQbUrqvakcMXYxYcdbN1O9VI0OANLrQI6q1MzETTBh8sK2gP8kO4BfLOzck5o=
X-Received: by 2002:a9d:6259:: with SMTP id i25mr15617766otk.250.1559058460066;
 Tue, 28 May 2019 08:47:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190527124051.7615-1-geert+renesas@glider.be>
In-Reply-To: <20190527124051.7615-1-geert+renesas@glider.be>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 28 May 2019 17:47:28 +0200
Message-ID: <CAMpxmJUDx7hF8+XqamMkMdX_w27-FyFkNKhQoVCpPa6jUXrwdg@mail.gmail.com>
Subject: Re: [PATCH 0/2] gpio: em: Miscellaneous probe cleanups
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

pon., 27 maj 2019 o 14:40 Geert Uytterhoeven <geert+renesas@glider.be>
napisa=C5=82(a):
>
>         Hi Linus, Bartosz,
>
> This small series contains two cleanups for the GPIO driver for the
> venerable Renesas EMMA Mobile EV2 SoC.
>
> These are compile-tested only, due to lack of hardware.
>
> Thanks!
>
> Geert Uytterhoeven (2):
>   gpio: em: Remove error messages on out-of-memory conditions
>   gpio: em: Return early on error in em_gio_probe()
>
>  drivers/gpio/gpio-em.c | 30 +++++++++---------------------
>  1 file changed, 9 insertions(+), 21 deletions(-)
>
> --
> 2.17.1
>
> Gr{oetje,eeting}s,
>
>                                                 Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                                             -- Linus Torv=
alds

Hi Geert,

applied both and also sent a follow-up that makes this driver use the
managed variant of gpiochip_add_data().

Bart

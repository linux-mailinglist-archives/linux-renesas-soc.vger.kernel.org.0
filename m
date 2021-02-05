Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1B8531093B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Feb 2021 11:37:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231445AbhBEKgI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 5 Feb 2021 05:36:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231453AbhBEKeC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Feb 2021 05:34:02 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E9C3C061794
        for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Feb 2021 02:33:21 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id jj19so11154473ejc.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Feb 2021 02:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nakZx3zOEZLUUZAMILq/ar1r+Acw84d9yqhqJi2BCQ4=;
        b=MCaRB/yhouM+RasCXL7nWTII8zlWlMUWJAulO8jiC92x8qY3zCz/ZGArDm64ac/QVu
         VLQM9j87YSDa3s86JmjFuS0nHbLZedPdvmtL7t/YozzV3TlB5BwbFOu+tbzemhs3XjDv
         qQyeiCfX55uvYTwtzs6Qm0U0ROsgSkXHI7zsFMI84+S4aUpEwnJLT1sb0s1QqxH9N76H
         aFcfa1C0x/QwJzp1/IMOouUvIXzmYNBHSoMxXokMqH3fjYiacgwIGHe51hPP5gTubOXT
         tttNxPaUJCMjFmYYAT2UziRm1+BKsTzMNXOhAzCsl9vWOXkAutzGpRf1FXkTdXqnALF8
         W4ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nakZx3zOEZLUUZAMILq/ar1r+Acw84d9yqhqJi2BCQ4=;
        b=DPHTK7551aDz1d0I+zkNmzqlWFDr6S7Xc+jlZMDUR84t+Md/0M4BklC4MEAriWYpNs
         Da5HY3DutW7I7Lzyxd96gVggozc39A3TAMG2Vr7nfbQHmerh5LaQ8z4cKRnUuTiQ0ZdN
         MRLg5K/PhHZyqSz/Io3YCnDSRhX2+45xKXKCYIgSnkFIQayEc5G4xq4PNVRgdXqBS9x6
         naiMLcnd4w3oH3RCIhwsKa8K7xXo9/PurPq8aPj03EjqIzyfhU02I6OyHqfS3EBDzeZQ
         3NVNs11CttCMF15n8wU0TzVd0VZ4hE1GLp5jZBEbGrnPLRcVj08aPLNtAQZy5ycza2aK
         jw8w==
X-Gm-Message-State: AOAM532wbDjJww0/nOSslY54hlJmGh8Dg+bjLkRokg31Wk/hpaKfZ7t0
        ZIm3sXYeSyRjzLlieUWKCZ6vxntejH1siGck4KsscsSdugQ=
X-Google-Smtp-Source: ABdhPJyHaqQrjRO5cpqMINsa6mjFq2ZDnqJ4rhd+YTk+15U1aHYwn6Iulgfm+QqVy4Lfq+NfF6kym99R3LGVRL0xXUA=
X-Received: by 2002:a17:906:8053:: with SMTP id x19mr3388210ejw.470.1612521199418;
 Fri, 05 Feb 2021 02:33:19 -0800 (PST)
MIME-Version: 1.0
References: <20210128111343.2295888-1-geert+renesas@glider.be>
 <20210128113353.GN963@ninjato> <CAMuHMdW--A2bwe==+A35_sLAS2OkXzi2hY0Ky_dwL0n8irHMZw@mail.gmail.com>
In-Reply-To: <CAMuHMdW--A2bwe==+A35_sLAS2OkXzi2hY0Ky_dwL0n8irHMZw@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 5 Feb 2021 11:33:08 +0100
Message-ID: <CAMpxmJXcbTnCbseAap=F0QO2Er6ANGSfgPMuoufaD2qQyUbpRA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: eeprom: at24: Document ROHM BR24G01
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jan 28, 2021 at 12:59 PM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Wolfram,
>
> On Thu, Jan 28, 2021 at 12:33 PM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > On Thu, Jan 28, 2021 at 12:13:43PM +0100, Geert Uytterhoeven wrote:
> > > Document the compatible value for the ROHM Semiconductor BR24G01 I2C bus
> > > EEPROM.
> >
> > What is the difference between those two? Could one also be the fallback
> > of the other (just in the highly unlikely case we need "generic" Rohm
> > handling somewhen)?
>
> Good question.  The datasheets look similar.
> Parametric search on rohm.com says the G-series differs in using
> "Cu wire bonding".
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

I'm fine with the current form as it's simpler than using two
fallbacks. Do you want to submit another version anyway or can I pick
it up?

Bartosz

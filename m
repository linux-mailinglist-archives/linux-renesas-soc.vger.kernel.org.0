Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24BC12D9B4C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Dec 2020 16:43:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733116AbgLNPkp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Dec 2020 10:40:45 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:38016 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393689AbgLNPki (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Dec 2020 10:40:38 -0500
Received: by mail-oi1-f196.google.com with SMTP id x13so10557734oic.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Dec 2020 07:40:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=lSIpxi3qbe/PfQ35qb/56ujJONWvJKskXw25q6FiN0Y=;
        b=Mt53xInbc6FMl/KGto3kvEmhwTNLBDRA5Dvb6BgdwZtn64WvbGM9pHq+7uBKAjbahI
         EEsGntCcDcc8nDHrnjsKE+/g469ttGuBHslIKq+QG8R+vs+A1RaRuZeM0yu39RqtKq2s
         AEEzbwQYUuItu7AOPiSYCP7TIoP6LDlYp0KWiRmnrNVGHTrQIoOTy0FlUlnYfOgKSAvT
         tcq4JKW9euKgqAIgmkmLY1hKu56mA0fELJ2dxSdYCKxnYm4DLygOS18syLNuSgZR5fek
         kbZgXcduhjUObMER+72YVTgwlWR3DYNvHbUhfSKlQnCIi+Ji1WDI9cuJ34/uYstaFECQ
         dQkQ==
X-Gm-Message-State: AOAM532KS4Imp5fV5azAQpyCd5K4Y+fO9d47xyEqKBB9PhpaTGp2jqAZ
        ip+Kmljvij6UYiZ3LDSxoYUPMMUkXDzfX6YM908Z2qLr8uk=
X-Google-Smtp-Source: ABdhPJy9h84OeGd59mU9lCIPQ6W0xi6ceNLQPSz7l2gx51KqyglhxS1Nl96WMizVFsEGaRh8JAbobGew4onRh4aLUhQ=
X-Received: by 2002:aca:4b16:: with SMTP id y22mr18566059oia.148.1607960397610;
 Mon, 14 Dec 2020 07:39:57 -0800 (PST)
MIME-Version: 1.0
References: <20201117090329.2128904-1-geert+renesas@glider.be>
In-Reply-To: <20201117090329.2128904-1-geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Dec 2020 16:39:46 +0100
Message-ID: <CAMuHMdVRev28xx+VPyn_SKzQ=E+B4u0gDD9_j3FknrwsFXtpGg@mail.gmail.com>
Subject: Re: [PATCH RFC 0/4] r8a779a0: Add MSIOF support
To:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Nov 17, 2020 at 10:04 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> This patch series adds support for MSIOF on R-Car V3U.
>
> I tested it on Falcon, with MSIOF1 TXD/RXD loopback (connect pins 5/6 of
> CN5), CONFIG_SPI_LOOPBACK_TEST, loopback=1, and the following appended
> to arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts:
>
>     &msiof1 {
>             #address-cells = <1>;
>             #size-cells = <0>;
>             status = "okay";
>
>             loopback@0 {
>                     compatible = "linux,spi-loopback-test";
>                     reg = <0>;
>                     spi-max-frequency = <10000000>;

This turned out to be way too high: reducing to 200000 makes
spi-loopback-test succeed.

>             };
>     };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

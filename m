Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1D5344E75C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Nov 2021 14:31:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232299AbhKLNe0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Nov 2021 08:34:26 -0500
Received: from mail-ua1-f44.google.com ([209.85.222.44]:38422 "EHLO
        mail-ua1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231553AbhKLNe0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Nov 2021 08:34:26 -0500
Received: by mail-ua1-f44.google.com with SMTP id o26so18850019uab.5;
        Fri, 12 Nov 2021 05:31:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z9iJ184pTnCaa6ehbVjWTeQI8DGobiB3mmOI1dCbKMU=;
        b=o/GFdxYNfIGUA02FN+VjC7aQgBaYNd+fXDK0WGMYSIWArgUYUz5DjPzkX8/KCB9aKd
         OT4hsvDYfxHO19nKDl7RgPJdrQgmGXIuQ+7SbxuttLRZQ27fjJEfgkn2Vm367EwyyK8I
         VC2WKVdOIgFpltwPVnsIM/n1UWaaJNpePBRsKIu2gvuOcju1iFw6jwCoHkSDbzZgAsgQ
         SMybUiAnbxPhjmMmOPDT1KJSmHrqTV0f6+1qoihqJRYFPIaEIrNgWKsPPIpgEO3S44zY
         FB9K5c4QstkIci3EmGo5y7iyAuY8pIvOOaofcms3nrCUGJs9VWvvTm/7OMChGqLDS5Hz
         eMyA==
X-Gm-Message-State: AOAM531nisTmwrzu5dncyC4Dy/8m/S8FXO+0EKK6KJXZ/++6ibAf/G0y
        tBX6GfG2h1amZVZZbGhnCg+l9E9rR8CiRA==
X-Google-Smtp-Source: ABdhPJzAuPKzRPDuRlU/MmgGABSdXo5gH9rmqwdbj2q4ZpC4uJFSFGyh/1TZ338wOqA++m/r2e9q9g==
X-Received: by 2002:a05:6102:2c6:: with SMTP id h6mr10225734vsh.13.1636723895072;
        Fri, 12 Nov 2021 05:31:35 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id m4sm3967164vkk.18.2021.11.12.05.31.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 05:31:34 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id p2so18752744uad.11;
        Fri, 12 Nov 2021 05:31:34 -0800 (PST)
X-Received: by 2002:a05:6102:1354:: with SMTP id j20mr10028611vsl.41.1636723894401;
 Fri, 12 Nov 2021 05:31:34 -0800 (PST)
MIME-Version: 1.0
References: <20211110191610.5664-1-wsa+renesas@sang-engineering.com> <20211110191610.5664-18-wsa+renesas@sang-engineering.com>
In-Reply-To: <20211110191610.5664-18-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Nov 2021 14:31:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV-8NK1bMXVnwaFahkZp8DN-wx35FYbQPtwjJOuT3U3QA@mail.gmail.com>
Message-ID: <CAMuHMdV-8NK1bMXVnwaFahkZp8DN-wx35FYbQPtwjJOuT3U3QA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 17/21] arm64: dts: reneas: r8a77990: add SDnH clocks
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Nov 10, 2021 at 8:16 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

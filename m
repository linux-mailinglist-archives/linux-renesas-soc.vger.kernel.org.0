Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3433044E778
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Nov 2021 14:35:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231553AbhKLNiZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Nov 2021 08:38:25 -0500
Received: from mail-ua1-f49.google.com ([209.85.222.49]:45819 "EHLO
        mail-ua1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231696AbhKLNiY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Nov 2021 08:38:24 -0500
Received: by mail-ua1-f49.google.com with SMTP id ay21so18779032uab.12;
        Fri, 12 Nov 2021 05:35:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z9iJ184pTnCaa6ehbVjWTeQI8DGobiB3mmOI1dCbKMU=;
        b=GcsvIDSnbfru690M6Q2ukmff/5JTm9OuacBPYARkBTVDI/o0pUK87EhSHs4u5k5uNA
         xGAri3fTqOMTw++Yn1kaQjhH/iEFDKKlpuIeehW+zCZMek38EIT7jGThS4FEkFhadIjZ
         vswoJ3eHa++4W6aaPoj/GkxIggFIvM1sOvb4ZCzXZnBPplQfhZ3RYisRW8Xjz6Dmg9io
         sFkSDOLR3RIdI7tgjYx1KAuoywKHbMz52PsoBIYD0pMwdRH7uRZbKhYrolbdaDxIedKP
         xrTn+InHgXVSquper9TkhHK7zbAqnWb4G0sF4ln5dAbFYx3EEpPyiqa03CBZGHdtN0CQ
         XPSw==
X-Gm-Message-State: AOAM532BTY18pvGQAmMVnUG1jsGKOklbeO0Jp1vm2sSXMcIabttIryNb
        gt+LwEUFQqsRVJa8f37hJYy7Qhn7o9INDw==
X-Google-Smtp-Source: ABdhPJxk0uHPqETCzzpmuuUSE8ac90WLiLgzRroV0XQiD0/bjx0Q8wDTYdBCiDaj/T4okiy1w/k6Ww==
X-Received: by 2002:a67:1701:: with SMTP id 1mr10009738vsx.52.1636724133751;
        Fri, 12 Nov 2021 05:35:33 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id c2sm4424976uab.11.2021.11.12.05.35.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 05:35:33 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id n6so2252608uak.1;
        Fri, 12 Nov 2021 05:35:32 -0800 (PST)
X-Received: by 2002:a67:c38f:: with SMTP id s15mr10110001vsj.50.1636724132316;
 Fri, 12 Nov 2021 05:35:32 -0800 (PST)
MIME-Version: 1.0
References: <20211110191610.5664-1-wsa+renesas@sang-engineering.com> <20211110191610.5664-22-wsa+renesas@sang-engineering.com>
In-Reply-To: <20211110191610.5664-22-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Nov 2021 14:35:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVEXy=6MmRam0s1Z06h0k3+QVA9aUT5EztZx0+7LgJKvA@mail.gmail.com>
Message-ID: <CAMuHMdVEXy=6MmRam0s1Z06h0k3+QVA9aUT5EztZx0+7LgJKvA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 21/21] arm64: dts: reneas: r8a779a0: add SDnH clocks
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
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

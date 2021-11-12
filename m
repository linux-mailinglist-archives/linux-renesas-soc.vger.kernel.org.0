Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44F3444E746
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Nov 2021 14:26:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232373AbhKLN3U (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Nov 2021 08:29:20 -0500
Received: from mail-ua1-f42.google.com ([209.85.222.42]:42844 "EHLO
        mail-ua1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231553AbhKLN3T (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Nov 2021 08:29:19 -0500
Received: by mail-ua1-f42.google.com with SMTP id t13so18737964uad.9;
        Fri, 12 Nov 2021 05:26:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=paGDyNa7vnBOS7YBqWJ68W8Oglar1Bf6yABt+gFjnlM=;
        b=dio9DgxgC2kNIV9EHCh87Qud1639wMaBN+xqfqf0vm1y/Fwp3GFNhqIOEcCVBDi+Re
         HJY2LMhvYSLZEUczN5UjdjW/BjWX6yvtklLHV+HcLNxFvVOTcuJHSS4ZI9JN0QkWZSg4
         Q7AjYSKmKjmqQMioYplKitxCSLGQwFXVIW0ewfDHjG0751MA128H8e2D2h2TvGCjwn31
         OYM4VFM6XM3im0Rn792vboeJ6JmuzFCttGqPoGNfxCVvEIl+0/FiLekFU43rX0+5QZwx
         dPHLDq8EBogcnC0nUwao3TmS9P7OA7gv2YV+O8534CHiTk97UhlOl/3BpWZJJVdicBnJ
         dKSw==
X-Gm-Message-State: AOAM531Gww7h3hhXqG9Z8fpcdLpXxllKEEdnOtmD0E3hCKYr4gg9fJ/7
        A5SsSYOk9RMsNvaEaZqBN7Y0yK/WUpcjBQ==
X-Google-Smtp-Source: ABdhPJy6DVU75+QY/ZmAVvleGWI4OQ/BTIJR+QTaXHDehiwfLPGnM1cxDUOasl7GGYooqzHr3izn3w==
X-Received: by 2002:a05:6102:dc7:: with SMTP id e7mr10051906vst.21.1636723587810;
        Fri, 12 Nov 2021 05:26:27 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id r20sm3994871vkq.15.2021.11.12.05.26.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 05:26:27 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id e10so18850387uab.3;
        Fri, 12 Nov 2021 05:26:27 -0800 (PST)
X-Received: by 2002:ab0:15a1:: with SMTP id i30mr22541141uae.122.1636723587104;
 Fri, 12 Nov 2021 05:26:27 -0800 (PST)
MIME-Version: 1.0
References: <20211110191610.5664-1-wsa+renesas@sang-engineering.com> <20211110191610.5664-9-wsa+renesas@sang-engineering.com>
In-Reply-To: <20211110191610.5664-9-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Nov 2021 14:26:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX_xXb0t5g8t9Pmc9LLGUhD0FA9R7NonF-92a2M556pYg@mail.gmail.com>
Message-ID: <CAMuHMdX_xXb0t5g8t9Pmc9LLGUhD0FA9R7NonF-92a2M556pYg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 08/21] arm64: dts: reneas: r8a774a1: add SDnH clocks
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

If you don't mind, I'll squash all RZ/G2 DTS patches into a single commit?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

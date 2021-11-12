Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 915E644E752
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Nov 2021 14:29:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232760AbhKLNcL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Nov 2021 08:32:11 -0500
Received: from mail-ua1-f48.google.com ([209.85.222.48]:34463 "EHLO
        mail-ua1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231855AbhKLNcJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Nov 2021 08:32:09 -0500
Received: by mail-ua1-f48.google.com with SMTP id n6so2215490uak.1;
        Fri, 12 Nov 2021 05:29:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EdkzL3zw3g1doKbLD44eNMlOgTIPKlB83qtPwXccIeM=;
        b=AupfAbCoTJRI1JWpaTYm12Qg1w3JGqp2ittyYGuOgCKHu2AbNWm0WBRmDSeAizJuZG
         6tcwvHrtPHs4gqAvBjQXnj/YzRMXsVCLSTDs1DNnWcA4xwX8rw5XFGW/MbuLghzI6tdV
         d6orOD2WXd9mjCFcT+m5CSCjz4en6Bw0uFGBiGgIXgQ/qi/Gva+tHBmoYRl/j3rBiUUG
         btrfE+ZRgJi6LeOuiaxr0YuYlOvAFg5PL3yBYLJwdJpQspiVMNs3iI6P+whoudXjwWXO
         cB6t+0bxkz69gdarw95BB6Yoj3Jn8zXPM4T+cN9+jJx+YBmkpJOQXhww1KMlIeRIjrrq
         ChMg==
X-Gm-Message-State: AOAM533/fypueHmmFGrPVaZ6CloxK9z0Q7TPOVwsZJPpeu09zhxy28bh
        ftW9YbhwTf3/UlhLKHHB+T9uPAmexHGIyw==
X-Google-Smtp-Source: ABdhPJydJUDiTN54YXqzrYoGaDfZuJiMNX8FT9H1AEP5hayy9PI+kPQBtqRG2C3WQVTCSRwLCIBcKA==
X-Received: by 2002:ab0:7c7a:: with SMTP id h26mr22493153uax.103.1636723758517;
        Fri, 12 Nov 2021 05:29:18 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id y7sm4247892uac.3.2021.11.12.05.29.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 05:29:18 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id i6so18764447uae.6;
        Fri, 12 Nov 2021 05:29:18 -0800 (PST)
X-Received: by 2002:a9f:2431:: with SMTP id 46mr22549065uaq.114.1636723758026;
 Fri, 12 Nov 2021 05:29:18 -0800 (PST)
MIME-Version: 1.0
References: <20211110191610.5664-1-wsa+renesas@sang-engineering.com> <20211110191610.5664-16-wsa+renesas@sang-engineering.com>
In-Reply-To: <20211110191610.5664-16-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Nov 2021 14:29:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXaiOuBn-PC0nyD-PqysuVZxLA_ZaSP=mhUSoqueE1y+Q@mail.gmail.com>
Message-ID: <CAMuHMdXaiOuBn-PC0nyD-PqysuVZxLA_ZaSP=mhUSoqueE1y+Q@mail.gmail.com>
Subject: Re: [RFC PATCH v2 15/21] arm64: dts: reneas: r8a77965: add SDnH clocks
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
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Will queue in renesas-devel for v5.17.

If you don't mind, I'll squash all R-Car Gen3 DTS patches into a single commit?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F5BE30023E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Jan 2021 13:01:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727439AbhAVK4d (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Jan 2021 05:56:33 -0500
Received: from mail-oi1-f174.google.com ([209.85.167.174]:33061 "EHLO
        mail-oi1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727648AbhAVKwT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Jan 2021 05:52:19 -0500
Received: by mail-oi1-f174.google.com with SMTP id j25so114808oii.0;
        Fri, 22 Jan 2021 02:52:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EKFboouSIPM3cmxVtPaJgvvj/V62UapNEUf+MQUoct8=;
        b=Yt3JYpcJJ2EPxBM/Gjj3LezUaFUozawwq5xYvXpTbj+tD0YvsQ7zzs1XOULEq79b6Z
         CIYi2MChUT5B66ukrYVpukYMXMjwEGE42QgK02vtWExOyQzVJf0crE+cpWrqikT9un5m
         kuZZYQaiy3QH4ALD+75zZSwbOrcKv6IdNRz/O4MtizX09EBsVsN7ZZ08vQ5GBmNhUBNL
         F5P08//45CvYzObB//L1fzjFNMSMndbYTYmiQ1RFFXCFZTPH/AAsVPFXIDoIVOFK2tuY
         6GSUiTwI5KG7nmHB4Rpn5CVGDiuznS6gUf4b1XhmJo/JfpUOnfm1Ahz6avuetxTahizX
         CY0g==
X-Gm-Message-State: AOAM530msDItEM8SD4GRLbNiUFg5WhDgoYBLRd90Sf9RLnJtb4XqIwqN
        UrLCD+RqBro5Ld1lyWDRVCFFvdPYtZ2cesxrKfEHreOa
X-Google-Smtp-Source: ABdhPJxAJv9t6PGIrLZlLkzh0tmKilCJALAhlx5khIB9HwoQYQZ9UGLVUYAeqt+uFw5noQdFYnRWIEkp2adADuy4DMM=
X-Received: by 2002:aca:3cc5:: with SMTP id j188mr2868569oia.54.1611312696969;
 Fri, 22 Jan 2021 02:51:36 -0800 (PST)
MIME-Version: 1.0
References: <20210121095420.5023-1-wsa+renesas@sang-engineering.com>
 <20210121095420.5023-3-wsa+renesas@sang-engineering.com> <CAMuHMdU-QK2xLrOy-OsS=H7tN5da2wrc3TuVKiwZFy0N6ueDtg@mail.gmail.com>
 <20210122104618.GA29150@kunai>
In-Reply-To: <20210122104618.GA29150@kunai>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 22 Jan 2021 11:51:25 +0100
Message-ID: <CAMuHMdV2JSvoArw4dU8sLQTneKNL5Ku+xgHkkRMpbCpKGuarrA@mail.gmail.com>
Subject: Re: [PATCH V2 2/4] arm64: dts: renesas: Add I2C to R8A779A0
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Fri, Jan 22, 2021 at 11:46 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > "arm64: dts: renesas: r8a779a0: Add I2c nodes".
>
> "I2C" please. Sorry for not prefxing it correctly!

Oh well...  The less mistakes you make before submitting, the less
mistakes I can make while fixing them ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

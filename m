Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FB07431737
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Oct 2021 13:25:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230494AbhJRL2G (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 Oct 2021 07:28:06 -0400
Received: from mail-vk1-f172.google.com ([209.85.221.172]:45952 "EHLO
        mail-vk1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230381AbhJRL2C (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Oct 2021 07:28:02 -0400
Received: by mail-vk1-f172.google.com with SMTP id n201so8351176vkn.12;
        Mon, 18 Oct 2021 04:25:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+QV83UsvanluxQT0ikWmUmVDE025fh23UHPCoeEQaJk=;
        b=L49kLyLuMxoScWgBnCrHC9JnOS/W+BV/3oFmC82+CfOBhRTFVNln2HwnLkELu0BKIZ
         pwQyniFo57uZDr3fOZqpEKGQjWIkcYJjZycDX1iJk//TGTFZRIMyjDJ9Cf177SNbxNqr
         hrYzYiNyJbw1JD/gSmz8FrWGkT+ZYPfojXTmj3MK61UaqGTcXxRiLQV2V6wS0HFPryJY
         zxBIo2nuTb6+HRSPGZyWoOv/3FnWVWTnXto3AITc5xM2iWJQnXmZVWiR5ebat7vlIx4I
         v7J/XC6Cy/VBhr48Kl7Na5k4xnedopcGTrLijpfBTRNBWGFPYmi1BRtVSEWvFYzoN20u
         CgiA==
X-Gm-Message-State: AOAM532Ql+PADz/MEN1np3wRbID7RC11WiK3po2gST/ssa1sdmvf/9Ut
        9ehJIxw9Fql46VA2lGvK/Xuht/FM76PV0g==
X-Google-Smtp-Source: ABdhPJwSKPxVApwKCt9IMegdrqLImmL8XNtkcDJp7TNQtut6oPCiEGMAWxnmTCz/K496+AAceD7NZw==
X-Received: by 2002:a1f:c602:: with SMTP id w2mr23585753vkf.26.1634556350446;
        Mon, 18 Oct 2021 04:25:50 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id x7sm8455158vsk.19.2021.10.18.04.25.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Oct 2021 04:25:49 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id ba39so7365129vkb.11;
        Mon, 18 Oct 2021 04:25:49 -0700 (PDT)
X-Received: by 2002:a1f:1604:: with SMTP id 4mr23699599vkw.11.1634556349059;
 Mon, 18 Oct 2021 04:25:49 -0700 (PDT)
MIME-Version: 1.0
References: <20211018014503.7598-1-wanjiabing@vivo.com>
In-Reply-To: <20211018014503.7598-1-wanjiabing@vivo.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 18 Oct 2021 13:25:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUvQNvJhg6u=whYcZCWCnrDJMv=spEw=PBSFe9=jQwhXw@mail.gmail.com>
Message-ID: <CAMuHMdUvQNvJhg6u=whYcZCWCnrDJMv=spEw=PBSFe9=jQwhXw@mail.gmail.com>
Subject: Re: [PATCH] ARM: shmobile: Add missing of_node_put()
To:     Wan Jiabing <wanjiabing@vivo.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kael_w@yeah.net
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Oct 18, 2021 at 3:45 AM Wan Jiabing <wanjiabing@vivo.com> wrote:
> Fix following coccicheck warning:
> ./arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c:156:1-33: Function
> for_each_matching_node_and_match should have of_node_put() before break
> and goto.
>
> Early exits from for_each_matching_node_and_match should decrement the
> node reference counter.
>
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A974C32789A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Mar 2021 08:53:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232597AbhCAHvW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 1 Mar 2021 02:51:22 -0500
Received: from mail-ot1-f47.google.com ([209.85.210.47]:42560 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232513AbhCAHvS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Mar 2021 02:51:18 -0500
Received: by mail-ot1-f47.google.com with SMTP id e45so15581630ote.9;
        Sun, 28 Feb 2021 23:52:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/BEA9tqk1Z5DGVDIqnNvVHjxxJYxrw4gw5VQQihj8bg=;
        b=s0oEYQ2w77g/G3TJ2Xcoa2jOYFvAshyop4SqUwsVGQhzQPyN4WWZVOzWXaQkBuT3+W
         pmRH3OvsdUa0nsmsyPfmRcBsT7o/Y2j1CkeZuaNVeqUakmrPVcpAR/LxOY3MXMU72a5B
         YjMkKCh5ei+Fn3Tt7AYVuSft/+onGyOGKtf1ncVMUiNrOSm9FvSGu8tpj67mXp67d4dd
         2FwifqFA+sjVjWNdgswE44oxkJUh/m41W4vUEcK5JbNIT2o7+am336Px3lHLRfiTJ4XN
         7MB35gp7zLweDBzthXsqbe5BUCaY+h09u5DfQaNmf5gnrlS5PYe0Nadh/MnlMLmayDfG
         D45A==
X-Gm-Message-State: AOAM533aFo8Xp1qQzr2eX3N+9bCnGecECceFzIuPQd6xUOtO0m95Ifa4
        wuyeibCA1FodCjFDROEYpb/af2MxLymWIB43CgBlLXzR
X-Google-Smtp-Source: ABdhPJx/FjpGPxZVIdiVDjbEACMuXlL2RNOQppluUKG2333jrrClqdkguQEHi+0FP3Hfj9rjjLZE7yPsmpl13e60pew=
X-Received: by 2002:a05:6830:244b:: with SMTP id x11mr11813396otr.19.1614585122865;
 Sun, 28 Feb 2021 23:52:02 -0800 (PST)
MIME-Version: 1.0
References: <20210301061924.103145-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210301061924.103145-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 1 Mar 2021 08:51:51 +0100
Message-ID: <CAMuHMdXKF6mn7PC+JX9n2RMafcma6xPqwpTf+7auxrm5hpDaRA@mail.gmail.com>
Subject: Re: [PATCH] dts: remove c6x dts hard link file
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Mon, Mar 1, 2021 at 7:28 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The architecture has gone and indexing software like 'mkid' complains
> about the broken link.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

With s/hard/symbolic/ in the oneline-summary:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

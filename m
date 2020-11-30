Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82D5E2C8591
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Nov 2020 14:37:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726985AbgK3NeH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Nov 2020 08:34:07 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:35587 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727224AbgK3NeE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Nov 2020 08:34:04 -0500
Received: by mail-ot1-f65.google.com with SMTP id t18so2798587otk.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Nov 2020 05:33:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aAj8eG27ljnDWkNNrJcHx318iuDzNfHKiJ1zlkRX+rQ=;
        b=V9aGzRV7amA1vcBjQwKxB9TyYVcp+8WsuFsF8UESwUkLydT0jtz2UedJxvREn1Cptf
         X2XuRbfPSQWOqZp0Zob5ljx/FDcEw3kiYB6ohmAurnrTAlRqKSH62LBWpe7YoEJas5BU
         Vv0vLpwC9aHRyYXlkpu5Kk3sHhI8gjmQW8KgYB/KTNkppIFn34KeLONX92l9SFOtK6qq
         wQCgZZXeqUt3i2PGKF1JpG/0mlVQkX/+J3nmspdj6QbDflBzwxMwFgsSKdIYCKWFIrS0
         q7i3ammXaUUeLFxPRSb0gYZVI19lYtWpVzgU+vN8a1AyT0yxbJu960sTvdKJSejPpDk+
         C0kw==
X-Gm-Message-State: AOAM53036nnNlN5eMfjL/XYMo66nG8fElFk6DuLIek2FwKKsuhKLOjrh
        crgGvI+n/Rn78HYZRjZmxQnue88/gtQTd/0dmNI=
X-Google-Smtp-Source: ABdhPJyk4SG6m+GmA0aBFfuO8biSR3/uYEnP9q/Y0H0YHoUtIzzIPN5662UDR6XWWOVpUIJkgAjblRdkZkESAWC8AVo=
X-Received: by 2002:a9d:686:: with SMTP id 6mr15659494otx.107.1606743203560;
 Mon, 30 Nov 2020 05:33:23 -0800 (PST)
MIME-Version: 1.0
References: <20201126172154.25625-1-uli+renesas@fpond.eu> <20201126172154.25625-6-uli+renesas@fpond.eu>
In-Reply-To: <20201126172154.25625-6-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 30 Nov 2020 14:33:12 +0100
Message-ID: <CAMuHMdXzUSWNSsF9+hpokK_qjRr68S_9arU--DLX2G7Fa2-EnQ@mail.gmail.com>
Subject: Re: [PATCH 05/11] pinctrl: renesas: r8a779a0: Add INTC-EX pins,
 groups and function
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, hoai.luu.ub@renesas.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Nov 26, 2020 at 6:22 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> Add pins, groups, and function for the Interrupt Controller for External
> Devices (INTC-EX) on the R-Car R8A779A0 (V3U) SoC.
>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

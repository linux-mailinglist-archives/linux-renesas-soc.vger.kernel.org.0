Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45A1997531
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2019 10:42:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726971AbfHUImP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Aug 2019 04:42:15 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:34730 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726828AbfHUImP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Aug 2019 04:42:15 -0400
Received: by mail-ot1-f67.google.com with SMTP id c7so1342390otp.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Aug 2019 01:42:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kcCL3wv+BmCUtlHUd1GtMt6GC6B3UYpLuYNiU+77akY=;
        b=S5buX0I7x0GgD1hKGo8e8q2Yv6n/PvkEAo2jRn8yxRKGr6g8MXTFAvdTqfQnCw0BBk
         L4h2dO7uwwdUCy9QD6UXEVGFq1x4iNhsTMx3xkDAqJgViSnH/zPaEFkyhfUlwJ6ZQWZl
         0seJDeJP8NBc+RpzKZkrxMtryIvf9kpXm6ajYW2V+saO7js2gwbQxvLLIXl/+ktezO5X
         Xp98GrlLtH9aTm6NqZj2O9IrJ+6Rc2H89X6INSK3cnbseS/qQGHKtMC80Hspu6wfbCEB
         n7Z91/0s8/76SzFbRl76xEuH5LjRTwZ0H++pqUGE9CHzQCBBfMDYH0LDHte9qohQw5Ms
         JWcw==
X-Gm-Message-State: APjAAAXGYf7FDvTNfSekfRy+ouA8aRbiQtcAlKIzLC+UT9KWSJxxAWRc
        8ncFU6LzILWMKT7GrvUB0vybPHaW5KpLgT/vU3c=
X-Google-Smtp-Source: APXvYqzOW5uLoow/xp0Km1ynU7ck0Zznytx9ikVVBuDkhA2SpBQ9CLc5kowJrWjS8M4IfNu3CU+6q8VzzkSjpyCW7x4=
X-Received: by 2002:a9d:459d:: with SMTP id x29mr26759808ote.39.1566376934821;
 Wed, 21 Aug 2019 01:42:14 -0700 (PDT)
MIME-Version: 1.0
References: <1566219341-23048-1-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1566219341-23048-1-git-send-email-ykaneko0929@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 21 Aug 2019 10:42:03 +0200
Message-ID: <CAMuHMdV7Hm8gEOD=ehS8K1G3W6MjcTwZ_w3n5s5YR1uppyJVyA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a774c0-cat874: sort nodes
To:     Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Aug 19, 2019 at 2:55 PM Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> Sort nodes.
>
> If node address is present
>    * Sort by node address, grouping all nodes with the same compat string
>      and sorting the group alphabetically.
> Else
>    * Sort alphabetically
>
> This should not have any run-time effect.
>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

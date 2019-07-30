Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05C137A3CF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2019 11:16:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728826AbfG3JQg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Jul 2019 05:16:36 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33609 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727317AbfG3JQg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Jul 2019 05:16:36 -0400
Received: by mail-wr1-f68.google.com with SMTP id n9so65018974wru.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jul 2019 02:16:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j24m8YwIkgZoAdisYhIZZGOM4mMaO5nu7o1IplZhp0U=;
        b=FkD8lMfl6vTHxUsFcdIL6DRtIUmwU5lrLKXWt9GITUyVnHqEi4Msfo1hgMhqnD08Du
         YgMNQNeQdqE1TJ6mDE3TWnGoW/NY4IqTG8MNlxpv6OhVvlhk9z61JY9eT7FiKHDZPkYC
         Pxd5IqU9BK21/0JAN8vqI+DbqjVFfCKV2YBF0eaH5fNY6eNIgHi6RHM9FSyFgMgVMNug
         +Js/ASGxvJGxADAawzn0P6rVeHMUtmLY3wj1Z4xZS4qo3Jzta7MKIRZvk4v41M5/Tm/U
         0LSGqZNo41IzuDp+0DdculFwxdICunJSs26WRG9lf9iRgqkAxMu/MKLi8fmbXNs3hF9Y
         DrCA==
X-Gm-Message-State: APjAAAXC6Qsf+1BEWD1nWQdAMsFh8OLbpTsi9cOv00Vgkroq6rD7N4Vo
        AZy1WEq7ViuFv+CC8HJVVxfKqzxs3GoHkNwZbwA=
X-Google-Smtp-Source: APXvYqwU8JEsUchDDEfZuLE6iNBFbDAIhT3lCErFptAgr1wuzTZlQZUkINWxbixHAgGlmtp33fGA54p3N0plrr6Ei00=
X-Received: by 2002:a5d:630c:: with SMTP id i12mr38575833wru.312.1564478194192;
 Tue, 30 Jul 2019 02:16:34 -0700 (PDT)
MIME-Version: 1.0
References: <1563904928-2797-1-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1563904928-2797-1-git-send-email-ykaneko0929@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 Jul 2019 11:16:22 +0200
Message-ID: <CAMuHMdVGYLFmqayWa5oR9ggBrLW2+KDAJ8Wx8AjPjiRJ=-eZKg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a7796-salvator-x: sort nodes
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

On Tue, Jul 23, 2019 at 8:02 PM Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
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

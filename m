Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B2E47A355
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2019 10:47:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731102AbfG3Irl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Jul 2019 04:47:41 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39455 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728432AbfG3Irl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Jul 2019 04:47:41 -0400
Received: by mail-wr1-f66.google.com with SMTP id x4so11646997wrt.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jul 2019 01:47:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3MGq4dLXH16WHHSffKqTgVZG8oTTt8RVIxVXhRU8i6A=;
        b=AvSNDoRfqFOAKVThFke6D/7rMdhTnrRWO+zaqQAGap0oEc8Epd6CjbXzhM0c6q0RJa
         fvemv3SPxUs1rWwIoMCWZSYRAn9NAEeKnZqIIOzqImyq9/QKVDX7kLD+TMnG1hgSyMbQ
         uyIxhWTJiTSX0WzxJ6Gp7tLFSb5lVVhHKgGdEKaMHrEZPCm42wUUzNIooJUCiAw68aXB
         sI0wk/fMnEfRPYVG00fUwhHnRQBZiB/CTGuFuSJGPZ3vRqodcBg9ilITGzJOwYjRlygD
         Di5Wk6Yjc0SRK3HvQprpAY7xd+tL9BFlWeYq+gGZsv7wXV7pIV442s7MTHBjDfqG2u25
         Du0Q==
X-Gm-Message-State: APjAAAXltguxzw0jOeVr/csBXcbaSC4q3bpEte4JBEB/jyU4MlH+vxjy
        XV0YnECYGl4Rvrmy2LJ+KTDFFXVve+ZdCd+3j/A=
X-Google-Smtp-Source: APXvYqz/Zpk0wNzPeFru0clrckCWLSUtKkVnUhCYVCmj9S9nfNd/4oGLTupfwLIvwxTLgp5O1m8+gMeHHw4rsj5XMog=
X-Received: by 2002:adf:f08f:: with SMTP id n15mr41608519wro.213.1564476459286;
 Tue, 30 Jul 2019 01:47:39 -0700 (PDT)
MIME-Version: 1.0
References: <1563461137-19827-1-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1563461137-19827-1-git-send-email-ykaneko0929@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 Jul 2019 10:47:27 +0200
Message-ID: <CAMuHMdUAW5ijuL_PW+5ANYBbtdyptXesvOtrA=B7zCcN_2xhRg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77965: sort nodes
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

On Thu, Jul 18, 2019 at 4:45 PM Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
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

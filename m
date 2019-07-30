Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC4037A3CD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2019 11:16:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730209AbfG3JQR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Jul 2019 05:16:17 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:56200 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729186AbfG3JQR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Jul 2019 05:16:17 -0400
Received: by mail-wm1-f66.google.com with SMTP id a15so56401210wmj.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jul 2019 02:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7p0S88q6+XKwX8nM1vn9ytVwUof8aNjUGgnKhdm0yLw=;
        b=jb6ycDtERrsUksbYC4oA9qV4Tke+z2+Kh29QbWD3pXePiqRLh9QKZCmJjxbZTZormj
         izmFXkHhCszyVQrh5ZXtRBk2JpQ1Qpo8cW0Lpa0S8sI4XmdfOThn36rqEBzgb1H7iiZK
         CB6TwbZv0wWQ6Pl2YkK26oN23nNnfccHW1Usue2YNAMsd8sShyRd0D7aHQ4NUbuhgfbc
         iJaaPpYg48w/wR5mv1WsMjQcRSJnih/IYgEBi2JgZ2rNrCrwEHHsno3QVon/LVWocKAH
         s1TmoHoGGMrEB4GYXzqh6r0b2fgrzV6RfojfZ+wnGuLV8YwC5bBgXpkfggW/xdEQFnbF
         Mg1g==
X-Gm-Message-State: APjAAAVtXjSx/6tVk7oPhTryoLlCpimNnWqZWroJpSuclebmsx0Qs0no
        /pBKK8Gn4hnk/mXoRooC9HfDmAYXIsNZeCO/5/Q=
X-Google-Smtp-Source: APXvYqw6hnQNgp9ba6JoXeB11DQEMihNidxPVOC8Wl9Pvr75u2HCkAaBWnNzEeHksMe9QZtBaO+D+5iMfEcGUkHu4Lc=
X-Received: by 2002:a7b:c310:: with SMTP id k16mr63730000wmj.133.1564478175274;
 Tue, 30 Jul 2019 02:16:15 -0700 (PDT)
MIME-Version: 1.0
References: <1563816188-17922-1-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1563816188-17922-1-git-send-email-ykaneko0929@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 Jul 2019 11:16:03 +0200
Message-ID: <CAMuHMdVP_NnnOPPsRCmUnR6quMJv2QnT0ZgE+kSRbV6-GmMJoQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a7795-salvator-xs: sort nodes
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

On Mon, Jul 22, 2019 at 7:23 PM Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
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

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 620D0265BC3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Sep 2020 10:37:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725554AbgIKIhV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Sep 2020 04:37:21 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:35875 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725550AbgIKIhT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Sep 2020 04:37:19 -0400
Received: by mail-ot1-f65.google.com with SMTP id 60so7712432otw.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Sep 2020 01:37:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G1eyyEj8P/0RRy8Uij3GQwAklZvSuy/9cJYRiTRzr/A=;
        b=rW4KmwLvP3udpGhGgw9E4dVAKq3gORV0uKLCyGUZBK8nOnEzbP50zrdukgRiacmVag
         QB7xyn0hYCTJTI7LiT0gMr8JxFlXxh3U613Oxr4xcaaHklKDLwFD+3nxqDsyNf79WTNA
         6U/KfqKwPktU/Ymy4lLpgn3F55FnGIWNqtrCkebdPk+UgexFDK6vKdAnaRKA9yk/FmlX
         UiY8c3PnWBVJp4jAwapp+Q/JQ5LnhIFeFTRiQbYrzYs4J8iydMLZhJXYF1oMdqhH1Jb4
         3pFZNjD9/ttbyo2N0eFyJP7LwRGixeiqZNmQ73keSP9yDJ6aVHHvD22VWONleXUFEixf
         9MSA==
X-Gm-Message-State: AOAM532paR/fTUr9a5BzOqJxxM77eTksDJfzFEXt5Vn7j3Co40lsO208
        SYOEq6MfXbPxfWdd4A8BnlMZq6u197EVuJK3KMY=
X-Google-Smtp-Source: ABdhPJz2okB2rt96CUVmoUz89d8SBQMgvs6S4JYrF8K2S2vmSKlqZcrikx/sLyxAjRgzoA6O95Xo27+43PV4rkxoKAk=
X-Received: by 2002:a9d:3b76:: with SMTP id z109mr561136otb.250.1599813438689;
 Fri, 11 Sep 2020 01:37:18 -0700 (PDT)
MIME-Version: 1.0
References: <1599810232-29035-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1599810232-29035-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1599810232-29035-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 11 Sep 2020 10:37:07 +0200
Message-ID: <CAMuHMdUjtPvTRM6EfBhzNo=xjRt0RckZ-gczt6qo10NyRh=mvA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] soc: renesas: r8a779a0-sysc: Add r8a779a0 support
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Fri, Sep 11, 2020 at 9:44 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add support for R-Car V3U (R8A779A0) SoC power areas and
> register access, because register specification differs
> from R-Car Gen2/3.
>
> Inspired by patches in the BSP by Tho Vu.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks for the update!
Will queue in renesas-devel for v5.10.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

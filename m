Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CE43263381
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Sep 2020 19:05:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730514AbgIIRFO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Sep 2020 13:05:14 -0400
Received: from mail-oo1-f65.google.com ([209.85.161.65]:41461 "EHLO
        mail-oo1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730426AbgIIPnR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Sep 2020 11:43:17 -0400
Received: by mail-oo1-f65.google.com with SMTP id t3so676661ook.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Sep 2020 08:43:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yGBHR3leqr9CBZhF9ZqOJVbNAq6Exddnv2N2//ISxwE=;
        b=iA84uHjC/hJe8ORTosMyZ/qa+AIxPBuvJibGI/RCTcChHgtIN3b1VxpnXfTolRlCrK
         3/ioyUK36Y7glRzBwYy0Qyzto0/ImYbNqE48NqfUplhm3E9x3Eg0x1ONuRZI9WzAi+Js
         9W45RjlB4tgFeiwPZMzK5D8Zbn/aUt2+o9UmLOf7j7ZhOF8EiGSWmY66Rwpxiu95E/K3
         vMbk7JtLzZmPP9/Sj5bubCh9/a9AJReAutGbeBKhQgv8TCzLGEconS3hFeHxGwjlEBuD
         /JtpEdES6eNZ1JXvqJAC9xbvf/nLLQrlqBiFRAwRMFsT18T8AS/K95R957XpSPzZsNKo
         spqw==
X-Gm-Message-State: AOAM533Fyz90tNl1sXMsdXnEmYmBOLGCMysGdNVPp9Wpop0KWJHaotsP
        zKM0o+bbakF64/4f45hOEfdBMcKsTaOdXkVIpJiCSqdW
X-Google-Smtp-Source: ABdhPJyk3rBz8EQua8Iyg/GLDc4KajqbkCdylr8NWvz49dKJwMWhh2ZrIxRPcWLbA3WSRCZqWZKF2xLXVNcOHiwh3LU=
X-Received: by 2002:a4a:4201:: with SMTP id h1mr840490ooj.1.1599658952216;
 Wed, 09 Sep 2020 06:42:32 -0700 (PDT)
MIME-Version: 1.0
References: <87d02yv55g.wl-kuninori.morimoto.gx@renesas.com> <87bliiv54u.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87bliiv54u.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 9 Sep 2020 15:42:21 +0200
Message-ID: <CAMuHMdXSVQggbf2v79x9Ykv3Q_fLP294fyOHUF=TXX5hQEjmBw@mail.gmail.com>
Subject: Re: [PATCH 1/2] soc: renesas: use ARM32/ARM64 for menu description
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Sep 7, 2020 at 1:51 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> For easy understanding architecture and alphabetical merging,
> this patch uses ARM32/ARM64 for description.
> This is prepare for menu sorting.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.10.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

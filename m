Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B48B182089
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Aug 2019 17:42:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727460AbfHEPmD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Aug 2019 11:42:03 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39511 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726559AbfHEPmD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Aug 2019 11:42:03 -0400
Received: by mail-wr1-f66.google.com with SMTP id x4so31721738wrt.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Aug 2019 08:42:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o9oTH3lrc9gbGQU8qF2CLsNoD8rh24pMm5pLzB4ne7U=;
        b=tMrY8+HzqxVzcu8rU10TjMiIw6DrXf3R3UOqtWqgsKI3PBYmI9scW5JGYD5SRK7efG
         sYA9A9mEMesblfofW2oCNyuqPAaRl0lBsTtn8vN8m1UorgGtzm0bEq/HxnMVXfbKRVd6
         PmU7vYLRjRBKOEumL5y9MqKESbBS848NPR8EFPwpTXIBLURJLCKiPCFUfG6YsTp3l+dr
         2JgslsyxCMmfW0vR6r7Ssy39eiaKTnRqCH9Q02/UCwPZe/LbCs6Cy9nn02+xsNB/hShI
         Rt9OoW5Zy/0oWtGujYNkcSvNv3CUicpbwFui4ZD9t3+pHEeVh3C57TvESAdmJMORoufe
         U7Vg==
X-Gm-Message-State: APjAAAXXz+Mvz7MHYiiXyOHBT9ETkVtWIyjmox7D1ZYkKufbirFumIXQ
        Q3CBA/JbPcIsY91kvHTPGTHLhV/18i/0mzMkmF4=
X-Google-Smtp-Source: APXvYqwnHv0v6dHYx6C94YFR+bjof897FfAM3+5r4a0vg1xBdeFYsxcg3XPpxKdzozbsvQocTZbdrYebSadyXnvHt1k=
X-Received: by 2002:a5d:4b91:: with SMTP id b17mr23848079wrt.57.1565019721013;
 Mon, 05 Aug 2019 08:42:01 -0700 (PDT)
MIME-Version: 1.0
References: <1564669513-22756-1-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1564669513-22756-1-git-send-email-ykaneko0929@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 5 Aug 2019 17:41:48 +0200
Message-ID: <CAMuHMdUKOoxGaRdNLnmKkuYpm_UaiV4b4deDfj81WVu7t94_fQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77995: sort nodes
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

On Thu, Aug 1, 2019 at 4:25 PM Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
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

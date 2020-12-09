Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4C322D4014
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Dec 2020 11:38:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727836AbgLIKgv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Dec 2020 05:36:51 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:44260 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730013AbgLIKgu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Dec 2020 05:36:50 -0500
Received: by mail-oi1-f195.google.com with SMTP id d189so1192702oig.11;
        Wed, 09 Dec 2020 02:36:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uo9dIETK9mAQxtw6iTjuVfB/lVN/jbUWmq6dj8/8OGE=;
        b=Nxy/hIfpxmM6CmFvhw+auoVlxsZmaosuVuLl0mGVsLv6vHi5XBlE3pfjrTizTb0QCM
         jcKWaui+qZF1jKbq+WbuKyMljakS7qW5aaj8+6tl1VO/C2J+Uwz8YYYayL6/3AA1nzt0
         A7HvfNG/S+Sl8Xhf12bLBK2BNMue8rN0z8XpJsWoviT9UkpU8PZwLzQQEkha/qjKnNTd
         6LZvkPgSGUydsSubdQJetqmyjDCE6Sh/eCHrpQHVM07tfjZhAvT4O3vktx1btn1VUe4R
         jIc/UfjtryLpPxr1B+bUNT9/DFH2HzdmphIceJIPLGAlM7yKABHxiOVGSXRSGo7q/JbZ
         NhXw==
X-Gm-Message-State: AOAM532dUlclXPJJd1CYpW8Ruj8n5SvyKmsBz8QSvr/XaHpr2FkTRQ55
        RjRir2SWKzEhmCE2tcRG6Sryb5IizLvASosY6mI=
X-Google-Smtp-Source: ABdhPJw581OO9kYd+JonG62ZvkgE3rbmlRIweQ0nWhyHb6euMOhoJ/4vcCdZN/7Yo02XhOtlgJZOg/EUeVU0cLJX47s=
X-Received: by 2002:aca:4b16:: with SMTP id y22mr1221145oia.148.1607510169947;
 Wed, 09 Dec 2020 02:36:09 -0800 (PST)
MIME-Version: 1.0
References: <1607414643-25498-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1607414643-25498-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1607414643-25498-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 9 Dec 2020 11:35:59 +0100
Message-ID: <CAMuHMdXugW_q-b8vGAKrqUMYZS4LYyp3jmedscAJH+h-FNR17A@mail.gmail.com>
Subject: Re: [PATCH 1/3] mfd: bd9571mwv: Use the SPDX license identifier
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Dec 8, 2020 at 9:06 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Use the SPDX license identifier instead of a local description.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

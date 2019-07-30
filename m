Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9472B7A3AF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2019 11:10:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727491AbfG3JKL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Jul 2019 05:10:11 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51839 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726693AbfG3JKL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Jul 2019 05:10:11 -0400
Received: by mail-wm1-f68.google.com with SMTP id 207so56390137wma.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jul 2019 02:10:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j24m8YwIkgZoAdisYhIZZGOM4mMaO5nu7o1IplZhp0U=;
        b=hiko/2xDTeOlrRiSq3jRMTNfLvOi7jE3vzzreTbN3++giAhShInsdrOB7+bHLNesUm
         ALg3+AoeLxm3pL+AhvEsn4FwGUtIQBQpDljRjDrLvsj1CsZQXUQizIkEnzeyxmvuUsxj
         ZrzEEI6Xn+xRxbXtFjwSfqUvJPXhrJL+qMY0TdtYtAJjZ32WhNm2Hm9+QVdoCCWO+6VS
         SC/IFsqePtEoTnbWQ4BME4w/vHZYZxcwCTgg+lBmk2GNVAxpnAuZApezyWe1+9q6epfM
         XILsttD1kjJdrR8wM6xfYCFyF9+nsdsWh5gBtGiu1eh3M/fVDWN7Os+K2zg/AKnyBOyv
         CqpA==
X-Gm-Message-State: APjAAAWd3jRoOC/Aa9BnmE3iQaJM4D9GVSBalqJeFdqIJ5WMToQWtf+K
        NwQqB2dgfRFtYOZhq7xo7Ps5urfljeqRM7DkHk4=
X-Google-Smtp-Source: APXvYqzPge52lU5A1/B7zTsY7olW5A2fkd5hOJKiLXpfIhEQv1v0kKof9M+mDPAErSronytfCxbIDsXyDNjrO38xVls=
X-Received: by 2002:a05:600c:20ca:: with SMTP id y10mr71381212wmm.72.1564477808749;
 Tue, 30 Jul 2019 02:10:08 -0700 (PDT)
MIME-Version: 1.0
References: <1563904961-2835-1-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1563904961-2835-1-git-send-email-ykaneko0929@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 Jul 2019 11:09:57 +0200
Message-ID: <CAMuHMdXbKrEKP4A33nP-N+x4cOeHPVxAJ=Cu+sQc9o4jDb7mMw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a7796-salvator-xs: sort nodes
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

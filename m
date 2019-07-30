Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF4CB7A3C3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2019 11:15:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728325AbfG3JPa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Jul 2019 05:15:30 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40871 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726557AbfG3JPa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Jul 2019 05:15:30 -0400
Received: by mail-wm1-f67.google.com with SMTP id v19so55954789wmj.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jul 2019 02:15:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bbMITpI9ih6oubekM+/8yvOIOsT8t48Ldjw0I9CwY0E=;
        b=AbVolmU949661DOcB8GQ/32+jT8u1HLZYtyB2etmJJS7LykaZR1lU88AslNEX1OiVe
         UY2lC+0U0E8Ob0O+oMsUlqflHRlJwIdfu02QfKYp22wOHd57CdkKvtKAtZyR6uoKfb/+
         NFxfm1m1dzRddabWk2uyeDVB9XDuwOhRLkJUp7kb1F4Lz9GYdz7E1x2LIQFjSiwGECVL
         m1X+oriZixkEkJEKpKxMiLZA0DJcuaIJ3upsz/IQIJmWmNvKyVFNSablBVTltacwgH8V
         38YtTvH/npVTym1CB8YK4IgETcX4/VzskdlxcmcNuanIZxfwfnODiADlsTZchZS7rDWX
         Pz/A==
X-Gm-Message-State: APjAAAXTp4ukeSaEjnSqrnIb/JPQZw9dOksAva7OOqCXla0wRcwb2niF
        8gVLRVDtpWowImUdc3w8LA2tgvzapcH0/UFsp3O6gXqo
X-Google-Smtp-Source: APXvYqzN98mCKmoV4rr2++jma1hFDr8aafGC97/FKFoJvBsh62mxPtdqhMJgzHzafWoI9ChLPL4+n+AeaRRX4NM0354=
X-Received: by 2002:a05:600c:254b:: with SMTP id e11mr97164024wma.171.1564478127904;
 Tue, 30 Jul 2019 02:15:27 -0700 (PDT)
MIME-Version: 1.0
References: <1563816141-17805-1-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1563816141-17805-1-git-send-email-ykaneko0929@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 Jul 2019 11:15:16 +0200
Message-ID: <CAMuHMdWJ1sq0eFWZki6g4bcPKU4Q4bTRs-WujJA6jLCK7jYQ4A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a7795-es1-salvator-x: sort nodes
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

On Mon, Jul 22, 2019 at 7:22 PM Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
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

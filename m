Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A43BF7A3AB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2019 11:09:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727442AbfG3JJn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Jul 2019 05:09:43 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54346 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726693AbfG3JJn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Jul 2019 05:09:43 -0400
Received: by mail-wm1-f68.google.com with SMTP id p74so56346501wme.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jul 2019 02:09:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j24m8YwIkgZoAdisYhIZZGOM4mMaO5nu7o1IplZhp0U=;
        b=X4ENj030BplSotEDWIB6FW/VH7gFK3N30kk3IOEMsYM5DFiFk5JKaghUIszSpw/lm/
         uoYDoT+YLFlusR84aOxYpXVOfLwUf0sNHGTCEZsItg+LaMhqh5yT3muXH8XfK6WuHEC6
         lh+0mLihPpLN8LDlzhzFuebAqo5C+/kWyxA/wHsav1Rx2kEbFNN8p/AgTpkrtfezPDjd
         9oZXfFawcoyCwWCV4iu/eeZEOqZtYufSQt5IphlrffMA2N0TqRl5aE1Vg1X/TKonLNJs
         iAIfHq6r+y+Nf9lqVp56dxyKHGQ7OoDC9kIZ9swa5Tt43De8UKsp+1VYZLnh1m2fffIG
         QRpg==
X-Gm-Message-State: APjAAAWtYlLEzkR/B6Yx5FmRBI2CtClzLFgen8OwZ6u7QMMwkKrXjw0K
        9dJYUe2C8uUupqNHKu3sW7u3ZH3Z8ZasJGBNNG4=
X-Google-Smtp-Source: APXvYqySBUHLqBSU7N6XxWulVRUOlueaDCODh+7IELqk6wpTCnt5wfRsHvBVYsa2lVF720QG2sKFJ9HzIyMa6NIOZ0I=
X-Received: by 2002:a1c:1f4e:: with SMTP id f75mr101586919wmf.137.1564477781703;
 Tue, 30 Jul 2019 02:09:41 -0700 (PDT)
MIME-Version: 1.0
References: <1563904928-2797-1-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1563904928-2797-1-git-send-email-ykaneko0929@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 Jul 2019 11:09:29 +0200
Message-ID: <CAMuHMdXQwRm1H3metXwGZdtFK13qhNuOLZem5hZmoHDtcm2rqA@mail.gmail.com>
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

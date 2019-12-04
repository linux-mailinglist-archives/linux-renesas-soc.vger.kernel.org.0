Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDB9111275C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2019 10:30:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727403AbfLDJaD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Dec 2019 04:30:03 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:41916 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727398AbfLDJaC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Dec 2019 04:30:02 -0500
Received: by mail-ot1-f67.google.com with SMTP id r27so5715154otc.8;
        Wed, 04 Dec 2019 01:30:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z4sTlkFw5+wOHxM+qW/GDcoDE8PYgsA3jAbxBgaLJKA=;
        b=UXpp6nbMBJLWasgVfuth5rPhe/1/1UIK5Ot/PQGdYXiIgs2MGObY6vlPlboT7fX25G
         0z7dI84ezXjAKPhkYkhNfw8yngKZ44p1FLYbyO9cbxLXxPEPa/jVE4sEy4fvUjZYg45x
         FmBZ/aapF3fO7ytDdmE5BlGQAHRHvcVufVo2g8rvcag2DJVfKzPMC23TdqVLTgLQ1guI
         aTCAY5T/xu2tzCj75qaV3YKBlNd/nenU2ycqsTEmE8vgnbM/2GMG8iV8GeQZ7Fo989ht
         zx9NqA+4NnbNdLYcK7aJEJGIpUL27ueliS4MHMJ83nj3ws9PKgGiT6t3bzORfkzGMh2C
         Nqsw==
X-Gm-Message-State: APjAAAVq4EklpNab/Wu6VC4JXeM7l/Rc9CSxzxpsRXr/43MqeD575CGX
        fgQ86AsNpMYEvauThyuboBqqQoRfcgbK9KWXK4T4D+7r
X-Google-Smtp-Source: APXvYqxXFXXECc2XcZW+SQ1oOt5NJVd5cG6kfZ6K9h0lyRxftV54zclUNBfsY6eV5OFdlabziq4SLQc92VoPUM+2feg=
X-Received: by 2002:a9d:19ed:: with SMTP id k100mr1747591otk.297.1575451802149;
 Wed, 04 Dec 2019 01:30:02 -0800 (PST)
MIME-Version: 1.0
References: <20191203200513.1758-1-wsa+renesas@sang-engineering.com> <20191203200513.1758-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20191203200513.1758-5-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 4 Dec 2019 10:29:50 +0100
Message-ID: <CAMuHMdXANypfbcB+0VDp7VobHnFTFRZO8o-Z8+WV1yq94VyqYA@mail.gmail.com>
Subject: Re: [PATCH 4/5] mmc: renesas_sdhi: remove 4taps as a TMIO flag
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Dec 3, 2019 at 9:06 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Now that the quirks structure is accesible, we can remove the TMIO flag
> for HS400 using only 4 taps. This is Renesas specific anyhow.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 656295A152
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2019 18:48:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726819AbfF1Qs4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Jun 2019 12:48:56 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:41263 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726687AbfF1Qs4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Jun 2019 12:48:56 -0400
Received: by mail-oi1-f194.google.com with SMTP id g7so4728346oia.8;
        Fri, 28 Jun 2019 09:48:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zgajdTWkhfsgGB1ENdLnhAjk++dDAjlzSBZ9ouDrc50=;
        b=F/MuiAyZ1MR2SC3rfTJVLyZJusPU58IL6zagwolBAsOVbmD0iiXUmXkA72r0u36XG5
         VbmusWtUQ+6bE5MfprpeUPlXO/mgNEaMcRV7gjI6YCf993FavyXTg8VQ9RInSqlU+GwO
         Am+Vyy3unurDkNiEu5zi9xfbZ7ckCiWYt3coXcYz82ZNK/Ra2ry6EK+UsBZe/UyA+Dhp
         c8aXzZVsAEXAKpcyI9mUE+VKSIZwSIPThZztEiDW4ZPQ97+uSjoK8igrybl7Z8UMg3y0
         6wREbvtiHEC09F2aHAv+ezyxeWM31PQZ0wnA+tnTvnp6EEupTtni+8TTgTRCKO9d65cA
         ib5Q==
X-Gm-Message-State: APjAAAXHYrhaamL7sSCcaRLHhL52dRYnEyBGM7uJ3NenAwiqWebvu8Gq
        53Zx/RJDy2mjZbnhitqZVqaXiSnfWisbctQZta52eA==
X-Google-Smtp-Source: APXvYqx/kKI9fBhrV5nI3PgdwnKLU5nohfvsbsy4p643RXXPlpSOkzZQksZouc+iexXRY5gXUl78ta6aQ1eQhMtgHy0=
X-Received: by 2002:a05:6808:3c5:: with SMTP id o5mr2256924oie.102.1561740535781;
 Fri, 28 Jun 2019 09:48:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190628153448.4167-1-wsa+renesas@sang-engineering.com> <20190628153448.4167-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190628153448.4167-3-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 28 Jun 2019 18:48:44 +0200
Message-ID: <CAMuHMdWnc0SBu+OH2gEqCjcmaYOsbwKBrsUHmHoEXEx7c-X7uw@mail.gmail.com>
Subject: Re: [PATCH RFT 2/4] mmc: tmio: add generic hook to fixup after a
 completed request
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jun 28, 2019 at 5:35 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Sadly, due to HW bugs, we need a callback to work around issues just
> before completing the request.
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

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AF1B11274A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2019 10:28:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725971AbfLDJ2t (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Dec 2019 04:28:49 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:46621 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725922AbfLDJ2t (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Dec 2019 04:28:49 -0500
Received: by mail-oi1-f196.google.com with SMTP id a124so6185089oii.13;
        Wed, 04 Dec 2019 01:28:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WoYCd7jK2NSLr3Li1krvLX96B9IpnuR1gtBKn3604rQ=;
        b=NuFzCEZuOEhdyE4yg0T6mZYOihUpur8wxp+Oqp9Ecivf9gtc8zfLVTa40QPpDBhHYn
         xWO7AV4BH2ySONoO/Ay7sINp+F+T1EBxog42qaSO/dCqQ1YjearHgCZJ64LYUEzV9W0e
         FMOigENtxm93PTNhMAU7cSB8vSDgTjb2ivVcQerE4yLY+w1WkHO5u4eqTdzblFyeVBx+
         h1vfiPxVRAXnucYv1nn2HKsv95YDnCTPX48bUSyi4I/BkHSjD4ruOvUtgOSBBJG+KGdt
         6hVHu7+7QihDr/693T/BwTcA86cEK7he/AWIvIu28xN1qNcuxN77/HySo5SN6JFeAhAq
         Afvw==
X-Gm-Message-State: APjAAAVYmElQGsELLKYjy2euVbNBnvMcW339IuY4yyCSR6Si4LwAts1H
        D2urT3osKfpP+0Pv5D3NhHfJJddJJA3qZi3KTqE=
X-Google-Smtp-Source: APXvYqy4BLSEPB7UDOJOYogzMIx9VEcX62yUQ2ZP9FMCWXEdHV8bO1U77hSKs55OBb654ugRwNdwLzTXSzbvciZ6qZo=
X-Received: by 2002:aca:4e87:: with SMTP id c129mr1684575oib.153.1575451728902;
 Wed, 04 Dec 2019 01:28:48 -0800 (PST)
MIME-Version: 1.0
References: <20191203200513.1758-1-wsa+renesas@sang-engineering.com> <20191203200513.1758-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20191203200513.1758-4-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 4 Dec 2019 10:28:37 +0100
Message-ID: <CAMuHMdUzFS559JZyhDb==OUOs=PpU7yPR3DOMkccZ7i-mTFQsg@mail.gmail.com>
Subject: Re: [PATCH 3/5] mmc: renesas_sdhi: make quirks info accessible
 outside probe()
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
> We will need that for a later patch.
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

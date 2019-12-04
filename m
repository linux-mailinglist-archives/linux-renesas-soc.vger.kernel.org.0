Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16B9A11278F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2019 10:33:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727444AbfLDJdn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Dec 2019 04:33:43 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:45953 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726899AbfLDJdn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Dec 2019 04:33:43 -0500
Received: by mail-ot1-f65.google.com with SMTP id 59so5697116otp.12;
        Wed, 04 Dec 2019 01:33:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qyMzLbZdPB2WzeGZyEue5bSRwbdZ/oJZ7z+TvTQUilY=;
        b=b8G6viCDcBagjgUVj+SQtRbDq8+Lo1D1LOLmt40DAEwBSmAM4ZxKjLKupUjSoSRpsJ
         hzNv1IB1UDrK5gt6EMK8NzIA4xvzCP4u4SRBIg9m98ghoy5iS1Qh4ydTVEmLPxn8HYLn
         q2huL9lOVQFttAh4u6PO1U8QbzklqHeOwGHdGPJKjBQdhFhuFNSJzktvOcLn0xmAdst6
         SfSVrrMWi6Jet/s13Y3djFATk0IjXhOCHTgp58YaUiNa3Hlo7tc15MSIRZ+zf8bwbr54
         MShkmGgNhxhqLa0WcJWz5qgQkmw5tE4NSF7ZrW8bTg0dDLvcoMeuujGtEJJWQ2Mbyj25
         4lrg==
X-Gm-Message-State: APjAAAWA1sOq7yfF48YN5suWZ/kc7YayILOsE4Bk9Nt4bdTbpGa7DnLJ
        1YIKgc7Bm2ya/osOV0j2cq31IpoRx1O7Qp93cCQ=
X-Google-Smtp-Source: APXvYqyYzGr350q+R4WJrcVazUXUxwjutofoXRqQAj0hvmPeQ7Igx5rCuCZw5HPKIbMMmi5ePob4JyOz/jlP4tXreUw=
X-Received: by 2002:a9d:19ed:: with SMTP id k100mr1758515otk.297.1575452021945;
 Wed, 04 Dec 2019 01:33:41 -0800 (PST)
MIME-Version: 1.0
References: <20191203194859.917-1-wsa@the-dreams.de>
In-Reply-To: <20191203194859.917-1-wsa@the-dreams.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 4 Dec 2019 10:33:30 +0100
Message-ID: <CAMuHMdWh1y4Q2a6N9-fQpkmVoW+LMiYKr17wONUcWid7G_2xHg@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: remove whitelist for internal DMAC
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Dec 3, 2019 at 8:49 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> We know now that there won't be Gen3 SoCs with both, SYS-DMAC and
> internal DMAC. We removed the blacklisting for SYS-DMAC already, so we
> can remove the whitelisting for internal DMAC, too. This makes adding
> new SoCs easier. We keep the quirk handling, of course.
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

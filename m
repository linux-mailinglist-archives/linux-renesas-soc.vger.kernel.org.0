Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 976D111820B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2019 09:18:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbfLJISt convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Dec 2019 03:18:49 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:39285 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726391AbfLJISt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Dec 2019 03:18:49 -0500
Received: by mail-oi1-f196.google.com with SMTP id a67so9020123oib.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2019 00:18:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lEWhLg8xyDyo+AokySnAhAqg2/H3GNBuOgbj/xaIKJE=;
        b=G5YQo55RgeiDyl4ey/5H5Hg06vbkmefO0LX5ZTPJnU6mLM6OFtXDeS1Vpjg30fy8O2
         kztKqFUNpTmLzD9ATyL3P4yzJufZMT8IXPJdPNHEF4O4xbG2KYe9Js4b3HNN+x5Wzs1E
         PdCi/dqbIvsyWMuaqf7ZJYaYpKBNP9edQL9Zm1VakmnkDllfrnQzcmCUCmrGTEnL4Y6E
         F6BhOOPKYhtRURkwGjzsC/2thcle4ql46E1r6teOhecj6MPMsYO/D4xTPRNDvVFAFLKp
         lPUbUxPk5BHNCsNxPyd3/8GeatooPzMJ9jqPgD8Wb/bny7QsfsjXvsKZCLJHI1c6qR2v
         U4aQ==
X-Gm-Message-State: APjAAAXhsYCqOzUkQNPZD2FdnXntflZk8TtHGmjc5NCsuruXDxq0I0pn
        4GT2AtnPJj5sC/NXsnDaPw/izQZqecVZ5Wjgyz1UOw==
X-Google-Smtp-Source: APXvYqxwIe7pA5z2Tk6C1+CckG3ks3HnUTgvMe9Nd7Y2sEcyRlkTT4tiDydl0Gbml2baqbVe7QhWIf0g0CTksYZ1Iao=
X-Received: by 2002:aca:36c5:: with SMTP id d188mr3028888oia.54.1575965928073;
 Tue, 10 Dec 2019 00:18:48 -0800 (PST)
MIME-Version: 1.0
References: <20191209212222.9857-1-niklas.soderlund@ragnatech.se>
In-Reply-To: <20191209212222.9857-1-niklas.soderlund@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 10 Dec 2019 09:18:37 +0100
Message-ID: <CAMuHMdWgkFiCbibrxUTOYPCFF+faJhacTEbF0LHA0gDpNA+_Jw@mail.gmail.com>
Subject: Re: [PATCH] yavta: Fix usage documentation for --field option
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Niklas,

On Mon, Dec 9, 2019 at 10:23 PM Niklas Söderlund
<niklas.soderlund@ragnatech.se> wrote:
> The --field option takes an argument selecting the field order. Update
> the usage text to reflect this.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  yavta.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/yavta.c b/yavta.c
> index f83e143c051396c4..196345c323c662d3 100644
> --- a/yavta.c
> +++ b/yavta.c
> @@ -2286,7 +2286,7 @@ static void usage(const char *argv0)
>         printf("    --enum-formats              Enumerate formats\n");
>         printf("    --enum-inputs               Enumerate inputs\n");
>         printf("    --fd                        Use a numeric file descriptor insted of a device\n");
> -       printf("    --field                     Interlaced format field order\n");
> +       printf("    --field field               Set the format field order\n");

"Valid values for field are ..."?

>         printf("    --log-status                Log device status\n");
>         printf("    --no-query                  Don't query capabilities on open\n");
>         printf("    --offset                    User pointer buffer offset from page start\n");

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

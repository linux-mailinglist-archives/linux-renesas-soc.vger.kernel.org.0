Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2B89181C6A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2020 16:35:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730007AbgCKPfN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Mar 2020 11:35:13 -0400
Received: from mail-ua1-f68.google.com ([209.85.222.68]:36924 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730018AbgCKPfN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Mar 2020 11:35:13 -0400
Received: by mail-ua1-f68.google.com with SMTP id h32so887021uah.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2020 08:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9Kghikgfqn6bJuPDxQtyH2+R9nJzm0Up17r6QXJ4bTk=;
        b=JU4M54sQHyVdtZvI7PmhunKH2bA2dLX6fcFm5QWkoYEfa18AxHt2H47ITkIzrJQOAp
         QOR/sL2uRHU+qDpyEZ+Qa/nnPrvh20NPWGaqUY5QFK3COlYFxztu92rc6nNLZfu6mo2G
         JOyKopFMkKtTw0Vx6pSmLco+X2KPmlaenkLZhhBzwY6yIYOQLVF4nfHqiu7GsgKtwMYL
         6YvePqCLX9VF00q+kLGdOFVvwXdokDT2lYM/+QrYPuGpmDJTkhbc/56aEn02mod2jvRC
         lwQ/630LvuGzw7isEzojOVg9xoDuiK5hJDzLEB/vmtGb5wo3H9ELK+kop/Ov6yZ9Lhna
         2+lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9Kghikgfqn6bJuPDxQtyH2+R9nJzm0Up17r6QXJ4bTk=;
        b=VIleXnwRik7FFsW8fo+5ZS+nYGdPOMg4Itpjph+WG7v9LHQUp080xv5NzpGdZfL+Tr
         H1SN+ppDSKVulbolGjJFKofKTeZClCkxUdH5YfGN21lDijSQ2uN/SkHmhdZIvAElQhwH
         aXLSWvkQWQ5pzdYr/kWGVke2RS0cZzHyeLS4mTQB5sU743IumwJ6XiDBjegtV6Cg1hOy
         ybdJVfyamp5ARz8WYoE44ZeHMLsHZ47No139D8Pm0bT/1vY487z8XOd9Sd44O6nzL9TK
         9gt+XDh529aFsdVjWKQj18JcDQoe38DqH4/IdvKsTyyPNtcZVFKpVnH2j9Le4BdlegdF
         nQnQ==
X-Gm-Message-State: ANhLgQ31zCVo2AUN+5zyTYzplXkXWCXgdsFiQ5kaiJLoKviU9AS6ZIXW
        DMgDlddtf7XQTsMle4P88SirjT/Uj7CDjl7qKFBwQkIO
X-Google-Smtp-Source: ADFU+vtTbcphEQGum/n9c6up7FXly2NfnVcBzg4XyXxcw20FJvQU+djxbXWDsPchjs8h5CBXKbeRZiFqWI/9Pd8s1sI=
X-Received: by 2002:a9f:3046:: with SMTP id i6mr2042779uab.15.1583940910358;
 Wed, 11 Mar 2020 08:35:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200302093534.9055-1-geert+renesas@glider.be>
In-Reply-To: <20200302093534.9055-1-geert+renesas@glider.be>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 11 Mar 2020 16:34:34 +0100
Message-ID: <CAPDyKFpK2sTo9EDN+3yZgcEkCWTc=J-Z-+-B-QAExNwMPibF0w@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: Use BITS_PER_LONG helper
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 2 Mar 2020 at 10:35, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
>
> Use the existing BITS_PER_LONG helper definition instead of calculating
> this value.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/renesas_sdhi.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
> index 7a1a741547f25de5..2a4c83a5f32ef8e2 100644
> --- a/drivers/mmc/host/renesas_sdhi.h
> +++ b/drivers/mmc/host/renesas_sdhi.h
> @@ -60,7 +60,7 @@ struct renesas_sdhi {
>         bool doing_tune;
>
>         /* Tuning values: 1 for success, 0 for failure */
> -       DECLARE_BITMAP(taps, BITS_PER_BYTE * sizeof(long));
> +       DECLARE_BITMAP(taps, BITS_PER_LONG);
>         unsigned int tap_num;
>         unsigned long tap_set;
>  };
> --
> 2.17.1
>

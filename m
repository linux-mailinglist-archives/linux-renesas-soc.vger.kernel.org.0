Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B78C644E7AA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Nov 2021 14:42:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231736AbhKLNph (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Nov 2021 08:45:37 -0500
Received: from mail-ua1-f46.google.com ([209.85.222.46]:46857 "EHLO
        mail-ua1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231436AbhKLNph (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Nov 2021 08:45:37 -0500
Received: by mail-ua1-f46.google.com with SMTP id az37so18813796uab.13;
        Fri, 12 Nov 2021 05:42:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qMfHRmP22y4/3s7/jbtocgrbzQ6bgDZGTpf7t5xiT0A=;
        b=bhxXK/1Tpgs48lMZ3ZCUCO6xtKFzj+JHmzW37XIAbyKlFLHDYgT49I3w1y5LgU8+as
         ExLQ6CgjsKBbENJnof1/amUWPec9K+3k1CaMr6+ofLCMujShyZMAhPbbQDptG1emacoq
         DQzu7diUQl9U+MrlAU83sgzSigPJmcURJWK8ZRGQRNXOyJiNwEqD+bqH0UbgeZEYYP4t
         wTaB7l5HM0RH+vuWhg1VaWBq37pINGQZ2YMMjw3r+YOt88PBQW8AjkbrpxxqKYmPGVFY
         ryv9dU4ebSLM52ppbZW7KQ5rsgOncdzG7ZBEhymAxbnIL1JATtLnX7Q0sDv2sh/Gx9Aw
         sebg==
X-Gm-Message-State: AOAM533PPOa3VQ1swzCdiT5Y8XXjjKE+squaExIvxLhn30vc1h47uKXy
        8VF7RkbKp0dp++CgANUKYAahD5PbzSld6Q==
X-Google-Smtp-Source: ABdhPJym03PMswYzXn+lBBPyXt4o/ZmSEMFxjMlKrKB3mYSRruRjd8caLmYvpxwcpp8DEwEF1nOXRg==
X-Received: by 2002:a05:6102:390c:: with SMTP id e12mr10192296vsu.10.1636724565858;
        Fri, 12 Nov 2021 05:42:45 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id t20sm4327062vsj.27.2021.11.12.05.42.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 05:42:45 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id n6so2303038uak.1;
        Fri, 12 Nov 2021 05:42:45 -0800 (PST)
X-Received: by 2002:a05:6102:1354:: with SMTP id j20mr10116053vsl.41.1636724565266;
 Fri, 12 Nov 2021 05:42:45 -0800 (PST)
MIME-Version: 1.0
References: <20211110191610.5664-1-wsa+renesas@sang-engineering.com> <20211110191610.5664-7-wsa+renesas@sang-engineering.com>
In-Reply-To: <20211110191610.5664-7-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Nov 2021 14:42:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWbcQ6FRFqjV-o82n1UZ2SHF-tJ052ytGPT=XgKb7DaPQ@mail.gmail.com>
Message-ID: <CAMuHMdWbcQ6FRFqjV-o82n1UZ2SHF-tJ052ytGPT=XgKb7DaPQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 06/21] clk: renesas: rcar-gen3: remove outdated SD_SKIP_FIRST
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

CC clk

On Wed, Nov 10, 2021 at 8:16 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> We handle it differently meanwhile.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Changes since RFC v1:
> * fixed subject prefix
> * added tag from Geert
>
>  drivers/clk/renesas/rcar-gen3-cpg.c | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
> index aa0797b98e89..c4b36c90e159 100644
> --- a/drivers/clk/renesas/rcar-gen3-cpg.c
> +++ b/drivers/clk/renesas/rcar-gen3-cpg.c
> @@ -397,29 +397,20 @@ static u32 cpg_quirks __initdata;
>
>  #define PLL_ERRATA     BIT(0)          /* Missing PLL0/2/4 post-divider */
>  #define RCKCR_CKSEL    BIT(1)          /* Manual RCLK parent selection */
> -#define SD_SKIP_FIRST  BIT(2)          /* Skip first clock in SD table */
>
>
>  static const struct soc_device_attribute cpg_quirks_match[] __initconst = {
>         {
>                 .soc_id = "r8a7795", .revision = "ES1.0",
> -               .data = (void *)(PLL_ERRATA | RCKCR_CKSEL | SD_SKIP_FIRST),
> +               .data = (void *)(PLL_ERRATA | RCKCR_CKSEL),
>         },
>         {
>                 .soc_id = "r8a7795", .revision = "ES1.*",
> -               .data = (void *)(RCKCR_CKSEL | SD_SKIP_FIRST),
> -       },
> -       {
> -               .soc_id = "r8a7795", .revision = "ES2.0",
> -               .data = (void *)SD_SKIP_FIRST,
> +               .data = (void *)(RCKCR_CKSEL),
>         },
>         {
>                 .soc_id = "r8a7796", .revision = "ES1.0",
> -               .data = (void *)(RCKCR_CKSEL | SD_SKIP_FIRST),
> -       },
> -       {
> -               .soc_id = "r8a7796", .revision = "ES1.1",
> -               .data = (void *)SD_SKIP_FIRST,
> +               .data = (void *)(RCKCR_CKSEL),
>         },
>         { /* sentinel */ }
>  };
> --
> 2.30.2

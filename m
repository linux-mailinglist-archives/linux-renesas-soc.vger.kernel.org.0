Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E32F51D40F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 May 2022 11:13:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1390358AbiEFJQo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 May 2022 05:16:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1390359AbiEFJQn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 May 2022 05:16:43 -0400
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FE5A63391
        for <linux-renesas-soc@vger.kernel.org>; Fri,  6 May 2022 02:13:01 -0700 (PDT)
Received: by mail-qt1-f176.google.com with SMTP id h3so5460677qtn.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 May 2022 02:13:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QH06rInB0KsgPSjAeJ4Tjq2UMmhQrEdFYqEPx/i2cq4=;
        b=cp2rsgZ65CATqd84yWeO17ywZ6HAA5UPSu9Dp2nMwjFIzeWRUmVvhaxEf9NRyvTB5B
         aNorf5bmfsP0iEQQcvxam1MzuDC45ySL93uy5FJ3kzRJn2pDFgA/dT5zVE7Xnuw8ZwJO
         gEH8rGOcAPn0hDpKBjudTuOBleJ6UZN6YMGoEZkN8hg+di2Df9zCo/ij8EMD6s2Kgj0q
         yS4wymXXF6Mc+XCh34NcYIId8HqGzjdDYKhEDbeH4vlfhlaazMB6OjhFqGmP1ERiXl45
         sYLk8A2QIP2F+jYAndCnhloSAco905I+LpcPCGZR1soVglr4GGuoz1GmBVhgjGMHNA72
         gbYA==
X-Gm-Message-State: AOAM533d3a4lrvHrt7BUwmaHfU8ZG/aUsmH8OUgtv0k9y24Fa6KQYxpD
        Jm0AwJz3pNWSFWQHgYu4eaol2dX9ikKQ/g==
X-Google-Smtp-Source: ABdhPJwaWFG78/DI+PDfHJJ23kBlfJqYQKjYQFlHGYiLo2o8SYz+ADwDGz16ArqsgOXyyV1wRaQcEA==
X-Received: by 2002:a05:622a:608:b0:2f3:a220:aa40 with SMTP id z8-20020a05622a060800b002f3a220aa40mr1880556qta.304.1651828379923;
        Fri, 06 May 2022 02:12:59 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id u186-20020ae9d8c3000000b0069fc13ce209sm2112461qkf.58.2022.05.06.02.12.59
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 May 2022 02:12:59 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id y76so11831813ybe.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 May 2022 02:12:59 -0700 (PDT)
X-Received: by 2002:a05:6902:352:b0:63e:94c:883c with SMTP id
 e18-20020a056902035200b0063e094c883cmr1460553ybs.365.1651828379169; Fri, 06
 May 2022 02:12:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220428135058.597586-1-yoshihiro.shimoda.uh@renesas.com> <20220428135058.597586-3-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20220428135058.597586-3-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 6 May 2022 11:12:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWCdVmygLnDWhdF6nrHxNXqe+DkzqofZyYjFm6NKxbYeQ@mail.gmail.com>
Message-ID: <CAMuHMdWCdVmygLnDWhdF6nrHxNXqe+DkzqofZyYjFm6NKxbYeQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] arm64: dts: renesas: Add Renesas R8A779G0 SoC support
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Thu, Apr 28, 2022 at 3:51 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add initial support for the Renesas R8A779G0 (R-Car V4H) SoC.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 122 ++++++++++++++++++++++
>  1 file changed, 122 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a779g0.dtsi
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> new file mode 100644
> index 000000000000..4b5d62512244
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> @@ -0,0 +1,122 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause)
                               ^
There's an opening parenthesis missing, also in the white-hawk board
DTS files.  I'll fix it up before sending my pull request for soc.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

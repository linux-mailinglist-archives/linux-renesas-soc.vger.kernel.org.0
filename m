Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EDD2510039
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Apr 2022 16:16:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233719AbiDZOTy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Apr 2022 10:19:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238012AbiDZOTy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Apr 2022 10:19:54 -0400
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2573235DEF
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Apr 2022 07:16:47 -0700 (PDT)
Received: by mail-qv1-f49.google.com with SMTP id hu11so14159715qvb.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Apr 2022 07:16:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VED+lSNE8kO45VKCHsfjJD1ybVZcVKUNFdwTJFHQQr8=;
        b=293rqWOY0rloe12jVnUHJq4jRQ2nvt6U803W9rcU1nJ37pnMXs210nNioF9/+RVDST
         sNIOS8AjThUqNhaEsmBMh2rFYex7Cl/6WZ2GmHvjoq/vvJNTa4KIzHTqvHwsk7XvGauh
         vFj/aTN0sbg/V7B4ZA6BfK+Nzb9WE6iQa4o6S23GL9bfBUc2tPT72yP9LIGOZVhy9WhF
         7ta4PxQ/5kHSu0jlwqI9TLjI8dbMF4EMc/uyhcWEjscPHQk2jN9aDwPlHi0E5N/I9vyT
         AJbkk41JEaLi2+PwFGfhZxinTHj9zuX8OQb03+ibKo/JCgv7DB1NORfK3vy3+C/sFZxK
         UJiw==
X-Gm-Message-State: AOAM530Mfw4+JEaI6IIzy502ykLvAP5d4h+crQgaHWL193q1sTQoahRz
        5/jWA3vScae0AfqURMlbJhw0IUweJYXfuw==
X-Google-Smtp-Source: ABdhPJxpg7E9hhdHuV4UJ1ITatDmNYFD/69Q42hV3b5o7BreJCx3WvqXS1U3smFceHg4USst0vpLAA==
X-Received: by 2002:ad4:5ae8:0:b0:456:4ae4:d990 with SMTP id c8-20020ad45ae8000000b004564ae4d990mr1115289qvh.33.1650982606098;
        Tue, 26 Apr 2022 07:16:46 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id e9-20020ac84e49000000b002f1fcda1ac7sm8431604qtw.82.2022.04.26.07.16.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Apr 2022 07:16:45 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id m128so15264007ybm.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Apr 2022 07:16:45 -0700 (PDT)
X-Received: by 2002:a5b:984:0:b0:63f:8c38:676c with SMTP id
 c4-20020a5b0984000000b0063f8c38676cmr21693898ybq.393.1650982605563; Tue, 26
 Apr 2022 07:16:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220321154232.56315-1-phil.edworthy@renesas.com> <20220321154232.56315-8-phil.edworthy@renesas.com>
In-Reply-To: <20220321154232.56315-8-phil.edworthy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 26 Apr 2022 16:16:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUxpt56iBMKroQN01ySg61JwxUZazENDhn-41i65Gtm4Q@mail.gmail.com>
Message-ID: <CAMuHMdUxpt56iBMKroQN01ySg61JwxUZazENDhn-41i65Gtm4Q@mail.gmail.com>
Subject: Re: [PATCH 07/14] soc: renesas: Identify RZ/V2M SoC
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Phil,

On Mon, Mar 21, 2022 at 4:44 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> Add support for identifying the RZ/V2M (R9A09G011) SoC.
> Note that the SoC does not have a identification register.
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -308,6 +308,11 @@ config ARCH_R9A07G054
>         help
>           This enables support for the Renesas RZ/V2L SoC variants.
>
> +config ARCH_R9A09G011
> +       bool "ARM64 Platform support for RZ/V2M"
> +       help
> +         This enables support for the Renesas RZ/V2M SoC.
> +
>  endif # ARM64

This part is superseded by "[PATCH v2 06/13] soc: renesas: Add RZ/V2M
(R9A09G011) config option".

The rest looks good to me (pending acceptance of the "sys" DT
bindings).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

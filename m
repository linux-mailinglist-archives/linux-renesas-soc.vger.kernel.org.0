Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CE4A67B32F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jan 2023 14:24:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234969AbjAYNYk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Jan 2023 08:24:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230257AbjAYNYj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jan 2023 08:24:39 -0500
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6DF0CA3D
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jan 2023 05:24:38 -0800 (PST)
Received: by mail-qt1-f170.google.com with SMTP id a25so15838950qto.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jan 2023 05:24:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zlDIad8pL+vplm5c98gWptczmUFCtiodIovuziGdXVE=;
        b=wXVrwSDifBv5OrBTr6nuC+qmMBvumk5XQSRWThJ/awHxj1208JCfmZNpCFlS+CSPEl
         c6/mjg8r+3gQF230ir0EUse4V26/vVJbrmXV5KZmVqr5rhq9ueCfUZyG8427O3zvZIsz
         1lgyD3mCiW9UNvB3+odWLt89T+dPaBoZoU2lyOJ70SVWxBOw03S1SBEc1NuZkvssUISo
         ybeoKrLXgw3GkKMGm7aVRZndNjdCQ9tk0VEnuqoPMERFNXR14oJlSW3J6p7uIkbot8I+
         4yHqrdiQVctcDCqwtHl0/FPgOzYF1ZDUOFZLwcfT6QGif+TOuXilW0tyfQxFbtTvIwJP
         J7OA==
X-Gm-Message-State: AFqh2krBEXfx9PJFuPqLcC+Qd57pVqUzI9OU7w7js5NmelAsGZQf6EKR
        +eRqGucjgv0X2c2g1xqPCAW8IPlhV0HyYw==
X-Google-Smtp-Source: AMrXdXt6k+7o3MGM2c9ZQIyUEhMM815FGJlWTrgjDBAYrLMblHwmEl1JgHeeyZQJkUW1FEcg+qi3IQ==
X-Received: by 2002:ac8:6f09:0:b0:3b6:35b2:5803 with SMTP id bs9-20020ac86f09000000b003b635b25803mr51774572qtb.17.1674653077698;
        Wed, 25 Jan 2023 05:24:37 -0800 (PST)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id b14-20020ac8754e000000b003ab43dabfb1sm3266904qtr.55.2023.01.25.05.24.37
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 05:24:37 -0800 (PST)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-50660e2d2ffso46897387b3.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jan 2023 05:24:37 -0800 (PST)
X-Received: by 2002:a81:1216:0:b0:506:6b5d:523c with SMTP id
 22-20020a811216000000b005066b5d523cmr155361yws.283.1674653077144; Wed, 25 Jan
 2023 05:24:37 -0800 (PST)
MIME-Version: 1.0
References: <87tu0nz3xr.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87tu0nz3xr.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 25 Jan 2023 14:24:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUTrtpHzPzPNMWc1GQL_7kYOX1x72OzDiNy80ujsvFRWw@mail.gmail.com>
Message-ID: <CAMuHMdUTrtpHzPzPNMWc1GQL_7kYOX1x72OzDiNy80ujsvFRWw@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a779a0: tidyup DMAC name on SYS-DMAC
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On Thu, Jan 19, 2023 at 2:52 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> "sydm" is bit name. Let's rename it as common "sys-dmac".
> This patch fixes the numbering, too.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
> @@ -176,8 +176,8 @@ static const struct mssr_mod_clk r8a779a0_mod_clks[] __initconst = {
>         DEF_MOD("scif3",        704,    R8A779A0_CLK_S1D8),
>         DEF_MOD("scif4",        705,    R8A779A0_CLK_S1D8),
>         DEF_MOD("sdhi0",        706,    R8A779A0_CLK_SD0),
> -       DEF_MOD("sydm1",        709,    R8A779A0_CLK_S1D2),
> -       DEF_MOD("sydm2",        710,    R8A779A0_CLK_S1D2),
> +       DEF_MOD("sys-dmac0",    709,    R8A779A0_CLK_S1D2),
> +       DEF_MOD("sys-dmac1",    710,    R8A779A0_CLK_S1D2),

Actually Rev 0.5 of the documentation does call the channels "SYS-DMAC1"
and "SYS-DMAC2".
Shall we use that numbering?
We also have labels "dmac1" and "dmac2" in DTS.

>         DEF_MOD("tmu0",         713,    R8A779A0_CLK_CL16MCK),
>         DEF_MOD("tmu1",         714,    R8A779A0_CLK_S1D4),
>         DEF_MOD("tmu2",         715,    R8A779A0_CLK_S1D4),

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

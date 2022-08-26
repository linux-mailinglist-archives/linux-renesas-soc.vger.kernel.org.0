Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B73515A2715
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Aug 2022 13:48:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230132AbiHZLst (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Aug 2022 07:48:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbiHZLss (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Aug 2022 07:48:48 -0400
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 632A6D0756
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Aug 2022 04:48:47 -0700 (PDT)
Received: by mail-qv1-f42.google.com with SMTP id w4so597852qvs.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Aug 2022 04:48:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=lK5luDghnd/dV3HAEqHuXDWS75i39JeDGFKWw/WnWlI=;
        b=qfOF/Qmof0Ka4HimtM8zjmyyCLwYcWRX3W5y6ZQLX0D9k+8mex54CExli60cdi/yQ3
         zShWO2c7eolsn2ToBXgdzjJ7ml/PdkXWduTcF/GTZlm3YsOwDOYVzo/09ptcUkGusNPt
         8Rb2bG6qlTh7A/PC6/69Nd3esHMyg5VluPJXKqDW4sSkqaApYM2kLVCfobh00QIe7c72
         ZwHJvWiCfDCQnmW3jmtmo1wxoe7lZ0x5H/RETc7/byhNbysFsW5JF6dlU5w9N7+nVEz+
         zcJqC9eamb7aDWC4p4U9cyXrasHsYTDzKtPuvKuKZKIiabZcHiKVkyWXJ5zovSEXcta3
         k/IA==
X-Gm-Message-State: ACgBeo1AGYRfK3OyU247lFF7SoVmT0PqR23Uup/4921ypsSEd1PW+fFW
        mS89zR2v/wgqnTOeoYCuiWWVbKKEsSaJ3w==
X-Google-Smtp-Source: AA6agR4bfuQVD9nozewhsD/9SGeUMdKkZSWS4wUXPQYu/HRC/oqCvU+YPcXlyFN1Uozp0Uqo95S4IQ==
X-Received: by 2002:a05:6214:c6f:b0:497:7e5:682b with SMTP id t15-20020a0562140c6f00b0049707e5682bmr7401892qvj.105.1661514526323;
        Fri, 26 Aug 2022 04:48:46 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id j15-20020a05620a288f00b006a793bde241sm1561739qkp.63.2022.08.26.04.48.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 04:48:46 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-33dba2693d0so28940537b3.12
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Aug 2022 04:48:45 -0700 (PDT)
X-Received: by 2002:a25:8e84:0:b0:696:466c:baa with SMTP id
 q4-20020a258e84000000b00696466c0baamr4748273ybl.604.1661514525501; Fri, 26
 Aug 2022 04:48:45 -0700 (PDT)
MIME-Version: 1.0
References: <87y1vf92do.wl-kuninori.morimoto.gx@renesas.com> <87tu6392cp.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87tu6392cp.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 26 Aug 2022 13:48:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUtgGGnxOrVRtObedDbiWSr+PhUO+nCd2-22pLEpb7u=Q@mail.gmail.com>
Message-ID: <CAMuHMdUtgGGnxOrVRtObedDbiWSr+PhUO+nCd2-22pLEpb7u=Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: renesas: Add V3H2 Condor-I board support
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Andrey Dolnikov <andrey.dolnikov@cogentembedded.com>,
        Valentine Barshak <valentine.barshak@cogentembedded.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>
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

Hi Morimoto-san,

On Tue, Aug 23, 2022 at 3:26 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> This patch adds r8a77980A V3H2 (= r8a77980 ES2) Condor-I board
> basic support.
>
> Signed-off-by: Andrey Dolnikov <andrey.dolnikov@cogentembedded.com>
> Signed-off-by: Valentine Barshak <valentine.barshak@cogentembedded.com>
> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a77980a-condor-i.dts
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for the Condor-I board on r8a77980A (ES2.0)
> + *
> + * Copyright (C) 2022 Renesas Electronics Corp.
> + */
> +
> +/dts-v1/;
> +#include "r8a77980a.dtsi"
> +#include "condor-common.dtsi"
> +
> +/ {
> +       model = "Renesas Condor-I board based on r8a77980A (ES2.0)";
> +

No need for a blank line.

> +       compatible = "renesas,condor-i", "renesas,condor",
> +                    "renesas,r8a77980a", "renesas,r8a77980";

Please drop compatibility with "renesas,condor", as per my comment on
"[PATCH v2 4/4] dt-bindings: arm: renesas: Document Renesas R-Car Gen3
V3H2 Condor-I board".

> +};

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

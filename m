Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 953D752D015
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 May 2022 12:07:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236076AbiESKGp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 19 May 2022 06:06:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234132AbiESKGm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 May 2022 06:06:42 -0400
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A6053CFEE;
        Thu, 19 May 2022 03:06:39 -0700 (PDT)
Received: by mail-qk1-f172.google.com with SMTP id 135so1832986qkm.4;
        Thu, 19 May 2022 03:06:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XsML1Fzd0mI70YY65ti5KucCY9s3M5cUl1m7qMWv0qk=;
        b=0V02GX3/a2HMKyanPH8UuMvQo9u23+CvmTbsVrsBrWy1XEX6hAOSUxpEPHsfXku8e3
         kwlKJgjUPLaZ6qYTx9CswbS4PiwA65SdllBQxR+8ms/XGWjRA5OZO/69crMAk0wmHKtT
         q4Hb5lRRD8C+vabRoqmDE49532pOGV1fZ9sZDbP3JfL+POQvhsEaMgK+1jV3s8HfIX32
         +bt5EaY/9uXVomQNuMFTtM4Xfp2YHeEYM7iSQvw9f00m6Pvu3eJ1+gZulsQegZQmmO5J
         6wbofnHU1fGNPOHJjzhSEi5P5ckICvQdWbK3m/GpTA0UDFK6FdMcw5+uhjQFKuWDRYXT
         nzFw==
X-Gm-Message-State: AOAM533otcVr+dkK4O/5Mh+bCIPcF1LiKUTSDMaicnbRdjTYTi04Mv9O
        EafSeR1iiYkn82CHixJaEMlfceK8l5kqNA==
X-Google-Smtp-Source: ABdhPJwC1XxMTR9a+P0h35WQmovHWnkr0/jvfdGsYpSF49xVSHQp07818qCvBoJC54A6uY+E4QcwWw==
X-Received: by 2002:a05:620a:4096:b0:6a0:40d1:450a with SMTP id f22-20020a05620a409600b006a040d1450amr2451956qko.506.1652954798444;
        Thu, 19 May 2022 03:06:38 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id h11-20020ac85e0b000000b002f90e768db8sm1107958qtx.59.2022.05.19.03.06.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 May 2022 03:06:37 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id v71so8164924ybi.4;
        Thu, 19 May 2022 03:06:37 -0700 (PDT)
X-Received: by 2002:a25:e7ce:0:b0:64d:6028:96b9 with SMTP id
 e197-20020a25e7ce000000b0064d602896b9mr3456532ybh.365.1652954797149; Thu, 19
 May 2022 03:06:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220517081645.3764-1-phil.edworthy@renesas.com> <20220517081645.3764-2-phil.edworthy@renesas.com>
In-Reply-To: <20220517081645.3764-2-phil.edworthy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 19 May 2022 12:06:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW80WGdQfK2zyYxxk=uvuYuRapVHgrNHiEkfS=1kQe-bQ@mail.gmail.com>
Message-ID: <CAMuHMdW80WGdQfK2zyYxxk=uvuYuRapVHgrNHiEkfS=1kQe-bQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: renesas: r9a09g011: Add ethernet nodes
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
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

On Tue, May 17, 2022 at 10:17 AM Phil Edworthy
<phil.edworthy@renesas.com> wrote:
> Add Ethernet nodes to SoC dtsi.
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2:
>  - Fix interrupt names

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.20.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

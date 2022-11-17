Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1D1662E57A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Nov 2022 20:51:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240464AbiKQTvP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Nov 2022 14:51:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240298AbiKQTvO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Nov 2022 14:51:14 -0500
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79DD385156;
        Thu, 17 Nov 2022 11:51:13 -0800 (PST)
Received: by mail-qk1-f172.google.com with SMTP id x21so2023117qkj.0;
        Thu, 17 Nov 2022 11:51:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aJf7/ggNbO5ptXt326sMe/Qk+cWkkDWccwoW4jqERjQ=;
        b=QZk8papSIgNWuTAspyxmiFRqOnOtPNyktBbJWcmUdMSz9XEyK5+5wCZmJY3Xwe/CTr
         gpmhxqpAIi8UIJrrAPYl0hVgkNKUS4b0f3I5LMp/bnUVUkazffPEqD00Dwv4OOxF3OQR
         qOcTjkPzN0TvptjSDv214Ai9yiM73Cq0jaDL1+IBij4QDe7hDVsX5imjenrLU/l4yOAq
         BB4yUSSfuT72Qqaurd5OtPYPiOES35LUVU++MV154hVSEocC8avLRM/nPqXlh92DIXel
         E4zaBC0Izl45BmnaMHtfZ/zvL0j+Ns43hwjcNswVtejib0mYGs7xY8+51+BLZ8KhYn/n
         6eYg==
X-Gm-Message-State: ANoB5plbSe8agMJnEoBLFSJoxuhUgMXmveaPNYI5qCI8rWFZ/HDKtKk+
        T4RkdE9s4UViSTBTFCNru9Z+8+34aJYANg==
X-Google-Smtp-Source: AA0mqf52Rx4lRV5pLVQ+wHwGHNOE8ctKOGUL1q3e9owobO5CxHg2jSo0PsY7tMfShbH1zw8T0sG7IA==
X-Received: by 2002:a05:620a:31a0:b0:6fa:c94:5c06 with SMTP id bi32-20020a05620a31a000b006fa0c945c06mr3141054qkb.91.1668714672362;
        Thu, 17 Nov 2022 11:51:12 -0800 (PST)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id p16-20020a05620a057000b006fb8239db65sm957432qkp.43.2022.11.17.11.51.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 11:51:11 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-37063f855e5so29511047b3.3;
        Thu, 17 Nov 2022 11:51:11 -0800 (PST)
X-Received: by 2002:a81:4f4c:0:b0:357:66a5:bb25 with SMTP id
 d73-20020a814f4c000000b0035766a5bb25mr3489069ywb.383.1668714671276; Thu, 17
 Nov 2022 11:51:11 -0800 (PST)
MIME-Version: 1.0
References: <20221116102140.852889-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20221116102140.852889-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Nov 2022 20:51:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWC5_+pLbewtSU=DkQ0pepTyjfKa9fx1btLt8=U0Eg=Yw@mail.gmail.com>
Message-ID: <CAMuHMdWC5_+pLbewtSU=DkQ0pepTyjfKa9fx1btLt8=U0Eg=Yw@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Add SoC identification support for RZ/V2M
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Nov 16, 2022 at 11:21 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> This patch series aims to add SoC identification support for RZ/V2M.
>
> v3->v4:
>  * Added Rb tags from Krzysztof and Geert
>  * Fixed the example indentation from 3 spaces-> 2 spaces.

Thanks, queued in renesas-devel for v6.2.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

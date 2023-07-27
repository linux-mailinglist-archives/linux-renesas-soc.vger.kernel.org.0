Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EFCD76539B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jul 2023 14:22:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231792AbjG0MWh convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 Jul 2023 08:22:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233907AbjG0MWe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Jul 2023 08:22:34 -0400
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05FCB2D76;
        Thu, 27 Jul 2023 05:22:20 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-583c48a9aa1so10080567b3.1;
        Thu, 27 Jul 2023 05:22:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690460540; x=1691065340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FAw6njM8FcxAdrqMyGlHw9zPc9fo/JXNI4sWpTpk0wk=;
        b=hM6cjSR8lDACFQjFDc4WcG2QVz2P0gJL/lhKeXRqB1A0a1ABSt3Xj4974Dcbh3A4j1
         8glyd4J0CwOORCmnB7AgCm+ZwDCFREQny1s3sYEPhufIlTEBHZ8UDrD4HNvIlRpYJ4si
         EWykvhgsRYCtK5CbrvokY3ERt1Qbv5i3WcgkbPzJkQAetwijtz/6iM7w6XcwcxFyK8il
         nWj44Xn+YnUdcC8A+uteju8DszSlHBLyufwfe28F5tGCpLrQUR+8a8ney1tjIeb9DUnG
         1c0w0KlUQKcy5XMGy9YH7AYvH3Q9JwAG7WmWmIW0/3Rf098YUNLJ2l4I1HcjAiTalqXc
         Zjag==
X-Gm-Message-State: ABy/qLY3N0iySCUdWo4ug4f60f6xqlH8syFgXZo6wGd7VEMilVPz2F2i
        dqexdlJFPIPs6uLk3f4ESfUhYWVOH7LoLw==
X-Google-Smtp-Source: APBJJlFpc1j8NpZ7xse6fKJYB3GWSMrkcMd+sTv8MEsLXCVU+3ZV+widtneNZyiYtg0SJNgipjm22w==
X-Received: by 2002:a0d:dfce:0:b0:56f:fbc6:3b0 with SMTP id i197-20020a0ddfce000000b0056ffbc603b0mr5071787ywe.14.1690460539795;
        Thu, 27 Jul 2023 05:22:19 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id o189-20020a0dccc6000000b005773ca61111sm371281ywd.42.2023.07.27.05.22.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 05:22:19 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-584388ec441so10025327b3.3;
        Thu, 27 Jul 2023 05:22:19 -0700 (PDT)
X-Received: by 2002:a25:bc89:0:b0:cec:81af:cf92 with SMTP id
 e9-20020a25bc89000000b00cec81afcf92mr4089498ybk.36.1690460539411; Thu, 27 Jul
 2023 05:22:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230727081848.100834-1-biju.das.jz@bp.renesas.com> <20230727081848.100834-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230727081848.100834-5-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 27 Jul 2023 14:22:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX1E+8xKRdrLxOmtehSK+PdeBHM9KdQ1tg9C5bD7a4p2g@mail.gmail.com>
Message-ID: <CAMuHMdX1E+8xKRdrLxOmtehSK+PdeBHM9KdQ1tg9C5bD7a4p2g@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] arm64: dts: renesas: r9a07g043: Add MTU3a node
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jul 27, 2023 at 10:19 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add MTU3a node to R9A07G043 (RZ/{G2UL,Five}) SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * No change

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.6.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

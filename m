Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6236A5171A0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 May 2022 16:32:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359311AbiEBOgW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 May 2022 10:36:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1385562AbiEBOgU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 May 2022 10:36:20 -0400
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93FB1634E;
        Mon,  2 May 2022 07:32:51 -0700 (PDT)
Received: by mail-qv1-f51.google.com with SMTP id eq14so685408qvb.4;
        Mon, 02 May 2022 07:32:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EE2i233vdQfSqBDZ5PxwBzq/5+fsfGTCjKO+MqVEgAU=;
        b=K5cUGI4QHF1KRQUso22p7acF7HqwFhS1q2Xgm9E2mxGPa8d7mYrtDHT5RRs4XOYBdG
         MS3sKzm8lE36tmR2dUH99BK6PjkId4fZDtlnAOuL2h6xFFoofGtNeY5EopCkwTgtK90Q
         mF3Kivq/WRz7p81ciZMvZQ5LSnk7djjuyqDPKy7byUutABJqcdDyRazy9xdXw4+kFHcO
         b+X5BouONRzHzSFnusQfdwQkq841VsxsLrwAuOBB22zZODwQlezTFdbhe3vPrMfi17+N
         TJaYSvru1pW5cFqG5UgNDhPMhYOYVUPTQPhQUEB4nMoK5BY/mX+v6ez6H/zjiMaWIMIB
         L4ZA==
X-Gm-Message-State: AOAM530sRqO0hPXGN2CYv74Ww9pewjqxU6WfdeDT5mcVADxXn7ZUkopQ
        PaL/oKJErJ1xBnsERV3VFiWTA8lJIjARzQ==
X-Google-Smtp-Source: ABdhPJzqoW6vSTkljcph81eeHgkR8A40DfLI0h6+GhA6jQkFkgY6PoX6G4cDiPicn6I14T1zLBBYog==
X-Received: by 2002:a05:6214:20af:b0:458:663f:ddf5 with SMTP id 15-20020a05621420af00b00458663fddf5mr9556507qvd.113.1651501970205;
        Mon, 02 May 2022 07:32:50 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id l184-20020a3789c1000000b0069fc13ce21csm4425781qkd.77.2022.05.02.07.32.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 May 2022 07:32:49 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id i38so26280113ybj.13;
        Mon, 02 May 2022 07:32:49 -0700 (PDT)
X-Received: by 2002:a25:4506:0:b0:648:cfc2:301d with SMTP id
 s6-20020a254506000000b00648cfc2301dmr10401028yba.380.1651501969269; Mon, 02
 May 2022 07:32:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220428133156.18080-1-biju.das.jz@bp.renesas.com> <20220428133156.18080-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220428133156.18080-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 2 May 2022 16:32:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXrzU2=1J_Q_w02dvY+4Sm2dth_7FXe56XKUsAofGj6qA@mail.gmail.com>
Message-ID: <CAMuHMdXrzU2=1J_Q_w02dvY+4Sm2dth_7FXe56XKUsAofGj6qA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: renesas: r9a07g054: Fix external clk
 node names
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Apr 28, 2022 at 3:32 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add suffix '-clk' for can and extal clk node names and replace the
> clk node names audio_clk{1,2} with audio{1,2}-clk as per the device
> tree specification.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3->v4:
>  * Replaced clk node names audio_clk{1,2} with audio{1,2}-clk.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

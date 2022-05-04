Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C5FB519A44
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 May 2022 10:44:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346562AbiEDIsW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 May 2022 04:48:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346571AbiEDIsU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 May 2022 04:48:20 -0400
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2521B24599;
        Wed,  4 May 2022 01:44:45 -0700 (PDT)
Received: by mail-qv1-f51.google.com with SMTP id kj8so438138qvb.6;
        Wed, 04 May 2022 01:44:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DvXySfTNMyD7wPbtBaaUMhVUjb1hJI7Yi3h6ioVr9FY=;
        b=LZfB6DJWF6lSsy/pVWL6lGpboswTpHVChdF3pXuUgo9st85uqCeg68zwyI+MAg90AV
         jz1U2eeZCzM3gkV9rqr/EBjEKbewFIkSepgoZ6ciVg+x/LK88kEoAMgtsuif0vrPjk8+
         qtrVaCUYFjzOCaLZGU5k/BIrXm/mugjimosiILRADhLOEufBhCNDxXMFEtD4TwoJEOHa
         /n2My57Ipk42BQTYYzu5iSdXpWBDK9aAbB1aR+NRYVxH9LAzKg4Tf/oTqycZZkcJ+onp
         pDYVrUSbHgUYhoCuQK7qU22LW5k0EvnN/UYWi0ho2MKPq8TCiq/Mkcqz8yjS1yATR/tT
         rMww==
X-Gm-Message-State: AOAM533uMNpHhVbifYjLGt58jnsxNLSmF81aga+pxgWsoe3UeiYYdbBM
        exFZ9pVE8AUgImI9QXTYyvqlV14qmcAw4Q==
X-Google-Smtp-Source: ABdhPJxyqRpjKKpIBVW+cLcuKnKcie3G40qA45Zjzd67xgAvqTPUbIenCqtUQIshJr428ZhvAM7zJQ==
X-Received: by 2002:a0c:e146:0:b0:458:10e4:d62f with SMTP id c6-20020a0ce146000000b0045810e4d62fmr16341499qvl.131.1651653884116;
        Wed, 04 May 2022 01:44:44 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id f64-20020a37d243000000b0069fc13ce224sm7560838qkj.85.2022.05.04.01.44.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 May 2022 01:44:43 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-2f7bb893309so7693057b3.12;
        Wed, 04 May 2022 01:44:43 -0700 (PDT)
X-Received: by 2002:a81:2143:0:b0:2fb:1274:247e with SMTP id
 h64-20020a812143000000b002fb1274247emr1054332ywh.384.1651653883077; Wed, 04
 May 2022 01:44:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220503115557.53370-1-phil.edworthy@renesas.com> <20220503115557.53370-8-phil.edworthy@renesas.com>
In-Reply-To: <20220503115557.53370-8-phil.edworthy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 4 May 2022 10:44:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX16KQgp0sq=5h5nxs+Pck6xyhB3OAXKZufV6D9xFJj8w@mail.gmail.com>
Message-ID: <CAMuHMdX16KQgp0sq=5h5nxs+Pck6xyhB3OAXKZufV6D9xFJj8w@mail.gmail.com>
Subject: Re: [PATCH v3 07/12] clk: renesas: rzg2l: Set HIWORD mask for all mux
 and dividers
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
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

On Tue, May 3, 2022 at 2:02 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> All of the muxes and dividers that can be modified require the HIWORD
> flags, so make the macros set them. It won't affect read only muxes and
> dividers.
> This will make the clock tables a little easier to read, particularly for
> new SoCs coming.
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3:
>  - Remove HIWORD masks in new r9a07g043-cpg.c
>  - Remove flags from DEF_MUX/DEF_DIV args

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

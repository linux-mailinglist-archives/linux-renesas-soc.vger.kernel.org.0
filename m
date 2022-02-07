Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65E664AC00D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Feb 2022 14:52:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241501AbiBGNvh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Feb 2022 08:51:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1388549AbiBGNYp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Feb 2022 08:24:45 -0500
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D0C0C043188;
        Mon,  7 Feb 2022 05:24:42 -0800 (PST)
Received: by mail-vk1-f176.google.com with SMTP id o11so6890186vkl.11;
        Mon, 07 Feb 2022 05:24:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j/nYR6LcLqtyOADxJCKrH/DHwPPbnTgPo5bzD3HSNiU=;
        b=IZUcO8xtR6vRxStTYqQkwBD0M1SGQvXoCvWNL2njNQPSnvbs+2IzHqkS07geB7siGi
         SO0cQJK/mSOyZeLgN62jL0wb3R7zEFJYVgLpM9THimtYRtAMTkwUqQT+hBkXwCs0xQ70
         Vdz0MDu/uHHB/6gerxRAM7r2VAfryqUZUB7t8nG7rAlKfJ6uGDaTk3z6S2yJ1l5Ts1dm
         ehOcLq0HxOLgKTv8ArjCa811tZafK7ki1Y62Vl606dgC7+HGhcZ6v+CcdSdPBlFOrJEP
         e8pC7wC0xIF2w0lPFdYrwcRRlva7zk6hYBFYCQ27E6/tcoFyeaLf3iCpsLu2qsNMRbQd
         ansQ==
X-Gm-Message-State: AOAM530xoFAYBtAlte8+YFGBalbKpNMLTojEFjH5Ptig+e3eo4buKdJq
        JrHF4b/MyD5oQEp5EK5WisBqKW9OjJo7Jg==
X-Google-Smtp-Source: ABdhPJyUOMPGV8fsuczzntS9oGUufecEK7f0FKLbT1YyZzw996hnUFRRHRZgvTIL9X4JODrJDtxGSQ==
X-Received: by 2002:a05:6122:588:: with SMTP id i8mr5266433vko.41.1644240281421;
        Mon, 07 Feb 2022 05:24:41 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id v71sm2192075vsv.1.2022.02.07.05.24.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Feb 2022 05:24:40 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id u25so7773903vkk.3;
        Mon, 07 Feb 2022 05:24:40 -0800 (PST)
X-Received: by 2002:a1f:b496:: with SMTP id d144mr323407vkf.20.1644240280557;
 Mon, 07 Feb 2022 05:24:40 -0800 (PST)
MIME-Version: 1.0
References: <20220206184749.11532-1-biju.das.jz@bp.renesas.com> <20220206184749.11532-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220206184749.11532-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 7 Feb 2022 14:24:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVPOjQLBZ+F6b7Wb4HoASxfM_9Cr6PPmeGmsArr=WnjqA@mail.gmail.com>
Message-ID: <CAMuHMdVPOjQLBZ+F6b7Wb4HoASxfM_9Cr6PPmeGmsArr=WnjqA@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: serial: renesas,scif: Document RZ/G2UL SoC
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
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

Hi Biju,

On Sun, Feb 6, 2022 at 7:48 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add SCIF binding documentation for Renesas RZ/G2UL SoC. SCIF block on
> RZ/G2UL is identical to one found on the RZ/G2L SoC. No driver changes
> are required as RZ/G2L compatible string "renesas,scif-r9a07g044" will
> be used as a fallback.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/serial/renesas,scif.yaml
> +++ b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
> @@ -76,8 +76,9 @@ properties:
>
>        - items:
>            - enum:
> +              - renesas,scif-r9a07g043      # RZ/G2UL
>                - renesas,scif-r9a07g054      # RZ/V2L
> -          - const: renesas,scif-r9a07g044   # RZ/G2{L,LC} fallback for RZ/V2L
> +          - const: renesas,scif-r9a07g044   # RZ/G2{L,LC} fallback for RZ/{G2UL,V2L}

To avoid having to update this comment over and over again,
perhaps the "for ..." should be dropped?

The rest looks good to me.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

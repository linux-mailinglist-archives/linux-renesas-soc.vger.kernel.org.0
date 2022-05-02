Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 862155171E4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 May 2022 16:47:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382326AbiEBOvH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 May 2022 10:51:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377203AbiEBOvG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 May 2022 10:51:06 -0400
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEA85767D;
        Mon,  2 May 2022 07:47:37 -0700 (PDT)
Received: by mail-qt1-f170.google.com with SMTP id p4so10663255qtq.12;
        Mon, 02 May 2022 07:47:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/bBfiiwYo4Xq/ApeCnkPpBPWFOXt+GLuICqGMpoEEEU=;
        b=PV9AV1aUPumNXacRH4Ph+imwligMbz6aYrQQsfIGzDzhaWtx9BomnbnPTUEchJgz1f
         Wl2yXMgZNparZx8AfQYETF6cBEVP0U4WK7HAwmnIM6XxKqKxFYSe5rUYccUP9wUDsQF8
         XxjaB524ItGgw62WHdm+rhPNG3wX9jjhWhN84SprON5E1uBT7xvS6R5vO3OuohIvFNPP
         tHJsfSbX+QIQ8/KNw0AX+00qGatbr3SyPUmW3pw/RUSZiwSiDlt0zGmjxVNRg8sVLgq7
         SHcyESX6hgZyaw5GRiJFr2x1Unrc60Z1cfdCtZj5HMurjE0Ozw9N2eb70vaUQa2qmbdN
         0W4A==
X-Gm-Message-State: AOAM531VUTUXoWBKRW4qx90fEFL0YWfJLYD+3QiY7NhSvZ0LXoesJ2xU
        pKTOSR3rV6+VZH7dAeOyoT2sij143hBI6Q==
X-Google-Smtp-Source: ABdhPJwHJ/OeUFwenmn1suQAAagNXB7DFrQQFpmH5D4Fc7vGxjue6xRz4t6GvZp9GO9ENe2dp5WynQ==
X-Received: by 2002:ac8:7c4c:0:b0:2f3:abb3:dc0f with SMTP id o12-20020ac87c4c000000b002f3abb3dc0fmr1466974qtv.441.1651502856966;
        Mon, 02 May 2022 07:47:36 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id b24-20020ac86bd8000000b002f39b99f67esm4252368qtt.24.2022.05.02.07.47.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 May 2022 07:47:36 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id r11so3544161ybg.6;
        Mon, 02 May 2022 07:47:36 -0700 (PDT)
X-Received: by 2002:a5b:482:0:b0:646:b85:ad4a with SMTP id n2-20020a5b0482000000b006460b85ad4amr9954943ybp.89.1651502856331;
 Mon, 02 May 2022 07:47:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220429105229.368728-1-miquel.raynal@bootlin.com> <20220429105229.368728-3-miquel.raynal@bootlin.com>
In-Reply-To: <20220429105229.368728-3-miquel.raynal@bootlin.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 2 May 2022 16:47:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUxkH2nHxxiKeNu3Uo_0_fDtyXbYuwcc+QWaLh-nN_y2w@mail.gmail.com>
Message-ID: <CAMuHMdUxkH2nHxxiKeNu3Uo_0_fDtyXbYuwcc+QWaLh-nN_y2w@mail.gmail.com>
Subject: Re: [PATCH 2/3] ARM: dts: r9a06g032: Fix the NAND controller node
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michael Walle <michael@walle.cc>,
        MTD Maling List <linux-mtd@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Apr 29, 2022 at 12:52 PM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
> Add the missing power-domains property which is mandatory.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

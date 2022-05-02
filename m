Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D71DF5171E2
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 May 2022 16:47:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383872AbiEBOuj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 May 2022 10:50:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377253AbiEBOui (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 May 2022 10:50:38 -0400
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17E94767D;
        Mon,  2 May 2022 07:47:10 -0700 (PDT)
Received: by mail-qt1-f171.google.com with SMTP id t11so11201482qto.11;
        Mon, 02 May 2022 07:47:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0HUcSw8jego8R/dUhSvUXBNvHBL51wNAgnKctgcWREg=;
        b=j0MTNK0RPAp4ssPZjamtld13OGjj1TcA1lyYAQzvJlQ3x6RFMUs3UdAUSP7RB6IAEV
         3w69iD+EcV7xWcjWIRDLJCsd8PNQ9eL6Dmf57nP/8bTBlyciHImZdob9EotnItNFd2hS
         YIG2YB2ORjLEBsRowQvRiD9yYT0472qRghYdO0PT4FqfcIm56tRhHWeEm5i5mQgRztVw
         KPwLOFxLqknSmWpI/DabOR2WIabS7fmfuu7XNOl/dKZXrvllg++gduSek63Gmb5E7V53
         Qska1VDpVJhyTChSoa7mLeBEDLy9dMhMu7hoWxMBcwKvbBNhVhj6Covj3zPvC2TFezn4
         l75Q==
X-Gm-Message-State: AOAM531SaS3/JLiuQXa5+/w/4OuJnlThRr08PGoCA+aNgAatMoSqtxm3
        ncivlDtdA8B+GhW9AzB+nFwS8jbDVZy1GA==
X-Google-Smtp-Source: ABdhPJwFR0BYd8MT/TIjF51a1lEN0yGSy4fMsuB+Ds2qx9Rwgvi1F1Aj3QJfPL+ULAoUbB5GYB0gmQ==
X-Received: by 2002:ac8:5754:0:b0:2e1:eee8:be0b with SMTP id 20-20020ac85754000000b002e1eee8be0bmr10534126qtx.349.1651502828923;
        Mon, 02 May 2022 07:47:08 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id g23-20020a05620a13d700b0069fc13ce1d4sm4414711qkl.5.2022.05.02.07.47.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 May 2022 07:47:07 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-2f7b815ac06so150382527b3.3;
        Mon, 02 May 2022 07:47:07 -0700 (PDT)
X-Received: by 2002:a81:6588:0:b0:2f8:b75e:1e1a with SMTP id
 z130-20020a816588000000b002f8b75e1e1amr11689177ywb.358.1651502827327; Mon, 02
 May 2022 07:47:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220429105229.368728-1-miquel.raynal@bootlin.com> <20220429105229.368728-2-miquel.raynal@bootlin.com>
In-Reply-To: <20220429105229.368728-2-miquel.raynal@bootlin.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 2 May 2022 16:46:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWWLy-RUoJG2pcoFqwds_f6HZWrwro17hUEE-3q_5fdGA@mail.gmail.com>
Message-ID: <CAMuHMdWWLy-RUoJG2pcoFqwds_f6HZWrwro17hUEE-3q_5fdGA@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: mtd: renesas: Fix the NAND controller description
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
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
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

On Fri, Apr 29, 2022 at 12:52 PM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
> Add the missing power-domain property which is needed on all the
> RZ/N1 SoC IPs.
>
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

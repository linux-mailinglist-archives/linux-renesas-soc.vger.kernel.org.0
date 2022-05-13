Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DB37526801
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 May 2022 19:16:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382360AbiEMRQ0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 May 2022 13:16:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238350AbiEMRQX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 May 2022 13:16:23 -0400
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91FC163A0;
        Fri, 13 May 2022 10:16:21 -0700 (PDT)
Received: by mail-qv1-f53.google.com with SMTP id js14so7100764qvb.12;
        Fri, 13 May 2022 10:16:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=raRyjvi/nNYnyN2p2YoiBhtLtPa6DvP11Zh+f/IjRsk=;
        b=nlFUNmeea732A2hRNrh9aFbxDJKP78DInq78e0LVlzmKNwYjlMLkkvqIyOfaqaB7sp
         omfNNtR6hui62pGc031a/rQMvagv4mFehULZOfVga0XbWcXo/H+zTuCoqjO/ukf0aPeF
         XNZAaKU7bbUDmES9jlcurW0/2ruiTQTo0bJsQAfdj7EoU/mr4ecyhpCy5lt/GuqTwrsh
         8qW2BQOid/W4S+R5SgfF+Fzg9+GgiruuuzjWVNxZOkjovFADXmCrhv4k1h1r+xm5sOVR
         0hOi4EJ/gu6X6gq4YjZ28hpr8LwE2upBptrPsNBtaHG0zlvYSNai0tQIxL62mlAe2eEB
         BFNQ==
X-Gm-Message-State: AOAM531rq3LQewjB1FPmaIf2H0K7BXKqR73bcA0y+6DHsfCjOtH36+ui
        bTACLWPWDeyEWmFpFJbIz+D2jSPgzg/66w==
X-Google-Smtp-Source: ABdhPJy5895WUGhzok/gOxcerwdT15xONRPO6cx9ZKH09oiy1dioaBOeuhY9EujN4C7nvHRoT44/Mg==
X-Received: by 2002:a05:6214:1c87:b0:42d:20cb:e484 with SMTP id ib7-20020a0562141c8700b0042d20cbe484mr5180142qvb.10.1652462180474;
        Fri, 13 May 2022 10:16:20 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id g20-20020a37e214000000b0069fc13ce23csm1573828qki.109.2022.05.13.10.16.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 May 2022 10:16:19 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-2f863469afbso97688987b3.0;
        Fri, 13 May 2022 10:16:19 -0700 (PDT)
X-Received: by 2002:a81:2143:0:b0:2fb:1274:247e with SMTP id
 h64-20020a812143000000b002fb1274247emr6840940ywh.384.1652462179266; Fri, 13
 May 2022 10:16:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220513104957.257721-1-miquel.raynal@bootlin.com> <20220513104957.257721-3-miquel.raynal@bootlin.com>
In-Reply-To: <20220513104957.257721-3-miquel.raynal@bootlin.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 13 May 2022 19:16:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWFV0PcvEYJht__pTDTq3jj-CW2KegwGMyDgfeJhtpSRw@mail.gmail.com>
Message-ID: <CAMuHMdWFV0PcvEYJht__pTDTq3jj-CW2KegwGMyDgfeJhtpSRw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] mtd: rawnand: renesas: Use runtime PM instead of
 the raw clock API
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michael Walle <michael@walle.cc>,
        MTD Maling List <linux-mtd@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>
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

On Fri, May 13, 2022 at 12:50 PM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
> This NAND controller is part of a well defined power domain handled by
> the runtime PM core. Let's keep the harmony with the other RZ/N1 drivers
> and exclusively use the runtime PM API to enable/disable the clocks.
>
> We still need to retrieve the external clock rate in order to derive the
> NAND timings, but that is not a big deal, we can still do that in the
> probe and just save this value to reuse it later.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

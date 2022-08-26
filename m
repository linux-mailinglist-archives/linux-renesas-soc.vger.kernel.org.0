Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38E0B5A22EF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Aug 2022 10:26:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245069AbiHZI0e (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Aug 2022 04:26:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229922AbiHZI0d (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Aug 2022 04:26:33 -0400
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADD448036A;
        Fri, 26 Aug 2022 01:26:30 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id h22so749118qtu.2;
        Fri, 26 Aug 2022 01:26:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=/1WQSdLoDwGGyvrmz3+n2uqmIsPY96qMfTE7qRiQCnI=;
        b=4PXteGd7ivlmZ8Tr6L5agUbkxHZZ7BlNds+9j6glPdMrx2YI/uddX8+vlrTVgS10uQ
         MEOdNFPXnGDLj2jN0Fno/QXNINjyy2QuQb0dl44paWrg0znyp282T/m9eE6hz7IdfNWS
         Kh4jno+syDi7z4C+DbtMmEsl/UJtzFIvJT4eZFK60NO9qety/qo6QVxuvMUu2e+2HApS
         APHp4JAEMqZ55fsb+22sgc8vU1o8F3qMJ072fDF2KUHTVHGkggYqNblpNGGFgHZ8r5TV
         Wcy7hIQLpWQKLxd//KV0ocC8vvGqZ7pjjDalFhi3KjYI9FVUmw0HhXB/0nFufeNFOnFH
         SbFA==
X-Gm-Message-State: ACgBeo1l4NF9WBuJCzJOnq4J2SnnX9VQLsGkzvYR6PTxdQnmNMVG9wQK
        I+/IPpzIvqRJoHewSARBvltHRi0X1M7Fzw==
X-Google-Smtp-Source: AA6agR5UuvtAuT2zF6uXkuIsrUhtNJOR8P7e/JchG5aLLa94K/JQNJrjDCLSBbtfYqAQka/lXEbSoQ==
X-Received: by 2002:ac8:7c46:0:b0:344:91e1:42ed with SMTP id o6-20020ac87c46000000b0034491e142edmr6790408qtv.105.1661502389699;
        Fri, 26 Aug 2022 01:26:29 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id e12-20020ac8130c000000b003430cbb0006sm874891qtj.1.2022.08.26.01.26.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 01:26:29 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-33da3a391d8so18743067b3.2;
        Fri, 26 Aug 2022 01:26:29 -0700 (PDT)
X-Received: by 2002:a25:778d:0:b0:696:4bb6:9aaa with SMTP id
 s135-20020a25778d000000b006964bb69aaamr4314577ybc.380.1661502389319; Fri, 26
 Aug 2022 01:26:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220819193944.337599-1-phil.edworthy@renesas.com> <20220819193944.337599-2-phil.edworthy@renesas.com>
In-Reply-To: <20220819193944.337599-2-phil.edworthy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 26 Aug 2022 10:26:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXa8bJbM=RhQYOrJiBNWCnhZYHEASRW3oQHAQFy8BDV2w@mail.gmail.com>
Message-ID: <CAMuHMdXa8bJbM=RhQYOrJiBNWCnhZYHEASRW3oQHAQFy8BDV2w@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: renesas: r9a09g011: Add IIC clock and reset entries
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
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

On Fri, Aug 19, 2022 at 9:40 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> Add IIC groups clock and reset entries to CPG driver.
> IIC Group A consists of IIC0 and IIC1. IIC Group B consists of
> IIC2 and IIC3. To confuse things, IIC_PCLK0 is used by group A
> and IIC_PCLK1 is used by group B.
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v6.1.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

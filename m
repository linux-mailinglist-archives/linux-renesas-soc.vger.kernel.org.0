Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2930A5A2312
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Aug 2022 10:34:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343527AbiHZIeK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Aug 2022 04:34:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229992AbiHZIeJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Aug 2022 04:34:09 -0400
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAEC8D4F62;
        Fri, 26 Aug 2022 01:34:08 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id a4so730226qto.10;
        Fri, 26 Aug 2022 01:34:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=O6VZsg9bRhmabSz16OhI5qwy1yHhHa5ahFeheIGdlKQ=;
        b=wQtlDqG+PV3vnvKRpYbhAWORUPAgs2K3Cwsi0ZfspkXtwamkG5fhZCFAvUNrf07j47
         Ju3R8LChUROiE44QSVOvOMcrGktgQuJlTzfxkpp7rPhJGr1o1bzwAcA7zWJPqYAhNqXf
         dtywEH3PxaCpbUw4FrtlSj1bYskGfRXYZCbonROa8++gL3SdAkSC0bd/q9CUtl7Lz9MY
         Hg6/Xf09bZGMNy+KU1e8r1LAE1fc6jKBv6TEsXVBLv0+3evtPDgV3KZxRswY5nvaXOWM
         OoUvzTpzczGDIOMfueUVfYLSZod6ycQg8TW0Dg/hOJnIYrSdjfW1Qmw6EPgKpWFHK9We
         LK8A==
X-Gm-Message-State: ACgBeo1iL0xyIlHZm6bdg0emy3wyrfz4iDmzbMN4WekrXhNxM6OoHgvv
        5RuNhRtIT6XTuAxMff4NzVu1xyjABzr/4g==
X-Google-Smtp-Source: AA6agR6dMP2u+D5hyCfx9vSHpqCxX5Euz3nrXbTHkFhZ0b1I1LvaFc6edcFxsv2KhwGY/HBderCUmw==
X-Received: by 2002:ac8:7d8a:0:b0:344:65fe:834a with SMTP id c10-20020ac87d8a000000b0034465fe834amr6839386qtd.649.1661502847836;
        Fri, 26 Aug 2022 01:34:07 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id x19-20020a05620a449300b006b629f86244sm1509039qkp.50.2022.08.26.01.34.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 01:34:07 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-33dc31f25f9so18540057b3.11;
        Fri, 26 Aug 2022 01:34:07 -0700 (PDT)
X-Received: by 2002:a25:d80b:0:b0:696:6d79:4891 with SMTP id
 p11-20020a25d80b000000b006966d794891mr1488374ybg.89.1661502847334; Fri, 26
 Aug 2022 01:34:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220819193944.337599-1-phil.edworthy@renesas.com> <20220819193944.337599-3-phil.edworthy@renesas.com>
In-Reply-To: <20220819193944.337599-3-phil.edworthy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 26 Aug 2022 10:33:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU3kvg6qUQ1w3HDLEL3=3G79gSiyHbAKNwgYp3ghgog0g@mail.gmail.com>
Message-ID: <CAMuHMdU3kvg6qUQ1w3HDLEL3=3G79gSiyHbAKNwgYp3ghgog0g@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r9a09g011: Add i2c nodes
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
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

Hi Phil,

On Fri, Aug 19, 2022 at 9:40 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.1 with

"Add device nodes for the I2C controllers that are not assigned to the ISP".

added.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 297626FDA71
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 May 2023 11:11:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229595AbjEJJLT convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 May 2023 05:11:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231486AbjEJJLT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 May 2023 05:11:19 -0400
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7D0330CF
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 May 2023 02:11:17 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-55a00da4e53so124451067b3.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 May 2023 02:11:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683709876; x=1686301876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gs1DGxuphnj49zt97f0sMg3HmMftGKuOnYCrO9t+Jos=;
        b=fgLUuUqLw8A7Lw9qqzrT+TqUTbarFDoPyAWUVz+1B+Me8UHb/yutuFWHdm/vZpE8Un
         BE8GaBkmA2NjWCK0hXtal8v+JxH32p2JaKZNPCbHaRszwIeplKvSNqfIDsn96kHxKxoG
         5gApacF2KZb9D7as3Ewb4sIOzMHMjCkfmZoII1fWqyKAXhWO9rhUL3yB3BE4PmZfTGoi
         X83O88Ju/ppZv4Pf3jEwVI+Q5X7Vxi5w7xYOBazjMKUd7u5KkTttNWtfBKQ66HACOV0y
         cynMaYVvo1HktEagUmNNJkPHAmKz44QGbQBpgpZRSJOs1Ds1Bo204gCBwVNr1vrJJtsq
         68Ng==
X-Gm-Message-State: AC+VfDwu/G5wJ6yKVXW1y1MTuF3LpsEbAJwotZYbYLoJ1bqnN5mXUOZr
        w6cty4QQsMUSmJAOz7lPT/WUYt7WYoASsw==
X-Google-Smtp-Source: ACHHUZ7iUiBLVh2+qE7NNZer2X+5e5NFGT1jC2l0rMPNIQtzr2evhvHDIFpDwGTL/lLwiqN88afyHA==
X-Received: by 2002:a0d:d483:0:b0:55b:4940:1bb5 with SMTP id w125-20020a0dd483000000b0055b49401bb5mr15330608ywd.22.1683709876634;
        Wed, 10 May 2023 02:11:16 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id v203-20020a8148d4000000b0055a18d8479csm3918801ywa.21.2023.05.10.02.11.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 02:11:16 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-55a20a56a01so124328657b3.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 May 2023 02:11:16 -0700 (PDT)
X-Received: by 2002:a0d:ef41:0:b0:55a:5616:ba36 with SMTP id
 y62-20020a0def41000000b0055a5616ba36mr19409922ywe.6.1683709876225; Wed, 10
 May 2023 02:11:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230419201511.31648-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20230419201511.31648-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 10 May 2023 11:11:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX4vqSR8vBA5BiRBYL0PccZxDayes9yXNu5C-wyMKxXZQ@mail.gmail.com>
Message-ID: <CAMuHMdX4vqSR8vBA5BiRBYL0PccZxDayes9yXNu5C-wyMKxXZQ@mail.gmail.com>
Subject: Re: [PATCH] soc: renesas: rcar-rst: Allow WDT reset on R-Car V3U
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org
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

On Wed, Apr 19, 2023 at 10:15 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> V3U firmware misses to enable WDT resets. Because there won't be any
> updates to the firmware anymore, enable that in Linux.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BA7E50A124
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Apr 2022 15:48:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237031AbiDUNum (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Apr 2022 09:50:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387375AbiDUNul (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Apr 2022 09:50:41 -0400
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 340E937ABA;
        Thu, 21 Apr 2022 06:47:51 -0700 (PDT)
Received: by mail-qv1-f45.google.com with SMTP id i14so3658639qvk.13;
        Thu, 21 Apr 2022 06:47:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uNX2H4vVMesbWb6WdnhP5kqTGvyi12cdMiTUkT65UuM=;
        b=TupRcL0jeX/oqtU98K+J2ueHAsHHkBsJXrjaj1v8Sf7TNNK9DAKuEm5BLmU9XUxcv3
         RlWssGM5ugQSXr54MuOxv63aSc3RQa+llvaq1sXlWR4UCdbaExtY4BpIUImnH5kdYdrU
         GCQ2TFaR4q+gdvlLLP3ujtf08R5hn/J616ZAQ58+swJD9+W3f8ojI+xMexaSU/L/kqmR
         dds5zN+/lG2WTEs1xTG5J2YiI71aRehEH9m1TLV1u3jrxm5Z1klfshfR1FxVich707v4
         30vYL2GvW0nuBTpqvp7H3tsJCkwKR3/lNPb7AdOUjEu7Jj5jwxEgkLJHGVqudpDio883
         suYg==
X-Gm-Message-State: AOAM533Gwma++6rNz4MopQ05FQ4U2RmrS4zcyvJObXCwDyAOo1rLUYGz
        N6Rmdcy16KCALufVAQR6PC0ZEQWojdOYf6f3
X-Google-Smtp-Source: ABdhPJy+k5aEtoN9Et21KJsrUEI9q6HZIqk8Uhubt9viUQgzZrXgUCDXMAe/bmO+wOf/+eNFEl83Iw==
X-Received: by 2002:a0c:fa43:0:b0:444:5137:44b0 with SMTP id k3-20020a0cfa43000000b00444513744b0mr19174862qvo.29.1650548870057;
        Thu, 21 Apr 2022 06:47:50 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id u13-20020a05622a010d00b002f34d93cc5esm833915qtw.0.2022.04.21.06.47.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Apr 2022 06:47:49 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id x9so1728141ybe.11;
        Thu, 21 Apr 2022 06:47:49 -0700 (PDT)
X-Received: by 2002:a25:8087:0:b0:641:dd06:577d with SMTP id
 n7-20020a258087000000b00641dd06577dmr24517952ybk.207.1650548869002; Thu, 21
 Apr 2022 06:47:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220420084255.375700-1-yoshihiro.shimoda.uh@renesas.com> <20220420084255.375700-13-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20220420084255.375700-13-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 21 Apr 2022 15:47:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXdgvcf0w06GaaSZSqdEwytKi+tNXpsUb29vXmKrB=gYA@mail.gmail.com>
Message-ID: <CAMuHMdXdgvcf0w06GaaSZSqdEwytKi+tNXpsUb29vXmKrB=gYA@mail.gmail.com>
Subject: Re: [PATCH 12/15] clk: renesas: rcar-gen4: Add CLK_TYPE_GEN4_PLL4
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Wed, Apr 20, 2022 at 10:43 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> R-Car V4H (r8a779g0) has PLL4 so that add CLK_TYPE_GEN4_PLL4.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> ---
>  drivers/clk/renesas/r8a779f0-cpg-mssr.c | 18 +++++++++---------
>  drivers/clk/renesas/rcar-gen4-cpg.c     |  5 +++++
>  drivers/clk/renesas/rcar-gen4-cpg.h     |  3 +++
>  3 files changed, 17 insertions(+), 9 deletions(-)

You forgot to update drivers/clk/renesas/r8a779a0-cpg-mssr.c.
Hence all clocks derived from PLL5 have a zero rate, causing the
SDHI driver to enter an infinite loop in renesas_sdhi_set_clock()
(clock = 0):

        for (clk = 0x80000080; new_clock >= (clock << 1); clk >>= 1)
                clock <<= 1;

Adding the missing PLL4 mul/div columns fixes that.

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

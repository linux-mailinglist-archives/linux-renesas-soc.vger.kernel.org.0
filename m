Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E76645EA7A4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Sep 2022 15:51:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234794AbiIZNvV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Sep 2022 09:51:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235885AbiIZNu5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Sep 2022 09:50:57 -0400
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 706071F4956;
        Mon, 26 Sep 2022 05:07:09 -0700 (PDT)
Received: by mail-qt1-f176.google.com with SMTP id a20so3887058qtw.10;
        Mon, 26 Sep 2022 05:07:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=9Znqpk/5E3d9qeZ4ziCaHeFp2PyF0ymTe8Mru6sAKdI=;
        b=nXcwTaStpAuNfcdtlc/qrzrx5yohRSTnMFGO6ucJ95E2XEVMeTyu1ouJqRiWsSD1up
         xHJBH0j8muJMFKYePVkSXJ/upv4x33xJM2uHcSEY/y2HjozI+EvnEHW28gW8WFULXh/9
         3rCL910MpYLo+U/sRo0eyhrHk2v3eSSAwCQwE97nNDU/DleUALPWy3AGKQpV1rX38VZN
         r+Q57DKvq23rHIaOV8eKMFD5HBoF90UYne8sfKNBU7TMj8JAzZYl+tIsLN8dq7lbpUxR
         2GR1E3Fy+BvmOyry+3n8bPRhaOio+jHgFbsj7ipT0Ldj1TMM0FDAqz8wEB1YwpiGiQxd
         Nbeg==
X-Gm-Message-State: ACrzQf0wGunNCbbNuEbW9MU6+HGXBAic4TD7evgfiIGnm+t9Q6bzu7A7
        X9aBudsUD/ATDH5HPJpZpEOgveDjsqR+uA==
X-Google-Smtp-Source: AMsMyM7WdsnBGd8AojgTyL/hdnjqYds1sc5FRKve4aC2lVo3YSguYQmngKB0UJGhz8J1Qbg+nJQP2Q==
X-Received: by 2002:ac8:5909:0:b0:35b:ce5c:ed73 with SMTP id 9-20020ac85909000000b0035bce5ced73mr17076773qty.635.1664193917144;
        Mon, 26 Sep 2022 05:05:17 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id o1-20020a05622a008100b003431446588fsm11499143qtw.5.2022.09.26.05.05.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 05:05:17 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-346cd4c3d7aso66085087b3.8;
        Mon, 26 Sep 2022 05:05:16 -0700 (PDT)
X-Received: by 2002:a0d:de43:0:b0:349:31bd:e8d5 with SMTP id
 h64-20020a0dde43000000b0034931bde8d5mr19441266ywe.283.1664193916570; Mon, 26
 Sep 2022 05:05:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220922051358.3442191-1-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20220922051358.3442191-1-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 26 Sep 2022 14:05:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVQLAV5xTmZTosvb_thPigMAmLommi0EL1v-dG5PWXFsg@mail.gmail.com>
Message-ID: <CAMuHMdVQLAV5xTmZTosvb_thPigMAmLommi0EL1v-dG5PWXFsg@mail.gmail.com>
Subject: Re: [PATCH v3] clk: renesas: r8a779f0: Add Ethernet Switch clocks
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Sep 22, 2022 at 7:14 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
> Changes from v2:
>  https://lore.kernel.org/all/20220921084745.3355107-2-yoshihiro.shimoda.uh@renesas.com/
>  - Separate patcheas into each subsystem.
>    (No change actual code from v2.)

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v6.2.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

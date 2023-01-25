Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7C8F67AFE4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jan 2023 11:43:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235641AbjAYKnR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Jan 2023 05:43:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235653AbjAYKnG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jan 2023 05:43:06 -0500
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82CEF8A47
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jan 2023 02:43:04 -0800 (PST)
Received: by mail-qt1-f178.google.com with SMTP id m26so5845579qtp.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jan 2023 02:43:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9B42Tb/lhgexciYUrry8410//KPif6AK8l4xyfAcmgw=;
        b=AqCp/tTqJztwokijAJY6Kb+Pgw2tD4Iq+LmZrjoRPfRfb1rOjKchKrz0etSHIM21D5
         u0VUyw04aX5hHe3zKxc5QfJZD6lQWTWy2uwfzkqwHHa4ghpIAISnwMUnEyU8dQP4acky
         tjBir/noqNxfTUreR6/UthRuA634tYeobzo1/tbOqJFD8W89dUNvoJl+bQVJ+3vfr6+z
         9UvnIGo4P97nSMkCZY79DThxM6+jYGuHYIx0W26VjqqB4p6dvfB/OUqc5szkNIUA6yGl
         RfJ9LR6rrchYhy34nrjG7nzPoTD86dIL2Z9uEViaQR+9MidKTvhWKdaMLGAhxOnqYZ4k
         K8Ng==
X-Gm-Message-State: AO0yUKVOxUgcSSs/sv8omH6ddVPrrhli/0sFInJrnkOriDfq+amzx9+U
        6PqBWgxaKUmlH63fox8ypkeFM8OJFVF1VA==
X-Google-Smtp-Source: AK7set/AnzfW67jmXN2a2zWcCdLl342d+dGym8vnL0ry6NcArB0W58ZZAOlAad76H49BjwmEO6ntaQ==
X-Received: by 2002:a05:622a:5d4:b0:3a7:ec99:56e4 with SMTP id d20-20020a05622a05d400b003a7ec9956e4mr3073229qtb.39.1674643383490;
        Wed, 25 Jan 2023 02:43:03 -0800 (PST)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id i19-20020a05620a145300b00706b09b16fasm3266055qkl.11.2023.01.25.02.43.03
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 02:43:03 -0800 (PST)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-4ff1fa82bbbso210823407b3.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jan 2023 02:43:03 -0800 (PST)
X-Received: by 2002:a81:7e4b:0:b0:506:4f19:740c with SMTP id
 p11-20020a817e4b000000b005064f19740cmr499916ywn.383.1674643382867; Wed, 25
 Jan 2023 02:43:02 -0800 (PST)
MIME-Version: 1.0
References: <20230113134639.338908-1-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20230113134639.338908-1-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 25 Jan 2023 11:42:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVQ_jHx-QUwrmj5n0p97c_-N30Og+Cb637mPYjLbjNMpg@mail.gmail.com>
Message-ID: <CAMuHMdVQ_jHx-QUwrmj5n0p97c_-N30Og+Cb637mPYjLbjNMpg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a779f0: spider-cpu: Enable UFS device
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jan 13, 2023 at 2:46 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Enable UFS device for R-Car S4-8 Spider CPU board.
>
> Note that the conditions of RC21012 on the Spider are:
>  - OUT11 (for UFS30_REFCLK_V) is disabled as default.
>  - OUT11 is controlled by GPIO0 pin.
>  - The GPIO0 pin is inverted sense (low active) and pull-up enabled.
>
> To output the clock, pin 4 of TCA9554 on the Spider board needs to
> output low level so that using "gpio-gate-clock" for it.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Changes from v1:
>  - Add /delete-property/ clock-frequency; in the ufs30_clk.
>  - Add Tested-by. (Geert-san, thanks!)

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.3.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

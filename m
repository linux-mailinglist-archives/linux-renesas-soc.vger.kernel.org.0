Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7F876E5F03
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Apr 2023 12:38:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231215AbjDRKiq convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Apr 2023 06:38:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231271AbjDRKip (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Apr 2023 06:38:45 -0400
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA76AD2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Apr 2023 03:38:42 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id u13so28777332ybu.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Apr 2023 03:38:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681814322; x=1684406322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fg62sItq/d31LHHETRObblo7yjYJ/mwZzdmWO3wQWFc=;
        b=TAEyXisO5t05fZ73kff2P4SHDykFE2/88lOgVXJeLRGjd82/StAvaYwCNGJ7bElNGG
         tfqHeOOWRJlFXohwDpYhV8fKDlL5+YCHfd5XysC7AumMikhyoB7klTOY8Q5ngIaQvX+S
         KyJ7lhS528cHAj59gEJcKnt0u5PcJidYKIAC7SGil/kXHVZmNZA24kIHaKyf4rMHRsKT
         uwPzrl88DLQdQB8q0d1uYGZ5a2Uknk7a++m//O2gonofkugLl0I7zWxy20/G3yWv5zIT
         9e3tG1FdzOLGnHLRK4gpzsWYc01FyJZiYCiR6sDlQ5f7ZBiaV/s/p9+/qXI49nffulSj
         iBQg==
X-Gm-Message-State: AAQBX9dSqe9ZGTnFZsjOuPV7n/uVuATVeASflAFSMs+TfccKf5/nJQu4
        u5NnY+RD7JbzVsLFetKN8/HiBtvUfxuRYQ==
X-Google-Smtp-Source: AKy350ajO+Gjv7F9HOBK0StiVHiU+ZuPar7LBjey07kz+o4HRUp9QcbcXIT9t0B2a98wOiq8jSAn1Q==
X-Received: by 2002:a25:3716:0:b0:b8d:a9e9:be74 with SMTP id e22-20020a253716000000b00b8da9e9be74mr16064060yba.38.1681814321740;
        Tue, 18 Apr 2023 03:38:41 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 80-20020a250d53000000b00b92397e9e3dsm1964135ybn.43.2023.04.18.03.38.41
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Apr 2023 03:38:41 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-54f6a796bd0so336635557b3.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Apr 2023 03:38:41 -0700 (PDT)
X-Received: by 2002:a0d:e342:0:b0:555:baf3:f544 with SMTP id
 m63-20020a0de342000000b00555baf3f544mr756482ywe.43.1681814321161; Tue, 18 Apr
 2023 03:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <12a4bf9526b12c9b2751aa1b35a5e09dfe211e1a.1680600884.git.geert+renesas@glider.be>
In-Reply-To: <12a4bf9526b12c9b2751aa1b35a5e09dfe211e1a.1680600884.git.geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 18 Apr 2023 12:38:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV=gpQBbH3WQHkj1qm72jcUBMz6zAncO03YndvdfQP7sQ@mail.gmail.com>
Message-ID: <CAMuHMdV=gpQBbH3WQHkj1qm72jcUBMz6zAncO03YndvdfQP7sQ@mail.gmail.com>
Subject: Re: [PATCH/LOCAL] arm64: renesas: defconfig: Enable CAN transceiver
 PHY support
To:     Magnus Damm <magnus.damm@gmail.com>
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

On Tue, Apr 4, 2023 at 11:37 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Enable the CAN transceiver PHY driver, which is needed for the NXP
> TJR1443AT CAN transceiver on CAN-FD channel zero on the White-Hawk
> development board.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Not intended for upstream merge.
> To be applied to the topic/renesas-defconfig branch.

FTR, this is postponed until after v6.4-rc1, when commit a0340df7eca4f28e ("can:
rcar_canfd: Add transceiver support") has landed upstream.
Else the following message is printed (_after_ rcar_canfd is probed):

    rcar_canfd e6660000.can: Failed to create device link (0x180) with can-phy0

> --- a/arch/arm64/configs/renesas_defconfig
> +++ b/arch/arm64/configs/renesas_defconfig
> @@ -386,6 +386,7 @@ CONFIG_PWM=y
>  CONFIG_PWM_RCAR=y
>  CONFIG_PWM_RENESAS_TPU=y
>  CONFIG_RESET_RZG2L_USBPHY_CTRL=y
> +CONFIG_PHY_CAN_TRANSCEIVER=y
>  CONFIG_PHY_R8A779F0_ETHERNET_SERDES=y
>  CONFIG_PHY_RCAR_GEN3_PCIE=y
>  CONFIG_PHY_RCAR_GEN3_USB2=y

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

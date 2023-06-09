Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47B6D72A638
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 Jun 2023 00:24:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbjFIWY2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Jun 2023 18:24:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbjFIWY2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Jun 2023 18:24:28 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44073359D
        for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Jun 2023 15:24:26 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b1b72dc2feso25161881fa.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Jun 2023 15:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20221208.gappssmtp.com; s=20221208; t=1686349464; x=1688941464;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q3Sod89Tr85HlvEeqZqTKhvlgNUeqBCXsuGYcnpXoCc=;
        b=qvXqEJldDBQv9VQ0ESw+nMzGkndCKOX/JLnvBNfWdihFTgYQmKSKxj1zW4B966VHpm
         bWaii+blhxov+TYn2GuiW49inS7q2ZWNWQOCndWOrLUeW3a/CcarJcASRUYjuIJcxajU
         hmiTUOY5uE/nrok0XJEgetmp80rKRulcJRg6DZzljg3UKXfEcrk4ks3AnLPRdq1YRuk/
         SCSPknmpOaMCw0cbverAcSksxA46Eg9CyWTrgDlc8O4msUtdky6m8eAGPXLRb4fXD5Cb
         6qBdsTZjeA5T92+UoA7waZ6XjxP5g1e2dDsEqD7G2YZ19KLn83sYdKRFMfD2zPuQp8/k
         XNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686349464; x=1688941464;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q3Sod89Tr85HlvEeqZqTKhvlgNUeqBCXsuGYcnpXoCc=;
        b=hC/3oslNIz2NgK6Tg8P9NpVOSTTgGN9jyQ20ITHrWqMDNslsw5XDD3xIYOaEYj05lw
         T+SezHLZgvjdT1Y7u113mj/UBuTB0abEg3s9em2CmFPm4CL2GWQi05Co5B9fOgST1WV6
         8c942GusSzhp68u1ZK60KElO9jCUS4zR4mT3MTApaqi9iyMCgwcYwBOkv7wYKSDBPuzt
         HDMlOTQzqP66jje1FUvDc9rQd2VPfA7WRllA734dCcQk7Sz+DUiHYc0BCMaJ4dppQ5dV
         K0FDigmibYSgT8+dvhgV72uGSADHkGs+3E0k9rqhO7xHsqxFpT42cQQ8xPUD30ufxobA
         Oafw==
X-Gm-Message-State: AC+VfDz5ZTEejQ6aq0U+pTkloK5QpTEdKFp0zcaD04wPc0qV3PJ2Dh1J
        QX0RpY+i+WXY2pz8sESI3NWuZ0Ox6/eJ7x0vPBY=
X-Google-Smtp-Source: ACHHUZ7Vwa23BuXlgi9ucMrWnKg5MmLAmNTsQR7ux0H6u2uLEaEV04WOedxK42W/qeNuXyvJRLRKhQ==
X-Received: by 2002:a2e:3801:0:b0:2b2:a6:6132 with SMTP id f1-20020a2e3801000000b002b200a66132mr51976lja.25.1686349463781;
        Fri, 09 Jun 2023 15:24:23 -0700 (PDT)
Received: from localhost (h-46-59-89-207.A463.priv.bahnhof.se. [46.59.89.207])
        by smtp.gmail.com with ESMTPSA id e15-20020a2e818f000000b002ad98ec6b10sm546745ljg.52.2023.06.09.15.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 15:24:23 -0700 (PDT)
Date:   Sat, 10 Jun 2023 00:24:22 +0200
From:   Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFC 0/3] Remove KZM9D board staging support
Message-ID: <ZIOmlp3LK8RcuDCr@oden.dyn.berto.se>
References: <cover.1686325857.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1686325857.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Happy to see this work!

On 2023-06-09 18:10:48 +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> Board staging was introduced to host temporarily legacy board support
> for platforms that are under active conversion to DT.  Currently it
> hosts:
>   1. USB Gadget support for the Kyoto Microcomputer Co. KZM-A9-Dual
>      (KZM9D) development board,
>   2. Display support for the Atmark Techno Armadillo-800-EVA development
>      board.
> 
> During the last few years, the KZM9D development board didn't receive
> much love.  Also, no one really cared about the EMMA Mobile USB Gadget
> driver, which is also hosted under staging.
> 
> Hence this RFC patch series removes the KZM9D board staging support,
> together with the EMMA Mobile USB Gadget driver, and the legacy EMMA
> Mobile EV2 clkdev registration.
> 
> Once the SH-Mobile LCDC DRM driver has been converted to atomic
> modesetting and DT, the remaining parts of board staging can be removed,
> together with legacy clkdev registration in the MSTP driver.
> 
> Thanks for your comments!
> 
> Geert Uytterhoeven (3):
>   staging: emxx_udc: Remove EMMA Mobile USB Gadget driver
>   staging: board: Remove KZM9D board staging code
>   clk: renesas: emev2: Remove obsolete clkdev registration
> 
>  drivers/clk/renesas/clk-emev2.c     |    3 -
>  drivers/staging/Kconfig             |    2 -
>  drivers/staging/Makefile            |    1 -
>  drivers/staging/board/Makefile      |    1 -
>  drivers/staging/board/kzm9d.c       |   26 -
>  drivers/staging/emxx_udc/Kconfig    |   11 -
>  drivers/staging/emxx_udc/Makefile   |    2 -
>  drivers/staging/emxx_udc/TODO       |    6 -
>  drivers/staging/emxx_udc/emxx_udc.c | 3223 ---------------------------
>  drivers/staging/emxx_udc/emxx_udc.h |  554 -----
>  10 files changed, 3829 deletions(-)
>  delete mode 100644 drivers/staging/board/kzm9d.c
>  delete mode 100644 drivers/staging/emxx_udc/Kconfig
>  delete mode 100644 drivers/staging/emxx_udc/Makefile
>  delete mode 100644 drivers/staging/emxx_udc/TODO
>  delete mode 100644 drivers/staging/emxx_udc/emxx_udc.c
>  delete mode 100644 drivers/staging/emxx_udc/emxx_udc.h

Acked-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>

> 
> -- 
> 2.34.1
> 
> Gr{oetje,eeting}s,
> 
> 						Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
> 							    -- Linus Torvalds

-- 
Kind Regards,
Niklas Söderlund

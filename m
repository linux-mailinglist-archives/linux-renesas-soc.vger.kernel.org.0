Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B34B723C3F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Jun 2023 10:53:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237307AbjFFIxy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 6 Jun 2023 04:53:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237257AbjFFIxx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Jun 2023 04:53:53 -0400
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAB37EA
        for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Jun 2023 01:53:51 -0700 (PDT)
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-43b4b5378ecso797619137.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 06 Jun 2023 01:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686041631; x=1688633631;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DkYmQSdDH/7swAFbB+hh/UI/hl2M4IPq1cAE0sbjhj8=;
        b=BY9mJRXU5Uw4Wc3BYKAAcw5wT0xCZwCwxzc+YVOR57ZSjyQlIbSzuSe0xA1iDXYAaR
         u8t2ptPstyGfvNyzGy06ScIUbo+zrCIVC4wykhuQN2Pf9I5RIgMro6FdbXrsPuhehf16
         Ywke/gcYvszx5dlgXkDjLNQFN3lZeN7CRrVqsK1yVBrHKZGJKaXOMHXfDXSWsJEh/Gzy
         ukJ1x6Nu0Ds5xfktQ0KwztbGpIN8VgQeFvm1hZJ847GGPel4Oa42tiiPOaoRd1u8wSi7
         wAVRi9P6gK4zUQgIqYd0fSEt/+hjvZ4JYldH1sMs0GtIU7U/8s9N4p2RfLhUYRDuKGHO
         2h3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686041631; x=1688633631;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DkYmQSdDH/7swAFbB+hh/UI/hl2M4IPq1cAE0sbjhj8=;
        b=DGD4Jp38iYIMcPCanmbivq+l1pxDtGJLAT2ZYt5HgjkIH2ekMY13tKx8i46/WQvURu
         omSNibOJLkHCQb96YOTblEDBbbm9RQjvavp0zMkHrlbI98KmmasgnQyh+jJX7VlDYIAk
         PeEXqvIWAN4bHnFk25fX+CuPVCUpk6kEBNrPhWAfnuBMw2iYaZvHFVm5bC7MI0isQxJh
         f9JRu8WmeR+4IxTuvvyj2gSKRtEn6OfsKzDLG5+AUaG2JbAOhDgUm24ZKszJJz6J5+V9
         4bEb0OY/4DXITYxaIiNDPSudL10bAqKwn0yn9Q/l72u/nlg/0Eq4jn0FrP38MaSJsGh5
         hTWQ==
X-Gm-Message-State: AC+VfDzv+4t3WDmhe5ASo804xt68vqcqtz17FvdEeUQXU504L7tv+S6A
        YcefhyRAcRRyTQFgmWSCeg8LzEq5WLGenlyZEYNHYg==
X-Google-Smtp-Source: ACHHUZ6oosJ/AGBnPC00r6QaUMmoCBOhY+Q8RI7xPxjgWlVuISrs9TDVAfbGhiRpcu/E3MP9rBkDqdCkWA7eX9GNUpo=
X-Received: by 2002:a05:6102:410:b0:43b:1b47:670 with SMTP id
 d16-20020a056102041000b0043b1b470670mr889033vsq.20.1686041630760; Tue, 06 Jun
 2023 01:53:50 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYv0a-XxXfG6bNuPZGT=fzjtEfRGEYwk3n6M1WhEHUPo9g@mail.gmail.com>
In-Reply-To: <CA+G9fYv0a-XxXfG6bNuPZGT=fzjtEfRGEYwk3n6M1WhEHUPo9g@mail.gmail.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Tue, 6 Jun 2023 14:23:39 +0530
Message-ID: <CA+G9fYueN0xti1SDtYVZstPt104sUj06GfOzyqDNrd3s3xXBkA@mail.gmail.com>
Subject: Re: arm: shmobile_defconfig: ld.lld: error: undefined symbol: lynx_pcs_destroy
To:     open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        clang-built-linux <llvm@lists.linux.dev>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Netdev <netdev@vger.kernel.org>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Anders Roxell <anders.roxell@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        maxime.chevallier@bootlin.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

+ netdev



On Tue, 6 Jun 2023 at 14:17, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> Following build regressions found while building arm shmobile_defconfig on
> Linux next-20230606.
>
> Regressions found on arm:
>
>  - build/clang-16-shmobile_defconfig
>  - build/gcc-8-shmobile_defconfig
>  - build/gcc-12-shmobile_defconfig
>  - build/clang-nightly-shmobile_defconfig

And mips defconfig builds failed.
Regressions found on mips:

  - build/clang-16-defconfig
  - build/gcc-12-defconfig
  - build/gcc-8-defconfig
  - build/clang-nightly-defconfig



>
> ld.lld: error: undefined symbol: lynx_pcs_destroy
> >>> referenced by stmmac_mdio.c
> >>>               drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.o:(stmmac_mdio_unregister) in archive vmlinux.a
> make[2]: *** [scripts/Makefile.vmlinux:35: vmlinux] Error 1
>
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> links,
> - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230606/testrun/17347517/suite/build/test/gcc-12-shmobile_defconfig/history/
> - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230606/testrun/17347562/suite/build/test/clang-16-shmobile_defconfig/log
>
> --
> Linaro LKFT
> https://lkft.linaro.org

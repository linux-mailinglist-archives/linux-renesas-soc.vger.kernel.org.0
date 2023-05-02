Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCA1A6F4C02
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 May 2023 23:19:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbjEBVTY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 2 May 2023 17:19:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229672AbjEBVTU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 May 2023 17:19:20 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E28601FED
        for <linux-renesas-soc@vger.kernel.org>; Tue,  2 May 2023 14:19:11 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-555e853d3c5so41130637b3.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 May 2023 14:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683062351; x=1685654351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0h/G3jDyFIlsGjKztRY6ZyzstNpimF/rtsReSh8uQhc=;
        b=KRpm0LIjs28Qed8shWU3rN8qoEPt7Z2dbTHfeBDQWUYQ/eleo/D1hSCVxF8U6UZ+bs
         F1XMfbU8w5Ga3fHrL9f52m54VFw9b/NoIHxi6VJvUi0wJbHm/C9DZq5Ys2jrTCtfhcm1
         oBkQ2yn5ZHZ/TfTLorY09e+913thRNTfaqI5mNLT0k9tsDcNET4Mx+BQIf1502z+U6F5
         zdPY5wpLT0wKF469rWVGVCkKCBVQOBcwk1PBnM9kbNCfxW76JztqaMMAKMKH5t+1tPeB
         +v6bV47t5nalynw/2xl/re8ehZcjTh36Ag3m136LAbl2iZeuJ0S5NvYOTuc93MhpGwqC
         v4lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683062351; x=1685654351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0h/G3jDyFIlsGjKztRY6ZyzstNpimF/rtsReSh8uQhc=;
        b=IRnv3oAX+PbaFMmrEiPYo7Pu9eQl4K9BHRHpBc2CzzFu90yeucKgRJrX76PFXGT4Lg
         d5AAQIMFB5iZYXA+Xn2JYveifETADwir+LvILS1V7MnsnhvgrK69ziAlt6SPhgW3vF/l
         Bz8GBy/68UPIiQlAcPQqNwx/f8ndff898Yy2MVHMZbqUsFdXcuCgx8rgxSeTdsFVE7N2
         NmAWm/f1aFEtmJWyrtwUnUY6bfhtKpv0I/sHXYneRmSunWiqMWAjHrEyFxAaB8TuQOiW
         QbkvlIo66Yz1CTNO8BDrLpGoiLLX1/w7hs4PwcL+GWiGQk5LzalPOEFfrWfrb+fNRznu
         jvIA==
X-Gm-Message-State: AC+VfDw4kAuOVewwVhcAGil0DMOOczSf7F7cqbegcRl0V1UBaCFKzKNl
        EUm4+beuhL55ByG6qIPDYX5yLVggrFwOOkghY+SMbg==
X-Google-Smtp-Source: ACHHUZ40eKx7z1zIEK43ZteAtF8Wd9UqjzfberS/RGyfg0Yc35rUPQJQ5+CsgQDyrPQsSFVeJx8PEmL+DqYZgiAtTAc=
X-Received: by 2002:a0d:e68f:0:b0:54f:6a20:5a19 with SMTP id
 p137-20020a0de68f000000b0054f6a205a19mr17486306ywe.34.1683062351071; Tue, 02
 May 2023 14:19:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220328000915.15041-1-ansuelsmth@gmail.com> <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain> <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com> <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
In-Reply-To: <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 2 May 2023 23:18:59 +0200
Message-ID: <CACRpkdZx6vEVnxVt0tW4nYtnbv8g=Dc11sa_3myB3GW4jXk1oA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Olof Johansson <olof@lixom.net>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org,
        linux-sunxi@lists.linux.dev,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-amlogic@lists.infradead.org, linux-arm-kernel@axis.com,
        linux-aspeed@lists.ozlabs.org,
        linux-rpi-kernel@lists.infradead.org,
        chrome-platform@lists.linux.dev,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        kernel@dh-electronics.com, linux-mediatek@lists.infradead.org,
        openbmc@lists.ozlabs.org, linux-tegra@vger.kernel.org,
        "linux-oxnas@groups.io" <linux-oxnas@groups.io>,
        linux-arm-msm@vger.kernel.org, linux-unisoc@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        linux-realtek-soc@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, May 2, 2023 at 9:40=E2=80=AFPM Rob Herring <robh+dt@kernel.org> wro=
te:

> I've dusted off my script and made a branch[1] with the result.
> There's just a couple of fixes needed after the script is run (see the
> top commit). The cross arch includes are all fixed up by the script.
> dtbs_install maintains a flat install. I compared the number of .dtbs
> before and after to check the script.
>
> I think the only issue remaining is finalizing the mapping of
> platforms to subdirs. What I have currently is a mixture of SoC
> families and vendors. The most notable are all the Freescale/NXP
> platforms, pxa, socfpga, and stm32. It's not consistent with arm64
> either. Once that's finalized, I still need to go update MAINTAINERS.

I see my nits were fixed like I wanted them, and it's now mostly a
mix of soc and vendor names that make sense so from my point of view:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

NB:
arch/arm64/boot/dts/arm$
vexpress-v2m-rs1.dtsi -> ../../../../arm/boot/dts/vexpress-v2m-rs1.dtsi

This still works after the script, yes?

Yours,
Linus Walleij

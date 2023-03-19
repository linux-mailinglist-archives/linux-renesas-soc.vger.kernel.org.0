Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 951F46C054F
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 19 Mar 2023 22:15:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbjCSVPD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 19 Mar 2023 17:15:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230036AbjCSVPC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 19 Mar 2023 17:15:02 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EA3DB758
        for <linux-renesas-soc@vger.kernel.org>; Sun, 19 Mar 2023 14:15:00 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id e65so10848173ybh.10
        for <linux-renesas-soc@vger.kernel.org>; Sun, 19 Mar 2023 14:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679260500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o0iorqXQgWfUsmZ323+Wyn0oeyKtqb16TQ+B351+3qA=;
        b=PqJlDX0gTYbEtn8Inp0Uq9s7u/HTYqGjD1dgyn2nK1HN81qzYpJ9YK87P3/GK9pyjS
         NIox5xD6dYqMCgOx32vaNV7CStlqriTHBcn+xVBoWVHv64f9OkeU7yqIs+ePEjrucDlf
         hLYQeSFr+uU2/M2tfVJ5lrNZIIQBGZMUOQR/x/Pb64/87ScadQHktjIXmYzf0soAd8Cm
         1/vXcIPIvmyXhvwjyg9zJXzO53/CrLg2sarThltEBai116bRrT//SIC4+loKJSCgmFoX
         qFt40qfje7rzwaijTzBX1bDxUpXmUPSUnzUEnrOEFINsNM2XFX8efE0qIlI4ANoUsKOX
         jQCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679260500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o0iorqXQgWfUsmZ323+Wyn0oeyKtqb16TQ+B351+3qA=;
        b=LaT6KsPnUkzJreyW/Tvpix6LVmOE/evCKv8WCekP8b+SMvsPkNQRJvdtqMxtBeLVzV
         tlPnvQQv1Dns5UgI3iNLbf+s0lzcAh1QWhO3u5zbDjteZEvTIYiIzdNW7vlm9MpHYvCN
         PT2ZZQMP684v68zbEJlyHW6Ukg/ZVPUguhosluV3BgDcovEQPyAyxUdwvk+yzhqZmGGN
         ZROg2UjtDP7RIGxJ552pU7dSY/MnyQvZRerZ2/o5GVUlAhV1bACiNX0aQvc5YglNZn5A
         y3pVMc+QNcvDizY3QYJz83cL12Djb9TUmXK/TybzPRpWEGLdg/V7I2Oe5SD3TA/AjGx4
         5veg==
X-Gm-Message-State: AO0yUKUaqDUGegwpz75Ifn48Qsnr8pLBaGKnYIRqKKrvH2GtLoDPWg7a
        6ZHgCSA5PDwzlt+X2j6xReOHhdjvpZoqFCbqJG0CLg==
X-Google-Smtp-Source: AK7set88lgxJVA166ieuR2TTLZeS1J0rp7AfomiAt3xMAZzNkfr7DVMxQnogtWZ9zBjTSPGk/rTQReVq7hLkbmXRmbU=
X-Received: by 2002:a05:6902:1143:b0:aa9:bd2e:3746 with SMTP id
 p3-20020a056902114300b00aa9bd2e3746mr2997588ybu.4.1679260499808; Sun, 19 Mar
 2023 14:14:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230317233623.3968172-1-robh@kernel.org>
In-Reply-To: <20230317233623.3968172-1-robh@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 19 Mar 2023 22:14:48 +0100
Message-ID: <CACRpkdYFJ-q9OT2b7U-CP08XGfdoD-qN3k3C2KBHhnuBdfSi7A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Drop unneeded quotes
To:     Rob Herring <robh@kernel.org>
Cc:     =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Hector Martin <marcan@marcan.st>,
        Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Andrew Jeffery <andrew@aj.id.au>,
        Joel Stanley <joel@jms.id.au>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Heiko Stuebner <heiko@sntech.de>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Jianlong Huang <jianlong.huang@starfivetech.com>,
        Dvorkin Dmitry <dvorkin@tibbo.com>,
        Wells Lu <wellslutw@gmail.com>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@lists.linux.dev, asahi@lists.linux.dev,
        linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, patches@opensource.cirrus.com,
        alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Mar 18, 2023 at 12:36=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:

> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Less bad examples =3D good.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

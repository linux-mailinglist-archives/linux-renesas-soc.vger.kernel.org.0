Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 987FA54E1AF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Jun 2022 15:16:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376691AbiFPNQs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Jun 2022 09:16:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376631AbiFPNQr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Jun 2022 09:16:47 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3F003FBEA
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Jun 2022 06:16:45 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id v22so2142949ybd.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Jun 2022 06:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fsun78rWieFnLaLeD83Q2xWjxjOs241/wdwG/0QCsic=;
        b=hfe7mj1KZcI8jwu/+nrNcYUQkpbisjdMGB5MdUDVHZURXKTI0fpPSwYzVJTSQIvUQj
         mQ+FkQDUQOvueZPXCdzZ+WEb9CVEmydueaKmiNl4EduEP7G5KldCbqyuT6DrH619ltMs
         SiQd+lbSkJ/2ztzapTtqInm6GdRXCWf5M7sFxt2WgQ72hgoUmjnoNNk2kM6AO8hHEKNE
         9YK5KNalKb6+DMnwTXh0W8DordCVtz41PW0ZjsKXzkeRiewzu8ZSaBVNIEHFdWdQ6ziQ
         lQIpZXEuEWineyu9YQb+gIhoNcGOJyB0hu2Lyui1EO16WO1/xuKLHNgfFYiihKSzkXkW
         MS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fsun78rWieFnLaLeD83Q2xWjxjOs241/wdwG/0QCsic=;
        b=M3ggTSms40f20dHdceG869dLygy/FKs45X5H4WzdPbzF+942yWyL/dPRov0mJ33Tx6
         DuRihMdtm6RW3LNruGSnP2mzspooj6TOHDpOQgo8RO1ZFKK9IE/Xtrqbl3XXWf7iX6MA
         FDhLMX7P4AH3Kw3lilXd0Mg+0ubt8/sA4RQiFjTo29dd72GaEvIPckfYmbWNWO4rwZ3P
         9q2D8HqZga37R3glkP7inpMFUWgWhO1y45v7jopjM+MGu2SscirB5N8wKFMIAYhrFzBg
         v/+vrbyeq3pEdwqlVldyIO1Jpw99isNc2iX+keJvsdakwaPwECE8u+Priufh7AUVQ9GS
         uEdw==
X-Gm-Message-State: AJIora/JrVEcAIWWrjATEufEljtCs99O3zOual5Et7IcPD99j6qs9ImW
        6ncYSxO0QcUQBSPwgUFpAv+DBC5qt4OBVKpeEMSMeA==
X-Google-Smtp-Source: AGRyM1uSi6CDKxBHFMyZRQ8/7cL0ndy869mFvAGFrCTYZ+gYNuQVO0PO7I97kA8jFrTxg7Fugxfs5Adf3pgP5atidCY=
X-Received: by 2002:a25:2642:0:b0:664:c89e:b059 with SMTP id
 m63-20020a252642000000b00664c89eb059mr5336121ybm.369.1655385405187; Thu, 16
 Jun 2022 06:16:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220610084545.547700-1-nuno.sa@analog.com> <20220610084545.547700-32-nuno.sa@analog.com>
In-Reply-To: <20220610084545.547700-32-nuno.sa@analog.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Jun 2022 15:16:34 +0200
Message-ID: <CACRpkdY4DMPwkxTGdyj31YsS=xCv7vv7Zwp5Awy3aNRgUMZcfw@mail.gmail.com>
Subject: Re: [PATCH 31/34] iio: adc: qcom-spmi-adc5: convert to device properties
To:     =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc:     linux-imx@nxp.com, linux-renesas-soc@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        chrome-platform@lists.linux.dev,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-mediatek@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        openbmc@lists.ozlabs.org, Cai Huoqing <cai.huoqing@linux.dev>,
        Benjamin Fair <benjaminfair@google.com>,
        Jishnu Prakash <quic_jprakash@quicinc.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Amit Kucheria <amitk@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        Haibo Chen <haibo.chen@nxp.com>,
        Benson Leung <bleung@chromium.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Christophe Branchereau <cbranchereau@gmail.com>,
        Patrick Venture <venture@google.com>,
        Arnd Bergmann <arnd@arndb.de>, Nancy Yuen <yuenn@google.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Gwendal Grignou <gwendal@chromium.org>,
        Saravanan Sekar <sravanhome@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Guenter Roeck <groeck@chromium.org>,
        Fabio Estevam <festevam@gmail.com>,
        Olivier Moysan <olivier.moysan@foss.st.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jun 10, 2022 at 10:49 AM Nuno S=C3=A1 <nuno.sa@analog.com> wrote:

> Make the conversion to firmware agnostic device properties. As part of
> the conversion the IIO inkern interface 'of_xlate()' is also converted to
> 'fwnode_xlate()'. The goal is to completely drop 'of_xlate' and hence OF
> dependencies from IIO.
>
> Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

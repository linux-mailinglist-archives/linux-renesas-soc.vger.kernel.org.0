Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 650D5547598
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Jun 2022 16:21:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234525AbiFKOVT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 Jun 2022 10:21:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230379AbiFKOVS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 Jun 2022 10:21:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CFB821B6;
        Sat, 11 Jun 2022 07:21:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BB75160F2B;
        Sat, 11 Jun 2022 14:21:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 454F6C34116;
        Sat, 11 Jun 2022 14:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654957277;
        bh=lfyWxTdm+9DA2o5Gv4TMOK79YAUDNtuhApIhJjT70sc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=oCVbMFgyFX6oFH9u3+7f5Hm4+q5RYHvp3rgC4dsE0IEQZXvrtnPlXfQnAAnejz0xR
         lkmxE/CIR1fCuZZ1eU3ZYl5amkKuaOVsuPrh6pXb2TtzM4ufNY7k1LT1YVEAZ0QUc9
         8kFKGWJz6+JPx7xwmpXMHQ0suVKcRhwqQiando1XDqH+x4ErQgXo+eWTv7qOtiS2Kk
         7sEjS2O1A+ImNtfVji8lSkOMnMR/LIKBCWMg10V5/81/grKwvV8ar0Y3R0FBH7igf4
         Hx1sU60YSsy+PE4LPbaCFaBA840/DS4NcKtTAOlTrHnPRvu+fg3VnT5Fr7aAFuXBk8
         iv+MSeL9C6Jnw==
Date:   Sat, 11 Jun 2022 15:30:15 +0100
From:   Jonathan Cameron <jic23@kernel.org>
To:     Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>
Cc:     <linux-imx@nxp.com>, <linux-renesas-soc@vger.kernel.org>,
        <linux-mips@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <chrome-platform@lists.linux.dev>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-iio@vger.kernel.org>,
        <openbmc@lists.ozlabs.org>, Cai Huoqing <cai.huoqing@linux.dev>,
        Benjamin Fair <benjaminfair@google.com>,
        Jishnu Prakash <quic_jprakash@quicinc.com>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Amit Kucheria <amitk@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        Haibo Chen <haibo.chen@nxp.com>,
        Benson Leung <bleung@chromium.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
        Christophe Branchereau <cbranchereau@gmail.com>,
        Patrick Venture <venture@google.com>,
        Arnd Bergmann <arnd@arndb.de>, Nancy Yuen <yuenn@google.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        "Gwendal Grignou" <gwendal@chromium.org>,
        Saravanan Sekar <sravanhome@gmail.com>,
        "Tali Perry" <tali.perry1@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Avi Fishman <avifishman70@gmail.com>,
        "Lorenzo Bianconi" <lorenzo@kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Nicolas Ferre" <nicolas.ferre@microchip.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Shawn Guo <shawnguo@kernel.org>,
        "Guenter Roeck" <groeck@chromium.org>,
        Fabio Estevam <festevam@gmail.com>,
        "Olivier Moysan" <olivier.moysan@foss.st.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 19/34] iio: core: drop of.h from iio.h
Message-ID: <20220611153016.2f91d7e5@jic23-huawei>
In-Reply-To: <20220610084545.547700-20-nuno.sa@analog.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
        <20220610084545.547700-20-nuno.sa@analog.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 10 Jun 2022 10:45:30 +0200
Nuno S=C3=A1 <nuno.sa@analog.com> wrote:

> There is no reason to include OF as we only need to forward declare
> 'of_phandle_args'. Previously, some drivers were actually relying on
> this for some headers (those were already fixed).
>=20
> Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>
This one deserves a 'woot' :)

I would have guessed we were much further off being able to do this
than the 18 patches earlier in this series. Good work from Andy
and yourself to get to the point where this was possible.

Applied to the togreg branch of iio.git and pushed out as testing for
0-day to take a look.  I'm probably going to review the remainder, but
leave on list a bit longer as they are more complex/controversial than
this includes cleanup.

Thanks,

Jonathan

> ---
>  include/linux/iio/iio.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
> index 4e21a82b3756..d9b4a9ca9a0f 100644
> --- a/include/linux/iio/iio.h
> +++ b/include/linux/iio/iio.h
> @@ -11,13 +11,14 @@
>  #include <linux/cdev.h>
>  #include <linux/slab.h>
>  #include <linux/iio/types.h>
> -#include <linux/of.h>
>  /* IIO TODO LIST */
>  /*
>   * Provide means of adjusting timer accuracy.
>   * Currently assumes nano seconds.
>   */
> =20
> +struct of_phandle_args;
> +
>  enum iio_shared_by {
>  	IIO_SEPARATE,
>  	IIO_SHARED_BY_TYPE,


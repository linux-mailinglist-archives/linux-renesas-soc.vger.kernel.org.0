Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FAC1770CF5
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Aug 2023 03:20:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229483AbjHEBUj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Aug 2023 21:20:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjHEBUi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Aug 2023 21:20:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C743C4EDE;
        Fri,  4 Aug 2023 18:20:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 578D1620F0;
        Sat,  5 Aug 2023 01:20:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B392AC433C8;
        Sat,  5 Aug 2023 01:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691198436;
        bh=9qAUJKWo25a23w4m5MuvYklEUaHcovxbWs3tx+POsKw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=QKK52NJEKAiL/WwzTChe9LU10WozFPPUGGFy6OwD1dtuqeloenn/TrVM5Gsb1p8kV
         SkM3jzz13lTSfb1c4i/ZbM5CYM6C2GV/IGl74q2irZEYXQyc+KucYsXHsHmRID6fRc
         oDtblZF8k7B3P3IXbcEUpMCQ5kqn41XGu8qYVy8IbZ6e/rqRzTh1eyU2MYb69l1COJ
         G/rkm0eY32Ql7Q8dJr2iBtBK8Lm8pqfim6li/qVw0W3b5u1IHjszYEpoiCGltrp1Nw
         CaGI1pCfI7VyZ83DROZyLM5YlTgZ9n2ErOqd/QNYtlFtTCiHx1vlBh896njUZ/Q3pK
         nSU4MK3oBd0+A==
Message-ID: <aa7d127df5fb91e9a3c61d78d4aa7cb9.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230725175140.361479-1-biju.das.jz@bp.renesas.com>
References: <20230725175140.361479-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH] clk: Fix undefined reference to `clk_rate_exclusive_{get,put}'
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thierry Reding <thierry.reding@gmail.com>,
        Uwe =?utf-8?q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        linux-renesas-soc@vger.kernel.org,
        kernel test robot <lkp@intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Russell King <linux@armlinux.org.uk>
Date:   Fri, 04 Aug 2023 18:20:34 -0700
User-Agent: alot/0.10
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Biju Das (2023-07-25 10:51:40)
> The COMMON_CLK config is not enabled in some of the architectures.
> This causes below build issues:
>=20
> pwm-rz-mtu3.c:(.text+0x114):
> undefined reference to `clk_rate_exclusive_put'
> pwm-rz-mtu3.c:(.text+0x32c):
> undefined reference to `clk_rate_exclusive_get'
>=20
> Fix these issues by moving clk_rate_exclusive_{get,put} inside COMMON_CLK
> code block, as clk.c is enabled by COMMON_CLK.
>=20
> Fixes: 55e9b8b7b806 ("clk: add clk_rate_exclusive api")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/all/202307251752.vLfmmhYm-lkp@intel.com/
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---

Applied to clk-fixes

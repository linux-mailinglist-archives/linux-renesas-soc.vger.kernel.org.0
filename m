Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB978784B5E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Aug 2023 22:28:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230519AbjHVU2v (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Aug 2023 16:28:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230032AbjHVU2v (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Aug 2023 16:28:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE221CF3;
        Tue, 22 Aug 2023 13:28:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6CC906432D;
        Tue, 22 Aug 2023 20:28:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2972C433C8;
        Tue, 22 Aug 2023 20:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692736127;
        bh=6f5FyCfLDzuHLiSHijWE7qPSLlX2swSIgoIGlFa2UeM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=JJrA4tFMwvnexhNlmF30iCe2bZXrD4P4ZkvdDesUn/pRJ7HQKc8GCIXzvTNXAPqlW
         Xflwb7z/bMAMgbbw4tprbGbmW5vK7sve/vBvbpI7W+wTSWGdQShS11goWswrdhb4Om
         4cb4io3WVngCKb1P8NVOGkC/3PXrMSJ19neLDx7ex8fZMjgDmIp0Ma0n9A8Dje7mNm
         s+xrirw6vCSBl6XV5D2xgdcmJAyAz5402umkjDtSvCMThF5oN8y1JMXHnnIAS8wy4m
         twWTLxZyN1ItRYx/n13NU3E3xh9duRhvsL1KLdyOdM7vE0y3Ep5+kPH1aJZ5+FH36s
         VNYFc++tFp0mw==
Message-ID: <309338dc2c3b62e3c62268760947b9c1.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230817142211.311366-3-biju.das.jz@bp.renesas.com>
References: <20230817142211.311366-1-biju.das.jz@bp.renesas.com> <20230817142211.311366-3-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v3 2/4] clk: vc3: Fix 64 by 64 division
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Julia Lawall <julia.lawall@inria.fr>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Tue, 22 Aug 2023 13:28:45 -0700
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Biju Das (2023-08-17 07:22:09)
> Fix the below cocci warnings by replacing do_div()->div64_ul() and
> bound the result with a max value of U16_MAX.
>=20
> cocci warnings:
>         drivers/clk/clk-versaclock3.c:404:2-8: WARNING: do_div() does a
>         64-by-32 division, please consider using div64_ul instead.
>=20
> Reported-by: Julia Lawall <julia.lawall@inria.fr>
> Closes: https://lore.kernel.org/r/202307270841.yr5HxYIl-lkp@intel.com/
> Fixes: 6e9aff555db7 ("clk: Add support for versa3 clock driver")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Added to this patch series.
> v1->v2:
>  * Added fixes tag.
> ---
>  drivers/clk/clk-versaclock3.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/clk-versaclock3.c b/drivers/clk/clk-versaclock3.c
> index 7ab2447bd203..3ded616a0d15 100644
> --- a/drivers/clk/clk-versaclock3.c
> +++ b/drivers/clk/clk-versaclock3.c
> @@ -401,9 +401,8 @@ static long vc3_pll_round_rate(struct clk_hw *hw, uns=
igned long rate,
>                 /* Determine best fractional part, which is 16 bit wide */
>                 div_frc =3D rate % *parent_rate;
>                 div_frc *=3D BIT(16) - 1;
> -               do_div(div_frc, *parent_rate);
> =20
> -               vc3->div_frc =3D (u32)div_frc;
> +               vc3->div_frc =3D min_t(u64, div64_ul(div_frc, *parent_rat=
e), U16_MAX);
>                 rate =3D (*parent_rate *
>                         (vc3->div_int * VC3_2_POW_16 + div_frc) / VC3_2_P=
OW_16);

                                                            ^
Should this be vc3->div_frc now to get the clamped value? --|

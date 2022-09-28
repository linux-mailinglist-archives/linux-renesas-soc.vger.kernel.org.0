Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE4625EE3C7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Sep 2022 20:03:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233404AbiI1SDj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 28 Sep 2022 14:03:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234550AbiI1SDi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Sep 2022 14:03:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D68F3FE659;
        Wed, 28 Sep 2022 11:03:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3295261F6B;
        Wed, 28 Sep 2022 18:03:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A9A1C433D6;
        Wed, 28 Sep 2022 18:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664388216;
        bh=9mc22b3QIo0ESJKycvuZW5v2n1XiZeg/Rl6AFynryHI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Yq+kcTGRO2jgzlrfE1zrD2k98f35KxSlZM54146hL8gTouY54JK/qsvPIodvwRyI0
         MQaNU1s8KJyS3swsPGf6+oUlVqRrJIsBesRTiyihpxXNTg9S1AoE1T/jsa2/xr1wpy
         4GpluAs8uMJm0tAiKUxbjQ56pxBsc46LT7NvTuMwP5zosjj+0d1cwOtgOJ9lg1WpGK
         2zWJZAXhDY23owJZm506xjk2OQwKD7OlhU+gr+3uP+WmfFqmgYpuPiAwYyKezcveXM
         5ZbnY18R2OScgI4bzGnScj8UyGVBePSr9WFmt1GlyXbLZHqz2izjb1MVoo9yZAcmHW
         xeMSo0VW9ruiQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3cb2f1798145099a46134862c6bcbdcc29ca7410.1664204336.git.geert+renesas@glider.be>
References: <cover.1664204336.git.geert+renesas@glider.be> <3cb2f1798145099a46134862c6bcbdcc29ca7410.1664204336.git.geert+renesas@glider.be>
Subject: Re: [PATCH 2/2] clk: renesas: r8a779g0: Add MSIOF clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 28 Sep 2022 11:03:34 -0700
User-Agent: alot/0.10
Message-Id: <20220928180336.8A9A1C433D6@smtp.kernel.org>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2022-09-26 08:01:49)
> Add the module clocks used by the Clock-Synchronized Serial Interfaces
> with FIFO (MSIOF) on the Renesas R-Car V4H (R8A779G0) SoC.
>=20
> Extracted from a larger patch in the BSP by Kazuya Mizuguchi.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

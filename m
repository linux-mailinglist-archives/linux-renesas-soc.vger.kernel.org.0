Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FC1B79AD6B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Sep 2023 01:39:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241597AbjIKVRl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Sep 2023 17:17:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244437AbjIKUcM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Sep 2023 16:32:12 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 180A6FB;
        Mon, 11 Sep 2023 13:32:08 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3DE1C433C7;
        Mon, 11 Sep 2023 20:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694464327;
        bh=A3REaV+xAgREm2UnZT+S/fzxN8fIDYskWjT3/a7HfYM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=eJeKXRwfv427s0fJnJuTjxX2lmgqFDmKpz2ZsMBzlSLaGqLmtQyI+jvILLI7G44tR
         RYJyPX2Z77zJR3UTAacVeylGET/57z3Z9F/yeUO7KfyqLhLyGbvwstjsT3t8j6sSWt
         auG58yiaLOC3SPVsv51XASeEsft6N4dKfb17IkY2A0uQBzLAMu13Z/p9QQBotUYC1B
         DxmQJAtoKM91/UIsc2bujUvlzU1h72x7/DK7V0RxLQESEm/cq3ukPMnHwPRtXmC6pP
         V2pbeYr5elpwYs65GjdHT4Eq+uA2YZ72nvDmEL9oNHaNWIVLRGGOkLUxEVuzjl68Ih
         ErCqoHVOTg/YA==
Message-ID: <d0fc2d257b85b6be8a8818932abcc088.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230824104812.147775-3-biju.das.jz@bp.renesas.com>
References: <20230824104812.147775-1-biju.das.jz@bp.renesas.com> <20230824104812.147775-3-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v5 2/4] clk: vc3: Fix 64 by 64 division
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Julia Lawall <julia.lawall@inria.fr>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Mon, 11 Sep 2023 13:32:05 -0700
User-Agent: alot/0.10
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Biju Das (2023-08-24 03:48:10)
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

Applied to clk-fixes

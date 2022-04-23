Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D099B50C6AF
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 23 Apr 2022 04:40:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232159AbiDWCnk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Apr 2022 22:43:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231970AbiDWCnj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Apr 2022 22:43:39 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 671AC14EC54;
        Fri, 22 Apr 2022 19:40:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0CE04B8335C;
        Sat, 23 Apr 2022 02:40:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC928C385A4;
        Sat, 23 Apr 2022 02:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650681640;
        bh=IdCFcgvm/zKae6TiKI2zjh09ofMsIgLxzcaNuyCmHiQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=CTmzRzmmh3Mw/xh2EsRf2TDOnNH7aiE+fxjXesKyFXSoKBDHZyrsQ7PHJf/7EGCqB
         RzcgUHtbhGnpA5FXudw4OSPjZv9rfavP6Qb349Nv56uajErL42/UG4HwD8hh6D4QD2
         Y7ER6Ix7fu3u31FP8MeDNfA1cDLPRPfBLdGPUveyY2UScsyxH+NIeLEw5pQPeRmYa0
         3nusJuqZn3Xj0UcbaWOD3J+Hean6ouWPLYLLe/0GE5rrIiM1huSK/Hce9xE520sln3
         Il0RgeWe4vjYDp/4o7XcNuzdcWrR740SavFqfxdewuPsYg429Q9+AAw/EIQpzLT5mP
         rC3zc+MGrCB9g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1650638810.git.geert+renesas@glider.be>
References: <cover.1650638810.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v5.19
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Fri, 22 Apr 2022 19:40:37 -0700
User-Agent: alot/0.10
Message-Id: <20220423024040.BC928C385A4@smtp.kernel.org>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2022-04-22 07:55:05)
>         Hi Mike, Stephen,
>=20
> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc=
17:
>=20
>   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v5.19-tag1
>=20
> for you to fetch changes up to 59086e4193f4fc920a23d2045a473f62450b4269:
>=20
>   clk: renesas: r9a07g043: Add SDHI clock and reset entries (2022-04-13 1=
2:30:19 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

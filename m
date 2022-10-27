Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C58A60ED06
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Oct 2022 02:33:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbiJ0Adn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Oct 2022 20:33:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbiJ0Adn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Oct 2022 20:33:43 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97B5313224C;
        Wed, 26 Oct 2022 17:33:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 27186620D9;
        Thu, 27 Oct 2022 00:33:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85819C433C1;
        Thu, 27 Oct 2022 00:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666830821;
        bh=LHGmM/mXpFrHGGaXOWXbiRdBL+GibSz7b5zQD+9pun0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=OHYvcFimlKnSGT4YaClHAJO5pu1y88wgJp1BQuyAwhwJ16+Et4zih/dmjV8S6RR9o
         qciLCYL2XAHJ4VhaQXvXmSXeyXhMFgnv9mHsW3He9/r3m8W29oflEjCSXMJIN71Mda
         zub4XQs1D1NzrTFU/4CEGcx/vv9PkZVOSzJRx+gHffHNxQklaIKcHLXYrENFf23Whu
         SbktOQKKORJ4fsUMIcUyE5dY0T0C95pCuv6cWC1AEC/BBPVPV5sWr8NPTFCfl72C2r
         xN5XiFtaC6/IReUJQY8MBRNH3v3iUl82bC6xSfrYvFK8+9q8yEPTvmlMgKRb3E40Mi
         jtSch+adnb7kQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1666780184.git.geert+renesas@glider.be>
References: <cover.1666780184.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Fixes for v6.1
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 26 Oct 2022 17:33:39 -0700
User-Agent: alot/0.10
Message-Id: <20221027003341.85819C433C1@smtp.kernel.org>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2022-10-26 04:35:28)
>         Hi Mike, Stephen,
>=20
> The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc7=
80:
>=20
>   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-fixes-for-v6.1-tag1
>=20
> for you to fetch changes up to a9003f74f5a2f487e101f3aa1dd5c3d3a78c6999:
>=20
>   clk: renesas: r8a779g0: Fix HSCIF parent clocks (2022-10-26 12:05:36 +0=
200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-fixes

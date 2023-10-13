Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3B297C904D
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Oct 2023 00:35:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbjJMWfl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Oct 2023 18:35:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbjJMWfl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Oct 2023 18:35:41 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB545B7;
        Fri, 13 Oct 2023 15:35:39 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 660F2C433C8;
        Fri, 13 Oct 2023 22:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697236539;
        bh=yY7vi/oHiaoaIjR8OOaR7MIByftEFMOd3g7FzrY3sK4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=uBtfZ888WLS6Q+mrCNHIpyLcSnurCl72jLJ97H+K3MYcQ48LrP21Iwrr4F71e8r6f
         0i89paKSkXDpZ1O3iskPP/1LED4Gp7xKwissNVBfDg8ekdoyyv7tqWofT12WLbGaDf
         ZKlyiLQc2Tl9p6s8gji9+8HcmGugGPqTfSMsb21grHKDwdf0E04fQGGF2aMFVlWorh
         7Tu47gNMXdkjsvtP4i72HgszQCH7hKBhQImutnTrKys3x6CCONAyTFV5D0Sawt7mdw
         PXzuJPZuWo/8X5eT2nDYUNxciuNtDl/iTCY3fH1NMyWtkzEm4ATePZQ2SDNY2VSpnp
         7ujCDt6fWFMqA==
Message-ID: <1d0a74d91a75211786c919254ff7a0f2.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1697200833.git.geert+renesas@glider.be>
References: <cover.1697200833.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v6.7 (take two)
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Fri, 13 Oct 2023 15:35:37 -0700
User-Agent: alot/0.10
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2023-10-13 05:48:24)
>         Hi Mike, Stephen,
>=20
>=20
> The following changes since commit 87882525e5ddae7ef6f1b1df5e1eda9bcbcd77=
20:
>=20
>   clk: renesas: r8a7795: Constify r8a7795_*_clks (2023-09-26 09:38:00 +02=
00)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v6.7-tag2
>=20
> for you to fetch changes up to 4bce4bedbe6daa54cf701184601f913a0c00bb1c:
>=20
>   clk: renesas: r9a08g045: Add clock and reset support for SDHI1 and SDHI=
2 (2023-10-12 20:05:52 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

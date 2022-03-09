Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F5C74D3939
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Mar 2022 19:52:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235544AbiCISw4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Mar 2022 13:52:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231675AbiCISwz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Mar 2022 13:52:55 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BC67108C;
        Wed,  9 Mar 2022 10:51:56 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1180461797;
        Wed,  9 Mar 2022 18:51:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70CCDC340E8;
        Wed,  9 Mar 2022 18:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646851915;
        bh=xzJ5MUhWVJhz7dgkUY0gBf+kW/zn0zNkmEhZ9It9QA4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=FwnEI0nFWdWAYlc1MD4qq1hCYtmQfnj23PnNY6G7735I0PuGDd812/PKE2su/qUTf
         +pgM/NcOA8QuSnaU9+0U6w7T3KnH/ymQO9UCOa6VQ05X1QoB4M7jO5BllxQrxdAHYd
         3VuEJi6VNHJsNCcgjn/WycKcFEVF51F5fFNZjxchLQzXXIl1b465OG2ALqybpXUujL
         /DZoClYmQh0iZXGScvA/8a4EjUiNXmGEBGzvs4DcPglP6LEx31JWU19uuIWEPXlBz1
         obXGah2qz9HVFQgKiUn7JItHR3GQyMmn/5k5JhxY5CVhc8dNWD741GfLZhT2UKopaB
         O46uX3wfBw+jw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1645795940.git.geert+renesas@glider.be>
References: <cover.1645795940.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v5.18 (take two)
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 09 Mar 2022 10:51:53 -0800
User-Agent: alot/0.10
Message-Id: <20220309185155.70CCDC340E8@smtp.kernel.org>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2022-02-25 05:38:29)
>         Hi Mike, Stephen,
>=20
> The following changes since commit a1bcf50a99dd1e40f0c6a963bd4f12547a89d4=
cd:
>=20
>   clk: renesas: rzg2l-cpg: Add support for RZ/V2L SoC (2022-02-10 14:34:5=
8 +0100)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v5.18-tag2
>=20
> for you to fetch changes up to 73421f2a48e6bd1d1024a09aedbc9c662cb88e77:
>=20
>   clk: renesas: r8a779f0: Add PFC clock (2022-02-22 09:51:20 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4B046FE649
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 May 2023 23:27:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236229AbjEJV1k (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 May 2023 17:27:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229826AbjEJV1j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 May 2023 17:27:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3E1B2D4A;
        Wed, 10 May 2023 14:27:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5A71B640AA;
        Wed, 10 May 2023 21:27:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF11CC433D2;
        Wed, 10 May 2023 21:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683754057;
        bh=ywmqeFMzfvrQL/SCISTTmbi8+l70/3WZqnqyuAWgS5c=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Mnzm273Jm12GMWY36IOsXl2AR9aOIcUQ+bruerK47ctqFDo49KzYmUXvCiIvb4Hg3
         lMj91TgOxAeD2WOAtBSzK5newgVzJhxoIX7M9oSQdTvAdxoi5QsOYfSR9fFORTn+5E
         +tB2bZMQBdTwuinWe/JIj90K7dXZOfjhXVcyI3yW5i1q9XPoYz8uZQvOf0k65kMinv
         4RfOUX+n52E7siVaJs9+LU8yRLuDJs38E+yOhZkw/obmjkaWfdGsiqTC8Nxliel8pS
         NTOcsibHr75a1ZejgcHZNfXPhxFwmppLARDwoHFBiGVjPs34FsMvBGMhMkNJEhYOQ/
         FVHF7tL6An9Ew==
Message-ID: <13b9618026d488a2871806b61014b459.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230507133906.15061-2-marek.vasut+renesas@mailbox.org>
References: <20230507133906.15061-1-marek.vasut+renesas@mailbox.org> <20230507133906.15061-2-marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH 2/3] clk: vc7: Fix .driver_data content in i2c_device_id
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Alex Helms <alexander.helms.jy@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-renesas-soc@vger.kernel.org
To:     Marek Vasut <marek.vasut+renesas@mailbox.org>,
        linux-clk@vger.kernel.org
Date:   Wed, 10 May 2023 14:27:33 -0700
User-Agent: alot/0.10
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Marek Vasut (2023-05-07 06:39:05)
> The .driver_data content in i2c_device_id table must match the
> .data content in of_device_id table, else device_get_match_data()
> would return bogus value on i2c_device_id match. Align the two
> tables.
>=20
> The i2c_device_id table is now converted from of_device_id using
> 's@.compatible =3D "renesas,\([^"]\+"\), .data =3D \(.*\)@"\1, .driver_da=
ta =3D (kernel_ulong_t)\2@'
>=20
> Fixes: 48c5e98fedd9 ("clk: Renesas versaclock7 ccf device driver")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---

Applied to clk-next

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A06E784D86
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Aug 2023 01:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231815AbjHVXx6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Aug 2023 19:53:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbjHVXx5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Aug 2023 19:53:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C08B5CFE;
        Tue, 22 Aug 2023 16:53:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5918563B2C;
        Tue, 22 Aug 2023 23:53:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BD0AC433C7;
        Tue, 22 Aug 2023 23:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692748434;
        bh=7wXNh2/0RYoqISXjhJS9rnCgvEFKMCPWJxUcecoVfgU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=F/6MAhkrKyEAg0YwsLKNGx/V1zjqXNl+Evs5K8B4HH8EfQiEWQ8pTK+pOzPXFXMxe
         AjkauLtsFAjXS3vnYvUThKo9KkJoaxN4Mi0KFLFa9zwhZniZCA69ciqWyU4pCNOLzS
         FR/ZbZhFHCvNDeItZCV7+0AFa7d3I4Z5IiFi2Qf21h1E4l7J/4Khky6KZEhWHQ5i4N
         A8ge0YR4s1o2po+ZWvsGaQEQEjXsctXcaneFpAtOJwk+Tehw9b0f+nesoBAwZfJZnF
         ntw9VsF+KvsyVc3Dih27hAN0e173aLK509OfatUXKRuzMgstAxY9WYLncow+MjyaGk
         J8TMXfvMS/toQ==
Message-ID: <35ec88057dd679844b259d9548e08b08.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230817142211.311366-5-biju.das.jz@bp.renesas.com>
References: <20230817142211.311366-1-biju.das.jz@bp.renesas.com> <20230817142211.311366-5-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v3 4/4] clk: vc3: Make vc3_clk_mux enum values based on vc3_clk enum values
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Tue, 22 Aug 2023 16:53:52 -0700
User-Agent: alot/0.10
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Biju Das (2023-08-17 07:22:11)
> Make vc3_clk_mux enum values depend upon vc3_clk enum values=C2=A0to avoid
> any accidental breakage in the future.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---

Applied to clk-next

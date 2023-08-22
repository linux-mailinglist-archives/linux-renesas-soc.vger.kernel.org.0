Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 201F5784D82
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Aug 2023 01:53:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231805AbjHVXxc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Aug 2023 19:53:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbjHVXxc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Aug 2023 19:53:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEF0CE45;
        Tue, 22 Aug 2023 16:53:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 58B8E64105;
        Tue, 22 Aug 2023 23:53:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83DB7C433C7;
        Tue, 22 Aug 2023 23:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692748409;
        bh=v9LYPstg2zH4mvpfNgK1sI5rjvM5lTE1Uh1AWsSrD6o=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=aTsJFA21PpkjnbVYM+cFpjhz0YNXEQt6sqbqHq5dYslbrE9Xnj1QyDZCpYbPCAkuR
         ZYThzDDl0AhreLEQ3rB7LniBf+wvEcO9kayx8L72mILasaugMBGqDf4LzJs9+LQzLg
         tlSgnuy/WZiVCQkb4Mo+T++3Aovo9BV0G04cd2cqq6Nf5yPAzvWC2G6kTJMBGUVwp8
         NYsbpFJO8B9KlquamIfq+okxJuJrhFX8wH+qWhjKhs9BFHzBx+DE6ohL/mM3xUwj9n
         FHQQhp1wQOokVc/lEQmu8kSwx3e01s3EbBwLlUgAEXWsBL8H+djs8LSkaYXrYMkCex
         EzxfwFIYn1NyA==
Message-ID: <4af566f16bfc5363bd9c1ba3e8861ddd.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230817142211.311366-4-biju.das.jz@bp.renesas.com>
References: <20230817142211.311366-1-biju.das.jz@bp.renesas.com> <20230817142211.311366-4-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v3 3/4] clk: vc3: Fix output clock mapping
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Tue, 22 Aug 2023 16:53:27 -0700
User-Agent: alot/0.10
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Biju Das (2023-08-17 07:22:10)
> According to Table 3. ("Output Source") in the 5P35023 datasheet,
> the output clock mapping should be 0=3DREF, 1=3DSE1, 2=3DSE2, 3=3DSE3,
> 4=3DDIFF1, 5=3DDIFF2. But the code uses inverse. Fix this mapping issue.
>=20
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Closes: https://lore.kernel.org/all/CAMuHMdUHD+bEco=3DWYTYWsTAyRt3dTQQt4X=
paejss0Y2ZpLCMNg@mail.gmail.com/
> Fixes: 6e9aff555db7 ("clk: Add support for versa3 clock driver")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Applied to clk-next

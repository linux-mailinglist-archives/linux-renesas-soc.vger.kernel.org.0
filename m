Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE1BF76BD20
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Aug 2023 20:59:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231620AbjHAS7K (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Aug 2023 14:59:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231955AbjHAS6X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Aug 2023 14:58:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB88026A3;
        Tue,  1 Aug 2023 11:58:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 67179616A0;
        Tue,  1 Aug 2023 18:58:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF82BC433C9;
        Tue,  1 Aug 2023 18:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690916299;
        bh=9d9S2Le/8QNHWQQ7wS+BkERzb+a1LXJW0Uz5xbiOPUA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Sll5qowzMz5rxOkXu3ekVNoF5EtcnBXtRgwRiv7Yo//3IIgX+G4oxpsTnsCZRqRet
         hXQBZjRski4gFlWiR9aEmRIds19A0hNu4RsSA4Vvy8W2LKfAbyZjAj5YamqtWI1Me0
         cdpPyIz99gaQWr66NhhdIeZt9RlRnofBLMIPf2vn0x2NTZQqe+0+wNkbHJlog37t6i
         tUZGMWZvNZzxxckpb0Df/plfSJD5V35YwPllOgPG6FFd+Wmtc8IhmwQZkzuPML37v0
         odaA0z+x3OTwrigz5PfPgGVv86+fMIbWvekOBo6czun/XyPapqkqsUMEQt1VJyi6e2
         BtEFWn+VhE38Q==
Message-ID: <09434a37dacc7b8b0278d1fe26c16313.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230801135552.386796-1-biju.das.jz@bp.renesas.com>
References: <20230801135552.386796-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH] clk: vc3: Fix 64 by 64 division
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Julia Lawall <julia.lawall@inria.fr>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Tue, 01 Aug 2023 11:58:17 -0700
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

Quoting Biju Das (2023-08-01 06:55:52)
> Fix the below cocci warnings by replacing do_div()->div64_ul() and
> bound the result with a max value of U16_MAX.
>=20
> cocci warnings:
>         drivers/clk/clk-versaclock3.c:404:2-8: WARNING: do_div() does a
>         64-by-32 division, please consider using div64_ul instead.
>=20
> Reported-by: Julia Lawall <julia.lawall@inria.fr>
> Closes: https://lore.kernel.org/r/202307270841.yr5HxYIl-lkp@intel.com/
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---

Any Fixes tag?

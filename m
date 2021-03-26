Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BED034AE0D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Mar 2021 18:56:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230114AbhCZRz5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Mar 2021 13:55:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:56436 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229986AbhCZRzp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Mar 2021 13:55:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1E347619F8;
        Fri, 26 Mar 2021 17:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616781345;
        bh=50K6yAF9BJep6gQmX7Ftk8E61gbf6hofpMr0Nx/U5+o=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=EcMPPOh/LPvsrYFbWZyeQ0les1WtCM9P9AXYvh7rkK49C4M+yiZwkFj9TVCdoCzpX
         UX/LuJhkjZYHmq3CruIkrD4GNx+siMftfZPFjPdmeL2Q8fEJx86Qr7oBqc/XDKWl1s
         4cYKLASkdCmUtSr+S762Oe59mwbkW7qw9TixzPxnFiLVzAQUP0s0t9LIpUMTL4QvNR
         W9aGvuAuxuFP9I1P7cOtBEiTtVlhiZWN/FBWhsifqqwQXN8AA/JdtszISIcQ/YhxWI
         rFDsDPCdxbfLSSMO9sWl5A9tRY+vpkU30rbMR77MJ4HDKBPEu+4mOygdikzzTf1QJV
         NuoDH0a4N5OIw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210326105434.1574796-1-geert+renesas@glider.be>
References: <20210326105434.1574796-1-geert+renesas@glider.be>
Subject: Re: [PATCH] clk: renesas: Zero init clk_init_data
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Fri, 26 Mar 2021 10:55:43 -0700
Message-ID: <161678134358.3012082.174231548040632088@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2021-03-26 03:54:34)
> As clk_core_populate_parent_map() checks clk_init_data.num_parents
> first, and checks clk_init_data.parent_names[] before
> clk_init_data.parent_data[] and clk_init_data.parent_hws[], leaving the
> latter uninitialized doesn't do harm for now.  However, it is better to
> play it safe, and initialize all clk_init_data structures to zeroes, to
> avoid any current and future members containing uninitialized data.
>=20
> Remove a few explicit zero initializers, which are now superfluous.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

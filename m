Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2308E15AE66
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Feb 2020 18:10:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728810AbgBLRKL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Feb 2020 12:10:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:58656 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728742AbgBLRKL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Feb 2020 12:10:11 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 84E2020658;
        Wed, 12 Feb 2020 17:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581527410;
        bh=77C7UbFhaRCqkGlKmtzRifapKly7hPgdS5q5b0mCZxQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=qg7VC669o1E/T/yDZMkcJdQ0Ks6UcgbQYgJb3m8/zqPlu1/WkD03nnm/VBitW6q+r
         8Y8VktL69an4DGGxQA/QSlebREo4qi0SWxjmV6mSi6MsiwRuXN25CWDOmWJEth+NQb
         75E2GjJK8zGpxLnF69ozuSvSK3oZ7UTR06aVc3Ng=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200212100830.446-8-geert+renesas@glider.be>
References: <20200212100830.446-1-geert+renesas@glider.be> <20200212100830.446-8-geert+renesas@glider.be>
Subject: Re: [PATCH 7/7] ARM: zynq: Replace <linux/clk-provider.h> by <linux/of_clk.h>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Chen-Yu Tsai <wens@csie.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Heiko Stuebner <heiko@sntech.de>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Magnus Damm <magnus.damm@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Russell King <linux@armlinux.org.uk>
Date:   Wed, 12 Feb 2020 09:10:09 -0800
Message-ID: <158152740982.121156.13184951766685879540@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2020-02-12 02:08:30)
> The Zynq platform code is not a clock provider, and just needs to call
> of_clk_init().
>=20
> Hence it can include <linux/of_clk.h> instead of <linux/clk-provider.h>.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>

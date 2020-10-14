Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAA6A28D893
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Oct 2020 04:37:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbgJNChW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Oct 2020 22:37:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:36038 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726044AbgJNChW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Oct 2020 22:37:22 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5DEC821775;
        Wed, 14 Oct 2020 02:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602643042;
        bh=WkPjfRceY0f36toNfAZOxoJNWpHMBwcl2xO2WvBYe5Y=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=LjZc6yfNsaUDYl05U0CiCE2popK1ezzp+5Em+fBWWbGv95U3OFdQZ/OxEsoRopwFV
         cKF/J9T6VhmUFLjFJ9AW7kdjYBh6k3SjIpp4At63ISNT+gArMIEQBDW0hifB6mE+vH
         M0zthPAER7bGNdbMTDdZ1K7E61wPn/f1lpQR0ueg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200924111808.15358-1-geert+renesas@glider.be>
References: <20200924111808.15358-1-geert+renesas@glider.be>
Subject: Re: [PATCH] clk: renesas: r8a779a0: Make rcar_r8a779a0_cpg_clk_register() static
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Tue, 13 Oct 2020 19:37:21 -0700
Message-ID: <160264304119.310579.2058925532925896113@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2020-09-24 04:18:08)
> When compiling with clang:
>=20
>     drivers/clk/renesas/r8a779a0-cpg-mssr.c:156:21: warning: no previous =
prototype for function 'rcar_r8a779a0_cpg_clk_register' [-Wmissing-prototyp=
es]
>     struct clk * __init rcar_r8a779a0_cpg_clk_register(struct device *dev,
>                            ^
>     drivers/clk/renesas/r8a779a0-cpg-mssr.c:156:1: note: declare 'static'=
 if the function is not intended to be used outside of this translation unit
>     struct clk * __init rcar_r8a779a0_cpg_clk_register(struct device *dev,
>     ^
>     static
>=20
> Similarly, with sparse:
>=20
>     drivers/clk/renesas/r8a779a0-cpg-mssr.c:156:12: warning: symbol 'rcar=
_r8a779a0_cpg_clk_register' was not declared. Should it be static?
>=20
> There are no users of rcar_r8a779a0_cpg_clk_register() outside this
> file, so it should be static.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: c07439dea94050b6 ("clk: renesas: cpg-mssr: Add support for R-Car V=
3U")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>

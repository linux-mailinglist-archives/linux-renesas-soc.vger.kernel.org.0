Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43DD4A76B3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Sep 2019 00:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbfICWJz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Sep 2019 18:09:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:42816 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726375AbfICWJz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Sep 2019 18:09:55 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7753320882;
        Tue,  3 Sep 2019 22:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567548594;
        bh=QD7r3eE4ZMI2vpWGrGV1ofl0ZaxGSQ/UIwMh8fpwyM8=;
        h=In-Reply-To:References:Cc:Subject:To:From:Date:From;
        b=BTaP8pDTiGCbdx3Gv4zFXb/6NyywEh1Cu+dPYCIYn3SgPSOsjesNjvZKlV3Mvv0ET
         M6+oex2jb0c205VYD8/Y9CA52e0wtokhtOhc4BxFnL+WN6smBZcjnFOplnn4bstKto
         3dhARJMum/7ve/GPnMWmx4i4Tmvd6aPK1r0mDbC8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190830134515.11925-1-geert+renesas@glider.be>
References: <20190830134515.11925-1-geert+renesas@glider.be>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2 0/8] clk: renesas: rcar-gen2/gen3: Switch to .determine_rate()
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Tue, 03 Sep 2019 15:09:53 -0700
Message-Id: <20190903220954.7753320882@mail.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2019-08-30 06:45:07)
>         Hi Mike, Stephen,
>=20
> As the .round_rate() callback returns a long clock rate, it cannot
> return clock rates that do not fit in signed long, but do fit in
> unsigned long.  The newer .determine_rate() callback does not suffer
> from this limitation.  In addition, .determine_rate() provides the
> ability to specify a rate range.
>=20
> This patch series performs the customary preparatory cleanups, and
> switches the Z (CPU) and SD clocks in the R-Car Gen2 and Gen3 clock
> drivers from the .round_rate() to the .determine_rate() callback.
> Note that the "div6" clock driver hasn't been converted yet, so div6
> clocks still use .round_rate().
>=20
> Changes compared to v1[1]:
>   - Add preparatory arithmetic division improvements
>   - Split off cpg_sd_clock_calc_div() absorption and SD clock best rate
>     calculation,
>   - Use div_u64() for division by unsigned long,
>=20
> This has been tested on R-Car M2-W and various R-Car Gen3, and should
> have no behavioral impact.

From what I recall the rate range code is broken but I can't remember
how. Anyway, I was just curious if you ran into any issues with that
code.

>=20
> To be queued in clk-renesas-for-v5.5.

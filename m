Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3928B0190
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Sep 2019 18:24:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729012AbfIKQYr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Sep 2019 12:24:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:34422 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728840AbfIKQYq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Sep 2019 12:24:46 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F377E2085B;
        Wed, 11 Sep 2019 16:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568219086;
        bh=nApWuaHiyB7NQ87eyJsFD37zbhJzmEawweguSUSdI/s=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=H5q+Ra0U4Tn/7Hw56qhY0twx23YrDZH830WLWStjcJEsaWGnK7E1brelzp00TceBX
         /GPI9xjt8XY2KWqrN9/UOrLTguRPTsh7zR/RqRZF7oIRalKTy4CSw5dJ2l9CwWc7J6
         B3N9oA0xkW1Yq33hFIMU/Flapph/onIqkKM7qIEk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAMuHMdVxktbMUn-JCO6Oz8zgG5V+dLv=3cMompErU33DkBG=0w@mail.gmail.com>
References: <20190830134515.11925-1-geert+renesas@glider.be> <20190903220954.7753320882@mail.kernel.org> <CAMuHMdVxktbMUn-JCO6Oz8zgG5V+dLv=3cMompErU33DkBG=0w@mail.gmail.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 0/8] clk: renesas: rcar-gen2/gen3: Switch to .determine_rate()
User-Agent: alot/0.8.1
Date:   Wed, 11 Sep 2019 09:24:45 -0700
Message-Id: <20190911162445.F377E2085B@mail.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2019-09-03 23:51:10)
> Hi Stephen,
>=20
> On Wed, Sep 4, 2019 at 12:09 AM Stephen Boyd <sboyd@kernel.org> wrote:
> > Quoting Geert Uytterhoeven (2019-08-30 06:45:07)
> > > As the .round_rate() callback returns a long clock rate, it cannot
> > > return clock rates that do not fit in signed long, but do fit in
> > > unsigned long.  The newer .determine_rate() callback does not suffer
> > > from this limitation.  In addition, .determine_rate() provides the
> > > ability to specify a rate range.
> > >
> > > This patch series performs the customary preparatory cleanups, and
> > > switches the Z (CPU) and SD clocks in the R-Car Gen2 and Gen3 clock
> > > drivers from the .round_rate() to the .determine_rate() callback.
> > > Note that the "div6" clock driver hasn't been converted yet, so div6
> > > clocks still use .round_rate().
> > >
> > > Changes compared to v1[1]:
> > >   - Add preparatory arithmetic division improvements
> > >   - Split off cpg_sd_clock_calc_div() absorption and SD clock best ra=
te
> > >     calculation,
> > >   - Use div_u64() for division by unsigned long,
> > >
> > > This has been tested on R-Car M2-W and various R-Car Gen3, and should
> > > have no behavioral impact.
> >
> > From what I recall the rate range code is broken but I can't remember
> > how. Anyway, I was just curious if you ran into any issues with that
> > code.
>=20
> I didn't ran into any issues.  But please note that in all tested cases, =
the
> limits were 0 and ULONG_MAX anyway, so probably it didn't trigger the
> broken cases in the rate range code.
>=20
> So, is it good to have .determine_rate() support in individual clock driv=
ers
> now, or do you want me to postpone the last 3 patches of my series until =
the
> rate range code is fixed?
>=20

It's fine to use .determine_rate() because we'll fix the problems in the
clk framework. So no concern from me here. Just curious if you ran into
any problems.


Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1739721051
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 May 2019 23:54:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727903AbfEPVyH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 May 2019 17:54:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:43618 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726523AbfEPVyH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 May 2019 17:54:07 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 75E5D2082E;
        Thu, 16 May 2019 21:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558043646;
        bh=7/VPrBeDCtUB7U1B72xCKN6fY5VM8msYqQe9cjnuI/4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ea7cvSFtUlBdy3juIFqqgBLtktCBOpnDrfQYYMnl7yji+Qq3nRa5PGMi88NO5NpBj
         S0Zdd+p13+BoTJfuB7yWTvvrxIqjoxLe1xQsTnaVcL+OZ3TNLxxckOyEcASIXUJhdo
         +MgNwoycoijodr3LLVBTOyHPcmlqf5uushk3bmSU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAMuHMdWPSyrhYx5Z5mgmKrR68cHL6owcRT=B3+DD3GhhxuG4zw@mail.gmail.com>
References: <20190514153341.22540-1-chris.paterson2@renesas.com> <155786877257.14659.6751252865489860937@swboyd.mtv.corp.google.com> <CAMuHMdWPSyrhYx5Z5mgmKrR68cHL6owcRT=B3+DD3GhhxuG4zw@mail.gmail.com>
Subject: Re: [PATCH] scripts/spelling.txt: Add spelling fix for prohibited
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
User-Agent: alot/0.8.1
Date:   Thu, 16 May 2019 14:54:05 -0700
Message-Id: <20190516215406.75E5D2082E@mail.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2019-05-15 00:32:46)
> On Tue, May 14, 2019 at 11:19 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > Quoting Chris Paterson (2019-05-14 08:33:41)
> > > Misspelling 'prohibited' is quite common in the real world, although
> > > surprisingly not so much in the Linux Kernel. In addition to fixing t=
he
> > > typo we may as well add it to the spelling checker.
> > >
> > > Also adding the present participle (prohibiting).
> > >
> > > Fixes: 5bf2fbbef50c ("clk: renesas: cpg-mssr: Add r8a77470 support")
> > >
> > > Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
>=20
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>=20
> > Acked-by: Stephen Boyd <sboyd@kernel.org>
>=20
> Thanks!
>=20
> So I guess I'll queue this in clk-renesas-for-v5.3?
>=20

Guess so! Or Andrew does it.

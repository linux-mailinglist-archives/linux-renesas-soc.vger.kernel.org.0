Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8B0F1ED0
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Nov 2019 20:32:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727615AbfKFTcl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 6 Nov 2019 14:32:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:60294 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727208AbfKFTcl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Nov 2019 14:32:41 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DAA82217D7;
        Wed,  6 Nov 2019 19:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573068761;
        bh=L6g1rurGDmUROgHcR+oSnvBcECbtPVw7m6M8p/Pacvc=;
        h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
        b=ty9pRY+BpFLtDERIoGFQWWSOvS6o0Ly15GRq1qEszda0Cgy61PUULIxX3QdJr2D+W
         pEOm5dMmXBmUqjfPhjYDoQBVJ1l2lYsDJxjnusgbGiiJO5ciVNrkKChEFC1BBl6wnk
         x0zScb06TZ3jA4u2t4bYNN9BdFihcClYwiAIdAss=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191101155907.31569-1-geert+renesas@glider.be>
References: <20191101155907.31569-1-geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v5.5 (take two)
From:   Stephen Boyd <sboyd@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
User-Agent: alot/0.8.1
Date:   Wed, 06 Nov 2019 11:32:40 -0800
Message-Id: <20191106193240.DAA82217D7@mail.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2019-11-01 08:59:07)
>         Hi Mike, Stephen,
>=20
> The following changes since commit 56278c8fcb71874d591907d654272d511ce359=
7c:
>=20
>   clk: renesas: r8a774b1: Add TMU clock (2019-10-07 14:29:53 +0200)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/clk-renesas-for-v5.5-tag2
>=20
> for you to fetch changes up to 2ba738d56db4ddb1c17e418cb501d303a8b481d2:
>=20
>   clk: renesas: r8a7796: Add R8A77961 CPG/MSSR support (2019-11-01 13:36:=
39 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next


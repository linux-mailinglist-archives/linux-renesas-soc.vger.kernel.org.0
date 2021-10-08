Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E593E42634F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Oct 2021 05:46:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242781AbhJHDsN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Oct 2021 23:48:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:59034 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242866AbhJHDsK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Oct 2021 23:48:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 38DE660FD7;
        Fri,  8 Oct 2021 03:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633664776;
        bh=LILxKtPM6i0oKzHRKfMYN9b7xPkkL+GaCXQvN1w7Bs8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=dhaEpWNaeDJod/hI8xBokcYXYseqvm/G4Hqk9yGHqrh2+T7nJO+UAxrH1e2tP1WOI
         SUDMS0xVke/rI9sQeLZLR5L37SjT1E8bNSh95DQiDz77z4zhQQ9GIF5rMZzwpSXLDj
         2fneTG/IIbyapm4F8YtFy60V7Bdf4f58AscwMFBdL94U5953xzIPEWKCpK1ydHWCWa
         XB1Dooo6Om/bLiyWsLaK2Zso7pZan3IxGwe/j84AWcTUX8Uyt5uoSnli27adVL1rvg
         8TBjfOvwdrYyKqbZO3ANtDp/rg9xhUmOtRhEkkYdq9oqnIFItJ+C/SVyfGAQ21WxMz
         4JrLXIsuDRn/A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1633081408.git.geert+renesas@glider.be>
References: <cover.1633081408.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v5.16
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Thu, 07 Oct 2021 20:46:14 -0700
Message-ID: <163366477495.2041162.7008095640363240487@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2021-10-01 02:46:46)
>         Hi Mike, Stephen,
>=20
> The following changes since commit fa2a30f8e0aa9304919750b116a9e9e3224652=
99:
>=20
>   clk: renesas: rzg2l: Fix clk status function (2021-09-24 15:11:05 +0200)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v5.16-tag1
>=20
> for you to fetch changes up to cc3e8f97bbd370b51b3bb7fec391d65d461d7d02:
>=20
>   clk: renesas: r8a779a0: Add Z0 and Z1 clock support (2021-09-28 09:28:5=
3 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

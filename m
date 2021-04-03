Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4E5B3532E4
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  3 Apr 2021 08:59:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231282AbhDCG7f (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 3 Apr 2021 02:59:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:46950 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236134AbhDCG7c (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 3 Apr 2021 02:59:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8BB5D611BF;
        Sat,  3 Apr 2021 06:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617433170;
        bh=QrRgzxGL2+UVBRv1VG1RXyFUnhe2EufHD67P9Imkas4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=mJCXJWbyxlnJ9dvyZmYrRZyOf+5AcGpBc80z7i/DcQTXn+a3/Mn6UXwz0Xzv5jvTw
         PRs/CcAhF6sI18QndfrMF2b6NzqaYzLuMYI/iNqtSbvX1g0p6yH3R/gEU9m5+OnvPS
         HstDIk96OV1+DYMJ2qLlXErvwttwVxLQiMv4IeNJXCBNGKqZ3xxr7gJ0Oo8HCChKJH
         ZMkzSKlsg2HUZQt8OH2zB6FK/tor/Z6iRu8BHtn3YkeSVxNAjXlFs51WWVblgixEed
         90dUXoj+szbR4aZtTfT0fqSXViZ5fHTHhU+Etq+yCXIU76iomn45xSTD5j7TjFGwA3
         hGCAO6AAYkiaA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1617363608.git.geert+renesas@glider.be>
References: <cover.1617363608.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v5.13 (take two)
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Fri, 02 Apr 2021 23:59:29 -0700
Message-ID: <161743316928.2260335.17856133729369410294@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2021-04-02 04:43:06)
>         Hi Mike, Stephen,
>=20
> The following changes since commit 0eedab655ec1817d450085dcb12219726cb415=
ff:
>=20
>   clk: renesas: r8a779a0: Add CMT clocks (2021-03-12 09:23:24 +0100)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v5.13-tag2
>=20
> for you to fetch changes up to f2fb4fe62390b293bc6edc04cc7002940c441359:
>=20
>   clk: renesas: Zero init clk_init_data (2021-03-30 09:58:27 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

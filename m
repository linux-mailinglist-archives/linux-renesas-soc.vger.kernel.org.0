Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0B11273413
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Sep 2020 22:52:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727980AbgIUUwO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Sep 2020 16:52:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:58110 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727808AbgIUUwN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Sep 2020 16:52:13 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5234E238E2;
        Mon, 21 Sep 2020 20:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600721533;
        bh=caz+2H2w7wsl/UXxZawljT6slmiD8Hkcm44uMUYbu8s=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=iTc6oy1GIyiCkxQr/YO+/rVQlFP285rKfLmhOyVUXk4nqg6dsdZdstwJCKKbsl/2x
         wPi+F1p9fIi2vfeWqWCmNntTjG51FV9VN0X1SJ9wVhLVCx3E4XMrXMf5Lk3vu5dXsm
         YCwbn55P6Q2MvModwxgQFLUeMHfvP/c846rpvmK8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200918124819.15652-1-geert+renesas@glider.be>
References: <20200918124819.15652-1-geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v5.10 (take two)
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Mon, 21 Sep 2020 13:52:11 -0700
Message-ID: <160072153199.4188128.14560622973384403988@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2020-09-18 05:48:19)
>         Hi Mike, Stephen,
>=20
> The following changes since commit e41cb217932969a20cea9c44299c449236058e=
43:
>=20
>   clk: renesas: rcar-gen2: Rename vsp1-(sy|rt) clocks to vsp(s|r) (2020-0=
9-04 09:42:01 +0200)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/clk-renesas-for-v5.10-tag2
>=20
> for you to fetch changes up to 15d683e61bdded719e6202fed2c7401f4dcd95ab:
>=20
>   clk: renesas: rcar-gen3: Update description for RZ/G2 (2020-09-17 15:32=
:25 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

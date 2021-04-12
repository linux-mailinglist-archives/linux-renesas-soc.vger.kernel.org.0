Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C509E35D1F0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Apr 2021 22:23:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237589AbhDLUXE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Apr 2021 16:23:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:45356 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237251AbhDLUXD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Apr 2021 16:23:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 08CCF61287;
        Mon, 12 Apr 2021 20:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618258965;
        bh=g5V9fR8SkjJzqibAxPAvp8vfBUQm04UogqEYAtZ1jwo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=m6vFDTTudwpX3UD5/TLAkwDnU+9nNAoXlVH/Arygho5fK74WQ/lIOk/DGa68/M/S8
         xEfR1CVAD3CaAYJDyKeSImn6iG9EVGbf3ArCoOJrC8xJJ+NpKJTX/yAt8z7Jv8flCR
         WH7vm4E6kqcqCLskGbs2zjNlA2Q6ZkpOsZroVpQB/G2AQueivhRnMh16YbGVCABOYv
         myuZOSM3GynN8qq3cQMgp53SZLf+m1xFyEQ3AH9z4MDYXb35zjhDyWQEZ7aFLjKq5x
         bQrRg4KYdA4jN07CvlbnunPflLYzYMag2xXlKJZZETRP25NGBkib2L2fvBT8RrOLw4
         2ohazQf+u/ajQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210412112601.31719-1-dinghao.liu@zju.edu.cn>
References: <20210412112601.31719-1-dinghao.liu@zju.edu.cn>
Subject: Re: [PATCH] [v2] clk: renesas: rcar-usb2-clock-sel: Fix error handling in rcar_usb2_clock_sel_probe
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     dinghao.liu@zju.edu.cn, kjlu@umn.edu
Date:   Mon, 12 Apr 2021 13:22:43 -0700
Message-ID: <161825896343.3764895.12784736660315356953@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Dinghao Liu (2021-04-12 04:26:01)
> diff --git a/drivers/clk/renesas/rcar-usb2-clock-sel.c b/drivers/clk/rene=
sas/rcar-usb2-clock-sel.c
> index 3abafd78f7c8..3b0e33e0bf7b 100644
> --- a/drivers/clk/renesas/rcar-usb2-clock-sel.c
> +++ b/drivers/clk/renesas/rcar-usb2-clock-sel.c
> @@ -193,11 +191,22 @@ static int rcar_usb2_clock_sel_probe(struct platfor=
m_device *pdev)
>         init.num_parents =3D 0;
>         priv->hw.init =3D &init;
> =20
> -       clk =3D clk_register(NULL, &priv->hw);
> -       if (IS_ERR(clk))
> -               return PTR_ERR(clk);
> +       clk =3D devm_clk_register(NULL, &priv->hw);

Please use devm_clk_hw_register() unless that can't be done for some
reason?

> +       if (IS_ERR(clk)) {
> +               ret =3D PTR_ERR(clk);
> +               goto pm_put;
> +       }
> +

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FF4F357D02
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Apr 2021 09:09:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229762AbhDHHKA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 8 Apr 2021 03:10:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:46618 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229506AbhDHHJ7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Apr 2021 03:09:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 561D661159;
        Thu,  8 Apr 2021 07:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617865788;
        bh=H5glC+vfELVo/toFGRJmLSWGcysIQJlPM8zDXfnp934=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=f6Ze47cwM+Q9yBg7hTOqFdsdmDTVyfBoNVcjjq71LB9C7iQD/BdIU/+VgQ7p+m6uQ
         2DEp1qKL4hPhDt9w2WdTGEuRI1ORRQ6wBiEDp9GWcLQXX6mJtugmLNEEuIMmKjTgZO
         RHH1iLtBGpWJRiJylkZWWfCfFDcSFm35D5GOCzDuOLuS5595IFezzdsXReMOP9AP7R
         /CEk/WuSavqvfP9mrd+h6Glet/ncW4iH09H1sm8B283kE9cODIfv/MEY/bIc4Fczvq
         S8A4pCg3GhWFCkDKEVVfokYGZNwWOP8awisJmnwOOXJBs36mjzwWz3JG1Ij1JI03UT
         FkzrUwZQBKz/w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <7a384d02b85cdaac4a0e2b357582c8244b9a6f98.1617282116.git.geert+renesas@glider.be>
References: <7a384d02b85cdaac4a0e2b357582c8244b9a6f98.1617282116.git.geert+renesas@glider.be>
Subject: Re: [PATCH] clk: renesas: r9a06g032: Switch to .determine_rate()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Gareth Williams <gareth.williams.jx@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Thu, 08 Apr 2021 00:09:47 -0700
Message-ID: <161786578706.3790633.4008870643384680138@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2021-04-01 06:03:24)
> diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas=
/r9a06g032-clocks.c
> index 71b11443f6fc3801..c99942f0e4d4c751 100644
> --- a/drivers/clk/renesas/r9a06g032-clocks.c
> +++ b/drivers/clk/renesas/r9a06g032-clocks.c
> @@ -630,11 +629,13 @@ r9a06g032_div_round_rate(struct clk_hw *hw,
>         if (clk->index =3D=3D R9A06G032_DIV_UART ||
>             clk->index =3D=3D R9A06G032_DIV_P2_PG) {
>                 pr_devel("%s div uart hack!\n", __func__);
> -               return clk_get_rate(hw->clk);
> +               req->rate =3D clk_get_rate(hw->clk);

Can this use clk_hw_get_rate()? Or it needs to be clk_get_rate() to make
sure the rate doesn't change while querying the framework... from the
framework? Another patch is preferred if you're interested in making the
change.

> +               return 0;
>         }
> +       req->rate =3D DIV_ROUND_UP(req->best_parent_rate, div);
>         pr_devel("%s %pC %ld / %u =3D %ld\n", __func__, hw->clk,
> -                *prate, div, DIV_ROUND_UP(*prate, div));
> -       return DIV_ROUND_UP(*prate, div);
> +                req->best_parent_rate, div, req->rate);
> +       return 0;
>  }
> =20
>  static int

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D9B521C114
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Jul 2020 02:17:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726780AbgGKARc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Jul 2020 20:17:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:52356 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726588AbgGKAR3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Jul 2020 20:17:29 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 60178206E2;
        Sat, 11 Jul 2020 00:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594426649;
        bh=7vSxiKS5OYdz9XoO3u9H7c/r36NftYgfeZwnWvjaybk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=F7Zyjg/FI9VNUSAerBX1fi1Pk0nef9AcYF7T13c3ch2C5ogVfQ0Z8nDyoBYlVDjsp
         In5BHe9zEig2yZwSEI4jlB2tZoau3WsXn1TJJJS0lev1jLE9oAoGc6+MG4oWu8mOEo
         LM6GeStyq1/5sPeEJh8glLSK6irYCfe2JUJErZjE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200703121729.6678-1-geert+renesas@glider.be>
References: <20200703121729.6678-1-geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v5.9
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Fri, 10 Jul 2020 17:17:28 -0700
Message-ID: <159442664871.1987609.14062615853813880007@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2020-07-03 05:17:29)
>         Hi Mike, Stephen,
>=20
> The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c74=
07:
>=20
>   Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/clk-renesas-for-v5.9-tag1
>=20
> for you to fetch changes up to 52bc5ea6edde35bc65ed6ecd7639534e78002c74:
>=20
>   clk: renesas: rzg2: Mark RWDT clocks as critical (2020-06-22 16:54:32 +=
0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

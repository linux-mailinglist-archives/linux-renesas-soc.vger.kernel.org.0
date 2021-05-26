Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC472390EC5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 May 2021 05:17:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231189AbhEZDTE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 May 2021 23:19:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:47882 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230288AbhEZDTB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 May 2021 23:19:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BE0496117A;
        Wed, 26 May 2021 03:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621999050;
        bh=Evb6YHbO/XivgWeiG4VIMZOqkXTAusj+85yojKz/WZo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=mJgp0Aj3znnD97CS/czoUQKCJdSLn5NWBK8QYGECapXmrXHOHImEvMlpG1w1EtpGL
         Q2UVyb6cPAjNGapw0a2Xfwsn/2DkjpfL0Fu76yUAIcB98Wq7neuQ4itfvfzA643zlr
         fZeyag9NUM09KPCgLOIsF3BpTM+huRqIVq5yNRksGRugKL/QVh442cAh1UAU7VgUaL
         RylWgBG+4KJJYcZCD90Zuc3yToAsKt1XbQ4AvTDKBOkKTd1F1anaBZcswwBXVvLd1e
         VOQqluauuIlWNhruU8EggGdPsrqLz0nxW85LfPZ5SHRQbfqx4tME7bMjYu8hOZzjYJ
         dyuQ+NkDW4vJQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2d8bc4d9806b419ebb06030d2f31b2ea1e59b1d6.1620119700.git.geert+renesas@glider.be>
References: <cover.1620119700.git.geert+renesas@glider.be> <2d8bc4d9806b419ebb06030d2f31b2ea1e59b1d6.1620119700.git.geert+renesas@glider.be>
Subject: Re: [PATCH 1/2] clk: renesas: cpg-mssr: Remove unused [RM]MSTPCR() definitions
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Hai Nguyen Pham <hai.pham.ud@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Tue, 25 May 2021 20:17:29 -0700
Message-ID: <162199904953.4130789.6257489771666063314@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2021-05-04 02:17:21)
> The Realtime Module Stop Control Register definitions (RMSTPCR(i)) are
> incorrect for i >=3D 8 on R-Car Gen2 and Gen3.
>=20
> As these are unused, and not planned to be used, just like the
> corresponding Modem Module Stop Control Register definitions (MMSTPCR())
> on R-Mobile APE6 (they are intended for the software running on the
> Real-Time and Modem CPU cores), they can just be removed.
>=20
> Reported-by: Hai Nguyen Pham <hai.pham.ud@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

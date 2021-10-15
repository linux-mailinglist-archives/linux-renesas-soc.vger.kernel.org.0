Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6985D42FDC4
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 16 Oct 2021 00:01:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243246AbhJOWDx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 Oct 2021 18:03:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:54328 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243244AbhJOWDw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Oct 2021 18:03:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4B8CD61027;
        Fri, 15 Oct 2021 22:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634335305;
        bh=u6gBdaPvvrBZfMHz7pA4zkuNG0Wt+WGPJFcDufvT57o=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=UKPw+T1myTIvcSarTfMnNHLMWKSRkZFQhaRcErAHpErRzs4yjB8jd/Oh0M/w9ueyy
         J8BnyMMo2P/nLtDwp4lYwP2FVF0rX0fDQuglUOUiK/jMBvP8OHYghdvCpiQfXOsT1c
         uxrqUcXZdugBgjPYvtCHr7ZGqpZbnySC8q+Hi0weUXszdCM5VsXcpTEbJR0w40uJIS
         ZXv6wCEBfMhWA1Titl6eqo0MP8jk9azaWgNCUI4TxGtA+k3zAou3VcmLRbBbnZ1aoC
         XjF6OrHaD5gIOomp5qiWk2xtRImiXRRyAdvePKI2MmZ4WDoTzE7OB/Z103/tBPrRr9
         n7G9vIojasPHQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1634298371.git.geert+renesas@glider.be>
References: <cover.1634298371.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v5.16 (take two)
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Fri, 15 Oct 2021 15:01:43 -0700
Message-ID: <163433530395.1688384.483025089157707634@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2021-10-15 04:47:36)
>         Hi Mike, Stephen,
>=20
> The following changes since commit cc3e8f97bbd370b51b3bb7fec391d65d461d7d=
02:
>=20
>   clk: renesas: r8a779a0: Add Z0 and Z1 clock support (2021-09-28 09:28:5=
3 +0200)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v5.16-tag2
>=20
> for you to fetch changes up to 2bd9feed23166f5ab67dec2ca02bd3f74c77b0ba:
>=20
>   clk: renesas: r8a779[56]x: Add MLP clocks (2021-10-15 09:46:14 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

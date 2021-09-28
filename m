Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53BBF41BA1E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Sep 2021 00:20:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243053AbhI1WWG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 Sep 2021 18:22:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:48796 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240687AbhI1WWG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Sep 2021 18:22:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E72206134F;
        Tue, 28 Sep 2021 22:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632867626;
        bh=cCrxQSnNRAST9uyK8lFINpxObG9fWTn6FmTmcnhmS7k=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=sLwAG3X+2olqzcUomNVYFpcBy8JHwyZdhBYNzc2kpXThcWyaKc0IyKYDp9kPwKr/P
         PKFUW6JJOm1pKtxSA5eLh/L/O+cw8eH0TDUnt+PCCDkvGE87OPI82e1DjQLHbAQQBF
         BUKdS5Fofn24kOpF5u+VZ4693btvNucJjwvFbuW381JwdxJpBZYIsp/Fw/wJKWLJCT
         RthM9u6jUyBLJCitrWx+lwpnUvBzChvBDQaM1gQVa+dBL9Q5knakBqkiy2e7/o9Ag1
         Vcrjz9vRdRr4VbTCj2pEU9Nv16K6q4Luhf9raNYkHShSFzLqZ1yp/NisKHoqyqTShD
         fOQx4+pIyIEuw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1632836915.git.geert+renesas@glider.be>
References: <cover.1632836915.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Fixes for v5.15
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Tue, 28 Sep 2021 15:20:24 -0700
Message-ID: <163286762464.9433.17437033278031855000@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2021-09-28 06:53:52)
>         Hi Mike, Stephen,
>=20
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd=
8f:
>=20
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v5.15-tag3
>=20
> for you to fetch changes up to fa2a30f8e0aa9304919750b116a9e9e322465299:
>=20
>   clk: renesas: rzg2l: Fix clk status function (2021-09-24 15:11:05 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-fixes

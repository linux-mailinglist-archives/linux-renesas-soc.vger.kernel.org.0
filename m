Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 664EF3F6927
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Aug 2021 20:38:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233688AbhHXSjY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Aug 2021 14:39:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:51170 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230404AbhHXSjX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Aug 2021 14:39:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5672861212;
        Tue, 24 Aug 2021 18:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629830319;
        bh=maEBqpCEjLOCqX6ajQ449eG3qPAnuFmvIOp4G98YB6E=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=d5UoQEosZIKn8XFGaDOjnsSb8zwnCKOv/NM+Y7ZFqspJz8iXiAxME9TMhJHX6qcyA
         cry19Yvww3aJQptz1z6rdgsHLH+fMdqBAICc9LB7UmaAKK9SgK9PVPq0/E0KMtBtZz
         pwLknwfGiOWUJt036U6IWByiuee/ngATPjyZMpCvb238FqXEpI2KGEe0NszAJi0mJ6
         JyMvKnJWrkwFy/SjlFqnoidpyHT9iCANQKCCHXfzO8t9QxAqP3B1IZqcDKbrrjyQaW
         ay6evygqSkJgL6VSfIZ8+U0OoQarllAQ38rhfZCweU0Rd/ilFmkW9362l6vP0sl/SB
         Bs4h9p6yuddLg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1628850207.git.geert+renesas@glider.be>
References: <cover.1628850207.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v5.15 (take two)
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Tue, 24 Aug 2021 11:38:37 -0700
Message-ID: <162983031799.1317818.3735529566901467357@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2021-08-13 03:28:14)
>         Hi Mike, Stephen,
>=20
> The following changes since commit d28b1e03dc8d1070538ca3ea3f4e6732109ddf=
42:
>=20
>   clk: renesas: r9a07g044: Add entry for fixed clock P0_DIV2 (2021-07-26 =
14:15:23 +0200)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v5.15-tag2
>=20
> for you to fetch changes up to e8425dd55abb12881694875972465f40bb0fe41b:
>=20
>   clk: renesas: Make CLK_R9A06G032 invisible (2021-08-13 12:05:41 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

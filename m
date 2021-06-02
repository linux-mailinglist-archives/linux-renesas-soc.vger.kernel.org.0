Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F599397E6A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jun 2021 04:04:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229740AbhFBCGa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Jun 2021 22:06:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:43724 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229654AbhFBCG2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Jun 2021 22:06:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 282E1610C9;
        Wed,  2 Jun 2021 02:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622599486;
        bh=FGm9ZGazPsU3M9DhHX6bohLj2suv+3QWa9/xiT2tMO8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=HoHDsqW/KAc3iJ+8xf29BUO77mvD3Goa3I5J4VMc002KogLWP25GTeys18QOmDqnJ
         1jRAmpGE9Sj+LyOLWVUSLTo4hUJgp4uWTQGYEEJJpzC0hdJc6S6+n+RMs4rxjiJc0f
         LxzGHRXG3lxMDnZxHQvLHQdUOmHwaQ07psZIvEbLWyuXGi0EB6q5KjaAZPCAMI2aLi
         n6zVfO+b0JwgKfRMa1wQ/PYMJaQvoElQShoP5w83t3H3HwjCv71MyxtT/QszNny83l
         LB74wsjOq/poXP2BkD9Rl/q4pQ+ZzlkiRA6EjhMllHErq9ITW16XAZkd93Z5qqLElY
         +lRYWSOIBU9Pg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1622191519.git.geert+renesas@glider.be>
References: <cover.1622191519.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v5.14
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Tue, 01 Jun 2021 19:04:44 -0700
Message-ID: <162259948457.4130789.8549983232454140220@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2021-05-28 01:49:48)
>         Hi Mike, Stephen,
>=20
> The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627=
b5:
>=20
>   Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v5.14-tag1
>=20
> for you to fetch changes up to 790c06cc5df263cdaff748670cc65958c81b0951:
>=20
>   clk: renesas: r8a77995: Add ZA2 clock (2021-05-27 15:27:28 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next.

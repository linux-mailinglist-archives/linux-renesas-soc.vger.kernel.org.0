Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FC9AA91B7
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Sep 2019 21:40:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388428AbfIDSYE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Sep 2019 14:24:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:38736 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388815AbfIDSYE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Sep 2019 14:24:04 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 54E10208E4;
        Wed,  4 Sep 2019 18:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567621443;
        bh=jAQjvuRtxMBwz1tlWu5CLWbFUsi1RrTRe3rT06yXBwA=;
        h=In-Reply-To:References:Cc:Subject:To:From:Date:From;
        b=Fx3Y0+SJzW2KUMh+JHZZB6hrOVOTJPF8RYY9qPwwtZGv5k/XEI7f7xZ9DKxBs45nK
         iPk1jA29+wtkahGd02IXLQSbXN35G69hvQYGJQjegF8drs8hteoIq9Kz7YZiUNXB0s
         SzgGqgXRi0N/VjA9JL/5nQRYyoLuKqtcPpWKihPA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190823125816.21519-1-geert+renesas@glider.be>
References: <20190823125816.21519-1-geert+renesas@glider.be>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [git pull] clk: renesas: Updates for v5.4
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Wed, 04 Sep 2019 11:24:02 -0700
Message-Id: <20190904182403.54E10208E4@mail.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2019-08-23 05:58:16)
>         Hi Mike, Stephen,
>=20
> The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca=
4b:
>=20
>   Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/clk-renesas-for-v5.4-tag1
>=20
> for you to fetch changes up to f787216f33ce5b5a2567766398f44ab62157114c:
>=20
>   clk: renesas: cpg-mssr: Set GENPD_FLAG_ALWAYS_ON for clock domain (2019=
-08-23 11:09:57 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next


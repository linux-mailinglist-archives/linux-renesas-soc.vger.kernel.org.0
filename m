Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13CC9393DD
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jun 2019 20:01:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731003AbfFGSBO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Jun 2019 14:01:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:37182 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730714AbfFGSBN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Jun 2019 14:01:13 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 31288208C0;
        Fri,  7 Jun 2019 18:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559930473;
        bh=7ntLOYXIydYLfD37wMkPewp/JYmDlfC5quUGAWPTxs4=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=Y0Nfr4l0cYVAuKKuQkoCzz5yOIapURXivr9o3/L1fF5FuQ8VYl+6NkkGhRnTj9LGv
         r70KXuvnTi264g5WAk4Ql2CP3MNKErY5EAOAnI1017u9/FcHichU+wL9uE7A8PwqeL
         Slgbu8WUQDqPoKOmy9JAsUQIccXe5KGTWIh+n2wg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190607072419.17185-1-geert+renesas@glider.be>
References: <20190607072419.17185-1-geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [git pull] clk: renesas: Updates for v5.3
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
User-Agent: alot/0.8.1
Date:   Fri, 07 Jun 2019 11:01:12 -0700
Message-Id: <20190607180113.31288208C0@mail.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2019-06-07 00:24:19)
>         Hi Mike, Stephen,
>=20
> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0eb=
d9:
>=20
>   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/clk-renesas-for-v5.3-tag1
>=20
> for you to fetch changes up to aad03a66f902e18bab612870261bde647fdbda2c:

Thanks. Pulled into clk-next, but won't be published until next Monday
most likely.


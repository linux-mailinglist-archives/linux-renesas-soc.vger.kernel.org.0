Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F168F200D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Nov 2019 21:46:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732411AbfKFUqA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 6 Nov 2019 15:46:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:33426 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727376AbfKFUqA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Nov 2019 15:46:00 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B14A120869;
        Wed,  6 Nov 2019 20:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573073159;
        bh=8EobBLdg79BFoLW8z+BryoGeSM6L13OfS+/VN6yROKM=;
        h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
        b=oY84uH53kicG5g/Aec/DaE31sE1u7PRypCK2hfInsLsk49g4rcGFVwm/mTzTp2qxR
         W3w0jwu/xCvpsDorwK83rau4PwqFn9J0ISe4eXPbJzCIX1E21PuCc45j0Guls4slmO
         gSRCBY4GHRSQfb5/m0Mp+4JkYIf4UAAd8aOMr170=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191018101212.26432-1-geert+renesas@glider.be>
References: <20191018101212.26432-1-geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v5.5
From:   Stephen Boyd <sboyd@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
User-Agent: alot/0.8.1
Date:   Wed, 06 Nov 2019 12:45:58 -0800
Message-Id: <20191106204559.B14A120869@mail.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2019-10-18 03:12:12)
>         Hi Mike, Stephen,
>=20
> The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c=
5c:
>=20
>   Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/clk-renesas-for-v5.5-tag1
>=20
> for you to fetch changes up to 56278c8fcb71874d591907d654272d511ce3597c:
>=20
>   clk: renesas: r8a774b1: Add TMU clock (2019-10-07 14:29:53 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Picked this description from here too.



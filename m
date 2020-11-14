Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 719132B30A5
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Nov 2020 21:37:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726172AbgKNUhf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 14 Nov 2020 15:37:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:33674 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726112AbgKNUhe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 14 Nov 2020 15:37:34 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 45EA0223EA;
        Sat, 14 Nov 2020 20:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605386254;
        bh=UzOqPfAfM/TT+6pQkybNem1OSxEsUVx2CPRJpPgUOSY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=kUWrJ0euqsF1io4WNjHM7pRRRDkX8b9gnTWTtBdp36rDIvwjqBsEmVJ417OaMWz6G
         BtLA+DRw73S/JgnqktCknaGsVFnCzvVY9WdMpg+aQfYXW45EfUZWHPBbkkgLUmVroM
         HOEQRWoCB9meen+GkZDBU0iDs9EZdGvS3pz3KuCY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201113151609.3924469-1-geert+renesas@glider.be>
References: <20201113151609.3924469-1-geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v5.11
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Sat, 14 Nov 2020 12:37:33 -0800
Message-ID: <160538625303.60232.12938651791402224679@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2020-11-13 07:16:09)
>         Hi Mike, Stephen,
>=20
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9=
ec:
>=20
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v5.11-tag1
>=20
> for you to fetch changes up to cf5577a1cfc104c71f011738ab753bf2ac2f91ed:
>=20
>   clk: renesas: r8a779a0: Fix R and OSC clocks (2020-11-10 09:25:46 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

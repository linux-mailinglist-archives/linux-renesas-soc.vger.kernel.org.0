Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 859531366C1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jan 2020 06:36:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbgAJFgY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Jan 2020 00:36:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:50530 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726273AbgAJFgY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Jan 2020 00:36:24 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E1E1A20673;
        Fri, 10 Jan 2020 05:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578634584;
        bh=JX47puHrq+wv87woEDGXvVPyKrIfBPEHa2Qj/JfjHxE=;
        h=In-Reply-To:References:Cc:Subject:To:From:Date:From;
        b=071fleckTZ0x2fe+GMNZkJdDwgCijiovAjIMrUC1n5IIqXTpGAfGgP8CLSKvXwEhw
         I/l5ReHV3c3mEFcA3u09JZGFlnSdFOhn2zDsjOydhSdlaUHx3Gvf30s5m4D9K7cvdp
         NmKGgEWnikDXUOngtn3BzgshuQ+fpnUv4aKdE27Q=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200108091027.5773-1-geert+renesas@glider.be>
References: <20200108091027.5773-1-geert+renesas@glider.be>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v5.6
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Thu, 09 Jan 2020 21:36:23 -0800
Message-Id: <20200110053623.E1E1A20673@mail.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2020-01-08 01:10:27)
>         Hi Mike, Stephen,
>=20
> The following changes since commit e42617b825f8073569da76dc4510bfa019b1c3=
5a:
>=20
>   Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/clk-renesas-for-v5.6-tag1
>=20
> for you to fetch changes up to 8040bf4091cdd13b6d0f9ab00e621ae6eb29174d:
>=20
>   clk: renesas: Prepare for split of R-Car H3 config symbol (2020-01-08 0=
9:52:43 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next


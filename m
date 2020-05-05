Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B505B1C6112
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2020 21:32:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728642AbgEETcd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 May 2020 15:32:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:41732 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728512AbgEETcd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 May 2020 15:32:33 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EC4262068E;
        Tue,  5 May 2020 19:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588707153;
        bh=VaPSawdI6c2GPZEPFPxmM5eZQ0mqch5COld+n26AhNE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=khnTB/AhLn3+G2g83vvdyETJTObdasq3QT3gFBzgJGkFJtkJr1QSAPLCh1otb8oDw
         /vo8+otvA5zQ+2WFHKdrqHILiFPD72D3QXQb0uK2dbIlaIOAlzt+PfCnRZr1l+BQkF
         WVukOVCb8X7jTysAf/EEM9qaqyLlWov+O+WoJisA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200430084902.1540-1-geert+renesas@glider.be>
References: <20200430084902.1540-1-geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v5.8
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Tue, 05 May 2020 12:32:32 -0700
Message-ID: <158870715221.26370.13261608407586100210@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2020-04-30 01:49:02)
>         Hi Mike, Stephen,
>=20
> The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f31=
36:
>=20
>   Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/clk-renesas-for-v5.8-tag1
>=20
> for you to fetch changes up to e2f022c10ed3b50ba1d2bb1f037b0e7a84cb1c3e:
>=20
>   clk: renesas: rcar-gen2: Remove superfluous CLK_RENESAS_DIV6 selects (2=
020-04-30 09:39:06 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

I see these warnings with smatch. Is it a real problem?

drivers/clk/renesas/renesas-cpg-mssr.c:851
cpg_mssr_resume_noirq() error: buffer overflow 'stbcr' 11 <=3D 11
drivers/clk/renesas/renesas-cpg-mssr.c:860
cpg_mssr_resume_noirq() error: buffer overflow 'stbcr' 11 <=3D 11
clk/renesas/renesas-cpg-mssr.c:862
cpg_mssr_resume_noirq() error: buffer overflow 'stbcr' 11 <=3D 11

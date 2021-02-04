Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8962030FD7A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Feb 2021 20:58:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239898AbhBDT6I (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 4 Feb 2021 14:58:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:60766 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239883AbhBDT5y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Feb 2021 14:57:54 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 18F9E64F38;
        Thu,  4 Feb 2021 19:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612468634;
        bh=fRR1VB3c6VvutDVQB6PF/ZUKUqLlBrE1/9o/d8NDwMw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Slcfxs99EIcG3+2XmBJjLOn5DvdF7Kq4ryaxVmjJQSfguQbLnqNwBnGJuv/9QS4OX
         WxTdS2/OR+KKZrkW9pfI0K242LX8O/FuqdtelXVwMZthRjoYRQmVZtfaT99BGoi16k
         +2MzqlfMZLYjjK0/enejc6JkMbe2FK+dEkClIQIZy/ySS/iVtcXguQ/VVBFtQlfycp
         eEcDHbOLJAiRYr6aJYsdmf9gGheLGufe0p/1UUF6o5sxCH3a6+kskBfrqAGbF+1uGW
         fPODfOBgSPSjxC2SZDdBo2tbPpC3ciauoKwC/Ag8J75iYC7yK2QuwdP0cvYeyDsGSc
         9s1moXUhDnVaw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210129091611.2552797-1-geert+renesas@glider.be>
References: <20210129091611.2552797-1-geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v5.12 (take two)
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Thu, 04 Feb 2021 11:57:12 -0800
Message-ID: <161246863272.76967.16202770505739428537@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2021-01-29 01:16:11)
>         Hi Mike, Stephen,
>=20
> The following changes since commit c706121386fe8414ac0a0acab37c74aac698c5=
1d:
>=20
>   dt-bindings: clock: renesas: rcar-usb2-clock-sel: Add support for RZ/G2=
 M/N/H (2021-01-12 12:35:13 +0100)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v5.12-tag2
>=20
> for you to fetch changes up to 24ece96554a963d5eab597be7d65a1812d854d10:
>=20
>   clk: renesas: cpg-mssr: Fix formatting issues for 'smstpcr_saved's docu=
mentation (2021-01-28 09:45:56 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

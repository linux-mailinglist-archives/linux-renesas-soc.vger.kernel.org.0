Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35DD12D1C94
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Dec 2020 23:01:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725969AbgLGV7f (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Dec 2020 16:59:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:49280 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725799AbgLGV7f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Dec 2020 16:59:35 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607378335;
        bh=Pi5GADo6j4UFpk7CEuwQxIw6GRAKpKOinEGB1LvlK40=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=KGof9gI3o9RpVbn/pS5WFPRGlaLFmaat4RM4BGFeRNLSHlKSSHteQphl4wn4+azfu
         KtERqlIJtZSCGenwUfPJkTcYW5ZJo6IBaJZoGiMapsW+KkrIKC2mdgS1XT7LAGDN0s
         X8oHcPnPLb5vpHTdUsEyhcggEGCUIH0+SovzMe+isE8PeJLcTrgfeCOnJsxYhGv0Ix
         YEYGj7ZZgjUm10GiavckoUcToMio2df5OtD8hXaMLZTbytitIOHIniT/e+vu/8vmsz
         c27HS+3Y2UafuVnMgDcRFeLt04g1LbIpjZPSRhAfHIcKz9QI8OZkV7qkZ2RodmdEyF
         MihTQOyjKVDdQ==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201130085743.1656317-1-geert+renesas@glider.be>
References: <20201130085743.1656317-1-geert+renesas@glider.be>
Subject: Re: [PATCH v2] clk: renesas: r9a06g032: Drop __packed for portability
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Gareth Williams <gareth.williams.jx@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michael Turquette <mturquette@baylibre.com>,
        Paul Mackerras <paulus@samba.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Date:   Mon, 07 Dec 2020 13:58:53 -0800
Message-ID: <160737833361.1580929.4851886406060076908@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2020-11-30 00:57:43)
> The R9A06G032 clock driver uses an array of packed structures to reduce
> kernel size.  However, this array contains pointers, which are no longer
> aligned naturally, and cannot be relocated on PPC64.  Hence when
> compile-testing this driver on PPC64 with CONFIG_RELOCATABLE=3Dy (e.g.
> PowerPC allyesconfig), the following warnings are produced:
>=20
>     WARNING: 136 bad relocations
>     c000000000616be3 R_PPC64_UADDR64   .rodata+0x00000000000cf338
>     c000000000616bfe R_PPC64_UADDR64   .rodata+0x00000000000cf370
>     ...
>=20
> Fix this by dropping the __packed attribute from the r9a06g032_clkdesc
> definition, trading a small size increase for portability.
>=20
> This increases the 156-entry clock table by 1 byte per entry, but due to
> the compiler generating more efficient code for unpacked accesses, the
> net size increase is only 76 bytes (gcc 9.3.0 on arm32).
>=20
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Fixes: 4c3d88526eba2143 ("clk: renesas: Renesas R9A06G032 clock driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Applied to clk-fixes

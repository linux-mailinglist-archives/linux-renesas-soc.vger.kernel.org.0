Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2316B2D6950
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Dec 2020 22:04:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393918AbgLJVBz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Dec 2020 16:01:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:56700 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393908AbgLJVBp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Dec 2020 16:01:45 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607634064;
        bh=xvDa/4mtJ2SRfR9N2eoju7R7AHC9Pb6GUPPP/ZxrkJY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=JtJNR8VSCscgqXYGU7SP0lziJXEYRKuxQRNV8HXyjbNmztiPkmZ9uSvAo6KI4f5G6
         PpsuE4gpBlZsYF4V5V51HxXozj+QtZdb9B5iOVUF888hO4z+2keErgrcVqrDV1CBGS
         eNRD+wQG+Ojt5QGYbc6KpnbrWhtdsMcX0IQoH3sYUjT5eJC381lFYPCCXVnefRBGN2
         lZ9f0TXfIrcdD1yQATMnYcOt34W+eqErDUkrXje+k6JHyjJs86v3vufyHKV/EVQbB/
         I+bOSNLWko3EN5ySEP0adNW9n6QVbjZiOthcKUuE3rkjNBE1epWfuJTivLNIfJrxM0
         79w1m0aSK/Kgg==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201210075018.2407915-1-geert+renesas@glider.be>
References: <20201210075018.2407915-1-geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v5.11 (take three)
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Thu, 10 Dec 2020 13:01:03 -0800
Message-ID: <160763406302.1580929.13900684378520875980@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2020-12-09 23:50:18)
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
 tags/renesas-clk-for-v5.11-tag3
>=20
> for you to fetch changes up to f5c50b1fed55332beb88e81e9e17c49673b77344:
>=20
>   dt-bindings: clock: renesas: rcar-usb2-clock-sel: Convert bindings to j=
son-schema (2020-12-10 08:34:01 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

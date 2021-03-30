Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BDA034DE36
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Mar 2021 04:22:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231159AbhC3CVp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Mar 2021 22:21:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:51936 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230224AbhC3CVR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Mar 2021 22:21:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BA2106198F;
        Tue, 30 Mar 2021 02:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617070876;
        bh=VwMnzrfQQQT7nc3mcwC2wj+/nSJG0avXbU0LxGnlYR4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=GZ36SWx0+6rXerokojc6d7a72QK2M1LswruVqIfJ9FkrWBpoFAaYJFUoGX0Q+5QdD
         eIq/PLiRPBd0lkg5OmPJWMX39+o4g1rq8mevPn6h3q0H8KnwPwyEmO8JKaAFP+Uu5/
         dVLMGME6+j8QlXoP/bgKgZ2FFFicar136cExySrnht07rJSznMIhGxyBg9w/BWL5/E
         znoT0IK+FHbgpz7jT6/I84wmI4EsP5qVaETNf1jlz4Bcn4QgLs7Cnr1lf92QRwtw+c
         8UcSV7yWA5Geomc3lY+2NiASynrQmMBzgaz19104k5xzJK3bVvVn2RmHCdBC+7KVan
         UkZl3PX1+4dXA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210326120100.1577596-1-geert+renesas@glider.be>
References: <20210326120100.1577596-1-geert+renesas@glider.be>
Subject: Re: [PATCH 0/7] clk: renesas: rcar-gen3: Add support for CPU core clock boost modes
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Mon, 29 Mar 2021 19:21:15 -0700
Message-ID: <161707087523.3012082.12537701492218973717@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2021-03-26 05:00:53)
>         Hi Mike, Stephen,
>=20
> This patch series improves the accuracy of the CPU clock rate on R-Car
> Gen3 SoCs, and adds support for CPU boost modes (marked "turbo-mode" in
> the operating points table in DT).
> As usual, it is preceded by a few small cleanups.
>=20
> The easiest way to test this is by enabling
> CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE, and writing the requested clock
> rate to /sys/devices/system/cpu/cpufreq/policy$n/scaling_setspeed
> (n=3D0 for the first cluster, n=3D2 or 4 for the second cluster).
> Note that you need to do
>=20
>     echo 1 > /sys/devices/system/cpu/cpufreq/boost
>=20
> before you can enable boost modes.
>=20
> The PLL rates and CPU clock rates and voltages can be monitored in
> /sys/kernel/debug/{clk/{z,z2,.pll[024]}/clk_rate,reg*/dvfs/cpu*/*uV}.
> The DVFS voltage measured by the on-board max9611 can be monitored
> remotely using iio-monitor.
>=20
> This series has been tested on Salvator-(X)S (with R-Car H3 ES1.0, H3
> ES2.0, M3-W, and M3-N) and Ebisu-4D (R-Car E3).
>=20
> As boost modes may be unstable without increasing the CPU core voltage,
> this series depends on "[PATCH 0/2] arm64: dts: renesas: Add cpu-supply
> properties for DVFS"[1].  Hence I think it is better to postpone this to
> v5.14.
>=20
> Thanks for your comments!
>=20

Acked-by: Stephen Boyd <sboyd@kernel.org>

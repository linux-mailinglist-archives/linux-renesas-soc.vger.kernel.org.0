Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD2C22D689D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Dec 2020 21:28:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390074AbgLJUZe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Dec 2020 15:25:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:43036 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726844AbgLJUZ0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Dec 2020 15:25:26 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607631885;
        bh=K42MpuAhpPk8zfmR6fY2hglfH5sAwH/Kt1o8sG7Mx6Q=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=AajgLUEcd0y0ChWbN88ju0FPBCIJxqKt6Gme88jnpRwdEqrmET3q9+fmUM52bNIDO
         C4nsEjzyEMBX7tZDLH66w7Vb7M4ClQOiqVtsTbCzRMTuKHcylwR29FfsB2vLxV0pF1
         hDeS6UO5jbAI5WZqFGay/oZVnc0/IsM5g2+JkweqdVdp15ejWLiiMY0mhNeRRA4Ttw
         oXf5rqBjDaq5Q44QKoskFw7t7Mb/14No/shNlnspit5ExhSiQJBqwHmFI6Lp/wQsCv
         syg/+uy2Was9LqegDbziRuXiqOVxBP60uJbsakGSFmetckmg/AMI7ZX8vfK9IcZQZg
         3m4dCBeBXV1iw==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201103162435.13689-8-krzk@kernel.org>
References: <20201103162435.13689-1-krzk@kernel.org> <20201103162435.13689-8-krzk@kernel.org>
Subject: Re: [PATCH 8/8] clk: scpi: mark scpi_clk_match as maybe unused
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
To:     Abel Vesa <abel.vesa@nxp.com>, Anson Huang <Anson.Huang@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Date:   Thu, 10 Dec 2020 12:24:44 -0800
Message-ID: <160763188424.1580929.11667962505964409515@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Krzysztof Kozlowski (2020-11-03 08:24:35)
> The scpi_clk_match (struct of_device_id) is referenced only with
> CONFIG_OF builds thus mark it as __maybe_unused:
>=20
>     drivers/clk/clk-scpi.c:132:34: warning:
>         =E2=80=98scpi_clk_match=E2=80=99 defined but not used [-Wunused-c=
onst-variable=3D]
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---

Applied to clk-next

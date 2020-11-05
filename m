Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E9712A74A3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Nov 2020 02:11:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387538AbgKEBLd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Nov 2020 20:11:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:56852 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729888AbgKEBLd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Nov 2020 20:11:33 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7408B206E3;
        Thu,  5 Nov 2020 01:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604538692;
        bh=jR2PetSMvs0C11v8mZSt53Ob1AAJ5sa4sqsKjufA7b8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=OO14B5X49OxN5eeQ0RlvG7QnWKVpaLTvE5UZcA6KUDe6sd4ZT/H+QEyuxd0dhcu/u
         CBKLNeHSZ650vBp/gFngfydkOBqcTXOcYlO5in2NxvAQWhGRY2yv1+EdL0d/uf/JJf
         qhg9yuqjjXpcdl1ZwUhGewdsY+1UTh2bvKZt7BYQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201103162435.13689-2-krzk@kernel.org>
References: <20201103162435.13689-1-krzk@kernel.org> <20201103162435.13689-2-krzk@kernel.org>
Subject: Re: [PATCH 2/8] clk: imx8mm: drop of_match_ptr from of_device_id table
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
Date:   Wed, 04 Nov 2020 17:11:30 -0800
Message-ID: <160453869090.3965362.13438552687754885315@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Krzysztof Kozlowski (2020-11-03 08:24:29)
> The driver can match only via the DT table so the table should be always
> used and the of_match_ptr does not have any sense (this also allows ACPI
> matching via PRP0001, even though it might be not relevant here).  This
> fixes compile warning (!CONFIG_OF && !CONFIG_MODULES):
>=20
>     drivers/clk/imx/clk-imx8mm.c:641:34: warning:
>         =E2=80=98imx8mm_clk_of_match=E2=80=99 defined but not used [-Wunu=
sed-const-variable=3D]
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

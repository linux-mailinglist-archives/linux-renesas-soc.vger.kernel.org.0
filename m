Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E57AD2D6898
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Dec 2020 21:25:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728036AbgLJUZF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Dec 2020 15:25:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:42940 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726844AbgLJUZF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Dec 2020 15:25:05 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607631864;
        bh=kwg/tKpZfJcgzmEhzL9w8F91fP/go66oy80CP2CouNQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ifuIgcsYP2UepQoWfMiYY9OMXC6M2J0h23teTNX0fgZA6Ar/xW1+9rbwYz5u9/otq
         aHOnrO1EruIEhIOFIvB0bpZfMgRbsx5ClMRkK0ZuOGy3D6EKINRgt2zpgPgKXjsD0f
         MOu1d7RAbeOqgDm6qa8Ha/r9dqxgprYvigAZBNfg0k49kFTc+JRSP9bJQFoYMgXPVe
         O81M1PLA8hxsPMUF9JhF+fI8HSU9EHmVYo0ICnSe/lYTFUsDaqyvXtelaknckPd3Y9
         iea200kEsww2jKvQCZN+YEYhGKdFb+t3+I0ViJYRKzkOz/7mQDVHYzthV9EQ1/OU8Z
         uegG0ypuBeOLA==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201103162435.13689-1-krzk@kernel.org>
References: <20201103162435.13689-1-krzk@kernel.org>
Subject: Re: [PATCH 1/8] clk: pwm: drop of_match_ptr from of_device_id table
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
Date:   Thu, 10 Dec 2020 12:24:23 -0800
Message-ID: <160763186300.1580929.2999322890374782210@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Krzysztof Kozlowski (2020-11-03 08:24:28)
> The driver can match only via the DT table so the table should be always
> used and the of_match_ptr does not have any sense (this also allows ACPI
> matching via PRP0001, even though it might be not relevant here).  This
> fixes compile warning (!CONFIG_OF && !CONFIG_MODULES):
>=20
>     drivers/clk/clk-pwm.c:139:34: warning:
>         =E2=80=98clk_pwm_dt_ids=E2=80=99 defined but not used [-Wunused-c=
onst-variable=3D]
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---

Applied to clk-next

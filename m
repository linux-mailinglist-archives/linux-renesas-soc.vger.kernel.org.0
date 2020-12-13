Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AFE12D8B6A
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 13 Dec 2020 06:22:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725306AbgLMFWQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 13 Dec 2020 00:22:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:35840 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725287AbgLMFWQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 13 Dec 2020 00:22:16 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607836895;
        bh=cV44tKi6E31BnITtCOWLyHjjS9XLowKnbRhNJZXaJOw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Dvra/5D2RYTkXWfQDsSyjOxTYcgxltABeZJVULPDQo/+W23kQkutGuebyBF3k9wDa
         /UT3mbkXolf6NeCO/upjzstc/oITZaf1QnZTfZrm2zXKKxKO8bqZSUYeOtqQBMWWUN
         q2Mib44yzw0PjAN3kcOvX+LucaQ/QYAz6+UuBaOmoc52voH+h8+J/9cbtGUl3R1W6o
         bq0RZjFrT4eli8YQLmvegx+3KsxuMbIIfMFoF8yY57cbmkyHdauNV39vxGW1/uViay
         3VWKWD2vr7nL43828x6xLgjAnHp89DR/3t3EPGR4JAqO+fjXbKfXb7cgLkR1wZw78w
         7G8WYGUQ5Dl7w==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201210093201.2419737-1-geert+renesas@glider.be>
References: <20201210093201.2419737-1-geert+renesas@glider.be>
Subject: Re: [PATCH v11] ARM: uncompress: Validate start of physical memory against passed DTB
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Eric Miao <eric.miao@nvidia.com>,
        Uwe =?utf-8?q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Lukasz Stelmach <l.stelmach@samsung.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Ard Biesheuvel <ardb@kernel.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Nicolas Pitre <nico@fluxnic.net>,
        Russell King <linux@armlinux.org.uk>
Date:   Sat, 12 Dec 2020 21:21:34 -0800
Message-ID: <160783689435.1580929.1038454293190061446@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2020-12-10 01:32:01)
> diff --git a/arch/arm/boot/compressed/fdt_check_mem_start.c b/arch/arm/bo=
ot/compressed/fdt_check_mem_start.c
> new file mode 100644
> index 0000000000000000..e58c3a79c8a31ec4
> --- /dev/null
> +++ b/arch/arm/boot/compressed/fdt_check_mem_start.c
> @@ -0,0 +1,131 @@
[...]
> +
> +static uint64_t get_val(const fdt32_t *cells, uint32_t ncells)
> +{
> +       uint64_t r =3D 0;

This assignment is unnecessary?

> +
> +       r =3D fdt32_ld(cells);
> +       if (ncells > 1)
> +               r =3D (r << 32) | fdt32_ld(cells + 1);
> +
> +       return r;

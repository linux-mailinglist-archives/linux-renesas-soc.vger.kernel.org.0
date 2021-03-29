Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D819934D7FC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Mar 2021 21:18:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230346AbhC2TSR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Mar 2021 15:18:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:56216 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229955AbhC2TSD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Mar 2021 15:18:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8A9FA61936;
        Mon, 29 Mar 2021 19:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617045482;
        bh=Vx8l5nUt6KRnMV7obic7+pvnXPSgoQ5HQnML0CGmV7Y=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=myLuX4TUnDEvlW63nMzOXUTCVbISHpLaBO7COIq5U6UTohnTkJiehgCayDNVx9DTg
         asHH2jKtoZX+vvn8fI22d03i83KjXBudXGbvzrJxjxTVgOdEckxt2sjYhJ8djnVqMx
         nrFxwVpwj/ZbKsXnmPorL1aH+TUYhI/+HKPhq8XRQUhD1dlm1ijKb4tu9KwgpWuJ9F
         JZNlceAOtAXNB3MdYBEflYNbvpPIBefeRf4uT+GDgVAGRKtpgmNa4fN7ByWuWqZsfM
         VUAbOeYPbiYIxBu8Ueff4axQjhbcMJoDtnj1Vr+/bVvh68OmrJ9sZgj86TSYjTTLHG
         rkZOOzq7hZggQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210319090737.2710936-1-geert+renesas@glider.be>
References: <20210319090737.2710936-1-geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v5.13
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Mon, 29 Mar 2021 12:18:01 -0700
Message-ID: <161704548101.3012082.5234092232201550637@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2021-03-19 02:07:37)
>         Hi Mike, Stephen,
>=20
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab=
15:
>=20
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v5.13-tag1
>=20
> for you to fetch changes up to 0eedab655ec1817d450085dcb12219726cb415ff:
>=20
>   clk: renesas: r8a779a0: Add CMT clocks (2021-03-12 09:23:24 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

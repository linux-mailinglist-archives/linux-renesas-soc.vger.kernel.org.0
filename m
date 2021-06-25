Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E64A13B4AAD
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 26 Jun 2021 00:43:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229962AbhFYWpu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Jun 2021 18:45:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:34152 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229831AbhFYWpt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Jun 2021 18:45:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 21369616EA;
        Fri, 25 Jun 2021 22:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624661008;
        bh=/de/3Jjvke3M30kHHXuxaAjdDkct112Tu0T3BG3Ty4s=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=P+wOXjTYOb5FAP0ybMaMwxYGGIz7ZCFJ2vo2osPxrZpbNkjucjK5PVs+u0P5U9kwl
         +tSs7fjE32oN7bsVmEni22ECY7JIzw2oD7GJchW4M5WyJ3/mkTfsP7VackMQSoe2Oy
         DXgNZPZMYUDri97DM38+hOa0VBNeuXO60Cot1u02ZUroMo7UMRA4P7f5LYSC1gqoH/
         dPWtzvC0WHMLc+9ELOL0zOnmvFD8M7qD7AGabEvTWpzCG0kT9BISSP5c/g6s/Tfwkt
         DVBhe21Pp6lEaJUh8pKmZnCdLdzusKcckf8wy8vpvjmbfyUb4L6POayU2aD1Ud+QT/
         H6huH2GPLjRZw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <46310530171886c6ccf4046518e07510274a506c.1623308843.git.geert+renesas@glider.be>
References: <46310530171886c6ccf4046518e07510274a506c.1623308843.git.geert+renesas@glider.be>
Subject: Re: [PATCH v6] dt-bindings: clk: versaclock5: Miscellaneous fixes and improvements:
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Adam Ford <aford173@gmail.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Fri, 25 Jun 2021 15:43:26 -0700
Message-ID: <162466100691.3259633.2764263798185965745@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2021-06-10 00:09:40)
>   - Add missing "additionalProperties: false" for subnodes, to catch
>     typos in properties,
>   - Fix property names in example.
>=20
> Fixes: 45c940184b501fc6 ("dt-bindings: clk: versaclock5: convert to yaml")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> ---

Applied to clk-next

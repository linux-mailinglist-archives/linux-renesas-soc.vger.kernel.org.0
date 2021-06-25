Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 016993B4AB0
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 26 Jun 2021 00:44:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229882AbhFYWrB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Jun 2021 18:47:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:34558 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229816AbhFYWrA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Jun 2021 18:47:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AE3D361942;
        Fri, 25 Jun 2021 22:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624661078;
        bh=MhhKjdtEyP6HKkMxYA8rEKdABGIn2lGWQrzheH0guDM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=hk7zp+7B+r23LLcTAUbuIGWhEqRFCTvfPcoLMnRyMBeiwMKea1A/FtqkRvm4TBV7r
         Iu50yYqAOSNUrEVUehzDShTdIzkUH48Fh5/AS87kCxAX8fWx9n5Pf3kpq/+A+PV0xk
         dMGM/kK5p5PCZOHhhfbqvyZI+M5v5MDeflDBPZPz1gb3RJHO786YGCqIWPsV8BxqRL
         qHxiBql+ghLPpniKISgisvzIAOcqy/reYHO+OAq03cG/ZISvqh2NJs+4lr36eVGezH
         OrqUsVGg12AhjVQl216Sizo2O5n0rRirJpaeZgflClqe1ZIGMhEOkfK5bNUUwAR11s
         XvsMTCKQ65DAQ==
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
Date:   Fri, 25 Jun 2021 15:44:37 -0700
Message-ID: <162466107751.3259633.17069845339624475647@swboyd.mtv.corp.google.com>
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

Actually looks like Rob picked something similar up, so dropped it.

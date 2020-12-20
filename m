Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC3FE2DF275
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 20 Dec 2020 01:10:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726771AbgLTAKM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 19 Dec 2020 19:10:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:38536 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726674AbgLTAKL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 19 Dec 2020 19:10:11 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608422971;
        bh=MKyWKqxtLmjSFAl3+Uh0SrvrSUJ2XhlWk29Jd8OAYNM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ig+dMCygwi3oqi1m3QBRefoto26eD+vf867VX23XXQReIWueKMHBJhNgBjfkMqwxS
         bMJoa1HNusAW2tld1p4QtMyLcpiK0z9PbCsq355NdmaiEnsVQQyqempJLi+WOUzPp1
         IUSn7dpHx3JEQACHkn2z8jOCoLaigcMr9UnzdA3E2waeJRNcSxK1LQ037Z1Z9C7HUI
         T42q/r7FCLfK5pTvLzVsz3/pKVoRLPkE47nnGgY3qat8sLHCYnl8aN46FuChN5OJh/
         Np3laDMZKSWgn9MSdwzMb+o8RBa3Vp8ymHgrZCy19UgOxmsHaANLpuR58If0Iz/zwy
         zkYSX1okQzqHw==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201218125253.3815567-1-geert+renesas@glider.be>
References: <20201218125253.3815567-1-geert+renesas@glider.be>
Subject: Re: [PATCH] clk: vc5: Use "idt,voltage-microvolt" instead of "idt,voltage-microvolts"
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Sat, 19 Dec 2020 16:09:30 -0800
Message-ID: <160842297002.1580929.11789688031780676224@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2020-12-18 04:52:53)
> Commit 45c940184b501fc6 ("dt-bindings: clk: versaclock5: convert to
> yaml") accidentally changed "idt,voltage-microvolts" to
> "idt,voltage-microvolt" in the DT bindings, while the driver still used
> the former.
>=20
> Update the driver to match the bindings, as
> Documentation/devicetree/bindings/property-units.txt actually recommends
> using "microvolt".
>=20
> Fixes: 260249f929e81d3d ("clk: vc5: Enable addition output configurations=
 of the Versaclock")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Applied to clk-next

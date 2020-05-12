Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9F6C1D0309
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2020 01:27:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731670AbgELX1l (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 May 2020 19:27:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:49142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726031AbgELX1k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 May 2020 19:27:40 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6765620753;
        Tue, 12 May 2020 23:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589326060;
        bh=Y9+FnbQlpSb4RPN2aukkia02/1PIeKWilIaFdtihQx8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=MzGZmwzsR/TZHjURU5ETxm4UO57HfQ9OfDho0RnroKPSeIHVybIqvUozvfHhbwJ6D
         z+G7URbyv1lM0TfcEp3Nay4gUOLINeXwouTv76djoCubzl+e8+hVNgshY/tTkvxFZJ
         EeZ700gGcPiyhV/47y1OUuQY3egTq6sbrZCy9HiM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200507075026.31941-1-geert+renesas@glider.be>
References: <20200507075026.31941-1-geert+renesas@glider.be>
Subject: Re: [PATCH] dt-bindings: clock: renesas: div6: Convert to json-schema
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Tue, 12 May 2020 16:27:39 -0700
Message-ID: <158932605967.215346.579509459834719291@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2020-05-07 00:50:26)
> Convert the Renesas CPG DIV6 Clock Device Tree binding documentation to
> json-schema.
>=20
> Drop R-Car Gen2 compatible values, which were obsoleted by the unified
> "Renesas Clock Pulse Generator / Module Standby and Software Reset" DT
> bindings.
> Update the example to match reality.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>

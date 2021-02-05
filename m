Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E18031038C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Feb 2021 04:26:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbhBED0c (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 4 Feb 2021 22:26:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:35534 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229854AbhBED0b (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Feb 2021 22:26:31 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0B11264FBE;
        Fri,  5 Feb 2021 03:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612495551;
        bh=6rO+LAksh5ANnYBlADpBpGpr5iLoUNXdtIfn+08rEv0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=RclseKkHcI9SzMP4+ZteFqN8kRQm8sUFcmQAysUYWsCEMsOqigCCMAwsW5BF+27fh
         JJTgcb9U5y05UqK5hX1Boc7lRyqq5SY8+ju7yFdVjWczPW3OuZRakOjDMpGtZ1ehQY
         kWUAuMvTKJPSOwLy79UlwSN3UDkKMfsV0smEbopBBynwpUTNm4RlP6DIog8TGZ/LM+
         muOko2LBD86VNLzaZJvjmYwNRlUHuKcWC2i+zm1BO4IoPyc2uf6XG6XF62h0zNXWFI
         gZUx/5RFlY/62STcKJ1U1Ai3ghVK6BxrmiDj84lAx3ERXV60umiMGLL22A8Xftw+S4
         P3p27jJWSHO+g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210126163955.1933893-1-geert+renesas@glider.be>
References: <20210126163955.1933893-1-geert+renesas@glider.be>
Subject: Re: [PATCH v3] dt-bindings: clk: versaclock5: Miscellaneous fixes and improvements:
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Thu, 04 Feb 2021 19:25:49 -0800
Message-ID: <161249554953.76967.8074850148342072118@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2021-01-26 08:39:55)
>   - Remove unneeded reference for "idt,slew-percent", as vendor specific
>     properties having a standard unit suffix don't need a type,
>   - Add missing "additionalProperties: false" for subnodes, to catch
>     typos in properties,
>   - Fix property names in example.
>=20
> Fixes: 45c940184b501fc6 ("dt-bindings: clk: versaclock5: convert to yaml")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

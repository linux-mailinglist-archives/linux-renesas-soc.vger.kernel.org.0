Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A80D11E31DC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2020 00:00:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390439AbgEZWAO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 May 2020 18:00:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:47334 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390021AbgEZWAO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 May 2020 18:00:14 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C2FB520707;
        Tue, 26 May 2020 22:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590530413;
        bh=ePX/xhu9LY5rXcbtZ4jfxnBBziuX1oq3oD24CUqvZIw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=pTPMhM/+9BAxChFerjv7S9XEudYsKcBN15AfOd6CopTxTsVApLApT5JeVx9YPJPLp
         zCMt104dVQNybRoJ0hF29E+r4HCMG17cBQsHQy9ibxrJd4j8lcqVOkcn7xgQzinvxk
         DhQ67ZXznfnGq8+ThuPH359iHbmv3Dv2bIECwmmI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200520125336.16173-1-geert+renesas@glider.be>
References: <20200520125336.16173-1-geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v5.8 (take two)
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Tue, 26 May 2020 15:00:13 -0700
Message-ID: <159053041310.88029.1261653133885166272@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2020-05-20 05:53:36)
>         Hi Mike, Stephen,
>=20
> The following changes since commit e2f022c10ed3b50ba1d2bb1f037b0e7a84cb1c=
3e:
>=20
>   clk: renesas: rcar-gen2: Remove superfluous CLK_RENESAS_DIV6 selects (2=
020-04-30 09:39:06 +0200)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/clk-renesas-for-v5.8-tag2
>=20
> for you to fetch changes up to 9b9df63b50306b9602954d2f40fa8e05c0c27fda:
>=20
>   dt-bindings: clock: renesas: mstp: Convert to json-schema (2020-05-20 1=
4:08:15 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

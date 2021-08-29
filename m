Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C2C13FA8E6
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Aug 2021 06:28:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbhH2E32 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 29 Aug 2021 00:29:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:45170 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229534AbhH2E31 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 29 Aug 2021 00:29:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 505F3608FB;
        Sun, 29 Aug 2021 04:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630211316;
        bh=F2YXzv8pODNGbftZpUm69vfaS8yG+ciIbCSP0Nnc0O8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=kYpdxOWShbK+JOr0P4qmSp+Pn1Z08aSiFdqbZXQBopjCCiiflYkbIMqpZWrlUEM54
         1HPMNvUBooXUk6bUBXASVINPreRK44xzyXlLMSTOG2fedJRm89nbDRUrg348qp8PUz
         O5xqiQ6QskPE6XLGcays5BrIM2VmyUfTtB3AGIsd1u6H9qFkSS0jbi9YZn35W4lcnK
         K+YQRz3iofrsMGWPDrwlFcFC2iOfVS4TEhX6tQI4MFYa0kkkw51dgm/JAVt9aExuGc
         uRwpd7qEH0LcdeeRJ4DSgbljyG1PuYEhvD56W85Fh03HkgUQb9cWjWfQQ8dOB0ty+4
         h6EtGMe4wZgew==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAMuHMdV5iTg6yyM5E8OH6basnTxmvS9UrY2V+oxDrBe1kfhiOw@mail.gmail.com>
References: <20210826141721.495067-1-aford173@gmail.com> <CAMuHMdV5iTg6yyM5E8OH6basnTxmvS9UrY2V+oxDrBe1kfhiOw@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: rcar-usb2-clock-sel: Fix kernel NULL pointer dereference
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
To:     Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Sat, 28 Aug 2021 21:28:35 -0700
Message-ID: <163021131515.2676726.6123327351640008838@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2021-08-26 10:42:29)
> On Thu, Aug 26, 2021 at 4:17 PM Adam Ford <aford173@gmail.com> wrote:
> > The probe was manually passing NULL instead of dev to devm_clk_hw_regis=
ter.
> > This caused a Unable to handle kernel NULL pointer dereference error.
> > Fix this by passing 'dev'.
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
>=20
> Fixes: a20a40a8bbc2cf4b ("clk: renesas: rcar-usb2-clock-sel: Fix error
> handling in .probe()")
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>=20
> Mike/Stephen: Can you please take this one directly, as we're
> already at rc7.
> Thanks!
>=20

It looks highly unlikely to make the cut but I'll try to send it off to
Linus tomorrow.

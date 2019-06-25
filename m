Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 814AD520E5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2019 05:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727950AbfFYDHC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Jun 2019 23:07:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:41432 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726801AbfFYDHC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Jun 2019 23:07:02 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5952F20663;
        Tue, 25 Jun 2019 03:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561432021;
        bh=srViXewipx7qkXdZBzuLRptj8+F00r8G6s+ib0wex0U=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=idXrGKlnuiYAujXP0l4+IcdRs+6HtCjbjOspNE1wgJTr3rpffGQqmHDi/SP5XX2VY
         TXxRpPDYel9zEO7KdKVoDm37BNK6BNI1fp+nYq9K9AlEpkyiO75oQAF9WlmeyeC6Ou
         7ZFjmSFVgcHF2XtLDkoizmwpNp42krX0MCfsjCE4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190621112821.3104-1-geert+renesas@glider.be>
References: <20190621112821.3104-1-geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [git pull] clk: renesas: Updates for v5.3 (take two)
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
User-Agent: alot/0.8.1
Date:   Mon, 24 Jun 2019 20:07:00 -0700
Message-Id: <20190625030701.5952F20663@mail.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2019-06-21 04:28:21)
>         Hi Mike, Stephen,
>=20
> The following changes since commit aad03a66f902e18bab612870261bde647fdbda=
2c:
>=20
>   clk: renesas: r9a06g032: Add clock domain support (2019-06-04 11:51:00 =
+0200)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/clk-renesas-for-v5.3-tag2
>=20
> for you to fetch changes up to ec2b827be39624bab743730385bc170d29472965:
>=20
>   clk: renesas: cpg-mssr: Use [] to denote a flexible array member (2019-=
06-20 11:37:16 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next


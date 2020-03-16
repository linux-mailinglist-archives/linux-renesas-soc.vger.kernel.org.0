Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5338E187220
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2020 19:19:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732220AbgCPSTK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Mar 2020 14:19:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:54040 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732187AbgCPSTK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Mar 2020 14:19:10 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C8F6D20409;
        Mon, 16 Mar 2020 18:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584382749;
        bh=bzs4I2nYnb+U0jlSoaN4JyuBCY7yS9sH5JZ5m2A+6hY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=KIA5zd8+1nERtBqo3ytb3keLIvlgxZXSk9PY7HI2/iJybHF7PL0OAXIK+ibjm6tNv
         fNpoASHY6OkAlmZVuazf3BQ6SYviUMOYhMf+M+RR9acDaG4n1hLZTRVOD3xfBs56dP
         lMfQqM0da09bdAtO6RKY5sRQQjFaYadhlzZJ3L/4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200314095120.32262-1-geert+renesas@glider.be>
References: <20200314095120.32262-1-geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v5.7 (take two)
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Mon, 16 Mar 2020 11:19:08 -0700
Message-ID: <158438274899.88485.6424320699409632373@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2020-03-14 02:51:20)
>         Hi Mike, Stephen,
>=20
> The following changes since commit 068e7f85234c0b56f55cc0259ad9c05f2c64b8=
fb:
>=20
>   clk: renesas: Remove use of ARCH_R8A7795 (2020-02-21 14:01:54 +0100)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/clk-renesas-for-v5.7-tag2
>=20
> for you to fetch changes up to eeb40fda056ce2f914fff000525ca5a7b2ddec50:
>=20
>   dt-bindings: clock: renesas: cpg-mssr: Convert to json-schema (2020-03-=
11 09:02:26 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

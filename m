Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18B4D2C3539
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Nov 2020 01:08:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbgKYAHH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Nov 2020 19:07:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:48508 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726521AbgKYAHG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Nov 2020 19:07:06 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5780B204EA;
        Wed, 25 Nov 2020 00:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606262826;
        bh=zj6g9Clw8rehUd4k305CMbHkFqyd7jA1940HLRtQPIQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=haPKvWTkKVxRj0YkXsTg6qLKWwgFPjOmh2soui0phvhTBmhyhtucXiKv9VCyLI9o8
         IBc2hW1vAO4arWfmO44tu5BURcoX+BHk21eGd/pzyUhNRzKT4HWOn0MpUvXNJMdf5t
         +zk2cY3NHKyce+RYWHW1uWkZE+WFZ2AWE0+Fbxr0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201119125053.4065746-1-geert+renesas@glider.be>
References: <20201119125053.4065746-1-geert+renesas@glider.be>
Subject: Re: [PATCH] clk: renesas: sh73a0: Stop using __raw_*() I/O accessors
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Arnd Bergmann <arnd@kernel.org>, linux-renesas-soc@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Tue, 24 Nov 2020 16:07:05 -0800
Message-ID: <160626282503.2717324.11024656692958658754@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2020-11-19 04:50:53)
> There is no reason to keep on using the __raw_{read,write}l() I/O
> accessors in Renesas ARM driver code.  Switch to using the plain
> {read,write}l() I/O accessors, to have a chance that this works on
> big-endian.
>=20
> Suggested-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Note that this now includes a barrier. It wasn't mentioned in the commit
text so I'm just mentioning it now in case having a barrier now causes
some sort of problem, which is highly unlikely.

Reviewed-by: Stephen Boyd <sboyd@kernel.org>

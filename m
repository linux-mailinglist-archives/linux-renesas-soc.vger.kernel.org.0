Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46B0835A411
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Apr 2021 18:54:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234174AbhDIQzB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Apr 2021 12:55:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:48996 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234006AbhDIQy6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Apr 2021 12:54:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E2078610CA;
        Fri,  9 Apr 2021 16:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617987285;
        bh=S1rreXn8cUdARnJpVN+EF5Cjzr8UniPQ8ZF/vXZxug8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=WQn88ieIhX6uiBORRqI2/sDT5FE5w9MqbJzV84QCcLDepb9D3J+86hFwyi3+urJOw
         +WlwM6cvEz1OK1flZLZIuXbr2WKVdeWCn9nflxkUnJCs7AlaKVtU6D4QeZOjOqHIiK
         ljwX/s8UcS3kNOQa1+sE0gfnaj6Xi3b/r5NkQqHYaLEPfQK0myli5n3BnYN72euD4f
         RuL1j3dg3j6R+LIDJmHR9cnVeW5N+BQIfw1OkzcUChpYyHZGx3DoCb8m9RLwRGqHy2
         LjhNrG3t3mbVHuMQ2f05HkyVXWxQuASwHJKppYaxphPqkqAalIGMO6682DlFQovrNz
         oRIMhhw4ym/Eg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210409095150.2294437-1-yebin10@huawei.com>
References: <20210409095150.2294437-1-yebin10@huawei.com>
Subject: Re: [PATCH -next] clk: renesas: r8a77970: Use DEFINE_SPINLOCK() for spinlock
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>, yebin10@huawei.com
Date:   Fri, 09 Apr 2021 09:54:43 -0700
Message-ID: <161798728363.3790633.9588461531050943158@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Ye Bin (2021-04-09 02:51:50)
> spinlock can be initialized automatically with DEFINE_SPINLOCK()
> rather than explicitly calling spin_lock_init().
>=20
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Ye Bin <yebin10@huawei.com>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>

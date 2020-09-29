Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39C7627B8AA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Sep 2020 02:12:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbgI2AMg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Sep 2020 20:12:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:33934 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727073AbgI2AMg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Sep 2020 20:12:36 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D5CB120809;
        Tue, 29 Sep 2020 00:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601338355;
        bh=+E1H/rqziA9SnWCpHRpFK/oBRhY8RA2SM+Ifg0y2sDA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=j2i8k4IbsHXT8qMYLIYFH3OeUCpG9gbDt+AtqRMYvVbsGZrvr+TXTO7mgoa+ltnv3
         a1mt2Za4WMffcLgQ33UPzTwwC9DI6urtK5sMC73inaOPizHb4IDOKobp32AL2XJorG
         DKVcvOt9/qsf/G6JFGclRgD9SgdRNWiPRaa7G5PY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200925110713.2652-1-geert+renesas@glider.be>
References: <20200925110713.2652-1-geert+renesas@glider.be>
Subject: Re: [PATCH] MAINTAINERS: Update git repo for Renesas clock drivers
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Mon, 28 Sep 2020 17:12:34 -0700
Message-ID: <160133835461.310579.12825711875902427078@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2020-09-25 04:07:13)
> Align the clock branch name with other renesas-* branches pulled by
> subsystem maintainers.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

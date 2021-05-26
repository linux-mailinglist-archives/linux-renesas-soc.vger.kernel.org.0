Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09BC2390EC6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 May 2021 05:17:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231365AbhEZDTH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 May 2021 23:19:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:47914 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230288AbhEZDTH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 May 2021 23:19:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 66A9C6117A;
        Wed, 26 May 2021 03:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621999056;
        bh=TrXEsxH1oqdjXsBvGLftWDrNBimOjyF2F6/YiV1Df8M=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=i/gQQTOydRtSjv02/yJEOPIAI1JCkqjfFtHoi23o6EY6OcdmTf71JMUYAHoYtZ2cK
         0ndYqonsrBiJVnGeE+L5K3fgUo9R0IItX+VDApwKjwWZaexCo8MhERfkk68OGENxr4
         d5YU0a2ffJtlkCyf5fz5No6T826YXvL8pRGhlTjjm9gH87UkLfq1/zlZmRG5Cc7W2m
         LQtQzBq/WoxTlBCwxZePW6nhT06AH3TZrEn70y2bs/Ey8MWmJoc1W4G25wbmnuk5kj
         pkxasB+JQesLEOTginuWb3K281HacOgIvnHk84sbhCipCoAsEdwJbvB8714mPnkNf4
         N9ybUCHE6PIdA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <97dde75fe3ff27b9639c59a43cddbd9d5c405d0c.1620119700.git.geert+renesas@glider.be>
References: <cover.1620119700.git.geert+renesas@glider.be> <97dde75fe3ff27b9639c59a43cddbd9d5c405d0c.1620119700.git.geert+renesas@glider.be>
Subject: Re: [PATCH 2/2] clk: renesas: cpg-mssr: Make srstclr[] comment block consistent
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Tue, 25 May 2021 20:17:35 -0700
Message-ID: <162199905528.4130789.16655172434627088109@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2021-05-04 02:17:22)
> Make the style of the comment block for the Software Reset Clearing
> Register offsets consistent with the comment blocks for the other
> register offsets.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

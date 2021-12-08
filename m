Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DA6146CC88
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Dec 2021 05:27:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240305AbhLHEah (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Dec 2021 23:30:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240029AbhLHEag (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Dec 2021 23:30:36 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 848EAC061574;
        Tue,  7 Dec 2021 20:27:05 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3C11CB80F00;
        Wed,  8 Dec 2021 04:27:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA2D6C00446;
        Wed,  8 Dec 2021 04:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638937622;
        bh=gm5U+6nX0OqHUocW+vFgpvA0DdUInMV72h3j85gnI+Y=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=V3TUKJkHA0uNFg5mmnT50camm9hsWJeSbBH/9dbCObUrQJj2i3Sb3TT7AkLjtvyyE
         xb2aYV4Ox8OF+5mTK5yDKm3y84zFBiTVGdW+1g6tER0rqMwBefVreUcf/GhGKmBbDt
         HlMp90EYZg4pZf2J+Y7uW6NKC35pI66fqpaWh4V8bVbCrCZpRcmwcpLhsrDhuT0TML
         DSdEdMiLAfG+l1wlGr2Hg2ytAUCgDnD3jwJXymtqPYdKl00u8WAWDBZAEKOgbDEhLq
         DzUGQHKIdwtjUylKebAU/mppFeRdGmqtvnzdA85nElvNyb6eF4Yfpu+8BSqB7LVg+g
         HAPODgp/n6n2A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1638534376.git.geert+renesas@glider.be>
References: <cover.1638534376.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v5.17
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Tue, 07 Dec 2021 20:27:01 -0800
User-Agent: alot/0.9.1
Message-Id: <20211208042702.BA2D6C00446@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2021-12-03 04:30:58)
>         Hi Mike, Stephen,
>=20
> The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0d=
bf:
>=20
>   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v5.17-tag1
>=20
> for you to fetch changes up to 33b22d9c3272003a525ba2d6b7b851f3d4f30574:
>=20
>   clk: renesas: r9a07g044: Add TSU clock and reset entry (2021-11-26 14:0=
6:16 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

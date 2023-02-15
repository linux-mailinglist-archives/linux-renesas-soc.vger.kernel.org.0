Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D763D69748C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Feb 2023 03:51:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231915AbjBOCvh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Feb 2023 21:51:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjBOCvg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Feb 2023 21:51:36 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22B2231E3E;
        Tue, 14 Feb 2023 18:51:36 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9F4B0619AC;
        Wed, 15 Feb 2023 02:51:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA47CC433D2;
        Wed, 15 Feb 2023 02:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676429495;
        bh=hRyigJaGI1OnqJ5TAZtMYDFjSp4uhphLpcroDkazujI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=YFivFtMXFwclsMkYYYexeE7WH0MXNFIckBquVthxz9112rUKYY+Raubdi3+Dc7lrc
         R0ZaVFxrTYu5hXSkGIGR1uXvW/aS0niVENWc0sg7Zz4VOTSfh4aqBFAQJRQJBv5gVV
         3OUxZPcyl3Vat1o01a+oJLzwnFqZJFjOxWwBGt+y9SXo+2g2a6woRIFmrxEL0d2BxE
         tldm6YzsBkAEnb+xPMlGwZuQTPIMiLHTbn11rERvkLjMDb17zuvFKr+F9+PAATeiHj
         kO3W2GALp70XOieYggHUvBeMyOsS584Jgtrr64+zmD/0FOOYoiYofX/dmDH7USZctf
         R4DwLuEpeVa/w==
Message-ID: <d6cdc1328fca7475da20f139c16fd462.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1676278827.git.geert+renesas@glider.be>
References: <cover.1676278827.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v6.3 (take three)
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Tue, 14 Feb 2023 18:51:32 -0800
User-Agent: alot/0.10
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2023-02-13 01:44:47)
>         Hi Mike, Stephen,
>=20
> The following changes since commit bd176e46e9c23f669b28630cc8f3fb1b89fd61=
0e:
>=20
>   clk: renesas: r8a779g0: Add CAN-FD clocks (2023-01-26 15:13:53 +0100)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v6.3-tag3
>=20
> for you to fetch changes up to b1dec4e78599a2ce5bf8557056cd6dd72e1096b0:
>=20
>   clk: renesas: rcar-gen3: Disable R-Car H3 ES1.* (2023-02-10 10:35:16 +0=
100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

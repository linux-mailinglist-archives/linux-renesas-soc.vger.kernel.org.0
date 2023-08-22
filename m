Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24616784883
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Aug 2023 19:40:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229450AbjHVRks (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Aug 2023 13:40:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjHVRks (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Aug 2023 13:40:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB77044AF;
        Tue, 22 Aug 2023 10:40:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DD4A26561B;
        Tue, 22 Aug 2023 17:40:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34D53C433C7;
        Tue, 22 Aug 2023 17:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692726036;
        bh=vUXnzI9j9sDb0rMzXZN/6KnI5PcGGTVTb3BdxDzzeys=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Qr/ppBl6GgVkdhPQK4f2qWkzGDP4viAkH9/RB5T8Wo0sVPjHB/l1+shNmn55PZuD9
         98Q2QRFFeCfTHc/+Mwx9j01Yss32EdhvEW9U/NmKEyQ5u3Ee2jcf5e+tfn4CAPgrtZ
         zY4iww4p7isvYgmb7yGzqiURPKZLjOyDeE6HoWVgpl8DUSMctVsbXg20Ekm+vaYbz2
         2PGtdNazK1SxVm5F+LS1a2LmRahzMuYSyZ975CsCXkvpNgK4f1IVTtyYH0B4kgQVJi
         ESbCl5SReVoO8YvYSb9ca07juhHMy/Pj5h6aAy9KjQtbVZrVDOPS/xVXDKMs5bYYiH
         fpXccfdwUpsDw==
Message-ID: <8d35fa35494d8e8958aab3bdfb73525e.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1692262242.git.geert+renesas@glider.be>
References: <cover.1692262242.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v6.6 (take two)
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Tue, 22 Aug 2023 10:40:33 -0700
User-Agent: alot/0.10
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2023-08-17 01:54:29)
>         Hi Mike, Stephen,
>=20
> The following changes since commit dec57795efc4585d5bbca913af6683c5cce2a6=
47:
>=20
>   clk: renesas: r8a77965: Add 3DGE and ZG support (2023-07-27 14:32:46 +0=
200)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v6.6-tag2
>=20
> for you to fetch changes up to 708cb698ffa219567dd5837aefae7a99fbb28b77:
>=20
>   clk: renesas: rcar-gen3: Add ADG clocks (2023-08-15 11:34:43 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

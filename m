Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC506728CB2
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jun 2023 02:57:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229573AbjFIA5h (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 8 Jun 2023 20:57:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230340AbjFIA5g (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Jun 2023 20:57:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BEC630E4;
        Thu,  8 Jun 2023 17:57:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A5A446527A;
        Fri,  9 Jun 2023 00:57:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3958C433D2;
        Fri,  9 Jun 2023 00:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686272252;
        bh=D8/QLnk62c2JW2uh38eLpF0eqg/3c9Kx621Upma/pvY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=EwpSu2GjUkCjOyTrD1/4cZO15oJEFXjU4GfqgzMp/6oFgm7Cex5Bm+hPwHmtlnfcP
         IkUuAgbbWaLcw0W7oUD0TpyVZRB+dyQrtEJXGGKgvPM4VTguScxIyHHBKVx1JNtfZj
         Deo0hpBI5IO6KuZx5SWJjoy1Vn6j43jr88wytqq7C4Z4hZ/J1BhLj7y85JJDKiaJht
         Z55itUnT3vGkRw6VmW+iWkNct2RLFHRBCh1Toum5KXrA5CZX+NXDyx1oEoJ5RBcJzj
         Tipp0/mkXWTueZiVp+cFnuLjvh/dSAyBooWyXZ5Qrk94b1EYbscffm0kw1D2/bm4uF
         1+aIoGiIlqTOg==
Message-ID: <dd78ea99114f431dfc97ba88de39b509.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1685094576.git.geert+renesas@glider.be>
References: <cover.1685094576.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v6.5
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Thu, 08 Jun 2023 17:57:29 -0700
User-Agent: alot/0.10
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2023-05-26 02:53:19)
>         Hi Mike, Stephen,
>=20
> The following changes since commit ac9a78681b921877518763ba0e89202254349d=
1b:
>=20
>   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v6.5-tag1
>=20
> for you to fetch changes up to d1c20885d3b01e6a62e920af4b227abd294d22f3:
>=20
>   clk: renesas: rzg2l: Fix CPG_SIPLL5_CLK1 register write (2023-05-23 09:=
06:50 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01180767796
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jul 2023 23:29:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbjG1V3Y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Jul 2023 17:29:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbjG1V3X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Jul 2023 17:29:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 371083AA8;
        Fri, 28 Jul 2023 14:29:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BED2C62204;
        Fri, 28 Jul 2023 21:29:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F6CAC433C7;
        Fri, 28 Jul 2023 21:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690579762;
        bh=6/RtFwBaL2z+M6AP5wKi0iQVsP4ZlFH47xlHH9reiYw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=PF4BAthHRvGxEbakctBECAPrA0dEg9eT5lmpX4TfLhHE2JLqHdXXnPFGshNe6zAG8
         gamd5GzS5yACTUf22Qs9f+0ujNxEkBA6th8vXn2KeDw5EzSVuiBGyfy5mKATYi4mxe
         emsfDYKjJWZ1+nM8anQrotOc5/Z+HRRgc1Ua6fNeGEYxT3sSxIUV2oNjm8XY9RfIxd
         R+W0Qmw7LxQV8Fkm6PurIRh8tasIVK+jmJfGwv9BW2lQnjPOuzh0YB/LBWY7saG2Pa
         E0VPn5TVVscRWBz9f7piqjUPt7r3EkCcVQ5SIGd73zKUjweB+HU3j5y+0cCcye6Sdn
         azYdgmIR+KP+g==
Message-ID: <b264fd7dd1e1f9db79d3990f4cd0d6e3.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1690545478.git.geert+renesas@glider.be>
References: <cover.1690545478.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v6.6
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Fri, 28 Jul 2023 14:29:19 -0700
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

Quoting Geert Uytterhoeven (2023-07-28 04:59:48)
>         Hi Mike, Stephen,
>=20
> The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaa=
a5:
>=20
>   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v6.6-tag1
>=20
> for you to fetch changes up to dec57795efc4585d5bbca913af6683c5cce2a647:
>=20
>   clk: renesas: r8a77965: Add 3DGE and ZG support (2023-07-27 14:32:46 +0=
200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38604672757
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Jan 2023 19:45:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230114AbjARSpN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Jan 2023 13:45:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231222AbjARSpF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Jan 2023 13:45:05 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20883144A3;
        Wed, 18 Jan 2023 10:45:05 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DCEC8B81E13;
        Wed, 18 Jan 2023 18:45:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74DD9C433F1;
        Wed, 18 Jan 2023 18:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674067502;
        bh=PBRyD7MKNaCb7PWBgF9NC7DLnhcGgYkOKn+XmoVUTZ0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=tXLwwG+4qh/YESvvqR60W06xni2SgSHl9t+bg6B9YgPv4lPRcGEiDE6xC1ReBNDuo
         qnXHOx173OYLtRMTZm95KkFYOl7oA2fXib4M78j2PO7pJ/1r5ZqiG2CDI0n4tngoed
         Qk2SfjbWBjKG9BZehcBj/9u5RyrluSThKO5W7pw0V15HrNwI3LwetXcFXbU0VF52Nq
         sa0/3i0RPbecJ0XMCL3jn103Kr7iE/ZxAU89iPTRwfszXK48k1hbKAPZ3qkB5vCNNI
         G01scXEL7EFSp3Nv7DFjpHMBPa/mrhPUNWqqhH6KweM+1DXsqxW1SAHyBMN4j5ovGW
         QDxOeqXdAMmjg==
Message-ID: <378e11b64af50cee80e3e739c4db5a62.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1673702689.git.geert+renesas@glider.be>
References: <cover.1673702689.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v6.3
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 18 Jan 2023 10:45:00 -0800
User-Agent: alot/0.10
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2023-01-14 05:25:54)
>         Hi Mike, Stephen,
>=20
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71=
c2:
>=20
>   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v6.3-tag1
>=20
> for you to fetch changes up to fbfd614aeaa2853c2c575299dfe2458db8eff67e:
>=20
>   clk: renesas: cpg-mssr: Fix use after free if cpg_mssr_common_init() fa=
iled (2023-01-12 17:18:48 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

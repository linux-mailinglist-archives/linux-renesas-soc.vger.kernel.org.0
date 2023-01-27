Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20E9867F01B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jan 2023 22:07:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbjA0VHi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Jan 2023 16:07:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbjA0VHh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Jan 2023 16:07:37 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C2518717D;
        Fri, 27 Jan 2023 13:07:36 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9CCD961CB2;
        Fri, 27 Jan 2023 21:07:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2366C433EF;
        Fri, 27 Jan 2023 21:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674853655;
        bh=a3kfzI/OJYfOAQlpl253CoHuuao3p0PRGthjUntv+wE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ECzrfn4OGE/GAibVpQTJLfiM/78oNIE5Ar4b9NmmLMVIu9VU4G1gK9wkvpMS/PwEZ
         IZpVpjoaPkL96/FfXKAEs88XBFcMeg69anHWdUrz6F3XdyWoNqNzglYMsem72POINS
         +7XC5a8DXjq2JICrzXGvZmOeEy5/jQk6NEBAogeG8xRtnNA+bJMhLgNGODNMn7Q21r
         tF8GCfYVFDIW9lvnhlCSOkVMeq7KryGowz+Zi17TVR5HsRyiUmGWSeOyUY/0cl0t21
         D12FDVdp9z16VANsDR2tPLWpsvu5v5rC1Ey6X5x6SYThVS5+J1sJwhRIbgUDZtHy2n
         hdc7exy9bkNRA==
Message-ID: <ac971e61582be2cb2c58850c06d8d8a4.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1674815598.git.geert+renesas@glider.be>
References: <cover.1674815598.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v6.3 (take two)
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Fri, 27 Jan 2023 13:07:32 -0800
User-Agent: alot/0.10
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2023-01-27 08:28:38)
>         Hi Mike, Stephen,
>=20
> The following changes since commit fbfd614aeaa2853c2c575299dfe2458db8eff6=
7e:
>=20
>   clk: renesas: cpg-mssr: Fix use after free if cpg_mssr_common_init() fa=
iled (2023-01-12 17:18:48 +0100)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v6.3-tag2
>=20
> for you to fetch changes up to bd176e46e9c23f669b28630cc8f3fb1b89fd610e:
>=20
>   clk: renesas: r8a779g0: Add CAN-FD clocks (2023-01-26 15:13:53 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

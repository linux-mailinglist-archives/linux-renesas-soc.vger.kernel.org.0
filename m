Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AED40578B16
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Jul 2022 21:38:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236246AbiGRTi6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 Jul 2022 15:38:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236307AbiGRTix (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Jul 2022 15:38:53 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 574AC6578;
        Mon, 18 Jul 2022 12:38:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8E576B816FF;
        Mon, 18 Jul 2022 19:38:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44AC4C341C0;
        Mon, 18 Jul 2022 19:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658173128;
        bh=bTynAwr3TaAm3WNJ7sbmubRNZoIAMbwK3m9PnZY4z5c=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=sB6BJZkTR304uuUU1Qr6OvIXrBgTZAivsVcG795lOCNuRtYG/IdzVB63Xizhpbd1l
         DGE6nM4xJN4H7crOl3dKkhXnJDEWEk9K5vuHBWznzouqKoFJCSwHgSJ1r8bH6E8p/M
         nZ069xBTkwtk19Za6UtBE5FhVJkXPyIBlbGWWtcdufQSwRGbPlHGNtm3oOdXDSsWjL
         2tUcjjO/S9PRqYF7dd063RZVcL8rvNDtQDQHqTuck84ubVreV77kS7M8j9IBfk2Psr
         7Q1bkk0PupTIDk7vji/HpMT4rirv1diqyoopjIrJwuqfJ6jpwPuv+OzcDiMysBFYuC
         0l2LUeV/8JH/Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1657279252.git.geert+renesas@glider.be>
References: <cover.1657279252.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v5.20 (take two)
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Mon, 18 Jul 2022 12:38:46 -0700
User-Agent: alot/0.10
Message-Id: <20220718193848.44AC4C341C0@smtp.kernel.org>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2022-07-08 04:26:59)
>         Hi Mike, Stephen,
>=20
> The following changes since commit 080bcd8d5997b1a615e17cab02bd9d16d1d4fb=
f3:
>=20
>   clk: renesas: r8a779f0: Add HSCIF clocks (2022-06-17 09:14:13 +0200)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v5.20-tag2
>=20
> for you to fetch changes up to 0e704f6c42dc64f081d0b1738d06b2dee9524f27:
>=20
>   clk: renesas: rcar-gen4: Fix initconst confusion for cpg_pll_config (20=
22-07-05 09:20:34 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

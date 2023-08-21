Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F00B27828DA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Aug 2023 14:19:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234630AbjHUMTO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Aug 2023 08:19:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234612AbjHUMTO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Aug 2023 08:19:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21ABDCC;
        Mon, 21 Aug 2023 05:19:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AF960633D8;
        Mon, 21 Aug 2023 12:19:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85CC0C433D9;
        Mon, 21 Aug 2023 12:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692620351;
        bh=kB8/0xQIfQX31Rkx5+9jQQr4Xco0EkIX8SGBsy14+88=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TqJDLzUkWk/f2E+cW8ICLMqsDpNmUF0v85Q7ClG5Ee+Cuv9vmp8I43W7bEZHxzTrX
         JOmfDMT3oHckQPQhqcEvhqZq9dST90to7aHXkkkRVBBDgwjDJikrlkpRsRha0fl7xz
         fslQDLBu1gNp6Jn7+GRHy4aJu7eipd8Sb7eN76uSHwbYcBGJv28f9VweaDub1c4xuh
         Jbq6CJmoU3PHdJRYAGPcGOcekqwNdaQsQH4yJUD/3Tld2DOqlcpSbu4X3pCNm9icQy
         eILUdD41n0a3/uldcbclyihosduQ/M6aMhcdcjW5zXkC/u+Uh40MT13+dOgd64E+mZ
         Sien050Iq1dHQ==
Date:   Mon, 21 Aug 2023 13:19:07 +0100
From:   Lee Jones <lee@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] leds: pca955x: Convert enum->pointer for data in the
 match tables
Message-ID: <20230821121907.GI1380343@google.com>
References: <20230820082005.55124-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230820082005.55124-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, 20 Aug 2023, Biju Das wrote:

> Convert enum->pointer for data in the match tables, so that
> device_get_match_data() can do match against OF/ACPI/I2C tables, once i2c
> bus type match support added to it.
> 
> Replace enum->struct *pca955x_chipdefs for data in the match table.
> Simplify the probe() by replacing device_get_match_data() and ID lookup
> for retrieving data by i2c_get_match_data().
> 
> While at it, add const definition to pca955x_chipdefs[].
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> Note:
>  This patch is only compile tested.
> ---
>  drivers/leds/leds-pca955x.c | 45 +++++++++++++------------------------
>  1 file changed, 16 insertions(+), 29 deletions(-)

This is too big of a change to be added this late in the cycle.

Especially since this is only compile tested.

Pushing review until after v6.5 is out.

-- 
Lee Jones [李琼斯]

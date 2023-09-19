Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 887C67A6781
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Sep 2023 17:01:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233042AbjISPBK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Sep 2023 11:01:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233013AbjISPBJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Sep 2023 11:01:09 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 254A2F0;
        Tue, 19 Sep 2023 08:01:04 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C65EC433C7;
        Tue, 19 Sep 2023 15:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695135663;
        bh=FI/dgYRbq7BAb8W+dQDuGx+WL6LSfVLjyGsPN51OSPs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LwTAnxYhxKekhfo3eMio2btiMj4L9AluR8wH4TmRUETomypwdmi0R+K8z/QUL6EWi
         FTnih4GyXn6KzOl5lunZkT+Vuune3SAjMbOIDcJEcSSojsPvV/OEcVFctx5+36AGHs
         HiBEASRo5swuKW4PxQqNNYRarHJsX287XW/lwhhoelhaLSGIr5eQvn3wRybyuTR0T2
         X9nEpCiI85fWmwI9udrWHXGWnDrPpbQA54UdwvMRCcJm47CycwFCWvh/8+ogSlfF4m
         4o3N8KDO3J0VRjwfo6lCtsGH+mWLmxV6fEKHxcjtfH/zls6yVoTYntO9t1RVoqOGyC
         ikX4audt/l6yQ==
Date:   Tue, 19 Sep 2023 16:00:59 +0100
From:   Lee Jones <lee@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] leds: pca955x: Convert enum->pointer for data in the
 match tables
Message-ID: <20230919150059.GY13143@google.com>
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

Reviewed-by: Lee Jones <lee@kernel.org>

Patch doesn't apply.  Please rebase, add the tag above and resubmit.

-- 
Lee Jones [李琼斯]

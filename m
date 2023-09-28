Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7ADAC7B1EC9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Sep 2023 15:44:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232152AbjI1NoI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Sep 2023 09:44:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231871AbjI1NoH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Sep 2023 09:44:07 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EECD196;
        Thu, 28 Sep 2023 06:44:06 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABEFAC433C7;
        Thu, 28 Sep 2023 13:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695908646;
        bh=/a8QarklBOFtA5LfqC8eHnpGOfZd/G2pFvn+2e3tt7U=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=RizwdQz85d2/AQDT3DBz/rZt/eWB7YIo/p0YnJyYIXNexLClNbwEfiRDU1hqcPVtS
         pz1hrt5muYGerY8AsNBL/w0s+N4bdd6FCidNOTB2dzSeneWhuZfPWgaeEKeFn2lyPI
         O3GnLLI1lVtRkjaTP5z7jvkGclb5x+M9oY9tEaA0eahegB1A4cP/7eaW2KMcieNg5g
         U3X5jHGtxpxO3aEwwtKqQrQbXiHRl2yiYbptDTD26zx/0aXq+69k0Ij2+WpI6umFdp
         DrKmZ0vjqNS1/jNz74Cc2qgsyb8+avPvtFd7AMrnfNecmbckk6JosI4oeKqyEzvNSB
         WOh2VSYJUD4JQ==
From:   Lee Jones <lee@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Cc:     linux-leds@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org
In-Reply-To: <20230820082005.55124-1-biju.das.jz@bp.renesas.com>
References: <20230820082005.55124-1-biju.das.jz@bp.renesas.com>
Subject: Re: (subset) [PATCH] leds: pca955x: Convert enum->pointer for data
 in the match tables
Message-Id: <169590864442.1606171.7587176714186983511.b4-ty@kernel.org>
Date:   Thu, 28 Sep 2023 14:44:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, 20 Aug 2023 09:20:05 +0100, Biju Das wrote:
> Convert enum->pointer for data in the match tables, so that
> device_get_match_data() can do match against OF/ACPI/I2C tables, once i2c
> bus type match support added to it.
> 
> Replace enum->struct *pca955x_chipdefs for data in the match table.
> Simplify the probe() by replacing device_get_match_data() and ID lookup
> for retrieving data by i2c_get_match_data().
> 
> [...]

Applied, thanks!

[1/1] leds: pca955x: Convert enum->pointer for data in the match tables
      commit: 734adca71b2ccc6df12c244037e0b284aab7cf58

--
Lee Jones [李琼斯]


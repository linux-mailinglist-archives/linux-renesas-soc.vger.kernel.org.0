Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68F977525C4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jul 2023 16:56:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231994AbjGMO45 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Jul 2023 10:56:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231671AbjGMO44 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jul 2023 10:56:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2572106
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Jul 2023 07:56:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5FC9561849
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Jul 2023 14:56:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0DCAC433C8;
        Thu, 13 Jul 2023 14:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689260214;
        bh=TLrNv/65R1yYjwwxIAAJ9m/BnNgiu6kbJYskLPyGqL4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Bfng/N0xvWkuRfaPkxNenAwzirZHA1D685tNTKX8/92DnO8oY5u8eWsJOh0kzabJk
         bso2NFofLX7KEXI+WqNWHQQpBT/PP3iXpaEQjOyIbnuWHr45oXPMxyYLBSBQDv+XpO
         7gF6xkMw//GIdBV2FVJ+zfxBRt2LnqzL3q8VfCqQb5Jybmdoh1QMQD3CJrLbDL2KYc
         9Zv+YIQ8rVSKWShJzuJeotm5/RIqLAb8rWA6SvkV/okDN5lZcTALL8yzUnWHga+fQI
         rGMi/PXKOc/D+c+KDhjAcdRfTwNHB36kzgGYZtd/NF8x/oPeGQVajEpixlNao3rtZz
         CYGus1h1Ud59w==
Date:   Thu, 13 Jul 2023 15:56:50 +0100
From:   Lee Jones <lee@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] mfd: Add module build support for RZ/G2L MTU3a
Message-ID: <20230713145650.GG10768@google.com>
References: <20230711092841.119161-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230711092841.119161-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 11 Jul 2023, Biju Das wrote:

> Modified Kconfig to enable module build support for RZ/G2L MTU3a driver.
> While at it, added module.h header file.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v1->v2:
>  * Added Rb tag from Geert.
>  * Added module.h header file and updated commit description
>  * Retained Rb tag as the change is trivail.
> ---
>  drivers/mfd/Kconfig   | 2 +-
>  drivers/mfd/rz-mtu3.c | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)

Applied, thanks

-- 
Lee Jones [李琼斯]

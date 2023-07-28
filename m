Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 262E2766AB0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jul 2023 12:32:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235329AbjG1Kc3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Jul 2023 06:32:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235588AbjG1KcK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Jul 2023 06:32:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0462B469A
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jul 2023 03:30:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8B0C1620D5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jul 2023 10:29:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3206C433C8;
        Fri, 28 Jul 2023 10:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690540176;
        bh=n6hLoJoxaHRZl2gwtQqqv7qOvBWSxA2vMdfkwL9PGdU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qm4fn49ckb/huwQHZkpuU6XUdygL0x4SJ0Pk6j7ZIhPC+WgpgR/QUmQZb3tdSTKGI
         OsEnht4nqo2vyxNwKzqs0k7EFMQS2xYN21NBZeQFvnFSuDBdIURnmBPKfidHgvToik
         gdn1y4C0XMhC/2KaP8Sri8S8AAYzRgFQ4yGZd3d6hCuZRsAdDeYLaJ4B+fgLZB0MHv
         JxZTBEtmK3F434HFNuwTInqzBCb9ZAyPsVpoVsnUw0+o7oUtKpztsUYJ/h9WYy3rAJ
         JEeVU1qM8E3x//UceZdgPeDWLpA6bqjIUvEwnZNkv8Dpn59aqWidS38fSeUt0ctEHC
         UA1d6qdT++Bhg==
Date:   Fri, 28 Jul 2023 11:29:31 +0100
From:   Lee Jones <lee@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Pavel Machek <pavel@denx.de>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] mfd: rz-mtu3: Replace raw_spin_lock->spin_lock()
Message-ID: <20230728102931.GJ8175@google.com>
References: <20230719124729.270393-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230719124729.270393-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 19 Jul 2023, Biju Das wrote:

> As per kernel documentation, use raw_spinlock_t only in real critical core
> code, low-level interrupt handling, and places where disabling preemption
> or interrupts is required. Here the lock is for concurrent register access
> from different drivers, hence spin_lock() is sufficient.
> 
> Reported-by: Pavel Machek <pavel@denx.de>
> Closes: https://patchwork.kernel.org/project/linux-renesas-soc/patch/20230717120333.165219-1-biju.das.jz@bp.renesas.com/
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> This patch depend upon [1]
> [1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20230717120333.165219-1-biju.das.jz@bp.renesas.com/
> ---
>  drivers/mfd/rz-mtu3.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

Doesn't apply.  Please rebase and resend

-- 
Lee Jones [李琼斯]

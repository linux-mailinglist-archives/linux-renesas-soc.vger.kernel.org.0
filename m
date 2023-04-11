Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 979C56DDD6A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Apr 2023 16:14:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229490AbjDKOO4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Apr 2023 10:14:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbjDKOOu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Apr 2023 10:14:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 553B6120;
        Tue, 11 Apr 2023 07:14:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E0CBA6276A;
        Tue, 11 Apr 2023 14:14:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3984C433B4;
        Tue, 11 Apr 2023 14:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1681222488;
        bh=pV0YHKOQGON8sXGyn6fHpweQWRBxouMZvrcjU8z4Jpg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VFLQ0/09CIMwEE5h/WWGpU/MVKy5DkvlIOlFjgMur7zSp91ZHGsKjxmflJgNQ38y8
         li3iANN8qYT4FtIQ4nq3DiujMZdCi+H8X1uquc5Bauu7WbLxD655XSLr0NgapP1RPr
         NsV/jyByBnne+gJ2OB29I35NQu2UADNX7nDOGw+M=
Date:   Tue, 11 Apr 2023 16:14:45 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Jiri Slaby <jslaby@suse.com>, linux-serial@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, stable <stable@kernel.org>
Subject: Re: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt handler
Message-ID: <2023041129-skeleton-nursery-f9b0@gregkh>
References: <20230411100859.305617-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230411100859.305617-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Apr 11, 2023 at 11:08:59AM +0100, Biju Das wrote:
> commit b43a18647f03c87e77d50d6fe74904b61b96323e upstream.
> 
> The fourth interrupt on SCI port is transmit end interrupt compared to
> the break interrupt on other port types. So, shuffle the interrupts to fix
> the transmit end interrupt handler.
> 
> Fixes: e1d0be616186 ("sh-sci: Add h8300 SCI")
> Cc: stable <stable@kernel.org>
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Link: https://lore.kernel.org/r/20230317150403.154094-1-biju.das.jz@bp.renesas.com
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> [biju: manually fixed the conflicts]
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> Resending to 4.14 with confilcts [1] fixed.
> [1] https://lore.kernel.org/stable/2023041046-synthetic-urgent-3126@gregkh/T/#u

You did not actually build your patch, as it breaks the build :(


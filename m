Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E870E2110E1
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Jul 2020 18:41:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732367AbgGAQlA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Jul 2020 12:41:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:53356 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732255AbgGAQlA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Jul 2020 12:41:00 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 225442085B;
        Wed,  1 Jul 2020 16:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593621659;
        bh=1oDKRRJecAucuPGAsybdvcvitslL98sAMdG8RwbytZQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FZRIXIggyKlaPBi3DZsdRlQHQ+jSKGJZolbyP4A8nXWVYzoJxDiSPros5zqrqYn8c
         ypVL9DZXRgd1XsGEktx5iQ9M7RMbJ3nlbPvSITYgGL90snNQGvqWCYZttA7igsS4Y3
         jtjx3bvtE4i9K5f1Y4v+3ewY3pl0hzqzvJ8d+TZs=
Date:   Wed, 1 Jul 2020 18:40:45 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH] serial: sh-sci: Initialize spinlock for uart console
Message-ID: <20200701164045.GA3163341@kroah.com>
References: <1593618100-2151-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1593618100-2151-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jul 01, 2020 at 04:41:40PM +0100, Lad Prabhakar wrote:
> serial core expects the spinlock to be initialized by the controller
> driver for serial console, this patch makes sure the spinlock is
> initialized, fixing the below issue:
> 
> [    0.865928] BUG: spinlock bad magic on CPU#0, swapper/0/1
> [    0.865945]  lock: sci_ports+0x0/0x4c80, .magic: 00000000, .owner: <none>/-1, .owner_cpu: 0
> [    0.865955] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.8.0-rc1+ #112
> [    0.865961] Hardware name: HopeRun HiHope RZ/G2H with sub board (DT)
> [    0.865968] Call trace:
> [    0.865979]  dump_backtrace+0x0/0x1d8
> [    0.865985]  show_stack+0x14/0x20
> [    0.865996]  dump_stack+0xe8/0x130
> [    0.866006]  spin_dump+0x6c/0x88
> [    0.866012]  do_raw_spin_lock+0xb0/0xf8
> [    0.866023]  _raw_spin_lock_irqsave+0x80/0xa0
> [    0.866032]  uart_add_one_port+0x3a4/0x4e0
> [    0.866039]  sci_probe+0x504/0x7c8
> [    0.866048]  platform_drv_probe+0x50/0xa0
> [    0.866059]  really_probe+0xdc/0x330
> [    0.866066]  driver_probe_device+0x58/0xb8
> [    0.866072]  device_driver_attach+0x6c/0x90
> [    0.866078]  __driver_attach+0x88/0xd0
> [    0.866085]  bus_for_each_dev+0x74/0xc8
> [    0.866091]  driver_attach+0x20/0x28
> [    0.866098]  bus_add_driver+0x14c/0x1f8
> [    0.866104]  driver_register+0x60/0x110
> [    0.866109]  __platform_driver_register+0x40/0x48
> [    0.866119]  sci_init+0x2c/0x34
> [    0.866127]  do_one_initcall+0x88/0x428
> [    0.866137]  kernel_init_freeable+0x2c0/0x328
> [    0.866143]  kernel_init+0x10/0x108
> [    0.866150]  ret_from_fork+0x10/0x18
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

This should be backported to older kernels too, right?  How far back?

thanks,

greg k-h

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27A6630BCC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 May 2019 11:40:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbfEaJkE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 31 May 2019 05:40:04 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:44420 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726485AbfEaJkE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 31 May 2019 05:40:04 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 5A05625AE77;
        Fri, 31 May 2019 19:40:02 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 52B429401DB; Fri, 31 May 2019 11:40:00 +0200 (CEST)
Date:   Fri, 31 May 2019 11:40:00 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        julien.grall@arm.com, magnus.damm@gmail.com, linux@armlinux.org.uk,
        geert@linux-m68k.org,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH V6] ARM: mach-shmobile: Don't init CNTVOFF/counter if
 PSCI is available
Message-ID: <20190531094000.7l32vuvslsijzgxb@verge.net.au>
References: <1559145900-5757-1-git-send-email-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559145900-5757-1-git-send-email-olekstysh@gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, May 29, 2019 at 07:05:00PM +0300, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> If PSCI is available then most likely we are running on PSCI-enabled
> U-Boot which, we assume, has already taken care of resetting CNTVOFF
> and updating counter module before switching to non-secure mode
> and we don't need to.
> 
> As the psci_smp_available() helper always returns false if CONFIG_SMP
> is disabled, it can't be used safely as an indicator of PSCI usage.
> For that reason, we check for the mandatory PSCI operation to be
> available.
> 
> Please note, an extra check to prevent secure_cntvoff_init() from
> being called for secondary CPUs in headsmp-apmu.S is not needed,
> as SMP code for APMU based system is not executed if PSCI is in use.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> CC: Julien Grall <julien.grall@arm.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks Oleksandr,

applied for inclusion in v5.3.

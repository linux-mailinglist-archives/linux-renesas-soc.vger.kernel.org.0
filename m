Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 489B01B2BC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2019 11:19:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727837AbfEMJT4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 May 2019 05:19:56 -0400
Received: from foss.arm.com ([217.140.101.70]:49932 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727576AbfEMJT4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 May 2019 05:19:56 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3836341;
        Mon, 13 May 2019 02:19:55 -0700 (PDT)
Received: from [10.37.12.148] (unknown [10.37.12.148])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 370653F703;
        Mon, 13 May 2019 02:19:54 -0700 (PDT)
Subject: Re: [RFC PATCH] ARM: mach-shmobile: Parse DT to get ARCH timer memory
 region
To:     Oleksandr Tyshchenko <olekstysh@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     horms@verge.net.au, magnus.damm@gmail.com, linux@armlinux.org.uk,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <1557505377-28577-1-git-send-email-olekstysh@gmail.com>
From:   Julien Grall <julien.grall@arm.com>
Message-ID: <e64d7f2f-209e-cf7d-6ddc-88d338b1c010@arm.com>
Date:   Mon, 13 May 2019 10:19:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1557505377-28577-1-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On 5/10/19 5:22 PM, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Don't use hardcoded address, retrieve it from device-tree instead.
> 
> And besides, this patch fixes the memory error when running
> on top of Xen hypervisor:
> 
> (XEN) traps.c:1999:d0v0 HSR=0x93830007 pc=0xc0b097f8 gva=0xf0805000
>        gpa=0x000000e6080000
> 
> Which shows that VCPU0 in Dom0 is trying to access an address in memory
> it is not allowed to access (0x000000e6080000).
> Put simply, Xen doesn't know that it is a device's register memory
> since it wasn't described in a host device tree (which Xen parses)
> and as the result this memory region wasn't assigned to Dom0 at
> domain creation time.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> ---
> 
> This patch is meant to get feedback from the community before
> proceeding further. If we decide to go this direction, all Gen2
> device-trees should be updated (add memory region) before
> this patch going in.
> 
> e.g. r8a7790.dtsi:
> 
> ...
> timer {
> 	compatible = "arm,armv7-timer";
> 	interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> 			      <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> 			      <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> 			      <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
> +	 reg = <0 0xe6080000 0 0x1000>;

This looks incorrect, the "arm,armv7-timer" bindings doesn't offer you 
the possibility to specify an MMIO region. This makes sense because it 
is meant to describe the Arch timer that is only access via co-processor 
registers.

Looking at the code, I think the MMIO region corresponds to the 
coresight (based on the register name). So you may want to describe the 
coresight in the Device-Tree.

Also, AFAICT, the code is configuring and turning on the timer if it has 
not been done yet. If you are here running on Xen, then you have 
probably done something wrong. Indeed, it means Xen would not be able to 
use the timer until Dom0 has booted. But, shouldn't newer U-boot do it 
for you?

Cheers,

-- 
Julien Grall

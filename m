Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 130A347CEA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 10:28:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726609AbfFQI2h (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 04:28:37 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:34522 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726005AbfFQI1H (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 04:27:07 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 755A825AED3;
        Mon, 17 Jun 2019 18:27:05 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 74D4194024A; Mon, 17 Jun 2019 10:27:03 +0200 (CEST)
Date:   Mon, 17 Jun 2019 10:27:03 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH 0/4] Enhance Thermal support
Message-ID: <20190617082703.kf3pw5u7ndnrixut@verge.net.au>
References: <1560349255-26336-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1560349255-26336-1-git-send-email-biju.das@bp.renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

+ Niklas

On Wed, Jun 12, 2019 at 03:20:51PM +0100, Biju Das wrote:
> This series aims to enhance thermal support by adding cpu-map,
> capacity-dmips-mhz,thermal zone to support IPA and also adding 
> dynamic power coefficients.
> 
> For CPU capacity-dmips-mhz calculation
> -------------------------------------
> dhrystone cross complied using the command [1].
> [1] $CC -O3 -DTIME -fno-inline -fno-builtin-printf -Wno-implicit -march=armv8-a dhry_1.c dhry_2.c -o exe-dry
> 
> dhrystone is executed(with a loop value of 80000000) and took the average value for 5 iterations
> of CA57 and CA53.
> 
> IPA testing
> ----------
> 
> 1)Enable THERMAL_WRITABLE_TRIPS and THERMAL_STATISTICS in kernel
> 
> 2) Check the current  temperature(36.5 C) and check the cooling stats on device0 and device 1
> 
> Execute the below applications on an ssh session
> 
> 3) while true; do touch pic-`date +%s`.jpg;done &  will give almost 0.5 C jump on each instance
> 
> 4) Executing dhrystone will give 3-4 C jump(runs through the benchmark: 800000000)
> 
> 5) Now the current temperature is around 46.0 C and there is no change in cooling stats on device0 and device 1
> 
> 6) Now change the passive trip temperature to 42 C, At this time CPUFreq started kicking in trying to limit the temperature, which you can see through the cooling stats on device0 and device1. You can see the system trying to maintain the temperature around 42 C.
> 
> 7)  Without changing the load, Now change  the passive trip temperature to 100 C, the temperature rises back to 46 C again.

...

Thanks,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

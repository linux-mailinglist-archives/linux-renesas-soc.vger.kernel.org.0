Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B69531D9400
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2020 12:05:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726412AbgESKF7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 May 2020 06:05:59 -0400
Received: from foss.arm.com ([217.140.110.172]:58168 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726333AbgESKF6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 May 2020 06:05:58 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 233C5101E;
        Tue, 19 May 2020 03:05:58 -0700 (PDT)
Received: from [192.168.2.22] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C375C3F305;
        Tue, 19 May 2020 03:05:56 -0700 (PDT)
Subject: Re: [PATCH] ARM: dts: r9a06g032: Correct GIC compatible value order
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
References: <20200519095431.5650-1-geert+renesas@glider.be>
From:   =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>
Organization: ARM Ltd.
Message-ID: <4e85d185-c982-1520-82f5-684ee66d7af3@arm.com>
Date:   Tue, 19 May 2020 11:05:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200519095431.5650-1-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 19/05/2020 10:54, Geert Uytterhoeven wrote:
> According to commit 61efb56e30f1c54e ("dt-bindings: arm: gic: Allow
> combining arm,gic-400 compatible strings"), "arm,gic-400" should be
> listed first.

Thanks for taking care!

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
> Aforementioned commit is in robh/for-next.
> ---
>  arch/arm/boot/dts/r9a06g032.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/r9a06g032.dtsi b/arch/arm/boot/dts/r9a06g032.dtsi
> index 4c1ab49c7d39aeed..ee59cc84f2121488 100644
> --- a/arch/arm/boot/dts/r9a06g032.dtsi
> +++ b/arch/arm/boot/dts/r9a06g032.dtsi
> @@ -174,7 +174,7 @@
>  		};
>  
>  		gic: interrupt-controller@44101000 {
> -			compatible = "arm,cortex-a7-gic", "arm,gic-400";
> +			compatible = "arm,gic-400", "arm,cortex-a7-gic";
>  			interrupt-controller;
>  			#interrupt-cells = <3>;
>  			reg = <0x44101000 0x1000>, /* Distributer */
> 


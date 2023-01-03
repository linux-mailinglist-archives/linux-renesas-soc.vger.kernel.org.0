Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59EE065C33B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Jan 2023 16:45:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237814AbjACPpP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Jan 2023 10:45:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233299AbjACPpN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Jan 2023 10:45:13 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDA5911C22;
        Tue,  3 Jan 2023 07:45:12 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id B881785569;
        Tue,  3 Jan 2023 16:45:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1672760711;
        bh=Ny4n0JEVF8y3jagsgv6Gt81L9Gok9NESzZwAFZRsUlc=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=BL9x05ZvWcIsIkBbAM47qtqp6/l0P/ouM5+8krCAWqakSIu7t5+WgHIlqNBP1DTz0
         ujRQLszhk5a3LrnBl3i8YMvIN4xTkoYfUaB82GKEF3GZRz+6mh5Zrg3lseM8GuJz8Y
         Go2stngw3xjg1AJTcpgwFbRZfeg42lKTwmK4SEzSwrripW29HpWh1A10pq7JEgHR64
         z5dtds3K6LeXYuQqSK1qKiynje4VebdqSwhKGfbLQAtAEdpj1q8zE0vS+y5I/1aVik
         oKb4kTOJgfwUVqSdH8tbszVn/MxSSYDG0P5xBOTfVZXX5nXk9TSs5g8tH1XCmvCja4
         dy5WiKpmrG+mA==
Message-ID: <8e9cc8fa-cddc-3c99-9810-f2355a1e1913@denx.de>
Date:   Tue, 3 Jan 2023 15:31:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 3/4] clk: rs9: Support device specific dif bit calculation
Content-Language: en-US
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230103123154.3424817-1-alexander.stein@ew.tq-group.com>
 <20230103123154.3424817-3-alexander.stein@ew.tq-group.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20230103123154.3424817-3-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 1/3/23 13:31, Alexander Stein wrote:
> The calculation DIFx is BIT(n) +1 is only true for 9FGV0241. With
> additional devices this is getting more complicated.
> Support a base bit for the DIF calculation, currently only devices
> with consecutive bits are supported, e.g. the 6-channel device needs
> additional logic.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>   drivers/clk/clk-renesas-pcie.c | 29 ++++++++++++++++-------------
>   1 file changed, 16 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
> index 0076ed8f11b0..d19b8e759eea 100644
> --- a/drivers/clk/clk-renesas-pcie.c
> +++ b/drivers/clk/clk-renesas-pcie.c
> @@ -18,7 +18,6 @@
>   #include <linux/regmap.h>
>   
>   #define RS9_REG_OE				0x0
> -#define RS9_REG_OE_DIF_OE(n)			BIT((n) + 1)
>   #define RS9_REG_SS				0x1
>   #define RS9_REG_SS_AMP_0V6			0x0
>   #define RS9_REG_SS_AMP_0V7			0x1
> @@ -31,9 +30,6 @@
>   #define RS9_REG_SS_SSC_MASK			(3 << 3)
>   #define RS9_REG_SS_SSC_LOCK			BIT(5)
>   #define RS9_REG_SR				0x2
> -#define RS9_REG_SR_2V0_DIF(n)			0
> -#define RS9_REG_SR_3V0_DIF(n)			BIT((n) + 1)
> -#define RS9_REG_SR_DIF_MASK(n)		BIT((n) + 1)
>   #define RS9_REG_REF				0x3
>   #define RS9_REG_REF_OE				BIT(4)
>   #define RS9_REG_REF_OD				BIT(5)
> @@ -62,6 +58,7 @@ struct rs9_chip_info {
>   	const enum rs9_model	model;
>   	unsigned int		num_clks;
>   	u8			did;
> +	u8			(*calc_dif)(int idx);
>   };
>   
>   struct rs9_driver_data {
> @@ -160,8 +157,14 @@ static const struct regmap_config rs9_regmap_config = {
>   	.reg_read = rs9_regmap_i2c_read,
>   };
>   
> +static u8 rs9fgv0241_calc_dif(int idx)
> +{
> +	return BIT(idx) + 1;

Can't we just do

if (model == ...)
  return BIT(idx) + 1
else if (model == ...)
  return BIT(idx);
...

?

[...]

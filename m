Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A981665C339
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Jan 2023 16:45:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237687AbjACPpO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Jan 2023 10:45:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233348AbjACPpN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Jan 2023 10:45:13 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71A2411C10;
        Tue,  3 Jan 2023 07:45:12 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 1B56D8556B;
        Tue,  3 Jan 2023 16:45:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1672760709;
        bh=7iNJcgcDAh7Ls4Cwi/5Xh89LG1+kct/Np5PWKTrZQZc=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=L8AFUajdHQQmMdtM7NEqO3SpeBYw4Bn7tcdMJoVMIJmCyEVgwF4hGA7RCYum9y5mM
         CYpDTPjolWXeMIpGiMnmqTbFsvrpVrRmvUTcqF5WCYCuhdhhVCL8Krolq+DmZO+gSZ
         8mhrWIC6hvyiNXfIfpxNZWmx3FdX22H79BQRAyfp89w1rdQesE+2zZjOkffqAUARwx
         MFmpPN/F3NEqTtTjYCdCROnBb+e/oRebwGCK72ToapRXlSUSdLIEzAT5/Dd+01f6sV
         1oBV5rO/Ge3woRpgt4k5oOONXYGdZOkmBdU5d7cCmo5Qjfh18YjQt9CjVO/rgpo2wz
         MfjYKuTUISwfQ==
Message-ID: <2ba4e002-9f27-2e36-2bd2-8753c455b21f@denx.de>
Date:   Tue, 3 Jan 2023 15:28:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/4] clk: rs9: Check for vendor/device ID
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230103123154.3424817-1-alexander.stein@ew.tq-group.com>
Content-Language: en-US
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20230103123154.3424817-1-alexander.stein@ew.tq-group.com>
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
> This is in preparation to support additional devices which have different
> IDs as well as a slightly different register layout.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>   drivers/clk/clk-renesas-pcie.c | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
> index e6247141d0c0..0076ed8f11b0 100644
> --- a/drivers/clk/clk-renesas-pcie.c
> +++ b/drivers/clk/clk-renesas-pcie.c
> @@ -45,6 +45,13 @@
>   #define RS9_REG_DID				0x6
>   #define RS9_REG_BCP				0x7
>   
> +#define RS9_REG_VID_IDT				0x01
> +
> +#define RS9_REG_DID_TYPE_FGV			(0x0 << RS9_REG_DID_TYPE_SHIFT)
> +#define RS9_REG_DID_TYPE_DBV			(0x1 << RS9_REG_DID_TYPE_SHIFT)
> +#define RS9_REG_DID_TYPE_DMV			(0x2 << RS9_REG_DID_TYPE_SHIFT)

I'm not entirely sure whether this shouldn't be using the BIT() macro, 
what do you think ?

> +#define RS9_REG_DID_TYPE_SHIFT			0x6
> +
>   /* Supported Renesas 9-series models. */
>   enum rs9_model {
>   	RENESAS_9FGV0241,
> @@ -54,6 +61,7 @@ enum rs9_model {
>   struct rs9_chip_info {
>   	const enum rs9_model	model;
>   	unsigned int		num_clks;
> +	u8			did;

Should this be const (and also the num_clks) ?

>   };
>   
>   struct rs9_driver_data {
> @@ -270,6 +278,7 @@ static int rs9_probe(struct i2c_client *client)
>   {
>   	unsigned char name[5] = "DIF0";
>   	struct rs9_driver_data *rs9;
> +	unsigned int vid, did;
>   	struct clk_hw *hw;
>   	int i, ret;
>   
> @@ -306,6 +315,20 @@ static int rs9_probe(struct i2c_client *client)
>   	if (ret < 0)
>   		return ret;
>   
> +	ret = regmap_read(rs9->regmap, RS9_REG_VID, &vid);
> +	if (ret < 0)
> +		return ret;

Newline here.

> +	ret = regmap_read(rs9->regmap, RS9_REG_DID, &did);
> +	if (ret < 0)
> +		return ret;
> +
> +	if ((vid != RS9_REG_VID_IDT) || (did != rs9->chip_info->did)) {

Drop the unnecessary inner () parenthesis .

> +		dev_err(&client->dev,

return dev_err_probe() might work better here ?

> +			"Incorrect VID/DID: %#02x, %#02x. Expected %#02x, %#02x\n",
> +			vid, did, RS9_REG_VID_IDT, rs9->chip_info->did);
> +		return -ENODEV;
> +	}

[...]

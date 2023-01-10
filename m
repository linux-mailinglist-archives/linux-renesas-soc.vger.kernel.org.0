Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B60D663FE8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jan 2023 13:08:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230433AbjAJMIY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Jan 2023 07:08:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238341AbjAJMHm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Jan 2023 07:07:42 -0500
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B357C8461F;
        Tue, 10 Jan 2023 04:05:19 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 09119852A1;
        Tue, 10 Jan 2023 13:04:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1673352292;
        bh=OmQu4t+nnptTG8yDn6d8Y1ycRLKO4lJQCVlmZo011fw=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=vxhNGvU9dDYD1dQbIW4qCCFH5qd7pBBUvXLXX4iEQSYk+fp+wKGhyIEZFg7bdtS2q
         LvdiylMhUHx8C9D9i/8stekIWl91rCojUSwnCvqCSEJWd1Ww2GL06gLyyZU3DOn/ZI
         RhZY4jGiJYS61eqZxupPcNVe60wStyzeYDNaRklrWCcU2vHgugb56/+9swxdTvtKuV
         sXBfa+3ZzxIAL6H6+LAwF1b3PC2R8pTathqLx67Sq+Mo7fPg3pyDI7hEKvqWpHwMDe
         KvousQ5FZVeQ1V9oUPmncvjuDuzXKCJToBDgYs4UYygrM9Oz0LGmn/Y3pmCSLQs1xn
         XTrXPvHSsEV8A==
Message-ID: <54e39604-088d-da4e-2779-4a635995db17@denx.de>
Date:   Tue, 10 Jan 2023 11:31:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 3/4] clk: rs9: Support device specific dif bit
 calculation
Content-Language: en-US
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230110100003.370917-1-alexander.stein@ew.tq-group.com>
 <20230110100003.370917-3-alexander.stein@ew.tq-group.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20230110100003.370917-3-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 1/10/23 11:00, Alexander Stein wrote:

[...]

>   static int rs9_get_output_config(struct rs9_driver_data *rs9, int idx)
>   {
>   	struct i2c_client *client = rs9->client;
> +	u8 dif = rs9_calc_dif(rs9, idx);
>   	unsigned char name[5] = "DIF0";
>   	struct device_node *np;
>   	int ret;
>   	u32 sr;
>   
>   	/* Set defaults */
> -	rs9->clk_dif_sr &= ~RS9_REG_SR_DIF_MASK(idx);

Are you sure this line ^ should be dropped ?
Shouldn't the bitfield be cleared first and modified second?

> -	rs9->clk_dif_sr |= RS9_REG_SR_3V0_DIF(idx);
> +	rs9->clk_dif_sr |= dif;
>   
>   	snprintf(name, 5, "DIF%d", idx);
>   	np = of_get_child_by_name(client->dev.of_node, name);

[...]

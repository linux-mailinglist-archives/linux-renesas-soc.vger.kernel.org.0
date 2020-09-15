Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D536F26A0BB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Sep 2020 10:24:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726429AbgIOIYr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Sep 2020 04:24:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726304AbgIOIYq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Sep 2020 04:24:46 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFEF0C06174A
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Sep 2020 01:24:44 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id n25so2033406ljj.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Sep 2020 01:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=04+SE6DYrBlKTgL/+azRsRd7o4aQd++kuLT20my0bbI=;
        b=Umw4mU2DPY2yDcDM2uD8RbZcGwOTYC/e67NfWFWR9W+p2M16ce8Rw3e+fVg2HVsrAQ
         NnPLCdUZoD9aFENc3r8vgu34zEyoCPJOEnVPdFmnjaZDVMj7eZLLn4pvOrfR8cEzoY19
         DSVKCZwy8ta8tUHlyVT9Jh4ZGKL1NXChGDM1H53biTPVo5g129yYSCRaprKk6yIBpRdX
         KieiQQxyLbC/6257iSsn6Ost7+wzXhIUaj6SmJVRrZrArVnZTYJBVoqkfFI7VyU35GhI
         t0sEvUagQ2MPYfEM0C2V/MFG+W4E4iRgcpLdAWPoUEOz83jvnF4EoNma2I2MeXOzn+f9
         0nlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=04+SE6DYrBlKTgL/+azRsRd7o4aQd++kuLT20my0bbI=;
        b=hSLjwTVHpoH0p7CB9UgPXnGj9Vp9TLrIhOtJc8JHJ/etPNyic3tsymwP3Kv22Axuq6
         sgDBVCeenCR5JAmvkAVRAIPfRylazPlepXJRT4n9HfMolxOkIz2UXbpWH/7dNNDywnUD
         miQxCA11xKn43cTgMrTEv1KaLNUTx2mA9tD5FcaQghGTDXrZW7DHTJASQYJEtEDYxf4j
         f9NFVeUVxLZJyPEVjgGjy3uvM2GrHh70/0K0MDHkymi3rSr/uZNXkA0uAZcEYhVLq+cd
         phe2F2dS/HD8nSlhrkcqrdl2YT24D669sbT2fVDGH5T0HjAY/BSCuu2MacX8FWMFhRsz
         zFig==
X-Gm-Message-State: AOAM5319OFujIwvknfhPUNqhyvrKi0ft+vU3VfDdE082UUckAeNyjhJ8
        liot4PZQ3GqCl4hbzYDLCMw=
X-Google-Smtp-Source: ABdhPJxjWffeKxDGgLRDTAf77gCQBOH1VUWMQ0nAXRfS5QOX9gtEYf+ZGBb+Boy0FLIGJxSDhjHsbA==
X-Received: by 2002:a2e:8884:: with SMTP id k4mr4651661lji.333.1600158283223;
        Tue, 15 Sep 2020 01:24:43 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:4246:524b:f990:5ce8:4590:941a? ([2a00:1fa0:4246:524b:f990:5ce8:4590:941a])
        by smtp.gmail.com with ESMTPSA id y9sm3853472lfg.293.2020.09.15.01.24.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2020 01:24:42 -0700 (PDT)
Subject: Re: [PATCH 2/4] pinctrl: sh-pfc: r8a7796: Add VIN pins, groups and
 functions
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
References: <20200914233744.468175-1-niklas.soderlund+renesas@ragnatech.se>
 <20200914233744.468175-3-niklas.soderlund+renesas@ragnatech.se>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <1eae4913-49c1-8843-65b6-dcc102202f43@gmail.com>
Date:   Tue, 15 Sep 2020 11:24:38 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200914233744.468175-3-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 15.09.2020 2:37, Niklas Söderlund wrote:

> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> 
> This patch adds VIN{4,5} pins, groups and functions to the R8A7796 SoC.

    Same question on the subject/changelog here...

> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> [Niklas: Rework to fit upstream driver]
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>   drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
> index a2496baca85d23f8..a50beb81a342f636 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
> @@ -4048,6 +4048,18 @@ static const union vin_data vin4_data_b_mux = {
>   		VI4_DATA22_MARK, VI4_DATA23_MARK,
>   	},
>   };
> +static const unsigned int vin4_data8_sft8_pins[] = {
> +	RCAR_GP_PIN(1, 0),  RCAR_GP_PIN(1, 1),
> +	RCAR_GP_PIN(1, 2),  RCAR_GP_PIN(1, 3),
> +	RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
> +	RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 7),
> +};
> +static const unsigned int vin4_data8_sft8_mux[] = {
> +	VI4_DATA8_MARK,  VI4_DATA9_MARK,
> +	VI4_DATA10_MARK, VI4_DATA11_MARK,
> +	VI4_DATA12_MARK, VI4_DATA13_MARK,
> +	VI4_DATA14_MARK, VI4_DATA15_MARK,
> +};
>   static const unsigned int vin4_sync_pins[] = {
>   	/* HSYNC#, VSYNC# */
>   	RCAR_GP_PIN(1, 18), RCAR_GP_PIN(1, 17),
> @@ -4102,6 +4114,18 @@ static const union vin_data16 vin5_data_mux = {
>   		VI5_DATA14_MARK, VI5_DATA15_MARK,
>   	},
>   };
> +static const unsigned int vin5_data8_sft8_pins[] = {
> +	RCAR_GP_PIN(1, 12), RCAR_GP_PIN(1, 13),
> +	RCAR_GP_PIN(1, 14), RCAR_GP_PIN(1, 15),
> +	RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
> +	RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 7),
> +};
> +static const unsigned int vin5_data8_sft8_mux[] = {
> +	VI5_DATA8_MARK,  VI5_DATA9_MARK,
> +	VI5_DATA10_MARK, VI5_DATA11_MARK,
> +	VI5_DATA12_MARK, VI5_DATA13_MARK,
> +	VI5_DATA14_MARK, VI5_DATA15_MARK,
> +};
>   static const unsigned int vin5_sync_pins[] = {
>   	/* HSYNC#, VSYNC# */
>   	RCAR_GP_PIN(1, 10), RCAR_GP_PIN(1, 9),
> @@ -4440,6 +4464,7 @@ static const struct {
>   		SH_PFC_PIN_GROUP(vin4_data18_b),
>   		VIN_DATA_PIN_GROUP(vin4_data, 20, _b),
>   		VIN_DATA_PIN_GROUP(vin4_data, 24, _b),
> +		SH_PFC_PIN_GROUP(vin4_data8_sft8),
>   		SH_PFC_PIN_GROUP(vin4_sync),
>   		SH_PFC_PIN_GROUP(vin4_field),
>   		SH_PFC_PIN_GROUP(vin4_clkenb),
> @@ -4448,6 +4473,7 @@ static const struct {
>   		VIN_DATA_PIN_GROUP(vin5_data, 10),
>   		VIN_DATA_PIN_GROUP(vin5_data, 12),
>   		VIN_DATA_PIN_GROUP(vin5_data, 16),
> +		SH_PFC_PIN_GROUP(vin5_data8_sft8),
>   		SH_PFC_PIN_GROUP(vin5_sync),
>   		SH_PFC_PIN_GROUP(vin5_field),
>   		SH_PFC_PIN_GROUP(vin5_clkenb),
> @@ -4978,6 +5004,7 @@ static const char * const vin4_groups[] = {
>   	"vin4_data18_b",
>   	"vin4_data20_b",
>   	"vin4_data24_b",
> +	"vin4_data8_sft8",
>   	"vin4_sync",
>   	"vin4_field",
>   	"vin4_clkenb",
> @@ -4989,6 +5016,7 @@ static const char * const vin5_groups[] = {
>   	"vin5_data10",
>   	"vin5_data12",
>   	"vin5_data16",
> +	"vin5_data8_sft8",
>   	"vin5_sync",
>   	"vin5_field",
>   	"vin5_clkenb",

MBR, Sergei

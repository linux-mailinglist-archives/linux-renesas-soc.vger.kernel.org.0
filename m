Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9D0526A0A4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Sep 2020 10:23:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726178AbgIOIXU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Sep 2020 04:23:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726401AbgIOIXI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Sep 2020 04:23:08 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 351CFC06174A
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Sep 2020 01:23:07 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id c2so1977968ljj.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Sep 2020 01:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ITLlVL6ZAQBt8+1vlUY6J35VLvg6u1DnlcyDLN0SYmk=;
        b=ZXLe2dlJPj5nLQNgmjtmg6alTLgT76UlSnrkW1Hv0fbbmpNNaX3MhQJd9XYWfxXk9N
         9fNQWlK0TcZjMmK5G1d9boBH+ruJoRPP2oRZYhBmCC+jsJ3yk0MdvCRLYmLb/3lKY6n0
         M+RTsGXj+PmH/5OktJFmuY9i5wQSX+b83fTR5/MCxNZr5U46M5m7h0Oux8rB/vsfJ2pU
         Nw6L+i/jXnyOdMN4VYStR20JDqMvIks7oix0m0iTYeBr58an+MvPXeah3xE/mOzqCgTm
         6nIsm6p7f9ZOM4ved1loLD2XI7d9u5KISPV5SvpyrcEVPAvDSmjWjE/OTDjPrmrTcAkf
         FfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ITLlVL6ZAQBt8+1vlUY6J35VLvg6u1DnlcyDLN0SYmk=;
        b=RXI3hFNbX2/ojXGfbTZnJG+aMO6rWZA0PzWhlJwMy6CBrXRHnpoZ0/vnJRukbZm6a8
         n1r5ytGpWCeFfBSHfQXitwJGXlCOI3e6kgDAhjhY9KDq9fjzsUQIrPU9dmld13w/ti8W
         GRVG59lKMbx0UtRgvQZVfmXZxcoolhqbiGqTkiQOgYkDDAXMuL7UcWBcGEyzlT1bUysY
         2/dhkI8g3whrUu3B6LshTVMrmO6J0NEd6JzJ22byZO9dLl/qM7xe2giYVOyAi8xyULhL
         cOuxcMtfkYJDiVhgppQyUbH99N7yqCV770VwH/05A5Ost/0MNLaEHvZJZKS63WqFgW91
         JttA==
X-Gm-Message-State: AOAM532wBwFfPN7OvWSqUJbhfutzyxV6Ce43lBH4nyRUfQNW0HEAsddj
        t9O2qM7+2GWfWgUvEMqGvAM=
X-Google-Smtp-Source: ABdhPJwdWRqQFkEpF+T2CXSTqmNejQusopYYWaWjLJBAkt9iHEW4OU53S4osC6/JBF2Lgqq7mW2bCw==
X-Received: by 2002:a05:651c:1253:: with SMTP id h19mr5943686ljh.55.1600158185700;
        Tue, 15 Sep 2020 01:23:05 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:4246:524b:f990:5ce8:4590:941a? ([2a00:1fa0:4246:524b:f990:5ce8:4590:941a])
        by smtp.gmail.com with ESMTPSA id x14sm4147114lfc.93.2020.09.15.01.23.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2020 01:23:05 -0700 (PDT)
Subject: Re: [PATCH 1/4] pinctrl: sh-pfc: r8a77951: Add VIN pins, groups and
 functions
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
References: <20200914233744.468175-1-niklas.soderlund+renesas@ragnatech.se>
 <20200914233744.468175-2-niklas.soderlund+renesas@ragnatech.se>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <329605c4-99fe-da88-1b3a-a0f991dbb3d4@gmail.com>
Date:   Tue, 15 Sep 2020 11:23:01 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200914233744.468175-2-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 15.09.2020 2:37, Niklas Söderlund wrote:

> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

    Re: subject -- you seem to be only adding the SFT8 pins/groups/funcs...

> This patch adds VIN{4,5} pins, groups and functions to the R8A77951 SoC.
> 
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> [Niklas: Rework to fit upstream driver]
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>   drivers/pinctrl/sh-pfc/pfc-r8a77951.c | 28 +++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77951.c b/drivers/pinctrl/sh-pfc/pfc-r8a77951.c
> index a94ebe0bf5d06127..afba52ae92009f17 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a77951.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77951.c
> @@ -4074,6 +4074,18 @@ static const union vin_data vin4_data_b_mux = {
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
> @@ -4128,6 +4140,18 @@ static const union vin_data16 vin5_data_mux = {
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
> @@ -4470,6 +4494,7 @@ static const struct {
>   		SH_PFC_PIN_GROUP(vin4_data18_b),
>   		VIN_DATA_PIN_GROUP(vin4_data, 20, _b),
>   		VIN_DATA_PIN_GROUP(vin4_data, 24, _b),
> +		SH_PFC_PIN_GROUP(vin4_data8_sft8),
>   		SH_PFC_PIN_GROUP(vin4_sync),
>   		SH_PFC_PIN_GROUP(vin4_field),
>   		SH_PFC_PIN_GROUP(vin4_clkenb),
> @@ -4478,6 +4503,7 @@ static const struct {
>   		VIN_DATA_PIN_GROUP(vin5_data, 10),
>   		VIN_DATA_PIN_GROUP(vin5_data, 12),
>   		VIN_DATA_PIN_GROUP(vin5_data, 16),
> +		SH_PFC_PIN_GROUP(vin5_data8_sft8),
>   		SH_PFC_PIN_GROUP(vin5_sync),
>   		SH_PFC_PIN_GROUP(vin5_field),
>   		SH_PFC_PIN_GROUP(vin5_clkenb),
> @@ -5022,6 +5048,7 @@ static const char * const vin4_groups[] = {
>   	"vin4_data18_b",
>   	"vin4_data20_b",
>   	"vin4_data24_b",
> +	"vin4_data8_sft8",
>   	"vin4_sync",
>   	"vin4_field",
>   	"vin4_clkenb",
> @@ -5033,6 +5060,7 @@ static const char * const vin5_groups[] = {
>   	"vin5_data10",
>   	"vin5_data12",
>   	"vin5_data16",
> +	"vin5_data8_sft8",
>   	"vin5_sync",
>   	"vin5_field",
>   	"vin5_clkenb",

MBR, Sergei

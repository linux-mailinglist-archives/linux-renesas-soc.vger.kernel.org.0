Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2167789342
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 26 Aug 2023 04:07:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229680AbjHZCHB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Aug 2023 22:07:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231713AbjHZCGv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Aug 2023 22:06:51 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDCED213A;
        Fri, 25 Aug 2023 19:06:49 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-68a42d06d02so1226912b3a.0;
        Fri, 25 Aug 2023 19:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693015609; x=1693620409;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Ta/EOi6UFLlOfG2+ecNotJJ63Mrja0RNYsrUoK82Jo=;
        b=C/MwbmfFx5rgxh0Gzz4PkbcFIr+K1+2w+8V30hedB/nU8wJOiZDf09p43RblcqF8+x
         CTlUs7FBI4KKxuhqJivmNmdd+/LOuqD3mi/yuNPmNtBp+mvY0J26dzksXu5bhEwZUuo6
         IMRXceemkAOuPHchwIppPnHem48UfvmvFw+5cqEKrmrkVYwWaLSx8lJo8+5vNnyoieOl
         Es+Hks+G4vuJRzYKHgx0AV+s99l6OMhyb7rgg3fz8Zd6YVNziVNjiD2HZSg3BzZuAn7l
         CgsDe6+3Q+Dm6vIZl9byKcQCUt2QFoPHpEkilzQSex5zeusZtuCgo/6bNzGRwssezK9E
         A6iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693015609; x=1693620409;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Ta/EOi6UFLlOfG2+ecNotJJ63Mrja0RNYsrUoK82Jo=;
        b=iPldBXn7yJR/ykJYyfH4eTMbPFnHdfpqa8gE3WZLUnHwBgG5FYOGic+F7gwuADbJ0L
         z+Bb4o7WDcGl/25Tkhi3wjcS2cFrfRfchuhwzGe8JNxEPTM1SNy8LOqALt/Taq5n7v2S
         fJbWZhB498+Em2f5KOEkQm0e51W49VekswoFgSGJ+rBS/1T0SmKwsc972J/y+7J0TvyA
         Y6890VZO+BpDjBeyVTZctDU+UjZR4aP8Mo8veb0aQk3EQO3hFfQR2CpD5z11LTgIrZUZ
         1f30XU3ATjXSEl6bQF5W+uR9INYoAH2Wet361WK0Ma6TyfQPhXXB1A1KKtSb1iDUHVcc
         A/9A==
X-Gm-Message-State: AOJu0YyaVP8NBQ6bk1WYYwf2oS08A77lhjkgh2VDC8ruCuhc8EAMLmPl
        xOGpV7ZMsAqKzmXnC3vpMBNwBq4fK9s=
X-Google-Smtp-Source: AGHT+IF+tRbUkciaGwGLsTfMmKMQ6fdPynaaFV1aXZj0NMaUx394mRBrkinLh1E45aZ+1faqnQ+fEg==
X-Received: by 2002:a05:6a00:b89:b0:68a:2e50:d7f1 with SMTP id g9-20020a056a000b8900b0068a2e50d7f1mr20884045pfj.4.1693015609062;
        Fri, 25 Aug 2023 19:06:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i190-20020a636dc7000000b0056c2f1a2f6bsm2342782pgc.41.2023.08.25.19.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 19:06:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 25 Aug 2023 19:06:47 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Eric Tremblay <etremblay@distech-controls.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 2/3] hwmon: tmp513: Drop enum tmp51x_ids and variable
 id from struct tmp51x_data
Message-ID: <5d7b4ef3-1331-4e34-97c3-4c6832e215fc@roeck-us.net>
References: <20230825205345.632792-1-biju.das.jz@bp.renesas.com>
 <20230825205345.632792-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230825205345.632792-3-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Aug 25, 2023 at 09:53:44PM +0100, Biju Das wrote:
> Drop variable id from struct tmp51x_data and enum tmp51x_ids as all the
> hw differences can be handled by max_channels.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Updated the macro TMP51X_TEMP_CONFIG_DEFAULT by adding bit definitions.
>  * Dropped unused macros TMP51{2,3}_TEMP_CONFIG_DEFAULT.
> ---
>  drivers/hwmon/tmp513.c | 38 +++++++++++++++++++++-----------------
>  1 file changed, 21 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/hwmon/tmp513.c b/drivers/hwmon/tmp513.c
> index 99f66f9d5f19..6bbae4735a4b 100644
> --- a/drivers/hwmon/tmp513.c
> +++ b/drivers/hwmon/tmp513.c
> @@ -19,6 +19,7 @@
>   * the Free Software Foundation; version 2 of the License.
>   */
>  
> +#include <linux/bitfield.h>
>  #include <linux/err.h>
>  #include <linux/hwmon.h>
>  #include <linux/i2c.h>
> @@ -73,9 +74,6 @@
>  #define TMP51X_PGA_DEFAULT		8
>  #define TMP51X_MAX_REGISTER_ADDR	0xFF
>  
> -#define TMP512_TEMP_CONFIG_DEFAULT	0xBF80
> -#define TMP513_TEMP_CONFIG_DEFAULT	0xFF80
> -
>  // Mask and shift
>  #define CURRENT_SENSE_VOLTAGE_320_MASK	0x1800
>  #define CURRENT_SENSE_VOLTAGE_160_MASK	0x1000
> @@ -116,6 +114,22 @@
>  #define TMP512_MAX_CHANNELS		3
>  #define TMP513_MAX_CHANNELS		4
>  
> +#define TMP51X_TEMP_CONFIG_GPM_MASK	BIT(2)
> +#define TMP51X_TEMP_CONFIG_RC_MASK	BIT(10)
> +#define TMP51X_TEMP_CONFIG_CONT_MASK	BIT(15)
> +
> +#define TMP51X_TEMP_CONFIG_GPM		FIELD_PREP(GENMASK(1, 0), 0)
> +#define TMP51X_TEMP_CONFIG_GP		FIELD_PREP(TMP51X_TEMP_CONFIG_GPM_MASK, 0)
> +#define TMP51X_TEMP_CONFIG_CONV_RATE	FIELD_PREP(GENMASK(9, 7), 0x7)
> +#define TMP51X_TEMP_CONFIG_RC		FIELD_PREP(TMP51X_TEMP_CONFIG_RC_MASK, 1)
> +#define TMP51X_TEMP_CHANNEL_MASK(n)	FIELD_PREP(GENMASK(14, 11), GENMASK(n, 0) > 1)
> +#define TMP51X_TEMP_CONFIG_CONT		FIELD_PREP(TMP51X_TEMP_CONFIG_CONT_MASK, 1)
> +
> +#define TMP51X_TEMP_CONFIG_DEFAULT(n) \
> +			(TMP51X_TEMP_CONFIG_GPM | TMP51X_TEMP_CONFIG_GP | \
> +			 TMP51X_TEMP_CONFIG_CONV_RATE | TMP51X_TEMP_CONFIG_RC | \
> +			 TMP51X_TEMP_CHANNEL_MASK(n) | TMP51X_TEMP_CONFIG_CONT)
> +
>  static const u8 TMP51X_TEMP_INPUT[4] = {
>  	TMP51X_LOCAL_TEMP_RESULT,
>  	TMP51X_REMOTE_TEMP_RESULT_1,
> @@ -155,10 +169,6 @@ static struct regmap_config tmp51x_regmap_config = {
>  	.max_register = TMP51X_MAX_REGISTER_ADDR,
>  };
>  
> -enum tmp51x_ids {
> -	tmp512, tmp513
> -};
> -
>  struct tmp51x_data {
>  	u16 shunt_config;
>  	u16 pga_gain;
> @@ -172,7 +182,6 @@ struct tmp51x_data {
>  	u32 curr_lsb_ua;
>  	u32 pwr_lsb_uw;
>  
> -	enum tmp51x_ids id;
>  	u8 max_channels;
>  	struct regmap *regmap;
>  };
> @@ -589,7 +598,7 @@ static int tmp51x_init(struct tmp51x_data *data)
>  	if (ret < 0)
>  		return ret;
>  
> -	if (data->id == tmp513) {
> +	if (data->max_channels == TMP513_MAX_CHANNELS) {
>  		ret = regmap_write(data->regmap, TMP513_N_FACTOR_3,
>  				   data->nfactor[2] << 8);
>  		if (ret < 0)
> @@ -672,9 +681,9 @@ static int tmp51x_read_properties(struct device *dev, struct tmp51x_data *data)
>  		return ret;
>  
>  	ret = device_property_read_u32_array(dev, "ti,nfactor", nfactor,
> -					    (data->id == tmp513) ? 3 : 2);
> +					    data->max_channels - 1);
>  	if (ret >= 0)
> -		memcpy(data->nfactor, nfactor, (data->id == tmp513) ? 3 : 2);
> +		memcpy(data->nfactor, nfactor, data->max_channels - 1);
>  
>  	// Check if shunt value is compatible with pga-gain
>  	if (data->shunt_uohms > data->pga_gain * 40 * 1000 * 1000) {
> @@ -696,8 +705,7 @@ static void tmp51x_use_default(struct tmp51x_data *data)
>  static int tmp51x_configure(struct device *dev, struct tmp51x_data *data)
>  {
>  	data->shunt_config = TMP51X_SHUNT_CONFIG_DEFAULT;
> -	data->temp_config = (data->id == tmp513) ?
> -			TMP513_TEMP_CONFIG_DEFAULT : TMP512_TEMP_CONFIG_DEFAULT;
> +	data->temp_config = TMP51X_TEMP_CONFIG_DEFAULT(data->max_channels);
>  
>  	if (dev->of_node)
>  		return tmp51x_read_properties(dev, data);
> @@ -719,10 +727,6 @@ static int tmp51x_probe(struct i2c_client *client)
>  		return -ENOMEM;
>  
>  	data->max_channels = (uintptr_t)i2c_get_match_data(client);
> -	if (data->max_channels == TMP513_MAX_CHANNELS)
> -		data->id = tmp513;
> -	else
> -		data->id = tmp512;
>  

See, hat is exactly what I wanted to avoid: The code above was introduced
with the previous patch for the sole reason to be removed with this patch.
On top of that, you introduced a bogus "fix" in the previous patch which
doesn't fix anything and is at the very least misleading.

So, if I accept this series, I'll combine those two patches back together.
I just do not see the point of making things more complicated than necessary.
Sure, the rule is "one patch per logical change", but the logical change here
is to replace the chip id with the number of channels, not the introduction
of some variable.

Guenter

>  	ret = tmp51x_configure(dev, data);
>  	if (ret < 0) {
> -- 
> 2.25.1
> 

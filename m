Return-Path: <linux-renesas-soc+bounces-8793-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC40C96EBFE
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 09:31:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2121DB20E55
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 07:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1708414A4D1;
	Fri,  6 Sep 2024 07:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XrUTohjU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C900522087;
	Fri,  6 Sep 2024 07:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725607893; cv=none; b=t4iqgFgxjkwt7rXAhutNdjJ7XoVe22osl2NRh5XfjN9Emmm3BvlvbPlZ2aGyV4xngwTnBH2SqKozQaiUJ33l4f5ui1oEZRACA/nQGHfbsonL1CpZmvx0dFcjz/LjdxGz/tD83RfvYAZ0iowKy047iJM+Tz40p1CZNXZAxYsDkRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725607893; c=relaxed/simple;
	bh=bH+u1poiP8KymP8wCH/Oh2qSwEOx0LGtJlm+LlrCVUk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eUl8OXZEjb1HnLTa0w3S64vn7zMj2xBtvGwivIKQ67jhh8l6Wg64QE4jGhEJwMpRqbr/G2c+fZ2qnkLpM3OeHUjKUfsN4QDjvx3ah7PnDQCTyssv5oiVHOup/C8omc4dBgtCkIM0/o0l5TEfAVR+PwlRhUP2lgukVfjrX3XAhV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XrUTohjU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BBE6C4CEC4;
	Fri,  6 Sep 2024 07:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725607893;
	bh=bH+u1poiP8KymP8wCH/Oh2qSwEOx0LGtJlm+LlrCVUk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XrUTohjUlzNcyGv03yfeY6fSR7HlIStQGqu+b2oPNrPDxL16+i46Jgdwra+SOVSj4
	 69MAkn1aCGCqmarkcuItQ/Hxs7yVpPJARDBwo+oB1jBbGzZjNohr9fDczfNoq4Yjcr
	 9yAyuBL8ydyLG+4ogsnQSYil/1sVx3x2+vhT5U6aqnp3f8SVAhxlqjXz+NyQZjLfQv
	 q88UfmRpv9UAfyOQGPYE1aaJFVT1890hQRUkQyxOPREfbfPvO/q1ZL9PJN9iNAzzoy
	 otWyLO3UEy4FPW/uljYYBq6Vx6WrTwF4BF4KQUdD50NrQRU+zeY6iwy+/lfMt6kya0
	 xvnx1BRciVABQ==
Message-ID: <7e3af957-391a-4604-9cad-04e581761b3c@kernel.org>
Date: Fri, 6 Sep 2024 09:31:25 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] hwmon: (isl28022) support shunt voltage for
 ISL28022 power monitor
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz,
 =?UTF-8?Q?Carsten_Spie=C3=9F?= <mail@carsten-spiess.de>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20240906061421.9392-1-Delphine_CC_Chiu@wiwynn.com>
 <20240906061421.9392-4-Delphine_CC_Chiu@wiwynn.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240906061421.9392-4-Delphine_CC_Chiu@wiwynn.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/09/2024 08:14, Delphine CC Chiu wrote:
> Added support reading shunt voltage in mV and revise code
> for Renesas ISL28022.
> 
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> ---
>  drivers/hwmon/isl28022.c | 93 ++++++++++++++++++++++++++++------------
>  1 file changed, 66 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/hwmon/isl28022.c b/drivers/hwmon/isl28022.c
> index f0494c3bd483..01220fad813d 100644
> --- a/drivers/hwmon/isl28022.c
> +++ b/drivers/hwmon/isl28022.c
> @@ -85,8 +85,6 @@ struct isl28022_data {
>  	u32			shunt;
>  	u32			gain;
>  	u32			average;
> -	u16			config;
> -	u16			calib;
>  };
>  
>  static int isl28022_read(struct device *dev, enum hwmon_sensor_types type,
> @@ -95,20 +93,61 @@ static int isl28022_read(struct device *dev, enum hwmon_sensor_types type,
>  	struct isl28022_data *data = dev_get_drvdata(dev);
>  	unsigned int regval;
>  	int err;
> +	u16 sign_bit;
>  
>  	switch (type) {
>  	case hwmon_in:
> -		switch (attr) {
> -		case hwmon_in_input:
> -			err = regmap_read(data->regmap,
> -					  ISL28022_REG_BUS, &regval);
> -			if (err < 0)
> -				return err;
> -			/* driver supports only 60V mode (BRNG 11) */
> -			*val = (long)(((u16)regval) & 0xFFFC);
> +		switch (channel) {
> +		case 0:
> +			switch (attr) {
> +			case hwmon_in_input:
> +				err = regmap_read(data->regmap,
> +						  ISL28022_REG_BUS, &regval);
> +				if (err < 0)
> +					return err;
> +				/* driver supports only 60V mode (BRNG 11) */
> +				*val = (long)(((u16)regval) & 0xFFFC);
> +				break;
> +			default:
> +				return -EOPNOTSUPP;
> +			}
> +			break;
> +		case 1:
> +			switch (attr) {
> +			case hwmon_in_input:
> +				err = regmap_read(data->regmap,
> +						  ISL28022_REG_SHUNT, &regval);
> +				if (err < 0)
> +					return err;
> +			switch (data->gain) {
> +			case 8:
> +				sign_bit = (regval >> 15) & 0x01;
> +				*val = (long)((((u16)regval) & 0x7FFF) -
> +					   (sign_bit * 32768)) / 100;
> +				break;
> +			case 4:
> +				sign_bit = (regval >> 14) & 0x01;
> +				*val = (long)((((u16)regval) & 0x3FFF) -
> +					   (sign_bit * 16384)) / 100;
> +				break;
> +			case 2:
> +				sign_bit = (regval >> 13) & 0x01;
> +				*val = (long)((((u16)regval) & 0x1FFF) -
> +					   (sign_bit * 8192)) / 100;
> +				break;
> +			case 1:
> +				sign_bit = (regval >> 12) & 0x01;
> +				*val = (long)((((u16)regval) & 0x0FFF) -
> +					   (sign_bit * 4096)) / 100;
> +				break;
> +			}
> +			break;
> +			default:
> +				return -EOPNOTSUPP;
> +			}
>  			break;
>  		default:
> -			return -EINVAL;
> +			return -EOPNOTSUPP;
>  		}
>  		break;
>  	case hwmon_curr:
> @@ -122,7 +161,7 @@ static int isl28022_read(struct device *dev, enum hwmon_sensor_types type,
>  				(long)data->shunt;
>  			break;
>  		default:
> -			return -EINVAL;
> +			return -EOPNOTSUPP;
>  		}
>  		break;
>  	case hwmon_power:
> @@ -136,11 +175,11 @@ static int isl28022_read(struct device *dev, enum hwmon_sensor_types type,
>  				(long)data->shunt) * (long)regval;
>  			break;
>  		default:
> -			return -EINVAL;
> +			return -EOPNOTSUPP;
>  		}
>  		break;
>  	default:
> -		return -EINVAL;
> +		return -EOPNOTSUPP;
>  	}
>  
>  	return 0;
> @@ -182,7 +221,8 @@ static umode_t isl28022_is_visible(const void *data, enum hwmon_sensor_types typ
>  
>  static const struct hwmon_channel_info *isl28022_info[] = {
>  	HWMON_CHANNEL_INFO(in,
> -			   HWMON_I_INPUT),	/* channel 0: bus voltage (mV) */
> +			   HWMON_I_INPUT,	/* channel 0: bus voltage (mV) */
> +			   HWMON_I_INPUT),	/* channel 1: shunt voltage (mV) */
>  	HWMON_CHANNEL_INFO(curr,
>  			   HWMON_C_INPUT),	/* channel 1: current (mA) */
>  	HWMON_CHANNEL_INFO(power,
> @@ -368,24 +408,22 @@ static int isl28022_read_properties(struct device *dev, struct isl28022_data *da
>  static int isl28022_config(struct isl28022_data *data)
>  {
>  	int err;
> +	u16 config;
> +	u16 calib;
>  
> -	data->config = (ISL28022_MODE_CONT_SB << ISL28022_MODE_SHIFT) |
> +	config = (ISL28022_MODE_CONT_SB << ISL28022_MODE_SHIFT) |
>  			(ISL28022_BRNG_60 << ISL28022_BRNG_SHIFT) |
>  			(__ffs(data->gain) << ISL28022_PG_SHIFT) |
>  			((ISL28022_ADC_15_1 + __ffs(data->average)) << ISL28022_SADC_SHIFT) |
>  			((ISL28022_ADC_15_1 + __ffs(data->average)) << ISL28022_BADC_SHIFT);
>  
> -	data->calib = data->shunt ? 0x8000 / data->gain : 0;
> -
> -	err = regmap_write(data->regmap, ISL28022_REG_CONFIG, data->config);
> -	if (err < 0)
> -		return err;
> +	calib = data->shunt ? 0x8000 / data->gain : 0;
>  
> -	err = regmap_write(data->regmap, ISL28022_REG_CALIB, data->calib);
> +	err = regmap_write(data->regmap, ISL28022_REG_CONFIG, config);
>  	if (err < 0)
>  		return err;
>  
> -	return 0;
> +	return regmap_write(data->regmap, ISL28022_REG_CALIB, calib);
>  }
>  
>  static int isl28022_probe(struct i2c_client *client)
> @@ -396,8 +434,8 @@ static int isl28022_probe(struct i2c_client *client)
>  	int err;
>  
>  	if (!i2c_check_functionality(client->adapter,
> -				     I2C_FUNC_SMBUS_BYTE_DATA |
> -				     I2C_FUNC_SMBUS_WORD_DATA))
> +					 I2C_FUNC_SMBUS_BYTE_DATA |
> +					 I2C_FUNC_SMBUS_WORD_DATA))
>  		return -ENODEV;
>  
>  	data = devm_kzalloc(dev, sizeof(struct isl28022_data), GFP_KERNEL);
> @@ -418,7 +456,7 @@ static int isl28022_probe(struct i2c_client *client)
>  
>  	isl28022_debugfs_init(client, data);
>  
> -	hwmon_dev = devm_hwmon_device_register_with_info(dev, "isl28022_hwmon",
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
>  							 data, &isl28022_chip_info, NULL);
>  	if (IS_ERR(hwmon_dev))
>  		return PTR_ERR(hwmon_dev);
> @@ -437,8 +475,9 @@ static struct i2c_driver isl28022_driver = {
>  	.class		= I2C_CLASS_HWMON,
>  	.driver = {
>  		.name	= "isl28022",
> +		.of_match_table = of_match_ptr(isl28022_of_match),

This is both unrelated and wrong. Your of_match_ptr causes here warnings.

Organize your patchset in logical chunks and be sure EACH has no
warnings. Your patch #1 now has such warnings. Please run standard
kernel tools for static analysis, like coccinelle, smatch and sparse,
and fix reported warnings. Also please check for warnings when building
with W=1. Most of these commands (checks or W=1 build) can build
specific targets, like some directory, to narrow the scope to only your
code. The code here looks like it needs a fix. Feel free to get in touch
if the warning is not clear.

Best regards,
Krzysztof



Return-Path: <linux-renesas-soc+bounces-33212-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBecHuYAF2o70wcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33212-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 16:34:14 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C55035E5EF8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 16:34:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 792203042266
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 14:31:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AF133BE635;
	Wed, 27 May 2026 14:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VJWMqp//"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7D833C52E;
	Wed, 27 May 2026 14:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779892306; cv=none; b=oI+Cv3Ls1tTsqdxe/JF2Fu6XJB5eStf+sDzh5VKDOEOpdm6RbTIBaD88Tc3OEX2DD2dnSy25dWGNk4yKsCeii/KZEDGm6v8LDcGi6qwEN1slesBB+Bsu+6nGab4/ZfW+YRAZ/VjBRxV8cHNf2LQS0FdjZpFU2KX30FNOXa8pVhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779892306; c=relaxed/simple;
	bh=GLk0mOH/Ro6x4OhHH5mt6SfSw+rlyqAEUfoZLaRZWi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d6L48G8JrIxWb8kB/Nxf2iGF3qldK2TQPHXUSFWlovA8AT4PUFT05r5k8kuVJkwpQtN6QwuHxiuJJZq5YSkANGYh1ClADeVmeVRt1drz298m0cCGA8YovUqReBUuhqXMCZ1PAZQGodKXaiVSCp5H7ANVR9cC0fNjoiOV7wM3syQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VJWMqp//; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A18F1F000E9;
	Wed, 27 May 2026 14:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779892303;
	bh=T5W/AJwLyoSFeUFTRO3nbsMxzq3EQYPe4mp8T+RfRbs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VJWMqp//zue313oJRyrXDQY32Y8i9ithYtCsCyPz1CPuYo+DUcqZ4XWBqVcscIc9T
	 CmaoV85yXXinTqox7rHueAxlcb859SE+WjUCFrj+Qnq8FS2NfbMy8CNFXHZ+Jq+oXA
	 bfOjVEzUNR5gAdwnnQich8LMvyvRmjC1CnAORBkx7fjyN6U2kYMCsLiHtSfBM9rzgp
	 gFRnys/3mYnXhXeUnEPvXMHJL7bZE/hUwHyEo80rhg+GW2yIyI7uZoXE6TAofNHaqM
	 BkGeasETrn7inK3lK7+6gAK7w6H/keiSIvAKoVV/6RG/njvHkfEWqih1biip2FAtYY
	 o2p9LBmLcwfLQ==
Date: Wed, 27 May 2026 15:31:34 +0100
From: Lee Jones <lee@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	James Ogletree <jogletre@opensource.cirrus.com>,
	Fred Treven <fred.treven@cirrus.com>,
	Ben Bright <ben.bright@cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Andy Shevchenko <andy@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Samuel Kayode <samkay014@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-omap@vger.kernel.org,
	imx@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v1] mfd: Use named initializers for arrays of
 i2c_device_data
Message-ID: <20260527143134.GC19682@google.com>
References: <20260515095839.4005460-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260515095839.4005460-2-u.kleine-koenig@baylibre.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33212-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[baylibre.com,analog.com,kernel.org,gmail.com,opensource.cirrus.com,cirrus.com,diasemi.com,samsung.com,linaro.org,iki.fi,kemnade.info,atomide.com,foss.st.com,vger.kernel.org,lists.linux.dev,st-md-mailman.stormreply.com,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cheri-alliance.org:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,baylibre.com:email]
X-Rspamd-Queue-Id: C55035E5EF8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 15 May 2026, Uwe Kleine-König (The Capable Hub) wrote:

> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
> 
> The mentioned robustness is relevant for a planned change to struct
> i2c_device_id that replaces .driver_data by an anonymous union.
> 
> While touching all these arrays, unify indention and usage of commas.
> 
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits. The former was confirmed with x86 and arm64
> builds.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

Lots of conflicts.  Please rebase.

> ---
> Hello,
> 
> the mentioned change to i2c_device_id is the following:
> 
> 	diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
> 	index 23ff24080dfd..aebd3a5e90af 100644
> 	--- a/include/linux/mod_devicetable.h
> 	+++ b/include/linux/mod_devicetable.h
> 	@@ -477,7 +477,11 @@ struct rpmsg_device_id {
> 	 
> 	 struct i2c_device_id {
> 		char name[I2C_NAME_SIZE];
> 	-	kernel_ulong_t driver_data;	/* Data private to the driver */
> 	+	union {
> 	+		/* Data private to the driver */
> 	+		kernel_ulong_t driver_data;
> 	+		const void *driver_data_ptr;
> 	+	};
> 	 };
> 	 
> 	 /* pci_epf */
> 
> and this requires that .driver_data is assigned via a named initializer
> for static data. This requirement isn't a bad one because named
> initializers are also much better readable than list initializers.
> 
> The union added to struct i2c_device_id enables further cleanups like:
> 
>         diff --git a/drivers/iio/accel/kxcjk-1013.c b/drivers/iio/accel/kxcjk-1013.c
>         index 8a082ff034dd..b2aac7348d22 100644
>         --- a/drivers/iio/accel/kxcjk-1013.c
>         +++ b/drivers/iio/accel/kxcjk-1013.c
> 	@@ -1429,7 +1429,7 @@ static int kxcjk1013_probe(struct i2c_client *client)
> 	 
> 		if (id) {
> 			name = id->name;
> 	-		data->info = (const struct kx_chipset_info *)(id->driver_data);
> 	+		data->info = id->driver_data_ptr;
> 		} else {
> 			name = iio_get_acpi_device_name_and_data(&client->dev, &ddata);
> 			data->info = ddata;
> 	@@ -1630,11 +1630,11 @@ static const struct dev_pm_ops kxcjk1013_pm_ops = {
> 	 };
> 	 
> 	 static const struct i2c_device_id kxcjk1013_id[] = {
> 	-	{ .name = "kxcjk1013", .driver_data = (kernel_ulong_t)&kxcjk1013_info },
> 	-	{ .name = "kxcj91008", .driver_data = (kernel_ulong_t)&kxcj91008_info },
> 	-	{ .name = "kxtj21009", .driver_data = (kernel_ulong_t)&kxtj21009_info },
> 	-	{ .name = "kxtf9", .driver_data = (kernel_ulong_t)&kxtf9_info },
> 	-	{ .name = "kx023-1025", .driver_data = (kernel_ulong_t)&kx0231025_info },
> 	+	{ .name = "kxcjk1013", .driver_data_ptr = &kxcjk1013_info },
> 	+	{ .name = "kxcj91008", .driver_data_ptr = &kxcj91008_info },
> 	+	{ .name = "kxtj21009", .driver_data_ptr = &kxtj21009_info },
> 	+	{ .name = "kxtf9", .driver_data_ptr = &kxtf9_info },
> 	+	{ .name = "kx023-1025", .driver_data_ptr = &kx0231025_info },
> 		{ }
> 	 };
> 	 MODULE_DEVICE_TABLE(i2c, kxcjk1013_id);
> 
> that are an improvement for readability (again!) and it keeps some
> properties of the pointers (here: being const) without having to pay
> attention for that. (I didn't find a good example in drivers/mfd, so an
> iio driver was used to demonstrate the gain.)
> 
> My additional motivation for this effort is CHERI[1]. This is a hardware
> extension that uses 128 bit pointers but unsigned long is still 64 bit.
> So with CHERI you cannot store pointers in unsigned long variables.
> 
> Best regards
> Uwe
> 
> [1] https://cheri-alliance.org/discover-cheri/
>     https://lwn.net/Articles/1037974/
> 
>  drivers/mfd/88pm800.c            |  4 ++--
>  drivers/mfd/88pm805.c            |  4 ++--
>  drivers/mfd/88pm860x-core.c      |  4 ++--
>  drivers/mfd/aat2870-core.c       |  2 +-
>  drivers/mfd/act8945a.c           |  4 ++--
>  drivers/mfd/adp5520.c            |  4 ++--
>  drivers/mfd/arizona-i2c.c        | 12 ++++++------
>  drivers/mfd/as3722.c             |  4 ++--
>  drivers/mfd/axp20x-i2c.c         | 22 +++++++++++-----------
>  drivers/mfd/bcm590xx.c           |  4 ++--
>  drivers/mfd/bd9571mwv.c          |  2 +-
>  drivers/mfd/bq257xx.c            |  4 ++--
>  drivers/mfd/cs40l50-i2c.c        |  4 ++--
>  drivers/mfd/da903x.c             |  6 +++---
>  drivers/mfd/da9052-i2c.c         | 12 ++++++------
>  drivers/mfd/da9055-i2c.c         |  2 +-
>  drivers/mfd/da9062-core.c        |  4 ++--
>  drivers/mfd/da9063-i2c.c         |  6 +++---
>  drivers/mfd/da9150-core.c        |  2 +-
>  drivers/mfd/intel_soc_pmic_crc.c |  2 +-
>  drivers/mfd/lm3533-core.c        |  2 +-
>  drivers/mfd/lp3943.c             |  2 +-
>  drivers/mfd/lp873x.c             |  2 +-
>  drivers/mfd/lp87565.c            |  2 +-
>  drivers/mfd/lp8788.c             |  2 +-
>  drivers/mfd/madera-i2c.c         | 18 +++++++++---------
>  drivers/mfd/max14577.c           |  4 ++--
>  drivers/mfd/max77541.c           |  4 ++--
>  drivers/mfd/max77620.c           |  8 ++++----
>  drivers/mfd/max77693.c           |  2 +-
>  drivers/mfd/max77759.c           |  2 +-
>  drivers/mfd/max77843.c           |  4 ++--
>  drivers/mfd/max8907.c            |  4 ++--
>  drivers/mfd/max8925-i2c.c        |  2 +-
>  drivers/mfd/max8997.c            |  4 ++--
>  drivers/mfd/max8998.c            |  4 ++--
>  drivers/mfd/menf21bmc.c          |  2 +-
>  drivers/mfd/palmas.c             |  8 ++++----
>  drivers/mfd/pf1550.c             |  2 +-
>  drivers/mfd/retu-mfd.c           |  4 ++--
>  drivers/mfd/rsmu_i2c.c           | 14 +++++++-------
>  drivers/mfd/rt5033.c             |  2 +-
>  drivers/mfd/si476x-i2c.c         |  8 ++++----
>  drivers/mfd/sky81452.c           |  2 +-
>  drivers/mfd/stmpe-i2c.c          | 16 ++++++++--------
>  drivers/mfd/stw481x.c            |  2 +-
>  drivers/mfd/tc3589x.c            | 14 +++++++-------
>  drivers/mfd/ti-lmu.c             | 10 +++++-----
>  drivers/mfd/tps6105x.c           |  4 ++--
>  drivers/mfd/tps65010.c           | 10 +++++-----
>  drivers/mfd/tps6507x.c           |  2 +-
>  drivers/mfd/tps65086.c           |  2 +-
>  drivers/mfd/tps65090.c           |  2 +-
>  drivers/mfd/tps65217.c           |  2 +-
>  drivers/mfd/tps65218.c           |  4 ++--
>  drivers/mfd/tps6586x.c           |  2 +-
>  drivers/mfd/tps65910.c           |  4 ++--
>  drivers/mfd/tps65912-i2c.c       |  2 +-
>  drivers/mfd/twl-core.c           | 22 +++++++++++-----------
>  drivers/mfd/twl6040.c            |  4 ++--
>  drivers/mfd/wm831x-i2c.c         | 14 +++++++-------
>  drivers/mfd/wm8350-i2c.c         |  6 +++---
>  drivers/mfd/wm8400-core.c        |  2 +-
>  drivers/mfd/wm8994-core.c        |  8 ++++----
>  64 files changed, 174 insertions(+), 174 deletions(-)
> 
> diff --git a/drivers/mfd/88pm800.c b/drivers/mfd/88pm800.c
> index e9941da58b18..fe1017c6234b 100644
> --- a/drivers/mfd/88pm800.c
> +++ b/drivers/mfd/88pm800.c
> @@ -116,8 +116,8 @@ enum {
>  #define PM800_CHIP_GEN_ID_NUM	0x3
>  
>  static const struct i2c_device_id pm80x_id_table[] = {
> -	{ "88PM800" },
> -	{} /* NULL terminated */
> +	{ .name = "88PM800" },
> +	{ } /* NULL terminated */
>  };
>  MODULE_DEVICE_TABLE(i2c, pm80x_id_table);
>  
> diff --git a/drivers/mfd/88pm805.c b/drivers/mfd/88pm805.c
> index f5d6663172ee..8df11233bc4c 100644
> --- a/drivers/mfd/88pm805.c
> +++ b/drivers/mfd/88pm805.c
> @@ -30,8 +30,8 @@
>  #include <linux/delay.h>
>  
>  static const struct i2c_device_id pm80x_id_table[] = {
> -	{ "88PM805" },
> -	{} /* NULL terminated */
> +	{ .name = "88PM805" },
> +	{ } /* NULL terminated */
>  };
>  MODULE_DEVICE_TABLE(i2c, pm80x_id_table);
>  
> diff --git a/drivers/mfd/88pm860x-core.c b/drivers/mfd/88pm860x-core.c
> index 77230fbe07be..d3c24a7a3936 100644
> --- a/drivers/mfd/88pm860x-core.c
> +++ b/drivers/mfd/88pm860x-core.c
> @@ -1232,8 +1232,8 @@ static int pm860x_resume(struct device *dev)
>  static DEFINE_SIMPLE_DEV_PM_OPS(pm860x_pm_ops, pm860x_suspend, pm860x_resume);
>  
>  static const struct i2c_device_id pm860x_id_table[] = {
> -	{ "88PM860x" },
> -	{}
> +	{ .name = "88PM860x" },
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, pm860x_id_table);
>  
> diff --git a/drivers/mfd/aat2870-core.c b/drivers/mfd/aat2870-core.c
> index 34d66ba9646a..43fbf9cb1713 100644
> --- a/drivers/mfd/aat2870-core.c
> +++ b/drivers/mfd/aat2870-core.c
> @@ -437,7 +437,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(aat2870_pm_ops, aat2870_i2c_suspend,
>  				aat2870_i2c_resume);
>  
>  static const struct i2c_device_id aat2870_i2c_id_table[] = {
> -	{ "aat2870" },
> +	{ .name = "aat2870" },
>  	{ }
>  };
>  
> diff --git a/drivers/mfd/act8945a.c b/drivers/mfd/act8945a.c
> index cafefb4451cb..e5fba40f89d4 100644
> --- a/drivers/mfd/act8945a.c
> +++ b/drivers/mfd/act8945a.c
> @@ -54,8 +54,8 @@ static int act8945a_i2c_probe(struct i2c_client *i2c)
>  }
>  
>  static const struct i2c_device_id act8945a_i2c_id[] = {
> -	{ "act8945a" },
> -	{}
> +	{ .name = "act8945a" },
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, act8945a_i2c_id);
>  
> diff --git a/drivers/mfd/adp5520.c b/drivers/mfd/adp5520.c
> index bd6f4965ebc8..a4b58f431f92 100644
> --- a/drivers/mfd/adp5520.c
> +++ b/drivers/mfd/adp5520.c
> @@ -329,8 +329,8 @@ static int adp5520_resume(struct device *dev)
>  static DEFINE_SIMPLE_DEV_PM_OPS(adp5520_pm, adp5520_suspend, adp5520_resume);
>  
>  static const struct i2c_device_id adp5520_id[] = {
> -	{ "pmic-adp5520", ID_ADP5520 },
> -	{ "pmic-adp5501", ID_ADP5501 },
> +	{ .name = "pmic-adp5520", .driver_data = ID_ADP5520 },
> +	{ .name = "pmic-adp5501", .driver_data = ID_ADP5501 },
>  	{ }
>  };
>  
> diff --git a/drivers/mfd/arizona-i2c.c b/drivers/mfd/arizona-i2c.c
> index 10e76fc8f12e..1ea8a59948b6 100644
> --- a/drivers/mfd/arizona-i2c.c
> +++ b/drivers/mfd/arizona-i2c.c
> @@ -85,12 +85,12 @@ static void arizona_i2c_remove(struct i2c_client *i2c)
>  }
>  
>  static const struct i2c_device_id arizona_i2c_id[] = {
> -	{ "wm5102", WM5102 },
> -	{ "wm5110", WM5110 },
> -	{ "wm8280", WM8280 },
> -	{ "wm8997", WM8997 },
> -	{ "wm8998", WM8998 },
> -	{ "wm1814", WM1814 },
> +	{ .name = "wm5102", .driver_data = WM5102 },
> +	{ .name = "wm5110", .driver_data = WM5110 },
> +	{ .name = "wm8280", .driver_data = WM8280 },
> +	{ .name = "wm8997", .driver_data = WM8997 },
> +	{ .name = "wm8998", .driver_data = WM8998 },
> +	{ .name = "wm1814", .driver_data = WM1814 },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, arizona_i2c_id);
> diff --git a/drivers/mfd/as3722.c b/drivers/mfd/as3722.c
> index 7ab6fcc9c27c..ec7be5fb326e 100644
> --- a/drivers/mfd/as3722.c
> +++ b/drivers/mfd/as3722.c
> @@ -432,8 +432,8 @@ static const struct of_device_id as3722_of_match[] = {
>  MODULE_DEVICE_TABLE(of, as3722_of_match);
>  
>  static const struct i2c_device_id as3722_i2c_id[] = {
> -	{ "as3722" },
> -	{}
> +	{ .name = "as3722" },
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, as3722_i2c_id);
>  
> diff --git a/drivers/mfd/axp20x-i2c.c b/drivers/mfd/axp20x-i2c.c
> index 5c93136f977e..2f595e2b883c 100644
> --- a/drivers/mfd/axp20x-i2c.c
> +++ b/drivers/mfd/axp20x-i2c.c
> @@ -76,17 +76,17 @@ MODULE_DEVICE_TABLE(of, axp20x_i2c_of_match);
>  #endif
>  
>  static const struct i2c_device_id axp20x_i2c_id[] = {
> -	{ "axp152" },
> -	{ "axp192" },
> -	{ "axp202" },
> -	{ "axp209" },
> -	{ "axp221" },
> -	{ "axp223" },
> -	{ "axp313a" },
> -	{ "axp717" },
> -	{ "axp803" },
> -	{ "axp806" },
> -	{ "axp15060" },
> +	{ .name = "axp152" },
> +	{ .name = "axp192" },
> +	{ .name = "axp202" },
> +	{ .name = "axp209" },
> +	{ .name = "axp221" },
> +	{ .name = "axp223" },
> +	{ .name = "axp313a" },
> +	{ .name = "axp717" },
> +	{ .name = "axp803" },
> +	{ .name = "axp806" },
> +	{ .name = "axp15060" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, axp20x_i2c_id);
> diff --git a/drivers/mfd/bcm590xx.c b/drivers/mfd/bcm590xx.c
> index 5a8456bbd63f..85a906b54541 100644
> --- a/drivers/mfd/bcm590xx.c
> +++ b/drivers/mfd/bcm590xx.c
> @@ -160,8 +160,8 @@ static const struct of_device_id bcm590xx_of_match[] = {
>  MODULE_DEVICE_TABLE(of, bcm590xx_of_match);
>  
>  static const struct i2c_device_id bcm590xx_i2c_id[] = {
> -	{ "bcm59054" },
> -	{ "bcm59056" },
> +	{ .name = "bcm59054" },
> +	{ .name = "bcm59056" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, bcm590xx_i2c_id);
> diff --git a/drivers/mfd/bd9571mwv.c b/drivers/mfd/bd9571mwv.c
> index db8c2963fb48..2b6fe6fd9806 100644
> --- a/drivers/mfd/bd9571mwv.c
> +++ b/drivers/mfd/bd9571mwv.c
> @@ -268,7 +268,7 @@ static const struct of_device_id bd9571mwv_of_match_table[] = {
>  MODULE_DEVICE_TABLE(of, bd9571mwv_of_match_table);
>  
>  static const struct i2c_device_id bd9571mwv_id_table[] = {
> -	{ "bd9571mwv" },
> +	{ .name = "bd9571mwv" },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(i2c, bd9571mwv_id_table);
> diff --git a/drivers/mfd/bq257xx.c b/drivers/mfd/bq257xx.c
> index e9d49dac0a16..e232ae2ae00f 100644
> --- a/drivers/mfd/bq257xx.c
> +++ b/drivers/mfd/bq257xx.c
> @@ -73,8 +73,8 @@ static int bq257xx_probe(struct i2c_client *client)
>  }
>  
>  static const struct i2c_device_id bq257xx_i2c_ids[] = {
> -	{ "bq25703a" },
> -	{}
> +	{ .name = "bq25703a" },
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, bq257xx_i2c_ids);
>  
> diff --git a/drivers/mfd/cs40l50-i2c.c b/drivers/mfd/cs40l50-i2c.c
> index 639be743d956..b61b0484644d 100644
> --- a/drivers/mfd/cs40l50-i2c.c
> +++ b/drivers/mfd/cs40l50-i2c.c
> @@ -40,8 +40,8 @@ static void cs40l50_i2c_remove(struct i2c_client *i2c)
>  }
>  
>  static const struct i2c_device_id cs40l50_id_i2c[] = {
> -	{ "cs40l50" },
> -	{}
> +	{ .name = "cs40l50" },
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, cs40l50_id_i2c);
>  
> diff --git a/drivers/mfd/da903x.c b/drivers/mfd/da903x.c
> index e86b39de3303..46d9d823414a 100644
> --- a/drivers/mfd/da903x.c
> +++ b/drivers/mfd/da903x.c
> @@ -439,9 +439,9 @@ static const struct da903x_chip_ops da903x_ops[] = {
>  };
>  
>  static const struct i2c_device_id da903x_id_table[] = {
> -	{ "da9030", 0 },
> -	{ "da9034", 1 },
> -	{ },
> +	{ .name = "da9030", .driver_data = 0 },
> +	{ .name = "da9034", .driver_data = 1 },
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, da903x_id_table);
>  
> diff --git a/drivers/mfd/da9052-i2c.c b/drivers/mfd/da9052-i2c.c
> index fd000a21bcba..6af9552ccba1 100644
> --- a/drivers/mfd/da9052-i2c.c
> +++ b/drivers/mfd/da9052-i2c.c
> @@ -103,12 +103,12 @@ static int da9052_i2c_disable_multiwrite(struct da9052 *da9052)
>  }
>  
>  static const struct i2c_device_id da9052_i2c_id[] = {
> -	{"da9052", DA9052},
> -	{"da9053-aa", DA9053_AA},
> -	{"da9053-ba", DA9053_BA},
> -	{"da9053-bb", DA9053_BB},
> -	{"da9053-bc", DA9053_BC},
> -	{}
> +	{ .name = "da9052", .driver_data = DA9052 },
> +	{ .name = "da9053-aa", .driver_data = DA9053_AA },
> +	{ .name = "da9053-ba", .driver_data = DA9053_BA },
> +	{ .name = "da9053-bb", .driver_data = DA9053_BB },
> +	{ .name = "da9053-bc", .driver_data = DA9053_BC },
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, da9052_i2c_id);
>  
> diff --git a/drivers/mfd/da9055-i2c.c b/drivers/mfd/da9055-i2c.c
> index 6c1981832aaf..e85db66f79a1 100644
> --- a/drivers/mfd/da9055-i2c.c
> +++ b/drivers/mfd/da9055-i2c.c
> @@ -54,7 +54,7 @@ static void da9055_i2c_remove(struct i2c_client *i2c)
>   * and CODEC, which must be different to operate together.
>   */
>  static const struct i2c_device_id da9055_i2c_id[] = {
> -	{ "da9055-pmic" },
> +	{ .name = "da9055-pmic" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, da9055_i2c_id);
> diff --git a/drivers/mfd/da9062-core.c b/drivers/mfd/da9062-core.c
> index 637c5f47a4b0..a90723d33ad9 100644
> --- a/drivers/mfd/da9062-core.c
> +++ b/drivers/mfd/da9062-core.c
> @@ -711,8 +711,8 @@ static const struct of_device_id da9062_dt_ids[] = {
>  MODULE_DEVICE_TABLE(of, da9062_dt_ids);
>  
>  static const struct i2c_device_id da9062_i2c_id[] = {
> -	{ "da9061", COMPAT_TYPE_DA9061 },
> -	{ "da9062", COMPAT_TYPE_DA9062 },
> +	{ .name = "da9061", .driver_data = COMPAT_TYPE_DA9061 },
> +	{ .name = "da9062", .driver_data = COMPAT_TYPE_DA9062 },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, da9062_i2c_id);
> diff --git a/drivers/mfd/da9063-i2c.c b/drivers/mfd/da9063-i2c.c
> index a803b7440f09..068f080d1f9b 100644
> --- a/drivers/mfd/da9063-i2c.c
> +++ b/drivers/mfd/da9063-i2c.c
> @@ -476,9 +476,9 @@ static int da9063_i2c_probe(struct i2c_client *i2c)
>  }
>  
>  static const struct i2c_device_id da9063_i2c_id[] = {
> -	{ "da9063", PMIC_TYPE_DA9063 },
> -	{ "da9063l", PMIC_TYPE_DA9063L },
> -	{},
> +	{ .name = "da9063", .driver_data = PMIC_TYPE_DA9063 },
> +	{ .name = "da9063l", .driver_data = PMIC_TYPE_DA9063L },
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, da9063_i2c_id);
>  
> diff --git a/drivers/mfd/da9150-core.c b/drivers/mfd/da9150-core.c
> index 5c59cc869fb3..ab2335b73a63 100644
> --- a/drivers/mfd/da9150-core.c
> +++ b/drivers/mfd/da9150-core.c
> @@ -494,7 +494,7 @@ static void da9150_shutdown(struct i2c_client *client)
>  }
>  
>  static const struct i2c_device_id da9150_i2c_id[] = {
> -	{ "da9150", },
> +	{ .name = "da9150" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, da9150_i2c_id);
> diff --git a/drivers/mfd/intel_soc_pmic_crc.c b/drivers/mfd/intel_soc_pmic_crc.c
> index 41429f9bcb69..d81941b5d4fd 100644
> --- a/drivers/mfd/intel_soc_pmic_crc.c
> +++ b/drivers/mfd/intel_soc_pmic_crc.c
> @@ -259,7 +259,7 @@ static const struct acpi_device_id crystal_cove_acpi_match[] = {
>  MODULE_DEVICE_TABLE(acpi, crystal_cove_acpi_match);
>  
>  static const struct i2c_device_id crystal_cove_i2c_match[] = {
> -	{ "intel_soc_pmic_crc" },
> +	{ .name = "intel_soc_pmic_crc" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, crystal_cove_i2c_match);
> diff --git a/drivers/mfd/lm3533-core.c b/drivers/mfd/lm3533-core.c
> index 0a2409d00b2e..1602d96987c5 100644
> --- a/drivers/mfd/lm3533-core.c
> +++ b/drivers/mfd/lm3533-core.c
> @@ -604,7 +604,7 @@ static void lm3533_i2c_remove(struct i2c_client *i2c)
>  }
>  
>  static const struct i2c_device_id lm3533_i2c_ids[] = {
> -	{ "lm3533" },
> +	{ .name = "lm3533" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, lm3533_i2c_ids);
> diff --git a/drivers/mfd/lp3943.c b/drivers/mfd/lp3943.c
> index 6764553147e4..503615a8d420 100644
> --- a/drivers/mfd/lp3943.c
> +++ b/drivers/mfd/lp3943.c
> @@ -126,7 +126,7 @@ static int lp3943_probe(struct i2c_client *cl)
>  }
>  
>  static const struct i2c_device_id lp3943_ids[] = {
> -	{ "lp3943" },
> +	{ .name = "lp3943" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, lp3943_ids);
> diff --git a/drivers/mfd/lp873x.c b/drivers/mfd/lp873x.c
> index e8c5c89c2a76..d1d128a339d2 100644
> --- a/drivers/mfd/lp873x.c
> +++ b/drivers/mfd/lp873x.c
> @@ -68,7 +68,7 @@ static const struct of_device_id of_lp873x_match_table[] = {
>  MODULE_DEVICE_TABLE(of, of_lp873x_match_table);
>  
>  static const struct i2c_device_id lp873x_id_table[] = {
> -	{ "lp873x" },
> +	{ .name = "lp873x" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, lp873x_id_table);
> diff --git a/drivers/mfd/lp87565.c b/drivers/mfd/lp87565.c
> index 9488d3793c10..33e4ce378d46 100644
> --- a/drivers/mfd/lp87565.c
> +++ b/drivers/mfd/lp87565.c
> @@ -106,7 +106,7 @@ static void lp87565_shutdown(struct i2c_client *client)
>  }
>  
>  static const struct i2c_device_id lp87565_id_table[] = {
> -	{ "lp87565-q1" },
> +	{ .name = "lp87565-q1" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, lp87565_id_table);
> diff --git a/drivers/mfd/lp8788.c b/drivers/mfd/lp8788.c
> index 32f255378f5a..48fe99a2b982 100644
> --- a/drivers/mfd/lp8788.c
> +++ b/drivers/mfd/lp8788.c
> @@ -216,7 +216,7 @@ static void lp8788_remove(struct i2c_client *cl)
>  }
>  
>  static const struct i2c_device_id lp8788_ids[] = {
> -	{ "lp8788" },
> +	{ .name = "lp8788" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, lp8788_ids);
> diff --git a/drivers/mfd/madera-i2c.c b/drivers/mfd/madera-i2c.c
> index 0986e4a99f4a..762f668ed20c 100644
> --- a/drivers/mfd/madera-i2c.c
> +++ b/drivers/mfd/madera-i2c.c
> @@ -112,15 +112,15 @@ static void madera_i2c_remove(struct i2c_client *i2c)
>  }
>  
>  static const struct i2c_device_id madera_i2c_id[] = {
> -	{ "cs47l15", CS47L15 },
> -	{ "cs47l35", CS47L35 },
> -	{ "cs47l85", CS47L85 },
> -	{ "cs47l90", CS47L90 },
> -	{ "cs47l91", CS47L91 },
> -	{ "cs42l92", CS42L92 },
> -	{ "cs47l92", CS47L92 },
> -	{ "cs47l93", CS47L93 },
> -	{ "wm1840", WM1840 },
> +	{ .name = "cs47l15", .driver_data = CS47L15 },
> +	{ .name = "cs47l35", .driver_data = CS47L35 },
> +	{ .name = "cs47l85", .driver_data = CS47L85 },
> +	{ .name = "cs47l90", .driver_data = CS47L90 },
> +	{ .name = "cs47l91", .driver_data = CS47L91 },
> +	{ .name = "cs42l92", .driver_data = CS42L92 },
> +	{ .name = "cs47l92", .driver_data = CS47L92 },
> +	{ .name = "cs47l93", .driver_data = CS47L93 },
> +	{ .name = "wm1840", .driver_data = WM1840 },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, madera_i2c_id);
> diff --git a/drivers/mfd/max14577.c b/drivers/mfd/max14577.c
> index 7e7e8af9af22..33da4bf51718 100644
> --- a/drivers/mfd/max14577.c
> +++ b/drivers/mfd/max14577.c
> @@ -464,8 +464,8 @@ static void max14577_i2c_remove(struct i2c_client *i2c)
>  }
>  
>  static const struct i2c_device_id max14577_i2c_id[] = {
> -	{ "max14577", MAXIM_DEVICE_TYPE_MAX14577, },
> -	{ "max77836", MAXIM_DEVICE_TYPE_MAX77836, },
> +	{ .name = "max14577", .driver_data = MAXIM_DEVICE_TYPE_MAX14577 },
> +	{ .name = "max77836", .driver_data = MAXIM_DEVICE_TYPE_MAX77836 },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, max14577_i2c_id);
> diff --git a/drivers/mfd/max77541.c b/drivers/mfd/max77541.c
> index f91b4f5373ce..5f5b2ff181d3 100644
> --- a/drivers/mfd/max77541.c
> +++ b/drivers/mfd/max77541.c
> @@ -199,8 +199,8 @@ static const struct of_device_id max77541_of_id[] = {
>  MODULE_DEVICE_TABLE(of, max77541_of_id);
>  
>  static const struct i2c_device_id max77541_id[] = {
> -	{ "max77540", MAX77540 },
> -	{ "max77541", MAX77541 },
> +	{ .name = "max77540", .driver_data = MAX77540 },
> +	{ .name = "max77541", .driver_data = MAX77541 },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, max77541_id);
> diff --git a/drivers/mfd/max77620.c b/drivers/mfd/max77620.c
> index 3af2974b3023..ab170593d8da 100644
> --- a/drivers/mfd/max77620.c
> +++ b/drivers/mfd/max77620.c
> @@ -690,10 +690,10 @@ static int max77620_i2c_resume(struct device *dev)
>  }
>  
>  static const struct i2c_device_id max77620_id[] = {
> -	{"max77620", MAX77620},
> -	{"max20024", MAX20024},
> -	{"max77663", MAX77663},
> -	{},
> +	{ .name = "max77620", .driver_data = MAX77620 },
> +	{ .name = "max20024", .driver_data = MAX20024 },
> +	{ .name = "max77663", .driver_data = MAX77663 },
> +	{ }
>  };
>  
>  static DEFINE_SIMPLE_DEV_PM_OPS(max77620_pm_ops,
> diff --git a/drivers/mfd/max77693.c b/drivers/mfd/max77693.c
> index 1c485a4c3dcf..411011afde37 100644
> --- a/drivers/mfd/max77693.c
> +++ b/drivers/mfd/max77693.c
> @@ -306,7 +306,7 @@ static void max77693_i2c_remove(struct i2c_client *i2c)
>  }
>  
>  static const struct i2c_device_id max77693_i2c_id[] = {
> -	{ "max77693", TYPE_MAX77693 },
> +	{ .name = "max77693", .driver_data = TYPE_MAX77693 },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, max77693_i2c_id);
> diff --git a/drivers/mfd/max77759.c b/drivers/mfd/max77759.c
> index 9fa6027a92c4..a7140006e8b8 100644
> --- a/drivers/mfd/max77759.c
> +++ b/drivers/mfd/max77759.c
> @@ -729,7 +729,7 @@ static int max77759_probe(struct i2c_client *client)
>  }
>  
>  static const struct i2c_device_id max77759_i2c_id[] = {
> -	{ "max77759" },
> +	{ .name = "max77759" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, max77759_i2c_id);
> diff --git a/drivers/mfd/max77843.c b/drivers/mfd/max77843.c
> index fcff0c498c0f..ceaf2864eeee 100644
> --- a/drivers/mfd/max77843.c
> +++ b/drivers/mfd/max77843.c
> @@ -170,8 +170,8 @@ static const struct of_device_id max77843_dt_match[] = {
>  };
>  
>  static const struct i2c_device_id max77843_id[] = {
> -	{ "max77843", TYPE_MAX77843, },
> -	{ },
> +	{ .name = "max77843", .driver_data = TYPE_MAX77843 },
> +	{ }
>  };
>  
>  static int __maybe_unused max77843_suspend(struct device *dev)
> diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
> index 7bac1d651771..6e2fed7021a8 100644
> --- a/drivers/mfd/max8907.c
> +++ b/drivers/mfd/max8907.c
> @@ -300,8 +300,8 @@ MODULE_DEVICE_TABLE(of, max8907_of_match);
>  #endif
>  
>  static const struct i2c_device_id max8907_i2c_id[] = {
> -	{ "max8907" },
> -	{}
> +	{ .name = "max8907" },
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, max8907_i2c_id);
>  
> diff --git a/drivers/mfd/max8925-i2c.c b/drivers/mfd/max8925-i2c.c
> index ab19ff0c7867..25390d0eabd4 100644
> --- a/drivers/mfd/max8925-i2c.c
> +++ b/drivers/mfd/max8925-i2c.c
> @@ -127,7 +127,7 @@ EXPORT_SYMBOL(max8925_set_bits);
>  
>  
>  static const struct i2c_device_id max8925_id_table[] = {
> -	{ "max8925" },
> +	{ .name = "max8925" },
>  	{ }
>  };
>  
> diff --git a/drivers/mfd/max8997.c b/drivers/mfd/max8997.c
> index 7ba8ed1dfde3..6edc18e0eebb 100644
> --- a/drivers/mfd/max8997.c
> +++ b/drivers/mfd/max8997.c
> @@ -229,8 +229,8 @@ static int max8997_i2c_probe(struct i2c_client *i2c)
>  }
>  
>  static const struct i2c_device_id max8997_i2c_id[] = {
> -	{ "max8997", TYPE_MAX8997 },
> -	{ "max8966", TYPE_MAX8966 },
> +	{ .name = "max8997", .driver_data = TYPE_MAX8997 },
> +	{ .name = "max8966", .driver_data = TYPE_MAX8966 },
>  	{ }
>  };
>  
> diff --git a/drivers/mfd/max8998.c b/drivers/mfd/max8998.c
> index eb13bbaeda55..e93a5ffc9612 100644
> --- a/drivers/mfd/max8998.c
> +++ b/drivers/mfd/max8998.c
> @@ -223,8 +223,8 @@ static int max8998_i2c_probe(struct i2c_client *i2c)
>  }
>  
>  static const struct i2c_device_id max8998_i2c_id[] = {
> -	{ "max8998", TYPE_MAX8998 },
> -	{ "lp3974", TYPE_LP3974},
> +	{ .name = "max8998", .driver_data = TYPE_MAX8998 },
> +	{ .name = "lp3974", .driver_data = TYPE_LP3974 },
>  	{ }
>  };
>  
> diff --git a/drivers/mfd/menf21bmc.c b/drivers/mfd/menf21bmc.c
> index 1d36095155e0..e4ec418ecce0 100644
> --- a/drivers/mfd/menf21bmc.c
> +++ b/drivers/mfd/menf21bmc.c
> @@ -103,7 +103,7 @@ menf21bmc_probe(struct i2c_client *client)
>  }
>  
>  static const struct i2c_device_id menf21bmc_id_table[] = {
> -	{ "menf21bmc" },
> +	{ .name = "menf21bmc" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, menf21bmc_id_table);
> diff --git a/drivers/mfd/palmas.c b/drivers/mfd/palmas.c
> index 7fc886f4f80e..26faecab1af3 100644
> --- a/drivers/mfd/palmas.c
> +++ b/drivers/mfd/palmas.c
> @@ -699,10 +699,10 @@ static const struct of_device_id of_palmas_match_tbl[] = {
>  MODULE_DEVICE_TABLE(of, of_palmas_match_tbl);
>  
>  static const struct i2c_device_id palmas_i2c_id[] = {
> -	{ "palmas", (kernel_ulong_t)&palmas_data },
> -	{ "twl6035", (kernel_ulong_t)&palmas_data },
> -	{ "twl6037", (kernel_ulong_t)&palmas_data },
> -	{ "tps65913", (kernel_ulong_t)&palmas_data },
> +	{ .name = "palmas", .driver_data = (kernel_ulong_t)&palmas_data },
> +	{ .name = "twl6035", .driver_data = (kernel_ulong_t)&palmas_data },
> +	{ .name = "twl6037", .driver_data = (kernel_ulong_t)&palmas_data },
> +	{ .name = "tps65913", .driver_data = (kernel_ulong_t)&palmas_data },
>  	{ /* end */ }
>  };
>  MODULE_DEVICE_TABLE(i2c, palmas_i2c_id);
> diff --git a/drivers/mfd/pf1550.c b/drivers/mfd/pf1550.c
> index c4f567c05564..7c3348ad59dc 100644
> --- a/drivers/mfd/pf1550.c
> +++ b/drivers/mfd/pf1550.c
> @@ -340,7 +340,7 @@ static int pf1550_resume(struct device *dev)
>  static DEFINE_SIMPLE_DEV_PM_OPS(pf1550_pm, pf1550_suspend, pf1550_resume);
>  
>  static const struct i2c_device_id pf1550_i2c_id[] = {
> -	{ "pf1550" },
> +	{ .name = "pf1550" },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(i2c, pf1550_i2c_id);
> diff --git a/drivers/mfd/retu-mfd.c b/drivers/mfd/retu-mfd.c
> index 1d43458b4938..330366224e80 100644
> --- a/drivers/mfd/retu-mfd.c
> +++ b/drivers/mfd/retu-mfd.c
> @@ -300,8 +300,8 @@ static void retu_remove(struct i2c_client *i2c)
>  }
>  
>  static const struct i2c_device_id retu_id[] = {
> -	{ "retu" },
> -	{ "tahvo" },
> +	{ .name = "retu" },
> +	{ .name = "tahvo" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, retu_id);
> diff --git a/drivers/mfd/rsmu_i2c.c b/drivers/mfd/rsmu_i2c.c
> index cba64f107a2f..630387868d7a 100644
> --- a/drivers/mfd/rsmu_i2c.c
> +++ b/drivers/mfd/rsmu_i2c.c
> @@ -332,13 +332,13 @@ static void rsmu_i2c_remove(struct i2c_client *client)
>  }
>  
>  static const struct i2c_device_id rsmu_i2c_id[] = {
> -	{ "8a34000",  RSMU_CM },
> -	{ "8a34001",  RSMU_CM },
> -	{ "82p33810", RSMU_SABRE },
> -	{ "82p33811", RSMU_SABRE },
> -	{ "8v19n850", RSMU_SL },
> -	{ "8v19n851", RSMU_SL },
> -	{}
> +	{ .name = "8a34000", .driver_data = RSMU_CM },
> +	{ .name = "8a34001", .driver_data = RSMU_CM },
> +	{ .name = "82p33810", .driver_data = RSMU_SABRE },
> +	{ .name = "82p33811", .driver_data = RSMU_SABRE },
> +	{ .name = "8v19n850", .driver_data = RSMU_SL },
> +	{ .name = "8v19n851", .driver_data = RSMU_SL },
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, rsmu_i2c_id);
>  
> diff --git a/drivers/mfd/rt5033.c b/drivers/mfd/rt5033.c
> index 2204bf1c5a51..99bc866c7b0d 100644
> --- a/drivers/mfd/rt5033.c
> +++ b/drivers/mfd/rt5033.c
> @@ -108,7 +108,7 @@ static int rt5033_i2c_probe(struct i2c_client *i2c)
>  }
>  
>  static const struct i2c_device_id rt5033_i2c_id[] = {
> -	{ "rt5033", },
> +	{ .name = "rt5033" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, rt5033_i2c_id);
> diff --git a/drivers/mfd/si476x-i2c.c b/drivers/mfd/si476x-i2c.c
> index 899c0b5ea3aa..83137683d8e2 100644
> --- a/drivers/mfd/si476x-i2c.c
> +++ b/drivers/mfd/si476x-i2c.c
> @@ -855,10 +855,10 @@ static void si476x_core_remove(struct i2c_client *client)
>  
>  
>  static const struct i2c_device_id si476x_id[] = {
> -	{ "si4761", SI476X_CHIP_SI4761 },
> -	{ "si4764", SI476X_CHIP_SI4764 },
> -	{ "si4768", SI476X_CHIP_SI4768 },
> -	{ },
> +	{ .name = "si4761", .driver_data = SI476X_CHIP_SI4761 },
> +	{ .name = "si4764", .driver_data = SI476X_CHIP_SI4764 },
> +	{ .name = "si4768", .driver_data = SI476X_CHIP_SI4768 },
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, si476x_id);
>  
> diff --git a/drivers/mfd/sky81452.c b/drivers/mfd/sky81452.c
> index 771b62a5c70f..8a213176b7cd 100644
> --- a/drivers/mfd/sky81452.c
> +++ b/drivers/mfd/sky81452.c
> @@ -59,7 +59,7 @@ static int sky81452_probe(struct i2c_client *client)
>  }
>  
>  static const struct i2c_device_id sky81452_ids[] = {
> -	{ "sky81452" },
> +	{ .name = "sky81452" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, sky81452_ids);
> diff --git a/drivers/mfd/stmpe-i2c.c b/drivers/mfd/stmpe-i2c.c
> index 943fa363efc3..8eee780afa16 100644
> --- a/drivers/mfd/stmpe-i2c.c
> +++ b/drivers/mfd/stmpe-i2c.c
> @@ -100,14 +100,14 @@ static void stmpe_i2c_remove(struct i2c_client *i2c)
>  }
>  
>  static const struct i2c_device_id stmpe_i2c_id[] = {
> -	{ "stmpe610", STMPE610 },
> -	{ "stmpe801", STMPE801 },
> -	{ "stmpe811", STMPE811 },
> -	{ "stmpe1600", STMPE1600 },
> -	{ "stmpe1601", STMPE1601 },
> -	{ "stmpe1801", STMPE1801 },
> -	{ "stmpe2401", STMPE2401 },
> -	{ "stmpe2403", STMPE2403 },
> +	{ .name = "stmpe610", .driver_data = STMPE610 },
> +	{ .name = "stmpe801", .driver_data = STMPE801 },
> +	{ .name = "stmpe811", .driver_data = STMPE811 },
> +	{ .name = "stmpe1600", .driver_data = STMPE1600 },
> +	{ .name = "stmpe1601", .driver_data = STMPE1601 },
> +	{ .name = "stmpe1801", .driver_data = STMPE1801 },
> +	{ .name = "stmpe2401", .driver_data = STMPE2401 },
> +	{ .name = "stmpe2403", .driver_data = STMPE2403 },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, stmpe_i2c_id);
> diff --git a/drivers/mfd/stw481x.c b/drivers/mfd/stw481x.c
> index 5ed64d53c23d..da1e293d36e9 100644
> --- a/drivers/mfd/stw481x.c
> +++ b/drivers/mfd/stw481x.c
> @@ -222,7 +222,7 @@ static int stw481x_probe(struct i2c_client *client)
>   * the structure of the I2C core.
>   */
>  static const struct i2c_device_id stw481x_id[] = {
> -	{ "stw481x" },
> +	{ .name = "stw481x" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, stw481x_id);
> diff --git a/drivers/mfd/tc3589x.c b/drivers/mfd/tc3589x.c
> index 2d4eb771e230..f812e7551f09 100644
> --- a/drivers/mfd/tc3589x.c
> +++ b/drivers/mfd/tc3589x.c
> @@ -466,13 +466,13 @@ static DEFINE_SIMPLE_DEV_PM_OPS(tc3589x_dev_pm_ops,
>  				tc3589x_suspend, tc3589x_resume);
>  
>  static const struct i2c_device_id tc3589x_id[] = {
> -	{ "tc35890", TC3589X_TC35890 },
> -	{ "tc35892", TC3589X_TC35892 },
> -	{ "tc35893", TC3589X_TC35893 },
> -	{ "tc35894", TC3589X_TC35894 },
> -	{ "tc35895", TC3589X_TC35895 },
> -	{ "tc35896", TC3589X_TC35896 },
> -	{ "tc3589x", TC3589X_UNKNOWN },
> +	{ .name = "tc35890", .driver_data = TC3589X_TC35890 },
> +	{ .name = "tc35892", .driver_data = TC3589X_TC35892 },
> +	{ .name = "tc35893", .driver_data = TC3589X_TC35893 },
> +	{ .name = "tc35894", .driver_data = TC3589X_TC35894 },
> +	{ .name = "tc35895", .driver_data = TC3589X_TC35895 },
> +	{ .name = "tc35896", .driver_data = TC3589X_TC35896 },
> +	{ .name = "tc3589x", .driver_data = TC3589X_UNKNOWN },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, tc3589x_id);
> diff --git a/drivers/mfd/ti-lmu.c b/drivers/mfd/ti-lmu.c
> index cfc9f88b9842..5d22830b010f 100644
> --- a/drivers/mfd/ti-lmu.c
> +++ b/drivers/mfd/ti-lmu.c
> @@ -206,11 +206,11 @@ static const struct of_device_id ti_lmu_of_match[] = {
>  MODULE_DEVICE_TABLE(of, ti_lmu_of_match);
>  
>  static const struct i2c_device_id ti_lmu_ids[] = {
> -	{ "lm3631", LM3631 },
> -	{ "lm3632", LM3632 },
> -	{ "lm3633", LM3633 },
> -	{ "lm3695", LM3695 },
> -	{ "lm36274", LM36274 },
> +	{ .name = "lm3631", .driver_data = LM3631 },
> +	{ .name = "lm3632", .driver_data = LM3632 },
> +	{ .name = "lm3633", .driver_data = LM3633 },
> +	{ .name = "lm3695", .driver_data = LM3695 },
> +	{ .name = "lm36274", .driver_data = LM36274 },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, ti_lmu_ids);
> diff --git a/drivers/mfd/tps6105x.c b/drivers/mfd/tps6105x.c
> index e2f6858d101e..94f5b1a6a923 100644
> --- a/drivers/mfd/tps6105x.c
> +++ b/drivers/mfd/tps6105x.c
> @@ -191,8 +191,8 @@ static void tps6105x_remove(struct i2c_client *client)
>  }
>  
>  static const struct i2c_device_id tps6105x_id[] = {
> -	{ "tps61050" },
> -	{ "tps61052" },
> +	{ .name = "tps61050" },
> +	{ .name = "tps61052" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, tps6105x_id);
> diff --git a/drivers/mfd/tps65010.c b/drivers/mfd/tps65010.c
> index 8a144ec52201..4d428b82def9 100644
> --- a/drivers/mfd/tps65010.c
> +++ b/drivers/mfd/tps65010.c
> @@ -649,11 +649,11 @@ static int tps65010_probe(struct i2c_client *client)
>  }
>  
>  static const struct i2c_device_id tps65010_id[] = {
> -	{ "tps65010", TPS65010 },
> -	{ "tps65011", TPS65011 },
> -	{ "tps65012", TPS65012 },
> -	{ "tps65013", TPS65013 },
> -	{ "tps65014", TPS65011 },	/* tps65011 charging at 6.5V max */
> +	{ .name = "tps65010", .driver_data = TPS65010 },
> +	{ .name = "tps65011", .driver_data = TPS65011 },
> +	{ .name = "tps65012", .driver_data = TPS65012 },
> +	{ .name = "tps65013", .driver_data = TPS65013 },
> +	{ .name = "tps65014", .driver_data = TPS65011 },	/* tps65011 charging at 6.5V max */
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, tps65010_id);
> diff --git a/drivers/mfd/tps6507x.c b/drivers/mfd/tps6507x.c
> index 9865512dc7cc..ed806754d89f 100644
> --- a/drivers/mfd/tps6507x.c
> +++ b/drivers/mfd/tps6507x.c
> @@ -103,7 +103,7 @@ static int tps6507x_i2c_probe(struct i2c_client *i2c)
>  }
>  
>  static const struct i2c_device_id tps6507x_i2c_id[] = {
> -	{ "tps6507x" },
> +	{ .name = "tps6507x" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, tps6507x_i2c_id);
> diff --git a/drivers/mfd/tps65086.c b/drivers/mfd/tps65086.c
> index 54832e9321b9..a73e0b5c0982 100644
> --- a/drivers/mfd/tps65086.c
> +++ b/drivers/mfd/tps65086.c
> @@ -127,7 +127,7 @@ static void tps65086_remove(struct i2c_client *client)
>  }
>  
>  static const struct i2c_device_id tps65086_id_table[] = {
> -	{ "tps65086" },
> +	{ .name = "tps65086" },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(i2c, tps65086_id_table);
> diff --git a/drivers/mfd/tps65090.c b/drivers/mfd/tps65090.c
> index 24f42175a9b4..ae845be3a8ea 100644
> --- a/drivers/mfd/tps65090.c
> +++ b/drivers/mfd/tps65090.c
> @@ -225,7 +225,7 @@ static int tps65090_i2c_probe(struct i2c_client *client)
>  
>  
>  static const struct i2c_device_id tps65090_id_table[] = {
> -	{ "tps65090" },
> +	{ .name = "tps65090" },
>  	{ }
>  };
>  
> diff --git a/drivers/mfd/tps65217.c b/drivers/mfd/tps65217.c
> index c240fac0ede7..cef5cefafea3 100644
> --- a/drivers/mfd/tps65217.c
> +++ b/drivers/mfd/tps65217.c
> @@ -390,7 +390,7 @@ static void tps65217_remove(struct i2c_client *client)
>  }
>  
>  static const struct i2c_device_id tps65217_id_table[] = {
> -	{"tps65217", TPS65217},
> +	{ .name = "tps65217", .driver_data = TPS65217 },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(i2c, tps65217_id_table);
> diff --git a/drivers/mfd/tps65218.c b/drivers/mfd/tps65218.c
> index 4f3e632f726f..d2d39bd7eddd 100644
> --- a/drivers/mfd/tps65218.c
> +++ b/drivers/mfd/tps65218.c
> @@ -336,8 +336,8 @@ static int tps65218_probe(struct i2c_client *client)
>  }
>  
>  static const struct i2c_device_id tps65218_id_table[] = {
> -	{ "tps65218", TPS65218 },
> -	{ },
> +	{ .name = "tps65218", .driver_data = TPS65218 },
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, tps65218_id_table);
>  
> diff --git a/drivers/mfd/tps6586x.c b/drivers/mfd/tps6586x.c
> index 8d5fe2b60bfa..88efe149e46b 100644
> --- a/drivers/mfd/tps6586x.c
> +++ b/drivers/mfd/tps6586x.c
> @@ -642,7 +642,7 @@ static SIMPLE_DEV_PM_OPS(tps6586x_pm_ops, tps6586x_i2c_suspend,
>  			 tps6586x_i2c_resume);
>  
>  static const struct i2c_device_id tps6586x_id_table[] = {
> -	{ "tps6586x" },
> +	{ .name = "tps6586x" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, tps6586x_id_table);
> diff --git a/drivers/mfd/tps65910.c b/drivers/mfd/tps65910.c
> index 6a7b7a697fb7..fb23d5ed1f26 100644
> --- a/drivers/mfd/tps65910.c
> +++ b/drivers/mfd/tps65910.c
> @@ -518,8 +518,8 @@ static int tps65910_i2c_probe(struct i2c_client *i2c)
>  }
>  
>  static const struct i2c_device_id tps65910_i2c_id[] = {
> -       { "tps65910", TPS65910 },
> -       { "tps65911", TPS65911 },
> +       { .name = "tps65910", .driver_data = TPS65910 },
> +       { .name = "tps65911", .driver_data = TPS65911 },
>         { }
>  };
>  
> diff --git a/drivers/mfd/tps65912-i2c.c b/drivers/mfd/tps65912-i2c.c
> index 138e50497b51..3eca8880532e 100644
> --- a/drivers/mfd/tps65912-i2c.c
> +++ b/drivers/mfd/tps65912-i2c.c
> @@ -43,7 +43,7 @@ static int tps65912_i2c_probe(struct i2c_client *client)
>  }
>  
>  static const struct i2c_device_id tps65912_i2c_id_table[] = {
> -	{ "tps65912" },
> +	{ .name = "tps65912" },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(i2c, tps65912_i2c_id_table);
> diff --git a/drivers/mfd/twl-core.c b/drivers/mfd/twl-core.c
> index f89eda4a17fe..2e42030e5198 100644
> --- a/drivers/mfd/twl-core.c
> +++ b/drivers/mfd/twl-core.c
> @@ -926,17 +926,17 @@ static int __maybe_unused twl_resume(struct device *dev)
>  static SIMPLE_DEV_PM_OPS(twl_dev_pm_ops, twl_suspend, twl_resume);
>  
>  static const struct i2c_device_id twl_ids[] = {
> -	{ "twl4030", TWL4030_VAUX2 },	/* "Triton 2" */
> -	{ "twl5030", 0 },		/* T2 updated */
> -	{ "twl5031", TWL5031 },		/* TWL5030 updated */
> -	{ "tps65950", 0 },		/* catalog version of twl5030 */
> -	{ "tps65930", TPS_SUBSET },	/* fewer LDOs and DACs; no charger */
> -	{ "tps65920", TPS_SUBSET },	/* fewer LDOs; no codec or charger */
> -	{ "tps65921", TPS_SUBSET },	/* fewer LDOs; no codec, no LED
> -					   and vibrator. Charger in USB module*/
> -	{ "twl6030", TWL6030_CLASS },	/* "Phoenix power chip" */
> -	{ "twl6032", TWL6030_CLASS | TWL6032_SUBCLASS }, /* "Phoenix lite" */
> -	{ /* end of list */ },
> +	{ .name = "twl4030", .driver_data = TWL4030_VAUX2 },	/* "Triton 2" */
> +	{ .name = "twl5030", .driver_data = 0 },		/* T2 updated */
> +	{ .name = "twl5031", .driver_data = TWL5031 },		/* TWL5030 updated */
> +	{ .name = "tps65950", .driver_data = 0 },		/* catalog version of twl5030 */
> +	{ .name = "tps65930", .driver_data = TPS_SUBSET },	/* fewer LDOs and DACs; no charger */
> +	{ .name = "tps65920", .driver_data = TPS_SUBSET },	/* fewer LDOs; no codec or charger */
> +	{ .name = "tps65921", .driver_data = TPS_SUBSET },	/* fewer LDOs; no codec, no LED
> +						   and vibrator. Charger in USB module*/
> +	{ .name = "twl6030", .driver_data = TWL6030_CLASS },	/* "Phoenix power chip" */
> +	{ .name = "twl6032", .driver_data = TWL6030_CLASS | TWL6032_SUBCLASS }, /* "Phoenix lite" */
> +	{ /* end of list */ }
>  };
>  
>  /* One Client Driver , 4 Clients */
> diff --git a/drivers/mfd/twl6040.c b/drivers/mfd/twl6040.c
> index 562a0f939f6e..ed2a2cca8cb9 100644
> --- a/drivers/mfd/twl6040.c
> +++ b/drivers/mfd/twl6040.c
> @@ -817,8 +817,8 @@ static void twl6040_remove(struct i2c_client *client)
>  }
>  
>  static const struct i2c_device_id twl6040_i2c_id[] = {
> -	{ "twl6040" },
> -	{ "twl6041" },
> +	{ .name = "twl6040" },
> +	{ .name = "twl6041" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, twl6040_i2c_id);
> diff --git a/drivers/mfd/wm831x-i2c.c b/drivers/mfd/wm831x-i2c.c
> index 9bee007f9c99..5a093086021a 100644
> --- a/drivers/mfd/wm831x-i2c.c
> +++ b/drivers/mfd/wm831x-i2c.c
> @@ -72,13 +72,13 @@ static int wm831x_i2c_poweroff(struct device *dev)
>  }
>  
>  static const struct i2c_device_id wm831x_i2c_id[] = {
> -	{ "wm8310", WM8310 },
> -	{ "wm8311", WM8311 },
> -	{ "wm8312", WM8312 },
> -	{ "wm8320", WM8320 },
> -	{ "wm8321", WM8321 },
> -	{ "wm8325", WM8325 },
> -	{ "wm8326", WM8326 },
> +	{ .name = "wm8310", .driver_data = WM8310 },
> +	{ .name = "wm8311", .driver_data = WM8311 },
> +	{ .name = "wm8312", .driver_data = WM8312 },
> +	{ .name = "wm8320", .driver_data = WM8320 },
> +	{ .name = "wm8321", .driver_data = WM8321 },
> +	{ .name = "wm8325", .driver_data = WM8325 },
> +	{ .name = "wm8326", .driver_data = WM8326 },
>  	{ }
>  };
>  
> diff --git a/drivers/mfd/wm8350-i2c.c b/drivers/mfd/wm8350-i2c.c
> index 767c176b12a7..b20761a88b05 100644
> --- a/drivers/mfd/wm8350-i2c.c
> +++ b/drivers/mfd/wm8350-i2c.c
> @@ -41,9 +41,9 @@ static int wm8350_i2c_probe(struct i2c_client *i2c)
>  }
>  
>  static const struct i2c_device_id wm8350_i2c_id[] = {
> -	{ "wm8350" },
> -	{ "wm8351" },
> -	{ "wm8352" },
> +	{ .name = "wm8350" },
> +	{ .name = "wm8351" },
> +	{ .name = "wm8352" },
>  	{ }
>  };
>  
> diff --git a/drivers/mfd/wm8400-core.c b/drivers/mfd/wm8400-core.c
> index 8ecfe878a5ba..1c0ba450ef9b 100644
> --- a/drivers/mfd/wm8400-core.c
> +++ b/drivers/mfd/wm8400-core.c
> @@ -135,7 +135,7 @@ static int wm8400_i2c_probe(struct i2c_client *i2c)
>  }
>  
>  static const struct i2c_device_id wm8400_i2c_id[] = {
> -       { "wm8400" },
> +       { .name = "wm8400" },
>         { }
>  };
>  
> diff --git a/drivers/mfd/wm8994-core.c b/drivers/mfd/wm8994-core.c
> index 094c0b3dbd97..903d7070dbe5 100644
> --- a/drivers/mfd/wm8994-core.c
> +++ b/drivers/mfd/wm8994-core.c
> @@ -643,10 +643,10 @@ static void wm8994_i2c_remove(struct i2c_client *i2c)
>  }
>  
>  static const struct i2c_device_id wm8994_i2c_id[] = {
> -	{ "wm1811", WM1811 },
> -	{ "wm1811a", WM1811 },
> -	{ "wm8994", WM8994 },
> -	{ "wm8958", WM8958 },
> +	{ .name = "wm1811", .driver_data = WM1811 },
> +	{ .name = "wm1811a", .driver_data = WM1811 },
> +	{ .name = "wm8994", .driver_data = WM8994 },
> +	{ .name = "wm8958", .driver_data = WM8958 },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, wm8994_i2c_id);
> 
> base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
> prerequisite-patch-id: 7779c63f16ef6f7247cdb71c89e66b27e299eb74
> prerequisite-patch-id: 6f920b6f8c31dc0ad1689200c37680755c20ce8b
> prerequisite-patch-id: 1fd68e883664147052540eea19769ea9e92d0138
> prerequisite-patch-id: fff07090df18a39a361bbb091a3f17223b4606b4
> prerequisite-patch-id: a935aab66aa9896437ab9d757ef9fdc859d22495
> prerequisite-patch-id: d0d54f7acecd560cdeb6ea0c0e5ae77a50695d68
> prerequisite-patch-id: d7876560b3bb9b05ac462d0a9b09b50efeb9b5e1
> prerequisite-patch-id: 65531f0504ac1885c6c4ed6be0e6a206a9795d5b
> prerequisite-patch-id: ec83e7e18d66da9ca677b5c8180a22bf3717c8fb
> prerequisite-patch-id: e33193d1a91f5819128db924c080caf1c5198667
> prerequisite-patch-id: c8862be402a445f30b9f5c91b07afdc840e7e21f
> prerequisite-patch-id: 33c001d1b8ecaf57ebe53c321d82d671bc82b647
> prerequisite-patch-id: a59a578f49eb5147623aab9fdcacba405b9c8353
> prerequisite-patch-id: 5eef512b8a5a1ec1848a939928168dbb719ca72e
> prerequisite-patch-id: 04746bfdfe146af71d0c41e225978fb42ce977f5
> prerequisite-patch-id: f8aeb0b768ae718aa0dab188fbad671aa4c76501
> prerequisite-patch-id: 8e0b48a5d5f8bb91933d440eda8f065590e5ca97
> prerequisite-patch-id: 5ca261e980415013434edc099b6f741b7a96c7a8
> prerequisite-patch-id: 912c3a7f7fa847c59d499e004965b805a63c8836
> -- 
> 2.47.3
> 

-- 
Lee Jones


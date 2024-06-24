Return-Path: <linux-renesas-soc+bounces-6673-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 810E0914181
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 06:57:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F4E71F218D2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 04:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E73BF10A3E;
	Mon, 24 Jun 2024 04:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="HfxGxzdd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504CE10A1E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jun 2024 04:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719205016; cv=none; b=NvK8uS2JKoYYC/Eb3JA8VrxPJKYZotpaqOHXHgs2Eypws2GI0lVRxFHm/zI2hgyT6k92yGocoZr5tbbDUguMy6a/Y7R4WSsaANR4/a68naXg9MY/yj8SDmTWst4eHco5qcBwxWJLiLr+u8bTwiXYriC9+inqb4+LykJ8CjQSawY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719205016; c=relaxed/simple;
	bh=vQNVTetRhtLL6F7YslSbOHAhs1Pv0RWIieQe3P1Be+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aOPBX+BgGCCIKkP7r7RXF3/bQMUNfi6+HtePqfRo6gLlCnDLBLqFpUfIRYtAcT/RrWxz0H8cs2WYp5wWYTVSR+wgn8jcxDrm6dkCfEkbG5UGIzZe/XHYkH8DgxJ5K/iuWAYupJfvGth8Xtkp+1UHqwob4fpV0sRxQQsw54/mNiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=HfxGxzdd; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ebeefb9a6eso41907981fa.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 23 Jun 2024 21:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1719205013; x=1719809813; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SsRCBcTH1uEJj0sj9Ql+zGgoMf4mCrb7QZgSphU4FDk=;
        b=HfxGxzddoE0c0o7t0WrJ5PavlHVjlBt11QBQbirIn+SN5P04F6sT/FzDnoD/GwgriY
         K4v0K393Loq6gQxAPDl7NEIyizShchRo6M4tAVsVuFlJG/7692ObGti18jKG4ttMD6rj
         MWD24BjKwXHzArukLxZsEmZ8OX97omVqOvW4d4as5xOgblhh5C1MZLHrCFgTZraxg0Rm
         KKeKoc7yHSp9vWeNnQ9L9tMptw+oBE4SEuMbBuiUNoPz36rowZGPNLyqzsg98ELIuTVB
         qGNF55iMelqJ0e0wBMMSnE17yPK+xISxry3ReXEEdRBqZdUhIVMzshsg+0DZWTtpuIoo
         qsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719205013; x=1719809813;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SsRCBcTH1uEJj0sj9Ql+zGgoMf4mCrb7QZgSphU4FDk=;
        b=igY7p1kZixeCPdUADPPA35wsyBgKjiQRNMb+M/ZlaTu89CYy+d73DoHz5VPmzB579E
         IoTnwcg/o/H0aa5PHUVh3K5u28q/+Jlhy91rTRy7l4qDGakfp3dh3RawtSZViXzJtB8K
         HNDg6ZD9u+VjnrklJv8TAXwr8oMS31GEvyMwVrKKUy+oGrBbhz4PYNBh0j/8ddNiudna
         Pb+82cCQjkO7ZkHWJZG4CiKTI5hSna937lxGFUxS9XPSubFNsgHHXCf7aJS/eb3AD0zS
         a0uxq65Wf3qEMkSYayLnvw9lzQPH/E4n7KQUCdmFlPJeuL1nJeQG3MA3T3Uv9RqXj/IU
         PRFg==
X-Gm-Message-State: AOJu0Ywt45SWIU3WE3Hrm9AGZB8Cy1zXQoUzr3tk2RjHA/QYmyOAlSoL
	kL1e0RgLYmD4aj8VQYVn8h20y9XzN8vy6d277BXfXRb/pYkRdI202Vsf4FmdDP8=
X-Google-Smtp-Source: AGHT+IHyBzk2CXG4/Qhw8e+uhBRG0J+M+VYIbsPIi8pyPckrwMs/nV4rQV2Emc4LsJMK0lOMIkSQiA==
X-Received: by 2002:a2e:95d4:0:b0:2ec:40ab:694d with SMTP id 38308e7fff4ca-2ec593be836mr23803111fa.1.1719205013392;
        Sun, 23 Jun 2024 21:56:53 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.70])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d303d7aecsm4209761a12.20.2024.06.23.21.56.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Jun 2024 21:56:52 -0700 (PDT)
Message-ID: <10afc62d-b58a-499f-9cc4-ba8905cece64@tuxon.dev>
Date: Mon, 24 Jun 2024 07:56:51 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] pinctrl: renesas: rzg2l: Update PIN_CFG_MASK() macro
 to be 32-bit wide
Content-Language: en-US
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240618174831.415583-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240618174831.415583-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240618174831.415583-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 18.06.2024 20:48, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Modify the `PIN_CFG_MASK()` macro to be 32-bit wide. The current maximum
> value for `PIN_CFG_*` is `BIT(21)`, which fits within a 32-bit mask.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

> ---
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> index 32945d4c8dc0..bfaeeb00ac4a 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -89,7 +89,7 @@
>  
>  #define PIN_CFG_PIN_MAP_MASK		GENMASK_ULL(62, 55)
>  #define PIN_CFG_PIN_REG_MASK		GENMASK_ULL(54, 47)
> -#define PIN_CFG_MASK			GENMASK_ULL(46, 0)
> +#define PIN_CFG_MASK			GENMASK_ULL(31, 0)
>  
>  /*
>   * m indicates the bitmap of supported pins, a is the register index
> @@ -1187,7 +1187,7 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
>  	u64 *pin_data = pin->drv_data;
>  	unsigned int arg = 0;
>  	u32 off;
> -	u64 cfg;
> +	u32 cfg;
>  	int ret;
>  	u8 bit;
>  
> @@ -1322,7 +1322,7 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
>  	u64 *pin_data = pin->drv_data;
>  	unsigned int i, arg, index;
>  	u32 off, param;
> -	u64 cfg;
> +	u32 cfg;
>  	int ret;
>  	u8 bit;
>  
> @@ -2755,9 +2755,9 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rzg2l_pinctrl *pctrl, bool suspen
>  
>  	for (u32 port = 0; port < nports; port++) {
>  		bool has_iolh, has_ien;
> -		u64 cfg, caps;
> +		u32 off, caps;
>  		u8 pincnt;
> -		u32 off;
> +		u64 cfg;
>  
>  		cfg = pctrl->data->port_pin_configs[port];
>  		off = RZG2L_PIN_CFG_TO_PORT_OFFSET(cfg);
> @@ -2801,7 +2801,7 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rzg2l_pinctrl *pctrl, bool suspen
>  static void rzg2l_pinctrl_pm_setup_dedicated_regs(struct rzg2l_pinctrl *pctrl, bool suspend)
>  {
>  	struct rzg2l_pinctrl_reg_cache *cache = pctrl->dedicated_cache;
> -	u64 caps;
> +	u32 caps;
>  	u32 i;
>  
>  	/*


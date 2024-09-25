Return-Path: <linux-renesas-soc+bounces-9053-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C64986498
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Sep 2024 18:16:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B46CBB2403E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Sep 2024 15:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3453D79C4;
	Wed, 25 Sep 2024 15:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="DbwS6BrZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4731D5AA9
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Sep 2024 15:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727278720; cv=none; b=R1VlzOKJYFKi+lNI0omXzkLEzcnwr3nRKiN9q85LWFBl3bdaGduHqVTD4rmRyz5ao26xtDQAHo/xAtuUrc8FJz/SJrE3Eo1bTx7xwBFH/V56RMAPCD5G0LaraK9a4XcXc8HgEcj5BhJPruydWQmmbUJZ9xSkEp3TOiPoKt4xzl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727278720; c=relaxed/simple;
	bh=Ppgu3Ihbk/CmVOQL+/gsAa1aI2YarJnQiUihXQNZPwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aybod7DaQcZNrBIVzysfqnVXbYR9Hx6zfCTH1JuNrtx8y7hu1aXy8aff4PyJy64xt/Ce5TB/iGtFNaguo3yOyHwRepO4/zjfFuK6NjshBweakC9WPa6ubPswlHMmDGM1CewqRCD3+mk/hyVx6fRZy1W11pYs14HsbU5pXZUIm3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=DbwS6BrZ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42cc8782869so65741035e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Sep 2024 08:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727278716; x=1727883516; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gleAVhem5eHU5K/a+/j+vn/FuUaf5+HzHEW7eiV/4EU=;
        b=DbwS6BrZZwEluaGA82+Q2fOiY3SVeepTqeJ6XQ2hNJW6UJwqFbGfHt4nNBpMJsHQrQ
         BHwEFmPcB/PKCanYa8pmt4mSI2kbF9vbtMDxt8ABTcFiM+cNWyyQqJinctdsfTzt8WiH
         04i6sL3uwwrzocjVqBkchdYqyzQ3fsBB7VtgvEVBq413ctg7V0yBGlwCuAwxbDqR52Td
         WB+0MNyKX19npXLuXlsCesKXFZYznELCp4gW2ksAH4gWmOfMOzWIw0GLLT+5xaDmy3R+
         asyVq0yQp5TcyJCLhb0SpWgVtdCkH1Fmpk/ZPTnWnslk9MO4E+wlhYeBRBlgQ2b3Fvx9
         a+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727278716; x=1727883516;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gleAVhem5eHU5K/a+/j+vn/FuUaf5+HzHEW7eiV/4EU=;
        b=XUnLDBsmoU3oQsL/DYnTQjRFulNhcdfXP6Vqgxc1750UuK4colBe0s/ue3USIiXW8v
         S0N25l4bs/j84IZOyy+c7Xno0mfruBzz/mr1c8C0dSCpVOa4yYZZzovXBz29TlcXWReG
         yIU8f8X6fn8wsHLHNqfEA7h/debgDdjrRd+Gd7SEkZOEoiZEHpzlUZ5cfOOdcGGmm50q
         ObzPz2hQLcqbZU+kktirnhsm9BKpeZzh9bJGF6uwZZqXz9DAZIMSxuvx0aY4RMa+HDW+
         k0EAgbb6N1JMvJFtiRvjuhxjV8GgjvCsaYuksZ0q1kEDf9pp0OJbEC0PdRKndCVeAgdT
         ueZw==
X-Forwarded-Encrypted: i=1; AJvYcCXhEQNLyMGYHntT7HQH4l8yOEznraOhwszIXjvBX07m4GtUCnHvfOUrOWtRJKbAVwdJvg1ccozI7dEyig/9+U2qrw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzP9Ypv86nWlqPwA19UdTP7CR8wAJOi1fKHS/LGeTx+pyDuMpW2
	VzwdtoorxSLUqZU0Swolb/6GDoetkKIejE5COvGpBfBJjITuKVq8W2VyOVo4NHU=
X-Google-Smtp-Source: AGHT+IG69kh5nH1IoPNONMBg4amKCyNKha9peszSwtvOlvHTYEFk1DLmAVqNiZgxQiaytt2s3JOQXg==
X-Received: by 2002:a05:600c:1e27:b0:42c:acb0:dda5 with SMTP id 5b1f17b1804b1-42e9610182cmr23057525e9.1.1727278715724;
        Wed, 25 Sep 2024 08:38:35 -0700 (PDT)
Received: from localhost (amontpellier-556-1-151-252.w109-210.abo.wanadoo.fr. [109.210.7.252])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e969fb822sm22430665e9.14.2024.09.25.08.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 08:38:35 -0700 (PDT)
Date: Wed, 25 Sep 2024 17:38:34 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, linux-pwm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH v21 3/4] pwm: Add support for RZ/G2L GPT
Message-ID: <slpywmbmamr4kw4jg2vyydheop44ioladvvm52aocnojgjkcsy@3eoztwsej5mn>
References: <20240808131626.87748-1-biju.das.jz@bp.renesas.com>
 <20240808131626.87748-4-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k35xue77xwzp4foo"
Content-Disposition: inline
In-Reply-To: <20240808131626.87748-4-biju.das.jz@bp.renesas.com>


--k35xue77xwzp4foo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Biju,

just a few minor issues left---see below ...

On Thu, Aug 08, 2024 at 02:16:19PM +0100, Biju Das wrote:
> +static int rzg2l_gpt_request(struct pwm_chip *chip, struct pwm_device *pwm)
> +{
> +	struct rzg2l_gpt_chip *rzg2l_gpt = to_rzg2l_gpt_chip(chip);
> +	u32 ch = RZG2L_GET_CH(pwm->hwpwm);
> +
> +	mutex_lock(&rzg2l_gpt->lock);
> +	rzg2l_gpt->user_count[ch]++;
> +	mutex_unlock(&rzg2l_gpt->lock);

Please consider using guard(mutex)(&rzg2l_gpt->lock);

> +
> +	return 0;
> +}
> +
> [...]
> +static u32 rzg2l_gpt_calculate_pv_or_dc(u64 period_or_duty_cycle, u8 prescale)
> +{
> +	return min_t(u64, (period_or_duty_cycle + (1 << (2 * prescale)) - 1) >> (2 * prescale),
> +		     U32_MAX);
> +}

Hmm, why does this round up? This is used during .apply() and converts a
nanosecond value to a register value. This should be rounded down. What
am I missing? (Maybe a code comment with an explanation :-)

> [...]
> +static int rzg2l_gpt_apply(struct pwm_chip *chip, struct pwm_device *pwm,
> +			   const struct pwm_state *state)
> +{
> +	struct rzg2l_gpt_chip *rzg2l_gpt = to_rzg2l_gpt_chip(chip);
> +	bool enabled = pwm->state.enabled;
> +	int ret;
> +
> +	if (state->polarity != PWM_POLARITY_NORMAL)
> +		return -EINVAL;
> +
> +	/*
> +	 * Probe() sets bootloader_enabled_channels. In such case,

.probe() ?

> +	 * clearing the flag will avoid errors during unbind.
> +	 */
> +	if (enabled && rzg2l_gpt->bootloader_enabled_channels[pwm->hwpwm])
> +		rzg2l_gpt->bootloader_enabled_channels[pwm->hwpwm] = false;

Hmm, not 100% sure, but I think if rzg2l_gpt_config() below fails,
cleaning this flag is wrong.

Does rzg2l_gpt->bootloader_enabled_channels[pwm->hwpwm] == true imply
enabled == true? If so, the if condition can be simplified to just the
right hand side of the &&. Then even an unconditional assignment works,
because

	rzg2l_gpt->bootloader_enabled_channels[pwm->hwpwm] = false;

is a nop if the flag is already false.

> +	if (!state->enabled) {
> +		if (enabled) {
> +			rzg2l_gpt_disable(rzg2l_gpt, pwm);
> +			pm_runtime_put_sync(pwmchip_parent(chip));
> +		}
> +
> +		return 0;
> +	}
> +
> +	if (!enabled) {
> +		ret = pm_runtime_resume_and_get(pwmchip_parent(chip));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	mutex_lock(&rzg2l_gpt->lock);
> +	ret = rzg2l_gpt_config(chip, pwm, state);
> +	mutex_unlock(&rzg2l_gpt->lock);
> +	if (!ret && !enabled)
> +		ret = rzg2l_gpt_enable(rzg2l_gpt, pwm);
> +
> +	return ret;
> +}
> +
> [...]
> +
> +static int rzg2l_gpt_probe(struct platform_device *pdev)
> +{
> +	struct rzg2l_gpt_chip *rzg2l_gpt;
> +	struct device *dev = &pdev->dev;
> +	struct reset_control *rstc;
> +	struct pwm_chip *chip;
> +	unsigned long rate;
> +	struct clk *clk;
> +	int ret;
> +	u32 i;
> +
> +	chip = devm_pwmchip_alloc(dev, RZG2L_MAX_PWM_CHANNELS, sizeof(*rzg2l_gpt));
> +	if (IS_ERR(chip))
> +		return PTR_ERR(chip);
> +	rzg2l_gpt = to_rzg2l_gpt_chip(chip);
> +
> +	rzg2l_gpt->mmio = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(rzg2l_gpt->mmio))
> +		return PTR_ERR(rzg2l_gpt->mmio);
> +
> +	rstc = devm_reset_control_get_exclusive(dev, NULL);
> +	if (IS_ERR(rstc))
> +		return dev_err_probe(dev, PTR_ERR(rstc), "get reset failed\n");
> +
> +	clk = devm_clk_get(dev, NULL);

Please use devm_clk_get_enabled() here. Otherwise the result of
clk_get_rate() isn't well-defined.

> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk), "cannot get clock\n");
> +
> +	ret = reset_control_deassert(rstc);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "cannot deassert reset control\n");
> +
> +	ret = devm_add_action_or_reset(dev, rzg2l_gpt_reset_assert, rstc);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return ret;
> [...]

Best regards
Uwe

--k35xue77xwzp4foo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmb0LncACgkQj4D7WH0S
/k7hwQf/eCYFblVI0c19ckmdIczjcp5bFj6Hq+IeNC3w/eTLFIRUXUKVOPBTDbyk
pgyXz/4iToVM+sXLoWoyzIEaRMPkFpu1QFMUdlXOYbXSLXJ5JTGp0boyzYEhcdVj
GFBZM51V6R2a1bzJm4wBKQIOUJnKH3QYEIfTZLx2IyJtEDfHYBStMRbalvzMLk0a
Z1tBtHSz6GrIb7+0ktlMEQvDLSSQwuwXHU5rp51pwCYRux1+ziTbp76IcO4TUKui
u7bIAI5TRTvDB7CKLw5TTP0v+Zn9ltcGwCSQaGARluxmV7sMj2GCyx7p+Z8H4JFp
lcYNgvDEgdrEn5vGYZVUHAkwJ74ZQw==
=DkrE
-----END PGP SIGNATURE-----

--k35xue77xwzp4foo--


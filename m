Return-Path: <linux-renesas-soc+bounces-8213-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AF895EC4B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 10:46:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 712801F2111E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 08:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DCF713BC35;
	Mon, 26 Aug 2024 08:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="akfXGzOA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B472782D70
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Aug 2024 08:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724661993; cv=none; b=bk0IrEW+KCWgMEotGaHN6ecdjNdnCqtk6Sp2A3lzBuyGCJFprPoC08TB3/PFLdoQEy2CIBH3ioqtQAkzsISe0YxN+0AkLa3F1CejaFKHbBfx3cug7YVPiC5JolHFbL1Bnph6iFF1plqgHxe5iW4sCf83OaJY2LCMLXr+UU48gTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724661993; c=relaxed/simple;
	bh=jRoGc8zZH4oC05abOb5eEX0kRMeyafNXbYdYJflymmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aNjn0F+KE9crWYtmQhGnP5s9hC6Xnaj0AIkoWJomo5/8BJMelA05C5tbCEksEhW5jYlh8frq/4SRYtnUIAMKAy0+IH3E7OEb065n8Qw3XfeJ/GCK1vf3xqw0606ceLjGVdpPyvu+0E1pleWCGDKtJZhPz1NeJYxkXzTpfS0sDBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=akfXGzOA; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f50f1d864fso4289521fa.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Aug 2024 01:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724661989; x=1725266789; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jRoGc8zZH4oC05abOb5eEX0kRMeyafNXbYdYJflymmE=;
        b=akfXGzOACYv1vaXfxF9H4LBBq05lTfO384/4Rgu678ZMsDHKAzcYMtfD3WvTt/fCWG
         UXEsg/HQ4iqw0MPuuUnM1MFu5BE8PpcgKsc1CyzYEULseNRrvQwqJdDtAbZUDLPXGD6u
         G2wrTlS5kQpVoh1ygWsIF68u6S6ZO3oVkiJFXrLpdsAXXb27JkNVTFseJKvaci/k6zTA
         WwCdWEIQX6f2a2+uBxrTZYOcelRA740+vQ2pdmH+WdWpuNQiixYDYuOmuhfUJTjNc2rK
         duc1gSbRJY/C9bhAjViG+yIHZDH3ZaU+LUGDSggNbBzPF2ZWp9WHzGclUWKrJf89ZFi/
         adoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724661989; x=1725266789;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jRoGc8zZH4oC05abOb5eEX0kRMeyafNXbYdYJflymmE=;
        b=WzAb4YsAHXdJG3C9ahtT7BHmM+lHz4RYN2NBxEiK6d33MJf3F5ixEFqr1IzKuxEFJN
         UwZuMCoYfH5N7A2y9Obu1BER4EExFFTQ9P69fXHYoGeS08dtOxoJCK48Esz7Pres/RJc
         mKRtZH8gb0I5E2Rw1+yj8rU0CSPrP3/OPxRHZbDsvagYnvAr9wOMDrFyY5uuyYl54Fx3
         ZcK5mrdaS5V6bMlNuu1k0K6T7iOxIuJoN54YAulmb8G0JsDDkC+/9MdwjKRXAgHd/3e3
         KZnJ3DkQSwMV5CQkg7Eaq43QTMBHVFj/L/ukIBKG/pmtP78Y3YbuulNvNNnBC/7hhIjd
         QPRg==
X-Forwarded-Encrypted: i=1; AJvYcCW+dsQ3YJxaDRr4okUtUChsGinkAAGYyACB5pOs/FXqiYbvCWm3ZFwDm0hU0ldNyuxKfOBXTn+84q3Lymhr5FQYCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKLB/yJHNbrtHeIKyJXrCAMXry0qMs0TTQJuihtYzAmEPo+UxT
	8EocXJDdVnRqLJ1nV6QupEBYME0iG38hDDSfuDDhrJRFMEXCnG/qXB/vvV96i0ag22ZENGnh6DC
	qd0ouZd7mSMwln7TXM5Q4N/jGeXrfCtwYPDgoLg==
X-Google-Smtp-Source: AGHT+IEAKix9avOZKhj3gUarttYPt1B5mxGGiNfGvZNqelGRoDbFczqf/+RGYgGgaLwvWmb22Hq7c+MIRiChzBxFm/8=
X-Received: by 2002:a05:6512:280c:b0:530:ab68:25e6 with SMTP id
 2adb3069b0e04-53438861474mr7188396e87.48.1724661989086; Mon, 26 Aug 2024
 01:46:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240823072122.2053401-1-frank.li@vivo.com> <20240823072122.2053401-4-frank.li@vivo.com>
In-Reply-To: <20240823072122.2053401-4-frank.li@vivo.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 26 Aug 2024 10:46:17 +0200
Message-ID: <CACRpkdb0rwN1YxF10MQDkVX1QoYTWot+heOJp4RodAtniCOdsA@mail.gmail.com>
Subject: Re: [net-next v2 3/9] net: ethernet: cortina: Convert to devm_clk_get_enabled()
To: Yangtao Li <frank.li@vivo.com>
Cc: clement.leger@bootlin.com, andrew@lunn.ch, f.fainelli@gmail.com, 
	olteanv@gmail.com, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, ulli.kroll@googlemail.com, marcin.s.wojtas@gmail.com, 
	linux@armlinux.org.uk, alexandre.torgue@foss.st.com, joabreu@synopsys.com, 
	mcoquelin.stm32@gmail.com, hkallweit1@gmail.com, kees@kernel.org, 
	justinstitt@google.com, u.kleine-koenig@pengutronix.de, horms@kernel.org, 
	sd@queasysnail.net, linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 9:06=E2=80=AFAM Yangtao Li <frank.li@vivo.com> wrot=
e:

> Convert devm_clk_get(), clk_prepare_enable() to a single
> call to devm_clk_get_enabled(), as this is exactly
> what this function does.
>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij


Return-Path: <linux-renesas-soc+bounces-24264-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC58C3C1D8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 06 Nov 2025 16:40:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E9AD1AA6329
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Nov 2025 15:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1564129CB3C;
	Thu,  6 Nov 2025 15:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="mtvz5v52"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0237D29BD9E
	for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Nov 2025 15:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762443633; cv=none; b=IPgtDHB4D3D9Q4kiGM0yBgar19aKRL+X2M2k42lwoQdTYblGrQEq7PGrew8/vI54D6U3AHQRkTRjB/ihown7jIAQQMS8hRFjN/nWsmNOAPfbKDbBpGQfzVji/Z59aBhpHUZVV4gKgcJUXuA7wwvC5HId/GnQTK2c77cvaT0ZztQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762443633; c=relaxed/simple;
	bh=bPYWoT/GHriiQOAtYqZ8RIEg/mdLe3X0Fy0Cau6Ehaw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cTLbRvCvYOuwtyuHCkUbWMsClW860lhWmi+OB78MwdEfnzCyKscFLahf3Gg97q0kDl+6qibfnD1yBWEQqquOOeXYYZtLN28Pb/gNHLylx7yUK3TO8M6hSN1KHvYvznV/P2eTKLmauENxvaUXzr/dGTIY0/WRIGWrG5dOpQs3++E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=mtvz5v52; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-429b72691b4so925118f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Nov 2025 07:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1762443629; x=1763048429; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q1Wk3Zb6iHABuxMtqYWJQhotr9eHGE3DttWEmz8jd9g=;
        b=mtvz5v52aKC7EZ6exceptOGN/yR8gwoXsD6+ODVzB9kwg3a747NB7nAIIRkFLLuLQR
         XBcjKQN5CZNpKd1ZcguBqMiX2nSvC0Z1oG4hopafKH8vJx+eI4zGuJAJwrSH9ktm9bUP
         ef5TD6xf7LgbjHen8vXyrF1x4MZh1P2Rn6KmzqAaAkc2ej7h2JXr9LBezDKJBzCJWyb/
         kLk8+T9ZGQe0OQH6XEgJfMkwIarLnluWJZ4U2rBWJ/A9Cu8+7CHNuyhqwbPZS+Pgd3lb
         Lp2qBmseBwR7R4lAID9txgDYo+nALkyWLvigN2v5GkBKoQN4Y1Ocwb6z5ztpSHoMdW0J
         FBlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762443629; x=1763048429;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q1Wk3Zb6iHABuxMtqYWJQhotr9eHGE3DttWEmz8jd9g=;
        b=YRs85dqEmu2rcKhWzY4RMZR6Ayx/dv3V5GfcasaLsBGKTvVMopgAJe6qxo/vryEVTE
         0DXMWSxu+/QbQ1wu3pj9Ugtm6b+yEYe2W79MrMHh1E+nfbn5JxuAFsXyTRGOSCe7n+F9
         eySIKUAaap1FxoRSCWa80QnmltcG8T8ZmpzDHyVns8NPoxJ6Zcehc4Zue0NFX7yoXAWp
         UKdb5LPqfUSwO2rRUeN/0KResfwutNBWQk7Le0EokYzaSmGQuHj3bwIjywgodxksC5kx
         WqIcYWWMiWCZF89Bdl5yVgG3D0L1kPnivF68NvzaCTtF20kiIlSs/gemPLAtX3P3dsFR
         2rOQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9r9H1u1wzGQizZ3AbL4FVyAU8SFd3PjHVRdJr/ryiiHSIaWY82F7+8/weCUs3FarhP77RfnoAfsvNb9izZrrokw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9WkginR6lvh1YvI/t8bL7aNuuOjjJZDLXsIkfSDtIXVqW49Fr
	kzhDIgCSUDyuoBUZNbcN+dQMHsRRMSie7FZPjdtjVkZ2b3ww3T+mOl0XhCIbiJBTTlc=
X-Gm-Gg: ASbGnctauQkmLzgckqUcggxHe1s7qzmkHuyMHt+CbB5xJz0efzOMSd7b1M4v1eeFz0L
	lqqqeWFfZ+aaD3Tqu+BBzU8guWL0F9lPESRh3ihirPDbTko2U7TBXDipMpmxx4xJP0vavADXOg+
	/bnZS9MfYUE4Cwi3PplaVKeAAghvuB5xn6EktEfCO6T1qvRWYfcr0QQtMPADNkb/SJmk8DmKIO7
	2PaGyFZzrYNQ1pSMbMmehRBNrwheLGdCVSqzh+SQaF1s6bnjTRmMwhae5YEzzXbvzpUNg6lliH1
	Ljo3oM335uG/ZXXv0KziETdm4KD0y54PZ21AiQPRfvZt8KbFdQ5pctjsQQPzNfizTjBGzR5MsYG
	qKwNHw15defZjwd6Edj9iN6OTjrgpNs3ai4wJ4BYvU9ZLbPHR89QHmD0NMr/BX4A3ir0f19GRw2
	YcAJD13YCRQR+pnD89GA0=
X-Google-Smtp-Source: AGHT+IFjpy8Et4z+rAreshTApQ1UnG8la7y5eDtsFm4fqVoBZudQUf3WRA0jtYYTZf5YlVXK7dWKmw==
X-Received: by 2002:a5d:5d0c:0:b0:3f7:b7ac:f3d2 with SMTP id ffacd0b85a97d-429e3309cc9mr7040773f8f.43.1762443629298;
        Thu, 06 Nov 2025 07:40:29 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429ec767edasm5003126f8f.43.2025.11.06.07.40.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 07:40:28 -0800 (PST)
Message-ID: <e0c8b161-3e08-48a0-89ef-8e0ea8b76672@tuxon.dev>
Date: Thu, 6 Nov 2025 17:40:24 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 21/26] soc: renesas: rz-sysc: Convert to common
 field_get() helper
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Yury Norov <yury.norov@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, David Miller
 <davem@davemloft.net>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Crt Mori <cmo@melexis.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Johannes Berg <johannes@sipsolutions.net>, Jakub Kicinski <kuba@kernel.org>,
 Alex Elder <elder@ieee.org>, David Laight <david.laight.linux@gmail.com>,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>, Jason Baron
 <jbaron@akamai.com>, Borislav Petkov <bp@alien8.de>,
 Tony Luck <tony.luck@intel.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Kim Seer Paller <kimseer.paller@analog.com>,
 David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Richard Genoud <richard.genoud@bootlin.com>,
 Cosmin Tanislav <demonsingur@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Jianping Shen <Jianping.Shen@de.bosch.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-edac@vger.kernel.org, qat-linux@intel.com, linux-gpio@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-iio@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1762435376.git.geert+renesas@glider.be>
 <ed045ec4db284ca8b4ec0c5b6ff334e459d14096.1762435376.git.geert+renesas@glider.be>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <ed045ec4db284ca8b4ec0c5b6ff334e459d14096.1762435376.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/6/25 15:34, Geert Uytterhoeven wrote:
> Drop the driver-specific field_get() macro, in favor of the globally
> available variant from <linux/bitfield.h>.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>


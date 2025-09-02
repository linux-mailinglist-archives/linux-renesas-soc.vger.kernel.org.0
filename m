Return-Path: <linux-renesas-soc+bounces-21226-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B227B40FEC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 00:18:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DA6CB7A141F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 22:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12CD9275B12;
	Tue,  2 Sep 2025 22:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tV1oCHyr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D6D26D4E2
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Sep 2025 22:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756851514; cv=none; b=Y7aRPARuugBzazUGLCXVJ2c5gnkfcvpW0urXZt5JNzxHPxaGdYrT76vjOpoWmTQ/IdeE8yRDCHdukVoWxxyoyO84VyU4CCeuMsll2yhcXbjWoEZTeTYgDwEwf84ZDVWRbeNKthaF1I0OIoY8Jv9OM0BfzVqHP5jSdN6V604F7Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756851514; c=relaxed/simple;
	bh=li67uZ6xqKQCADV810jgcapd5oaTXRr3DZZuD3FIP0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h9wlsSjXmEHki6X8ZtNc1TyeKIJop/Ha9WWAIBoKHbrNYXz8P0aFRh9FaLbil6x5nJc6vzz39BSVmn7u71q87tu8f9Sr21S1cTguQBC/mRnmdQL1KYbCQR2abgpdk2BcGM4hlX9NqSrmrNNz7QYhmz5vSlThqMkFan2dTigdEeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tV1oCHyr; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-55f6bb0a364so5096199e87.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Sep 2025 15:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756851510; x=1757456310; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=li67uZ6xqKQCADV810jgcapd5oaTXRr3DZZuD3FIP0o=;
        b=tV1oCHyrfYmjhrmPLH533BARsrpxRbaJMmIKMNpiBU+cBcoAjdS61zjvYBmxUNSWSE
         aLQlV49Fpv/lyTrHOgiCRClCVrQmVfAYwYrPsVja3Cz8n6w5wQljG6AStH2AXIaaAkWh
         357LGU4MIEiI1ubmGF0VLgK+FaxVBli9M0d3co6QlJKjUJrgHwHnL9NEZVuUznqwc9CP
         S+j1UgUlrXACUZa1nKRyhUNvDBnwf3uB1+8Wthz8opS0iYw7ry0PGN1Vq3T9FzCoyRaj
         PFlMqIw9ZZCGI6EFQ/qIAeNKWYnpnLly2XhKcY6P5fOUspO4X9L4qxrNK5K6r/0qV1ZY
         GXOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756851510; x=1757456310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=li67uZ6xqKQCADV810jgcapd5oaTXRr3DZZuD3FIP0o=;
        b=H32V7aQsl6yWqV8uCNSVIXsx1hKOVmrKOee/3eEhZiEX7TIAdgOxIhwLxPwI9SznuL
         K09EZIu7Oq4In+prN0S9AJTslYjIblXBMNvBwdQrZxeWlZ1l7aWqZ5W4pH28rnzVmILp
         rUyDhWOgfafa0CgsceFPrg+sniA2o4FIH3uFHYDdPH1wYLoCebeAWyO4rNq+hMjtowcA
         yxFFWJj9900U8aTYAja5llvMvizDB2XxoVpA7FHzeT6TC8PZiDD5VmtkkWbx5/Ymg859
         +4r+QeoptQHGtTOQkRKaOCiVxAId3WET9dsM4QsC/PeW6VI/Bl8jh0w58aFG0flbB407
         509A==
X-Forwarded-Encrypted: i=1; AJvYcCUWbgow+Nbj0GrYO0I4DhbIQre6ZJ7YwnEf4PnmnnyNpmAVJslaOGOSo563pW2UWuQTKa8EZh3YE2geEAffajXMhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8vRlaT26shPLBqEFkhis0+OcYgyLonh4REeYC2kcSjRpCRClX
	UYIWdtbLr2N+5M4OJxGf+a1aayxx5635FpuX2TtR8245dFgvISK4iLXBo5VxkBCa7N8qk3z9VXf
	MjU5Pb5xXPj4yYfg65tucKXG6Iy/mVp/UaIt7OzCUJw==
X-Gm-Gg: ASbGncupY57CO/3/+6AqieBXe9VuG9amF7UAo/2RIfNotIaCGR5gXXTzU062WhL2ZMd
	FcncU1gRzq4lQCNaEbkRb7M820/QAIigKD7BEpFnE4ak93oXTvXRkla8Sjjc8CHflN59bwHu7+q
	8MP8+tYNOQkOf/eS1s+lX3L2sGglcUynL3+N4MFTHTLcRLZ0aMODtsTbwBBrzW0kVgKGGPBC2Un
	Z27nh0ZNuH/ccHgsA==
X-Google-Smtp-Source: AGHT+IFb5FJ4SVuaW/MZYjqlxiCtjVdy/Gs9hCmULK5gWsYMbnHTDsvg0XfXKbqBDAFJs9xAYF0giEeS6uNYA+ao+FQ=
X-Received: by 2002:a05:6512:3d11:b0:55f:65fc:8db5 with SMTP id
 2adb3069b0e04-55f708b9c56mr3711945e87.23.1756851510074; Tue, 02 Sep 2025
 15:18:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
In-Reply-To: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 3 Sep 2025 00:18:18 +0200
X-Gm-Features: Ac12FXw-1tPuaZxU9kVS8RfwbL5AeZ_YF1A5IdRwoR4crjvnC6JAL_oHeKPOKoA
Message-ID: <CACRpkdZ-Toq9MziPisZCcT7zcL3rosQYZ1Jw=RWCH1KZTbeBug@mail.gmail.com>
Subject: Re: [PATCH v7 00/16] pinctrl: introduce the concept of a GPIO pin
 function category
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mm@kvack.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, stable@vger.kernel.org, 
	Chen-Yu Tsai <wenst@chromium.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 2, 2025 at 1:59=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> We have many Qualcomm SoCs (and I can imagine it's a common pattern in
> other platforms as well) where we mux a pin to "gpio" function using the
> `pinctrl-X` property in order to configure bias or drive-strength and
> then access it using the gpiod API. This makes it impossible to mark the
> pin controller module as "strict".
>
> This series proposes to introduce a concept of a sub-category of
> pinfunctions: GPIO functions where the above is not true and the pin
> muxed as a GPIO can still be accessed via the GPIO consumer API even for
> strict pinmuxers.

This is what I want for pin control, and fixes an ages old issue
that pin control has no intrinsic awareness of if a pin is muxed
to a function providing GPIO.
So patches applied!

Any remaining code nitpicks can be fixed in-tree, I need this
to be able to apply the much desired Broadcom STB driver,
so this needs to go into -next now for cooking.

I also want to strictify some drivers using this, bringing GPIO
function awareness into them, which is a good thing!

Yours,
Linus Walleij


Return-Path: <linux-renesas-soc+bounces-21136-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F44B3EE66
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Sep 2025 21:22:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E98F74881AC
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Sep 2025 19:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A23632A800;
	Mon,  1 Sep 2025 19:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="t900PpJz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601523081CB
	for <linux-renesas-soc@vger.kernel.org>; Mon,  1 Sep 2025 19:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756754558; cv=none; b=cuEkKfFQ6l4pJgrhVBCzwKLTUFoPvq8SkufU+reFm/r9xkZ+enJDGr9QJwFLp/bKjv9zUXnAOJ2J4vCWwJycsDfhvZLFSpQUckQSJOqqeZIKgkLvEF6YvS2UNEEauOojZ2td+Mw87bdyadYQoJSOblvXdJ8KE7M3MS740E3dXt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756754558; c=relaxed/simple;
	bh=bEgP0yvmX9KvAOyKB8kFlw77eqxGqe3qY7fzx2tEl08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FxBUSkclh65wnrA++W2TS2RV516z6p7pW+mmk+45KsBSMLDncMtjM2wtHT8IDeZCgk/GB7oJqAX58cXCGR1xjFBRcNH5ugSaW38gkaMz9FM0aOV7Amm0RTKzJ9/BPqhK5MMxnMmTF7cDo8YwjFX2+VQX56jnrL7HAD/qgI+sANA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=t900PpJz; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55f78f32580so1135087e87.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 01 Sep 2025 12:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756754554; x=1757359354; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i7ewcbrPHINPUvrYPT4zyhNXGIzXoRLTJHpyb8YY7mI=;
        b=t900PpJzwxzqo3Y1GxMEGOx/cIe6LnRWPfzvbNBzJxqMURjGzVgSFAzYzWdMr16D6U
         7W1w7wZZ0HJMoXPz7GyCCq/BsiYBWRPDcW5htfmxqYhnN8F6mlZGM+gEK1EdJOlHaYrJ
         WKsNWBvJa6cSDSWG5CJEPYfjCdeMTcxE8h6u8zH1OFaPbiqdpDWntKrdNsePjKoODtIN
         i7EjbzVPr6zp+ZOKNAovXYeyJnDfUoATQx54RbmBAOEuC4eAHvTFTxXZfPHolWh5NQFL
         8Sf+gNRnIGv0aTxL4C6dmSroWmqXlYsIh7L7kcBhqrOzxxF+2OV0DrALd7xXf64j3fDu
         MdQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756754554; x=1757359354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i7ewcbrPHINPUvrYPT4zyhNXGIzXoRLTJHpyb8YY7mI=;
        b=Fs8wGKZSb65nQOotmdznImHynOpe8GPRdRjDCJFtGRdlb8V8jXNvNngY7ixkNGYxf/
         s8U85dUw4A7jjOI4ioihbQyw2FqCQHetm+AgI3Z09qUPH1W5QYpSHXUlniEkm826Qimp
         wP5TE9HlQSCUJszIbdw0OAjJThR3j/Nm06GWIU6oTAxLjZmFa1rIa5/IMEmbQAuMH2dE
         MT0y31iwivBoA5MFjbtx1EspI9VtVrL6bm/PF8TnOLvVcC0VfHN2MtcVOavUPoU3fOBb
         2OG2vYXdAz92JyXOhxYqSth96QSAt/f1/BjHVDmL7O8smXbDqyiuFjYjUFTsI0d6y3O6
         NRxw==
X-Forwarded-Encrypted: i=1; AJvYcCUqprWWmYkClHZTYJmFJJj4ISuRaarlMvGwyXoj0HNftggCxS1iiE9vRmP3RPSkoOwzrMNADwpfYSc+qAM0ODUvfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsPnSlXEJcP9H6BEJjxgmoohUyITVChzB+heEelhmAGYDcN9T5
	C98qkz9m7O/D1dLZI8PPuRQjpWZOxX32LzgYN6hn5LlBVN5NYW3otbAWLx6tozVfSQNivdR62v2
	lSBo+k5Su2ovb/L5I3EkMJT0KKZMwcAhLf9yJDZmaPw==
X-Gm-Gg: ASbGncuu1SbyWhTWU2D0/K1XkEYomSjofJs0a9/z/oRb8bBvAZfS+rFvK0VzWGGxzp2
	S7lPHbZ7vu0/Ww9cMKQt4Qp/Z/N63dYWMEZ+xa4n5n7NKqEDZZrUI15WsBze5Rzv3OkzJQFtu6C
	hossfaxFafZ5EjYOSMqQuuRpSu8ej9Bo7GNLRap2P17R4JIJuetL6B5OLbfhgXE/F93FfUsd8Na
	LmFJYFQ+BTlEN+YCVr7gfEhcYQw7QlM4JZJWt2os1QllaqtvA==
X-Google-Smtp-Source: AGHT+IFcWj/MxjmrVdPmxch8QritOIaLTRMlhZkDbys4s6fntW4mvCl/nwD9FPfF52jhBYUT32dL+MvS1Koz6TeQoRU=
X-Received: by 2002:a05:6512:1051:b0:55f:4f46:9f2a with SMTP id
 2adb3069b0e04-55f708b5e26mr2212325e87.19.1756754554484; Mon, 01 Sep 2025
 12:22:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
 <20250828-pinctrl-gpio-pinfuncs-v6-6-c9abb6bdb689@linaro.org>
 <61bad868-d976-4f49-805c-8d14d4d8b3e4@sirena.org.uk> <CAMRc=MfB_3e0sjCpV+XaKcKvit7Opk5LczH2wsxO=RftrAabjg@mail.gmail.com>
 <4a633387-08a9-43c8-81d7-488e7222aeda@sirena.org.uk>
In-Reply-To: <4a633387-08a9-43c8-81d7-488e7222aeda@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 1 Sep 2025 21:22:23 +0200
X-Gm-Features: Ac12FXzmS2jWw7xFpjYhhy0Ln3t9KFQZe_l3JIooPobPNCmkv86DLX_8q8OSWPk
Message-ID: <CAMRc=Mf0dOvwsWb6uraCQXeauLYP0TqY6xsQnV3fM0w=wROW+Q@mail.gmail.com>
Subject: Re: [PATCH v6 06/15] pinctrl: imx: don't access the pin function
 radix tree directly
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
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
	Danilo Krummrich <dakr@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mm@kvack.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 1, 2025 at 4:37=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Mon, Sep 01, 2025 at 03:20:44PM +0200, Bartosz Golaszewski wrote:
>
> > That's not a lot of info but it fails in strcmp() which - I suppose -
> > is the one in pinmux_func_name_to_selector(). Any chance you could
> > check what the value of np->name is in imx_pinctrl_parse_functions()?
> > Is it NULL for some reason?
>
> [    0.628245] imx8mp-pinctrl 30330000.pinctrl: np->name pinctrl
>
> https://lava.sirena.org.uk/scheduler/job/1758947#L705

Linus,

FYI: I reproduced the bug on qemu with an older ARMv7 IMX SoC. Should
be able to debug it and figure it out shortly.

Bart


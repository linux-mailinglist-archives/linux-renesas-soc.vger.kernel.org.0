Return-Path: <linux-renesas-soc+bounces-21195-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2A2B40409
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 15:39:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5087B1890B3A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 13:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DE32306498;
	Tue,  2 Sep 2025 13:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="oSx6kIYn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD05D322DB2
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Sep 2025 13:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756819854; cv=none; b=QE0NiIpnnEMOsRCzT4U6Qi5cWlB8AGTrZwGKd9g1tlILamy0w4cDRYIoSTmbCxTdKTlVB6VDrqaqgxLehFBe/KG2OyvNxhVj7w2NFBBzE4MSQAjIhbNebaUUubIur7riEAyyst8j4bgYpvH5o6k8GnSBVng4lmSv9vGF3dkxJa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756819854; c=relaxed/simple;
	bh=OnwD5QXlkWRXkwweSWm2YbRhyhJnp/UrnZINov1baPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ptcB3hKx3jKuaLUeF78VUge6oBtCqN8pMsu7U93GilOk0jfLaSJTn5pLjPOrCKnb+4bRFSolLdG+Mw0wYbFyD0eBNUoZs4022zOozwhxrKZVghNB9/hplWHehTbpLE/ON3i4nJ30IJ2YJupFl+IRtB6dTV6eHBy3wWXse+dE1Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=oSx6kIYn; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-55f6f7edf45so3014082e87.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Sep 2025 06:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756819851; x=1757424651; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZhR5vC+b5jGByrsGl+I17mSTr+5gAmJbDumtIuc2ZA=;
        b=oSx6kIYnxTc4ce01XQdS97dHxSBJKFsS51gCgcViELkkIwWqV/G2fco58SnjNs49Pv
         JeUzY5hNY+EEphjDs00DvHnyLamO2HJU2/cPZT2O9EwEXQeUpC8X0+oUTDWnNtjqQVQe
         46XR6p7LyBgmKVd/m1rmJgtKo7VL2uT/yb4P4nzuEL88f4bz0xt7Pi+wNjVBkT5KKdbr
         n5686Wy1/ivZr1opV3gkwC96pi3LrgMumjJM2Pc1GHnlw9v9fRFXdXcND4fexD6gyV/M
         FdtCCDQ2ECS2XLK1jOKNrP0rsM5v0y+fS4KBIhfPIeOJjMGM4pWsI9WXPLGOr4UEbuLK
         R9xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756819851; x=1757424651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XZhR5vC+b5jGByrsGl+I17mSTr+5gAmJbDumtIuc2ZA=;
        b=La8u2FNWcx0FOB/vxHE5OPXLEsHGND+Jcg9QxC1pWfTVUZFTN1aF+a/huXBz0KYbOK
         G1yCWub/CXQoCe6ZSudV4TCpIl73CovA0nWntDXcTDWWqLTJ4xZuKbC6B7wVp6v8jBMQ
         sOAyv5IC8ZtHpxAH5yo95YcTcDLM1zCNPoQgc3YO+tl5Ip2aulQoJmwQ9nDiMzHv9/Pa
         ggapFfwvjRvjnDBlZJNWxQOuMFXUsyw1VQI0HZ04x80kxUNG4/FjdQn/SVpQawzwR6a3
         hJMw24QPykuWbU4Gnk8mvfgPgLjfo4LWJ1boS9UAXsSk5/fD+m72trBkYt6gzoO1DB/6
         92dw==
X-Forwarded-Encrypted: i=1; AJvYcCVBzxJiz6YLK8WysrDXe2qxqoYz/hr36tMLrEtouugssnf4FLz5cgD87luQNT0lGHmHGNaWIO2ZVAfLgrhyJGEtZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPCSWvOY8XSJ2rQgmq+I+R4oWrbx6psC7CauHdlWtqqptwPzy1
	rftWm2weE1pue6/fKdYAboXNwtr9vn5BnLpgqFcVHh0BiuYH2NKfBEYNQMU/Qg8AoQqrWmA7+bH
	wRUlMv59t1g/7cSki6I+W9AgAwxDee2o106DpsJyNMw==
X-Gm-Gg: ASbGncvEeCC5TMmgz7z9/3cbhVsp5MGhDW4lhPC1OoC5KOnakpT3mjgokvO64TJ/3fo
	LQW9EDMoHXWfkFpnm19REc8OmMDLyWVY/k4oQ1RHSoovuBpGbDidnKY5pcv29h1/0+XmIEKX2z9
	zBzzYZx1viwgEB8+H58WWEbffrORYyZlPueiVvdNB9vMxjlxUv4csXAQgs2YWj6Su2+Okq9SxDb
	r7rsNeofjXi0G/8eV+0b2WdaYp4aOcKqmDHGZU=
X-Google-Smtp-Source: AGHT+IETXrXrPtCI9kHaUsOk3PiYBtzLQDyO5BpniBUPpd4tNEA5zWWpm33Zl8pshGOfywjYNp9sGHw+kB/41Th8Wwg=
X-Received: by 2002:a05:6512:2522:b0:55f:4429:15a6 with SMTP id
 2adb3069b0e04-55f70967db8mr4302395e87.48.1756819849325; Tue, 02 Sep 2025
 06:30:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-8-bb091daedc52@linaro.org> <aLbsr4s7nfvCKLnd@smile.fi.intel.com>
In-Reply-To: <aLbsr4s7nfvCKLnd@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 2 Sep 2025 15:30:38 +0200
X-Gm-Features: Ac12FXwa7a499RP9JirYFVy7SbY2WfOVu2ugSGxCUkawbutvsj6hahPNBLiFvFg
Message-ID: <CAMRc=MfgXac4kRgeiw+SkNUZS_ThoX5qcXeRX5bPWm-t3JQ9Xg@mail.gmail.com>
Subject: Re: [PATCH v7 08/16] pinctrl: keembay: release allocated memory in
 detach path
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
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
	Danilo Krummrich <dakr@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mm@kvack.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 2, 2025 at 3:10=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Sep 02, 2025 at 01:59:17PM +0200, Bartosz Golaszewski wrote:
> >
> > Unlike all the other allocations in this driver, the memory for storing
> > the pin function descriptions allocated with kcalloc() and later resize=
d
> > with krealloc() is never freed. Use devres like elsewhere to handle
> > that. While at it - replace krealloc() with more suitable
> > devm_krealloc_array().
>
> With that in mind...
>
> > Note: the logic in this module is pretty convoluted and could probably
> > use some revisiting, we should probably be able to calculate the exact
> > amount of memory needed in advance or even skip the allocation
> > altogether and just add each function to the radix tree separately.
>
> ...
>
> > Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
>

Ah, I just ran b4 trailers -u and didn't check the result. :(

> This tag is not applicable to all patches, I do not believe this has been
> tested.
>
> ...
>
> > -     keembay_funcs =3D kcalloc(kpc->npins * 8, sizeof(*keembay_funcs),=
 GFP_KERNEL);
> > +     keembay_funcs =3D devm_kcalloc(kpc->dev, kpc->npins * 8,
>
> ...switching to size_mul() also adds more robustness against too big npin=
s
> values.
>

Eh... ok, if there'll be a v8.

Bart

> > +                                  sizeof(*keembay_funcs), GFP_KERNEL);
>
> --
> With Best Regards,
> Andy Shevchenko
>
>


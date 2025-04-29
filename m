Return-Path: <linux-renesas-soc+bounces-16457-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD97AA06D7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Apr 2025 11:18:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E53B28449F7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Apr 2025 09:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39A772BCF68;
	Tue, 29 Apr 2025 09:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tqqv2JPb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3659A2BCF4B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Apr 2025 09:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745918235; cv=none; b=jYK5vMtHcw/BdcBjTf2JYO4Mmwm8IdIbpTnqaDPou4ByqhqPYwLRoqPmd50jKZ4IAFgJGnioH/fHmWbjKeYJOb+Bx4HBlHTGLvi7FZI5jlcnKYglmPSl0hu71+G0l6fpYXZ/6z0AqUWZDrbD7L+BQVo3NsVgAmNabF5VEbZQ0iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745918235; c=relaxed/simple;
	bh=B0ki5WVqBAKBRusFcBBrcMjDpyZxRQJNqVD9RLqvS2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=VI97x19g4pthxVUoZ2VEWzWOwRJv9RbZll4yfmD1ngI6kVa925kHSv90XrPyInTCRyQSuXOKH5dyFnu2nNGyoHutyZivDU5CLXVCuRLD4gOEznaAjdOvnvFAY2VHOHF6Y62C52gXuu5pJYrKeMSXGx8+Sk8NwG0dNNJ+hYGkPQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tqqv2JPb; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e73120cc26fso3714293276.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Apr 2025 02:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745918229; x=1746523029; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9AFZuP5QCiVw2bvfwORhzfZHSaEjFI09KNVHM5hnVfQ=;
        b=tqqv2JPboip4waBsxCUxEc1fWSpcBjV68m1ENkXsLyc07SA5iztnY9ba+hkmsicL6k
         5THEQU7YmL4dgxrOlvKDq3aIaxR+ukqXP1cks2h3ZbOuraPbjQf3CpEiYBDyA9A/aNg4
         xF6ruBnofXe+Z09lOeunI0qVM1ws13x+pw0lvszRPPWEmb4CNHZRpjTF7GWC+AdSaIkb
         MpTS9wqehY/N31g8epy+eFvbT+SHNFGTE/oixVAJ2e0zvMTxpx+AcQdVDnEjVsTLbS2w
         z6dxEBTg3krg8gaVntBROF9xh9LdVzVE/L/MFe3AL4Fdk6/Qs5O5bw21UZa/C7g5Pm5R
         4S6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745918229; x=1746523029;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9AFZuP5QCiVw2bvfwORhzfZHSaEjFI09KNVHM5hnVfQ=;
        b=fI3cCVL41v8max01PwtQqLPEkDPg7VrrutNVI74DEyPwkLtriOZiP75ma2rIY8y+y2
         6M7j6m5CbIzWGXWXZW47g/XkQaXQpoB7E65gWZ7wLZkC60hXzxEo+pDiiSsxqD53oUOD
         dB4NN/rblCSREPOo6DjynR8/7xLDU6Y+Zop/3sCZZy+JKwLZMqUdS4lYLxktKessgZP1
         kS4yYUdoZo5h7Cr1bAhlAzK1RFfahz9mzWNslq8/j3lL2SubZLvPVTdiHe4kNrEePj4B
         rvudTLYlJVsAKJ9tJtlYUXrnMsjLygdOeq38BQcORFV/A2jPMYdP7Kw0MdTR5qFXGpQF
         a3Yw==
X-Forwarded-Encrypted: i=1; AJvYcCVRxSilkmOgs2oN7XDQUdigEC5LlRvmFpnG/FIM4ff+4Wk2lmijHNfkMKOfXGb5CeY45jEiApjlencxVQs/YqtgCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyWqYpgu/Ku30iE8oXEKS9EfXEpQct7gv46vjkFye2bhoGhAa6
	3GeyeO5VEHMbahT9s0IHj2h/hVd/XwAkr8ZRF9sPcI95pGLA4lYIgxl7HsELZ5AB3tO+8RA3tca
	IsGH2bAxb9oXX1gTYpxICzMXO/8h40FZlILbGCw==
X-Gm-Gg: ASbGncvWlsM0chl6GJp9bJYbKb7vgEcC6ELwx72vJLcnvtBWDwR4+GDXMXf6GhAgG6q
	Je+0jxpmu9GeoZLknibOsQ5KK6aFyv5RVnMX03yTTri9D2+pGaSp01jRSi+7bWui3L0ShAaBuse
	alCiCEk3YgHLEbKIxkLUehAjA=
X-Google-Smtp-Source: AGHT+IHzF99Jc5zjHiTwpYwDuGNz5KeVf6zfylnYOW5l1S9c2m17qhd0GLM02sExOq6djyUCeukxpH9Gv2n/QOZUitk=
X-Received: by 2002:a05:6902:2085:b0:e72:ecd8:6d51 with SMTP id
 3f1490d57ef6-e7323471842mr15952277276.46.1745918229201; Tue, 29 Apr 2025
 02:17:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425111414.2522-1-wsa+renesas@sang-engineering.com>
 <CAPDyKFqxHd85DsUH6eZVyoocTDrvwNu+wTLRBq-jUwDY+2iFTg@mail.gmail.com> <aA-yRD3FX5Nr9ypK@shikoro>
In-Reply-To: <aA-yRD3FX5Nr9ypK@shikoro>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 29 Apr 2025 11:16:33 +0200
X-Gm-Features: ATxdqUERauDj9X-EyfbLPJoHlMhqfczBHusMUQhGDJMr2QFYf9GT2Yl7ZA3WSRs
Message-ID: <CAPDyKFrWrw4ZthJ_GGZQ-qtgrPjQ2j0BoJTVbHH_qA1oTMt0kg@mail.gmail.com>
Subject: Re: [PATCH 00/11] mmc: rename mmc_retune_* to mmc_host_retune_*
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	linux-mmc@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Aubin Constans <aubin.constans@microchip.com>, Ben Dooks <ben-linux@fluff.org>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eugen Hristev <eugen.hristev@linaro.org>, 
	Fabio Estevam <festevam@gmail.com>, Haibo Chen <haibo.chen@nxp.com>, Hu Ziji <huziji@marvell.com>, 
	imx@lists.linux.dev, Jaehoon Chung <jh80.chung@samsung.com>, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Michal Simek <michal.simek@amd.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, s32@nxp.com, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, Viresh Kumar <vireshk@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Apr 2025 at 18:52, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi Ulf,
>
> uuuh, I overlooked this mail, sorry!
>
> > Sorry if my suggestion was unclear. I only had the MMC_CAP|CAP2_*
> > related functions in mind. I think we should leave the mmc_retune*
> > functions as is as they are not "can" functions.
>
> I agree. I suggested that in my initial series, too.
>
> > mmc_host_cmd23, mmc_host_done_complete, mmc_boot_partition_access,
> > mmc_host_uhs. All in drivers/mmc/core/host.h
> >
> > According to your earlier renaming series, we should rename these function too:
> > mmc_host_can_cmd23, mmc_host_can_done_complete,
> > mmc_host_can_boot_partition, mmc_host_can_uhs
> >
> > Does this make sense to you?
>
> I don't know these functions well, so you are probably right. I'll look
> into it. One question: do you really suggest:
>
> mmc_boot_partition_access -> mmc_host_can_boot_partition
>
> or should it be:
>
> mmc_boot_partition_access -> mmc_host_can_boot_partition_access

The name tends to be rather long, perhaps while at it move to
mmc_host_can_boot_partition and rename the MMC_CAP* too?

>
> ? I tend to think the first is better, just making sure.
>
> Happy hacking,
>
>    Wolfram

Thanks and kind regards
Uffe


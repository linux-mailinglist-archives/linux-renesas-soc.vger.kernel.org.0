Return-Path: <linux-renesas-soc+bounces-21019-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66183B3A39C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Aug 2025 17:10:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 318E1171D17
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Aug 2025 15:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 377C1259CBC;
	Thu, 28 Aug 2025 15:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HtlJsaRb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FBF25A630
	for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Aug 2025 15:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756393571; cv=none; b=IijsXei1vsvA5JIWqJn45O81s574UWjVcm27WyYQF+npCKUsUVh9aWHijWoPqo5/9/Tdw30IUqqqpjThmTTbkk6dI9xH6E3Lp28t41hmcf4g8sTZwFwbkbULT3x1L3UdA0Be1bJH79zMeL9VlZl0mldmOIE+dgVASK4L0MB8ZL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756393571; c=relaxed/simple;
	bh=Ef83d0YHCFyXZ9JYCFn6uu+wEcqauHSJmdcfvFUnW4Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iYWK5LKwvNai7uojGJ2nKE69zp5t+EMW8ZpS3ex/HJLucOdUVtrFjsfPwi1D8doWoSBXVIYyFdMirCSeUYJI09RMME1z68v7v4eMdpkrReYGVhFqZfwaQMrkxtOmVV26Y+pvGOE8xOy6IpmcdjUMzOGeKNtwtJIXLWR2S7oMGzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=HtlJsaRb; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55f42dcbf4aso1071482e87.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Aug 2025 08:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756393567; x=1756998367; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmZzYFeRtHhCTqoukOzpWHGqKe1b+6GRRn1Jw/JtbH8=;
        b=HtlJsaRbJJ+D83KeKw5rgqxnOV0eXpO2PegIL6MombIPlh35pItmsIxXWggNbxC26T
         uwBRyylafQ/XSJ5k6siMY90H+99TFs3TKcD8sPZZ+2mtwuUyqzYwm4aONZvQjm5PjOzy
         YVuu7SHG/2Ee9V5QYuesopQBHtL8TieFh4H/tN8HuAvajIeuC6l1nEHdh9Byp8So1xKU
         rnYhAJHdWLU9Rc1c4HEYwZQ7hBsXXLVV4F2sqwbP7iSt4ntYj/w8qZRGgVLFrlBYtVRP
         JYTokGWOAmkDSH80oq33etkxmrMvX8nfskJlAh4ivVHVasWBP/WdDYlVNK4+CMHALRx4
         5T+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756393567; x=1756998367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RmZzYFeRtHhCTqoukOzpWHGqKe1b+6GRRn1Jw/JtbH8=;
        b=l+XfAQ2iYH5qiGNxELWi1SHEaEbWq4bHjF+xdVilpROmoDpaVg6vy07rxbhL27CYWZ
         qHqlkfTj7d3Q9FaY62tFFJ9o6W4pQUe0+M0EQ2otE4FPIvPDXga6dXol6ys5472RC45k
         cdSAKskp0BF2xIPYUdhCDtdiOL6PIuo48IEIQzGUeDkvw50xlW8sEpT2P8/yk/5Tx6Le
         +rz1JDlNNUU1gEHHOV+1xUjmpoHaXQM8ZzQAYphOlvrxA8NUL9nqebOKtLIBx5JdjfZT
         VCKodKhPnkeEqywbXfoQZ51MMwtb2OnjT10L461OkC9eWhiKLtVxmXNm9quU0k/Ktt3F
         dimA==
X-Forwarded-Encrypted: i=1; AJvYcCUr4gX3pHHkYYx2hJIsCJLaAfzBFZzaOKNzo7UjSHmX0j1w4RTlsqR92Cr2cMRoA0NkdAEaa8CWV370ajOa5lLvrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyV3aUzQetjt+szotnfGuLDoTpCYDCrIpOVjldv6HgSXDxarNTD
	B54hFWpIsRxVpzTXBEcgYQX2AYQblJoSk/UO2DMUSuSRJ1aPl3EDPVm0VpV5sBTCPH5U7LSsaNz
	OuRVZKkGvFfbrWYPdf9IGcfgAJgqvHbj9DcSEeR3G5g==
X-Gm-Gg: ASbGncsGk6v4rZeCFgEfBGkJ+MpgMUF9v47/xgA7NLmsLWAwYCNW2dPh95q7BZgSVvz
	+COyKupmH6/2cGbSf7IuBZ8+cPFwqxURfFtvrz/vyo3X/GRDNzfjfGIMKu2yBcXtlwTOKEVNlyw
	Z7Oa0THmXrXLR5FhowrerM05ZEZiQVq2e3rUSoBXj2ElMFsjtiNcWXTbOiu6EoQcKnFYn3Wunah
	/WZXFurChTHlsyOG1ffiFS8FW1sbQsXEWYugDKcLrU5IWGPiw==
X-Google-Smtp-Source: AGHT+IE3iToga29hoCNxE0T8DagXuUfkGuMta1TYBW4jpnncy+JoEDrvVPvrustOmHcaLq8T48+IshbcHhnVTj991MY=
X-Received: by 2002:a05:6512:a94:b0:55f:5704:806d with SMTP id
 2adb3069b0e04-55f570486bdmr2169702e87.21.1756393566910; Thu, 28 Aug 2025
 08:06:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
 <CACRpkdaDGmdhaik+1saRv7Ts4myQ+tg1aQqGU3xQyT7ma8dJFw@mail.gmail.com>
 <CAHp75VephepLq61HrVy=PX2oKUQd5NK2qS-vOC5h_NR65td3Uw@mail.gmail.com>
 <CACRpkda4soRCLF5=W=6R4wnwT3pjk743j022XfJxjTTQzuarAA@mail.gmail.com>
 <534ad082-08fa-42c0-9c24-f0c11af7d5b2@sirena.org.uk> <CAMRc=Mdn0_yPXyYq4sbvH4P9-h71vEc4arLPBfSk1PiEFaB7jQ@mail.gmail.com>
 <1804d9dc-8814-47d4-af88-c819c3f17bc0@sirena.org.uk> <CAMRc=MdKgqa+vjhHvD2+Tjw5NwBtFv-0aUivi5UuEQd+n4KxmA@mail.gmail.com>
 <aLAYoDyz8Xie4Dhb@finisterre.sirena.org.uk> <CAMRc=Mdd3fmKjFAfbUB-AAhx-5_CR+c7f36pePkF1k_2LDoORw@mail.gmail.com>
 <aLBggd4rGHV_5zQ7@finisterre.sirena.org.uk>
In-Reply-To: <aLBggd4rGHV_5zQ7@finisterre.sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 Aug 2025 17:05:55 +0200
X-Gm-Features: Ac12FXx5n8TdDo5k-Gc9YU8HcEZiyD1aufJb5T8PdE3CuzVh_XFc9j0GLQlkpOM
Message-ID: <CAMRc=MdgorsPpkkRF9amVhqPgzb5QBwFY87K-fZ04gONAkGCTQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] pinctrl: introduce the concept of a GPIO pin
 function category
To: Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
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
	Danilo Krummrich <dakr@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 28, 2025 at 3:58=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Thu, Aug 28, 2025 at 03:36:43PM +0200, Bartosz Golaszewski wrote:
> > On Thu, Aug 28, 2025 at 10:51=E2=80=AFAM Mark Brown <broonie@kernel.org=
> wrote:
>
> > > It's failing prior to putting any output on the console.  I was also
> > > seeing an issue on i.MX6 so it might be all i.MX boards, same issue:
>
> > >    https://lava.sirena.org.uk/scheduler/job/1697667
>
> > > so it's possibly all the i.MX platforms failing.
>
> > Not even with earlycon? That's weird. There are no smatch warnings on
> > this patch and I can't see anything obviously wrong upon visual
> > inspection. I fixed all other issues but this one I can't test. :(
>
> This looks like it has something:
>
>    https://lava.sirena.org.uk/scheduler/job/1747304

Ah, now I see it, I confused two radix trees used in pinctrl with this
change. Cooking up a fix.

Thanks!
Bart


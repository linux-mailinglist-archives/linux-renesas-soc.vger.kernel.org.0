Return-Path: <linux-renesas-soc+bounces-22956-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7D5BD525A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 18:41:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 47382583234
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 16:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D03092153E7;
	Mon, 13 Oct 2025 15:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aG1qRnSz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029CD3101B6
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 15:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760370987; cv=none; b=SDe5htUnTfLvaMHlmwgECmKmpETcQT/qVvM9gdj6HCAi3+qY5jh521b7aFm9JOAhNgJa8n0D4OkjOB1wSuuFIVXUAruBlRDJI1JwEwSsFfP+KrOQfyq+x5paGbDmmwS/Qhwn0n5/lszMwb6SnP8piCC/cwtNkfr6Ih0EPCO5T/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760370987; c=relaxed/simple;
	bh=cAB0kIpqj20tM7yHpaFoe3xcfA2AB5cxFaYcvZmpAuc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p9ACZQoVWihtD4IuaWf0b0DKoSUtMNk7mriUHN2T2yJuFNJDFgyPCpcu679RWxmlFqiin3l2tuEJGWN732PRd2sMqWsdP8E+7mRZ2kb86aJgnczb4R4Gc9c7H9owqs5Uq9yaiUTyI4NQ83m/NKLLte8KwQ/1B1BOLwrjp2MzZXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aG1qRnSz; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-afcb7ae31caso942163966b.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 08:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760370984; x=1760975784; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LK0kBaNkf30iNo8Y7sNwo/F78yA794Ns47GaxpHfRwE=;
        b=aG1qRnSz90MTX6LX93eI36uNNbuxgCxOwYX1HKjVz1+Du/MM9rN9u3EkGeoXvqJvNF
         8K75lTLxrgoFhSJgtJt2HsW+0SjUv3rt4PwNY/tpMEz0OKt4mrCn0IMo6gMh0CJMK8ok
         rJcDxt40omlqylfcMP2yxG3XE/IhqE1/yFAlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760370984; x=1760975784;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LK0kBaNkf30iNo8Y7sNwo/F78yA794Ns47GaxpHfRwE=;
        b=wE9Tc/b3i2wMPQVmqRulxKBFaHcbqYVaVa6xABwd91BAxMhD93+O2hkfjqL6iBisxK
         Fke0hmC+Aw+x2436uoYgaLMr2+YrSEqgg0EZIrarsjBKEshzfNWlc0E9I52GdDpDBdWG
         v65GFKRTqj7prcH2MmjpiQ03xP0tRAB1Na3PzadkdNZei4xNotof7j2Qb/ThI4bfje7x
         +Y19fRpc5PjB1jSRcZHUsinA9Z9mC8NDfzCKhU7ebBd0w0F33Q6kHJKBkD3zl6CRLOCu
         fiHBty5oL3oan3b+CiFL2O3nQWINU7/fXFBhdAo/rteykvNUumuS6agQ9xEg5rVQxCVs
         Xzcg==
X-Forwarded-Encrypted: i=1; AJvYcCXNQQ1kbpyuYVxQxo/q5pxHm9gPAgDfV/Zdj1accWj/2ToD996/5DzoyIjzqd2ubSV98gyUfHW00CG0j7r2Hch7HQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuhTEcYz1MlyRErrRdA5jTH5ZYYz8USaDwdjixR/tr8tNdVYEZ
	G6BNSqCHZT9bFHQz7D0MhnBPjKJPsk5Vb+gqbJC5AgZcJs031hg/vsJa/YBOeH6MJ7H5JGN6nnz
	pBvRePmzl
X-Gm-Gg: ASbGncunhmIDMVr55Sb/qfq0hR2bu7UZVGIcCHxJGz0UJGI9IieB65mhqXwBDcneEKp
	cWne5bJ7JUKv4JkFcRhsFKaqIWxVVFtP4/tSKkw7I1aCzaWoQig6Uk3qtAXjve1aIb5YEVtRHg5
	zv3ClB7yObXTx+mpB65sp00O6frcngYJjDToVVykp76tK/DLIcTeB2Ul9UgOQRimQK0sQF0vOvg
	2pTMHwh4wTo/pxAYuJXVQnNS97OGAMVfOdU+JhKLYcoohY/hJZcxA+akxdoK3NtVdX5MG+14WxJ
	Auv5vyLBYMxQbi9h8g8YAMcaWgwBYibgD+XOtu76vBp/ZZOICjvnt/P3Da3ErwxhXIbxUrPqKPF
	pY+mRcI6QosA+AFzd5zCPKfiaXeuUTuhaN/oNKGAQmAQG0nvTz0+/5OyQG7NQTsJMn+go2429rd
	NTAqs=
X-Google-Smtp-Source: AGHT+IENM6nfE5l7ikz9jH2V/91YLpXdgfW0tj0F0Mr1zWTB3JopiiITU8XqhDFMYWFWjg3jYJx+OA==
X-Received: by 2002:a17:906:ee87:b0:b3c:3c8e:189d with SMTP id a640c23a62f3a-b50abfd3442mr2310566066b.32.1760370984119;
        Mon, 13 Oct 2025 08:56:24 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d900e151sm947241766b.68.2025.10.13.08.56.23
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 08:56:23 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b40f11a1027so784386266b.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 08:56:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUQUlhM4swTW5eIcR5kQqX/o4bnHdnE4/1YpxdYZERet6+jg6fzTOF4r0lZKBUQZ9XxD9dm+JbFX25im/rm7ex1iQ==@vger.kernel.org
X-Received: by 2002:a05:6512:1095:b0:58b:75:8fbc with SMTP id
 2adb3069b0e04-5906dd8ef00mr6030162e87.50.1760370658194; Mon, 13 Oct 2025
 08:50:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
 <20251013-ptr_err-v1-1-2c5efbd82952@chromium.org> <aO0cXYeGLwwDABP6@lizhi-Precision-Tower-5810>
In-Reply-To: <aO0cXYeGLwwDABP6@lizhi-Precision-Tower-5810>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 17:50:44 +0200
X-Gmail-Original-Message-ID: <CANiDSCtxnR-ydCquhH1=g-XwZ9DN=eeJNxRBOGiqufS_DMYzUg@mail.gmail.com>
X-Gm-Features: AS18NWAjEedfD0tRDHHy9p2HIYCpNxcTQpn_Xf2f0oNW4TLvTJ881tcLSkxWDmQ
Message-ID: <CANiDSCtxnR-ydCquhH1=g-XwZ9DN=eeJNxRBOGiqufS_DMYzUg@mail.gmail.com>
Subject: Re: [PATCH 01/32] Input: cyttsp5 - Use %pe format specifier
To: Frank Li <Frank.li@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Leon Luo <leonl@leopardimaging.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Julien Massot <julien.massot@collabora.com>, Jacopo Mondi <jacopo@jmondi.org>, 
	Daniel Scally <djrscally@gmail.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Yong Zhi <yong.zhi@intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
	Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Rui Miguel Silva <rmfrfs@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Dafna Hirschfeld <dafna@fastmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Frank

On Mon, 13 Oct 2025 at 17:36, Frank Li <Frank.li@nxp.com> wrote:
>
> On Mon, Oct 13, 2025 at 02:14:41PM +0000, Ricardo Ribalda wrote:
> > The %pe format specifier is designed to print error pointers. It prints
> > a symbolic error name (eg. -EINVAL) and it makes the code simpler by
> > omitting PTR_ERR()
> >
> > This patch fixes this cocci report:
> > ./cyttsp5.c:927:3-10: WARNING: Consider using %pe to print PTR_ERR()
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/input/touchscreen/cyttsp5.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
>
> Suppose it will go though input subsystem intead of media.
> Need post seperated at difference thread?

Indeed, it belongs to input. if there is a v2 I will move it to a
different thread.

Thanks!

>
> Frank
>
> >
> > diff --git a/drivers/input/touchscreen/cyttsp5.c b/drivers/input/touchscreen/cyttsp5.c
> > index 071b7c9bf566eb0b58e302a941ec085be1eb5683..47f4271395a69b8350f9be7266b57fe11d442ee3 100644
> > --- a/drivers/input/touchscreen/cyttsp5.c
> > +++ b/drivers/input/touchscreen/cyttsp5.c
> > @@ -923,8 +923,8 @@ static int cyttsp5_i2c_probe(struct i2c_client *client)
> >
> >       regmap = devm_regmap_init_i2c(client, &config);
> >       if (IS_ERR(regmap)) {
> > -             dev_err(&client->dev, "regmap allocation failed: %ld\n",
> > -                     PTR_ERR(regmap));
> > +             dev_err(&client->dev, "regmap allocation failed: %pe\n",
> > +                     regmap);
> >               return PTR_ERR(regmap);
> >       }
> >
> >
> > --
> > 2.51.0.760.g7b8bcc2412-goog
> >



-- 
Ricardo Ribalda


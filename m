Return-Path: <linux-renesas-soc+bounces-22947-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 08009BD3C75
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 16:58:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 631D418A07E4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 14:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E68A26E6F2;
	Mon, 13 Oct 2025 14:50:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795A01F91E3
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 14:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760367031; cv=none; b=ERqW5YSqw5vs9B6T9UeyFeW6hOvs9R1FQg32nLwn+79mHRMJhU6vP6/6kbE1byG5YctZUMKFa+Zxl9CEhrqji4FlSVLchmqAX+1Wn98MKBgC+DaUffwQRoxQRHCZFlGYyBBvhT55S53YOhRyxp61Hc95RySQd4EhaL10rHighQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760367031; c=relaxed/simple;
	bh=a8rzeaiQ54tOFcMOe+sIUa8tfmcif5r7xjlXNM2RFaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BInSTlULTQqm2DImpsi8adOZ649X7qrvl14D5uRECuLPVRVdXFoeeCt4FtG052twqdXqpRKKfnTesZ9Nm3Xh/R7wuwTE7c/ExsQatS9uZXwipW7CLXiMhVxOaItiCJ7kDNE1arIQU34xS20G3CFiJj9KnwtYluX/qL/DEnzmzq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-855d525cd00so765877485a.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 07:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760367028; x=1760971828;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8BF1nvJKgerbunlxq6rI58NsjqwKmmQvTj5E3RRtPIQ=;
        b=SKeuJ0Sgx9Ex7Y4mtdWPLDP/LakAGkkX1d1/ok8SyUlKs67SQrWPJCdXOtELnp/2oP
         HFb4ozaGIFzMZKJUtwlRnMY+hSGuFOmSknlwroPoaBg2EuhGPSh9+al8kperWOJI1Jgv
         gJsao7C1FITUqmmf/CcLZB0luF4H17A4IHnLZ6Zxo3z2OsEuLhZbbILhgAzkcxNWbRuq
         ia6j6ibsN7ady8I1eotWUDx29R2/gdjK4B0icefu5Rt/OR4qMj4dxiGcpFf9Uoy/AxWq
         tKWQReLu/VUuTJvpnbQeFBaexGCDdF4PjHVxWrnfCYTIQZmA+Cr8waPCCjE11SBeJoOg
         bV1w==
X-Forwarded-Encrypted: i=1; AJvYcCVNRqC2SLmjfYlaCMK4waNfm4n06WXX4xQzkxeEAEhZKWnmDWVTzbicUKX60PQXJK3+F0rXAbFUsN2zf2oWcA9BTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMQI5opK3nXc2QB7D4ZEf9OQQ3f9uZZ0YDh+Gt4qv4e1+Br3Cl
	cSlFny9p7gbchy2karQMKVAtkWuLu8awwoBr12PELRXwJk4+zSx56Bd+fWXZSr+2
X-Gm-Gg: ASbGncs1FVppJ5uOb0QghGCeC48pFyNyjTZ3z8VJajsGCRjgZwQeOWqicfoxCDgK1Ip
	Ow2g7z0E8XDaGxJym9BU0HUFoDBkE70M8ggoz3LUi8H00zxvioi+vT1VzsQFGUWJTN32qNmQ/sa
	QAe4OZE0gorzUemofDWNwWzqUTOOuRFBPc+8eAVTb8fId4QeNBRp0QUMXg0ijt/DOAkKSMTHWut
	x0mgHX/GRjCFROsmcQNiSGtIdloyuKHZFJExDGYx7Pd8uqfTPWhBtEjH/mZsHCVfikVHLq0s7kz
	Ieq26TkcWl1YVmslmQzlvSu8Jb2ZxjbDYEckMGPsFK+pPZemSLgpRyxXJq+vQRh5QxK6jpmZf6k
	Eeicxz9Pxl4INAgKJShgWAd91PjmIBKmtEyez6k8YP8T/cvE1Qt0SQFqGmnbvEHZ6feq4TWKv3R
	8TidsUuofgyamiZO4zqQ==
X-Google-Smtp-Source: AGHT+IGmHNODfatmdMP8jGM1RrFVt/QbF6kKlkwptB+scm5KemxbOktRXykDkp59Kpca5nxAazy1uA==
X-Received: by 2002:a05:620a:4506:b0:85c:809:3f10 with SMTP id af79cd13be357-8835088ef4bmr2760454785a.26.1760367028009;
        Mon, 13 Oct 2025 07:50:28 -0700 (PDT)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com. [209.85.222.176])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8849f3d8576sm1017765185a.11.2025.10.13.07.50.27
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 07:50:27 -0700 (PDT)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-855d525cd00so765873685a.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 07:50:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUmNualb4WEE+0KYpPnBxA7CKDe3YOkYNlxSGrwJ2lLrXwsC62fpaxybo0k5J76x0f5yCVhRRhIWT6VicqASl6QRg==@vger.kernel.org
X-Received: by 2002:a05:6102:598b:b0:521:57e7:3b19 with SMTP id
 ada2fe7eead31-5d5e23ad946mr7466194137.25.1760366582403; Mon, 13 Oct 2025
 07:43:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org> <20251013-ptr_err-v1-27-2c5efbd82952@chromium.org>
In-Reply-To: <20251013-ptr_err-v1-27-2c5efbd82952@chromium.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Oct 2025 16:42:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUw4x4GxxZ+m+108rp+_uiuiNFHO4Vtrd3vftb_LwmCLQ@mail.gmail.com>
X-Gm-Features: AS18NWDbEQGWUFg0r_aGxPQP6vUjubUz4v9cHDpfk8kXxZq-lj2695LEwK7MQ10
Message-ID: <CAMuHMdUw4x4GxxZ+m+108rp+_uiuiNFHO4Vtrd3vftb_LwmCLQ@mail.gmail.com>
Subject: Re: [PATCH 27/32] media: renesas: vsp1: Use %pe format specifier
To: Ricardo Ribalda <ribalda@chromium.org>
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

On Mon, 13 Oct 2025 at 16:24, Ricardo Ribalda <ribalda@chromium.org> wrote:
> The %pe format specifier is designed to print error pointers. It prints
> a symbolic error name (eg. -EINVAL) and it makes the code simpler by
> omitting PTR_ERR().
>
> This patch fixes this cocci report:
> ./platform/renesas/vsp1/vsp1_drv.c:958:4-11: WARNING: Consider using %pe to print PTR_ERR()
>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


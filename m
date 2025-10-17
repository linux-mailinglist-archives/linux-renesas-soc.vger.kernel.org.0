Return-Path: <linux-renesas-soc+bounces-23194-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E13BE666A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 07:18:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D4D2622103
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 05:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D321230C378;
	Fri, 17 Oct 2025 05:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TKFEWJWG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9882AEE1
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Oct 2025 05:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760678325; cv=none; b=eDHqX9NziqExNTap3iQGnHMR1CWCDYzt4mJdCqdzs+Cy3R5KFU7Or4RgoFeckmpkROG8hpro98Q36m7AW4Ab0TmpSCFlM65Xr2Co7LsrvGHWfGFeOngicOzgLec6BidSPb87cBu1C/Oqmy1PeYgxOTdQXmA07lBM2NRfEG3WIHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760678325; c=relaxed/simple;
	bh=qG5HMa66bXcs8gT8hnOihrhSdB9Nf9qJM+cXeN/bESE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qBn2axnA6Jisvi7tuQD70j/nhX1hC6L/dilFS68pnullnb2Q6qEWX6Q7n01MYFgT57SEQhmZslrVLu6rutnqkWKTbuRHNjK6k9jDrcnWob2YhWBi4X/W2O4CaAfhbJmsunsEzfOq6wwg4TrJSkZNHsA50/cgKk+kOSOB5XFjQFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TKFEWJWG; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-781001e3846so1487516b3a.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Oct 2025 22:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760678323; x=1761283123; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l6S63uReOFquePjk+el+IDhyWrHQTPL8Zy49l1W17no=;
        b=TKFEWJWGDOlIxwdyfqDfy9J03up5ma5IKzn7zDGrD/KpnHIG+HICjR90wcpK3s/OSZ
         wG+vgWJSwlXhmk0RD2JmThXV/eTaiNnxSHw+dyfR/4V8ekLpTD7d8CDzi3+Yn9gS1hh/
         GrRSzUR6AWgK3OLjaKyQ4S83DvuycjpUx/gGl6tQZd7XAPnrls3mjS2EckLgfGQtC1/M
         wrk6YC48wd233iBH5Tu4cdJTm0lqWvvbvoCpGkiAYWjoaGmLoEdLYHHKum5aDMcBsa+g
         1jCtsM/DhBAJW2p/HBpCsCCGp9fWmUxyujojrogaPxTJX6/W631KL75F60OU4xCPU5Ec
         Ec3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760678323; x=1761283123;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l6S63uReOFquePjk+el+IDhyWrHQTPL8Zy49l1W17no=;
        b=k+5qFDniSX4nolpP53ghAduxMobpbSZEkWf1CFI4IPKNzzWXRaryLlUXyCb1tt4VxR
         mWYFGukSzrGEGikNW+Da25YbU/5Pez27p1BWPMdGORay9YmFQb9HwaOVJW3Ov5Lw5fJI
         ilbFjcZPnw9qwTU42LEFTAjRsyzw5bdvIc8IiiO+3pCy5DTRzhkkq2AkIqNqL4i2bjrw
         QjgRkExelFTj3tDtVxhbRbYY+mujGyaD1QHmjDLatwXBmc5K5N3g5GEFfefJ4AUcDAlE
         Pqd8zm3x5tlSrO8qwlEXF5kaFqVY23YxZXJMNyoleLAIjYDQ2yA5kQHvbDk2r+aCQ+c7
         VBGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkqCrziSdtwiS9NQAe3GhUU0LfQA83/D44TnBqjw4mX3oT2gv6+TS2RlDPGClZKe6F2dXLEFbIeDJffbNmyRP2Cw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYwZ67seilDGArXNULgEHIv4F5Oaiqr3hILfLqeAtuZ1KTdM/u
	Mz30Sye/gw7KWGY2pYTT5AqHqWoxtXHhHitiHW8zWvtQrq2UL6BT/SaR
X-Gm-Gg: ASbGncvtYON/8Pn1GHHLfkCPDwJENrrUfFD+rY1bCjuDCLGyj794zaM/CmZxzq992Sc
	ck48do79uqW8hR0XREmX6JESmcgmzJkZKk1v/o9nZFywd4T84M+wCr3Pt0z0bLIfsmhahJGoQTG
	Aik4RYP16ej7V1dBY+qz0/8t8h3N5tuZB+vtbhKmxkrKu10Ma7iEK7YR0iElaf4NeTFzKJbiQrn
	GhkhcrDvZbBnniickh/BuoO9kaSTi1eJodI04fNa3nHNaGHJOS9U1vHFGuu7c42BJtZ1vK/zUkt
	FpHKzFr6bh46Jo+KGZ5LKKDbgNRQIZSNGXYyQVyk3c4lZIeNsmoZQrvpLZrUPNk7xWfJQ1GQtvJ
	q/9OhXupTPPtOQ9PRarJwzEQmtGuwDQC6EwJGvpKB6hI/NCA3jSo+jbC0mJz6Xrylev3y8Xw0Dn
	n5FXRtEpW7ctmixBuzNEBqpkMKDBdFDxImlIv6rOFcnri6TRAXEeg=
X-Google-Smtp-Source: AGHT+IEoZYavaM7njBnG3D3Z+hduFKNotyz+5aU6kPX8BleR1uI1Sy5GSDkuztm0nYl05g784spRlg==
X-Received: by 2002:a05:6a20:9185:b0:32d:b946:dd20 with SMTP id adf61e73a8af0-334a8566437mr3249260637.24.1760678322944;
        Thu, 16 Oct 2025 22:18:42 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:df8a:9eba:d1a8:6b39])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d993853sm24177361b3a.74.2025.10.16.22.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 22:18:42 -0700 (PDT)
Date: Thu, 16 Oct 2025 22:18:38 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Leon Luo <leonl@leopardimaging.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Julien Massot <julien.massot@collabora.com>, 
	Jacopo Mondi <jacopo@jmondi.org>, Daniel Scally <djrscally@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	Tianshu Qiu <tian.shu.qiu@intel.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Martin Kepplinger <martink@posteo.de>, 
	Purism Kernel Team <kernel@puri.sm>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Dafna Hirschfeld <dafna@fastmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 01/32] Input: cyttsp5 - Use %pe format specifier
Message-ID: <xirb6664gow5ldjy7xihkz2wooidbm4bsyl7qrm2uosdybdki7@mqkdqzeznx6h>
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
 <20251013-ptr_err-v1-1-2c5efbd82952@chromium.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013-ptr_err-v1-1-2c5efbd82952@chromium.org>

On Mon, Oct 13, 2025 at 02:14:41PM +0000, Ricardo Ribalda wrote:
> The %pe format specifier is designed to print error pointers. It prints
> a symbolic error name (eg. -EINVAL) and it makes the code simpler by
> omitting PTR_ERR()
> 
> This patch fixes this cocci report:
> ./cyttsp5.c:927:3-10: WARNING: Consider using %pe to print PTR_ERR()
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Applied, thank you.

-- 
Dmitry


Return-Path: <linux-renesas-soc+bounces-16392-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 063D3A9ED62
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Apr 2025 11:59:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CF17188C091
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Apr 2025 09:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 340CC25F7B3;
	Mon, 28 Apr 2025 09:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K2xZJeLH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F0225F782
	for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Apr 2025 09:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745834353; cv=none; b=Sa24LeHM+fTpeYWN3fqW7cEJkkTG4MUMXJ7ddV45hvBA5ZSaWExbqgOLh8IxdR7meLPahY330cJgvlR7qqvfKNDILqqZ3UjTtQ3ifMawpDajko4P3ZLpBvnKYqTeqQtjsAfxv+RILjwfkMWeXYSgU+QDpfh/92MS8Avm/Yifr/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745834353; c=relaxed/simple;
	bh=NnpDnaecEjaxgC/9EoeWEeuNxdMbouz16eL8rW7sxFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r4aa4HkjcKPqrEoMvrqSmHkYhB+k6cw5lcs/yQxiX+pO31xBEJvFA2uf2asb1x1ZCkGudSwvIxMfVyl9M3dG9w3/4gAnmrYpbsgDOFabZQVj18CkQrWUKBlR+Tpoqere2lD4wJAHbyiokmef04M/zFjh3cXc89uJxdhVPIfAQec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K2xZJeLH; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e6a8aa771e8so3853724276.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Apr 2025 02:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745834350; x=1746439150; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZgHog5j3bHubplZHipHB2WxTh+7XYb3lCIW6vc6Lfpk=;
        b=K2xZJeLHgVf3Sd5eVouWDptnISu9bfHgNEp+GAMvTwnSj+YITypzptgv5Bubi6Ja/X
         3tE/WrPX/C39HvzmAoKVo5d/517GkISPG3yzH/qPs+sfjg8uVbEQFXFpTOof3OaZ5Lw2
         Dore7O4wOIDq57p8aRvtivif2D1kvFHog4t3kjHO4gKo9bVg7uoIb03KT6x3ix3+j7mI
         Wjni7RscgwcKneQ8BJTnFB5y6PXde/TY+x6H77S2OkKf5Seb18GySoZ9p3mGwXxR0cK7
         7jWOv8V00iMqV9STkqwZf1j6yweNdmRhbxFB7R5H/MgUg7H+pbBnIXNrK6BybKGVv1Pz
         UAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745834350; x=1746439150;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZgHog5j3bHubplZHipHB2WxTh+7XYb3lCIW6vc6Lfpk=;
        b=feJ44Jx5jGAN1KN/0t+ci8/SnJerv9m9a4qdPaq1I2AHqHk8jsC1keIg9bJAScjpmb
         tLHP2GKrMNtz5liUudN7GsrGD1QQWznZEskuaNH/3qKeoYVT0pTy6OjCOl8fBjz8m/KC
         jKNQi5LeRdkY1c0QOEXhm21xuV0Quy8Zz0JGNRmOnQZH4QY6/3HLVzglFPpSD56Ho5Cx
         w3BmD6RaYjdgegbV6p5vc3Cayrz5nt9f33boKfM3hI4fMgpx2cD4iMPHYXM8EbYEXwqi
         EH+/b5Uw5V8dgSaGptJrZk/lQBncq5nOqLzEEUGAN5bMjxe9K1AavOQDhPHVw1P+Ibge
         tMyg==
X-Forwarded-Encrypted: i=1; AJvYcCXU6Amu9mvzW1KKnupAokxNtYtAd5Ciujiv/kN6IJvLoIALpnMD7UZbCkAPrAr061VbHKLJv2OzprVR6UVNtT651g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDMvcUnBOZIFExIXgz82uOcS5ER7168mmzdDIIfejcBEQqhvA7
	59ExXvPdUphZrzbXsqwyM3e+WBEuEeO/CZhx8FYL2r7cE95GEPpzxA0BUGvtn4zFFQ0XCTblawQ
	icWihOoXoMvbnh+Z1STzxLm137Ha9gTFPJS2ALQ==
X-Gm-Gg: ASbGncut1TBcEn8Z8i9C5yq5Q70HhDb5JiipQwpmrShR7SFn5cvuaorUFcJN6wfuUc7
	8WAcb0qUIcYmtRSls4pISz8gkjG/7+FEovzj0xNUM2z87eg/r0YE2Z5BlfVOzMN/jZPAHrEvnLG
	ysmwhtde5fvk//N1MyvI+3Dng=
X-Google-Smtp-Source: AGHT+IGzqA988NBw7sdHyV2pa28mJrkNSc68Mx4LZTYc3yj0PJhv5acQ0zBwmMN9hv6uRI1W/EgLr/AniunkS+8k1Ek=
X-Received: by 2002:a05:6902:2e05:b0:e6d:f157:c601 with SMTP id
 3f1490d57ef6-e7316aa4b6cmr12912739276.17.1745834350357; Mon, 28 Apr 2025
 02:59:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425111414.2522-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250425111414.2522-1-wsa+renesas@sang-engineering.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 28 Apr 2025 11:58:34 +0200
X-Gm-Features: ATxdqUESjgj-C7jn03RVVXo_02Q8tUEdsDkHYmNdSurwgrXAz3FKSyh0hhQHxd4
Message-ID: <CAPDyKFqxHd85DsUH6eZVyoocTDrvwNu+wTLRBq-jUwDY+2iFTg@mail.gmail.com>
Subject: Re: [PATCH 00/11] mmc: rename mmc_retune_* to mmc_host_retune_*
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-mmc@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>, 
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

On Fri, 25 Apr 2025 at 13:14, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> As discussed previously[1], here is the next set of MMC core function
> renaming to indicate if an action is relevant for the host or for the
> card. Local build tests went fine, buildbots were happy too.
>
> [1] https://lore.kernel.org/r/CAPDyKFpsJpLre2bO9T7gsSthsta9f3JXoXTGZbjTjWVXH47gCw@mail.gmail.com
>
> Wolfram Sang (11):
>   mmc: rename mmc_retune_enable() to mmc_host_retune_enable()
>   mmc: rename mmc_retune_disable() to mmc_host_retune_disable()
>   mmc: rename mmc_retune_hold() to mmc_host_retune_hold()
>   mmc: rename mmc_retune_release() to mmc_host_retune_release()
>   mmc: rename mmc_retune() to mmc_host_retune()
>   mmc: rename mmc_retune_pause() to mmc_host_retune_pause()
>   mmc: rename mmc_retune_unpause() to mmc_host_retune_unpause()
>   mmc: rename mmc_retune_clear() to mmc_host_retune_clear()
>   mmc: rename mmc_retune_hold_now() to mmc_host_retune_hold_now()
>   mmc: rename mmc_retune_recheck() to mmc_host_retune_recheck()
>   mmc: rename mmc_retune_needed() to mmc_host_retune_needed()
>
>  drivers/mmc/core/block.c           | 16 +++++++-------
>  drivers/mmc/core/core.c            | 28 ++++++++++++------------
>  drivers/mmc/core/host.c            | 34 +++++++++++++++---------------
>  drivers/mmc/core/host.h            | 22 +++++++++----------
>  drivers/mmc/core/mmc.c             |  8 +++----
>  drivers/mmc/core/mmc_ops.c         | 12 +++++------
>  drivers/mmc/core/mmc_test.c        |  4 ++--
>  drivers/mmc/core/sdio.c            |  6 +++---
>  drivers/mmc/core/sdio_io.c         |  4 ++--
>  drivers/mmc/host/sdhci-acpi.c      |  4 ++--
>  drivers/mmc/host/sdhci-esdhc-imx.c |  6 +++---
>  drivers/mmc/host/sdhci-of-arasan.c |  2 +-
>  drivers/mmc/host/sdhci-of-at91.c   |  2 +-
>  drivers/mmc/host/sdhci-of-esdhc.c  |  2 +-
>  drivers/mmc/host/sdhci-omap.c      |  2 +-
>  drivers/mmc/host/sdhci-pci-core.c  |  6 +++---
>  drivers/mmc/host/sdhci-pltfm.c     |  2 +-
>  drivers/mmc/host/sdhci-pxav3.c     |  4 ++--
>  drivers/mmc/host/sdhci-s3c.c       |  4 ++--
>  drivers/mmc/host/sdhci-spear.c     |  2 +-
>  drivers/mmc/host/sdhci-st.c        |  2 +-
>  drivers/mmc/host/sdhci-xenon.c     |  2 +-
>  drivers/mmc/host/sdhci.c           |  2 +-
>  drivers/mmc/host/sdhci_am654.c     |  2 +-
>  drivers/mmc/host/tmio_mmc_core.c   |  4 ++--
>  include/linux/mmc/host.h           |  2 +-
>  26 files changed, 92 insertions(+), 92 deletions(-)
>

Sorry if my suggestion was unclear. I only had the MMC_CAP|CAP2_*
related functions in mind. I think we should leave the mmc_retune*
functions as is as they are not "can" functions.

mmc_host_cmd23, mmc_host_done_complete, mmc_boot_partition_access,
mmc_host_uhs. All in drivers/mmc/core/host.h

According to your earlier renaming series, we should rename these function too:
mmc_host_can_cmd23, mmc_host_can_done_complete,
mmc_host_can_boot_partition, mmc_host_can_uhs

Does this make sense to you?

Kind regards
Uffe


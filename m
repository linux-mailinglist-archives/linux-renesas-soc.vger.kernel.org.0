Return-Path: <linux-renesas-soc+bounces-6084-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 384449043E7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2024 20:44:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CAF3C288763
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2024 18:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04D7C7406E;
	Tue, 11 Jun 2024 18:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="exe9x/dN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFC956B79;
	Tue, 11 Jun 2024 18:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718131485; cv=none; b=EB10R/Bdrw/VfCsHRP/Rwr+8qapf+Ic+WyPRKNir0lQz0FUaTk25gGpBKXYesR7uVQqFG66ebPSvk48Q0ocVCZgopH+gMiZDWHURKk9TprhW1kTI6Lc9UxcDyteEfVjPyXkIYwhA00szUIBjeIsxBo2mpCRRjDhwJb6f23Eevq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718131485; c=relaxed/simple;
	bh=cmWCRSsYOjggNYeVeX/Fh4mhXsxo9amZoR1fd/Cu6Gk=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=mwITV4wKUeiCM+3agPzL81ds4okk68z0HA10nnD8lurKF84GIrH6eyjucI98dLMApCS5/NrCx3YC5Kr7gtS7Iq+DdAmPEh9GyMN7FNBW3pcikoaEdio6MsaArV7LqpzzSbpNXOFeVwJ2M8s15sLvqEMqh+BGWWnwU/oGYPVTtt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=exe9x/dN; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1718131479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7pHYA0hGBd5Rs4Cbwkyp6/xsosqWE78XZanccvxJQB0=;
	b=exe9x/dNpVvBNkUcZVrYH73T+Uod4Qi/u0ryfQ1dBdVMGUqiiCQ8njpLS63/J4xQpon0KC
	Opyqd+dviw2iFD9Q42wk9fmwQlEmV26rd+V5Jd5/PTAYZ82ABKgP/vPLC/N4xrd3AEpes8
	iO59i0Wx+OCimcupfXEDaQcyvSvQ0/JojoiXxQJuVMgt4ndSkFy17xEnLjQ+6IX94naf8y
	KzGRAxT1KNWpCQhG6Q2qDs0cQWIrUyijdRg+Is6g2VkHKK5XVgVtBL8iKnIxbELUlV+uC/
	/5tcB+Q0wW/rxhrHd2T6vdNbgCpZTlR5QzCjFY81tIVh30LUJws/J/Bz72CohQ==
Date: Tue, 11 Jun 2024 20:44:38 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] mmc: add missing MODULE_DESCRIPTION() macros
In-Reply-To: <20240611-md-drivers-mmc-v2-1-2ef2cbcdc061@quicinc.com>
References: <20240611-md-drivers-mmc-v2-1-2ef2cbcdc061@quicinc.com>
Message-ID: <afbb0c52a5f37caeba7c2839d702cc0a@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

On 2024-06-11 17:50, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in 
> drivers/mmc/host/of_mmc_spi.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in
> drivers/mmc/host/tmio_mmc_core.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in
> drivers/mmc/host/renesas_sdhi_core.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in 
> drivers/mmc/core/mmc_core.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in
> drivers/mmc/core/pwrseq_simple.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in
> drivers/mmc/core/pwrseq_sd8787.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in 
> drivers/mmc/core/pwrseq_emmc.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in 
> drivers/mmc/core/sdio_uart.o
> 
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
> 
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com> # for TMIO 
> and SDHI
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Looking good to me, thanks for the v2.

Reviewed-by: Dragan Simic <dsimic@manjaro.org>

> ---
> Corrections to these descriptions are welcomed. I'm not an expert in
> this code so in most cases I've taken these descriptions directly from
> code comments, Kconfig descriptions, or git logs.  History has shown
> that in some cases these are originally wrong due to cut-n-paste
> errors, and in other cases the drivers have evolved such that the
> original information is no longer accurate.
> ---
> Changes in v2:
> - Updated descriptions in core/pwrseq_emmc.c, core/pwrseq_simple.c, and
>   host/renesas_sdhi_core.c per guidance from Dragan.
> - Link to v1:
> https://lore.kernel.org/r/20240610-md-drivers-mmc-v1-1-c2a2593e4121@quicinc.com
> ---
>  drivers/mmc/core/core.c              | 1 +
>  drivers/mmc/core/pwrseq_emmc.c       | 1 +
>  drivers/mmc/core/pwrseq_sd8787.c     | 1 +
>  drivers/mmc/core/pwrseq_simple.c     | 1 +
>  drivers/mmc/core/sdio_uart.c         | 1 +
>  drivers/mmc/host/of_mmc_spi.c        | 1 +
>  drivers/mmc/host/renesas_sdhi_core.c | 1 +
>  drivers/mmc/host/tmio_mmc_core.c     | 1 +
>  8 files changed, 8 insertions(+)
> 
> diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
> index a8c17b4cd737..d6c819dd68ed 100644
> --- a/drivers/mmc/core/core.c
> +++ b/drivers/mmc/core/core.c
> @@ -2362,4 +2362,5 @@ static void __exit mmc_exit(void)
>  subsys_initcall(mmc_init);
>  module_exit(mmc_exit);
> 
> +MODULE_DESCRIPTION("MMC core driver");
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/mmc/core/pwrseq_emmc.c 
> b/drivers/mmc/core/pwrseq_emmc.c
> index 3b6d69cefb4e..96fa4c508900 100644
> --- a/drivers/mmc/core/pwrseq_emmc.c
> +++ b/drivers/mmc/core/pwrseq_emmc.c
> @@ -115,4 +115,5 @@ static struct platform_driver 
> mmc_pwrseq_emmc_driver = {
>  };
> 
>  module_platform_driver(mmc_pwrseq_emmc_driver);
> +MODULE_DESCRIPTION("Hardware reset support for eMMC");
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/mmc/core/pwrseq_sd8787.c 
> b/drivers/mmc/core/pwrseq_sd8787.c
> index 0c5808fc3206..f24bbd68e251 100644
> --- a/drivers/mmc/core/pwrseq_sd8787.c
> +++ b/drivers/mmc/core/pwrseq_sd8787.c
> @@ -130,4 +130,5 @@ static struct platform_driver 
> mmc_pwrseq_sd8787_driver = {
>  };
> 
>  module_platform_driver(mmc_pwrseq_sd8787_driver);
> +MODULE_DESCRIPTION("Power sequence support for Marvell SD8787 BT + 
> Wifi chip");
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/mmc/core/pwrseq_simple.c 
> b/drivers/mmc/core/pwrseq_simple.c
> index df9588503ad0..154a8921ae75 100644
> --- a/drivers/mmc/core/pwrseq_simple.c
> +++ b/drivers/mmc/core/pwrseq_simple.c
> @@ -159,4 +159,5 @@ static struct platform_driver 
> mmc_pwrseq_simple_driver = {
>  };
> 
>  module_platform_driver(mmc_pwrseq_simple_driver);
> +MODULE_DESCRIPTION("Simple power sequence management for MMC");
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/mmc/core/sdio_uart.c 
> b/drivers/mmc/core/sdio_uart.c
> index 575ebbce378e..6b7471dba3bf 100644
> --- a/drivers/mmc/core/sdio_uart.c
> +++ b/drivers/mmc/core/sdio_uart.c
> @@ -1162,4 +1162,5 @@ module_init(sdio_uart_init);
>  module_exit(sdio_uart_exit);
> 
>  MODULE_AUTHOR("Nicolas Pitre");
> +MODULE_DESCRIPTION("SDIO UART/GPS driver");
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/mmc/host/of_mmc_spi.c 
> b/drivers/mmc/host/of_mmc_spi.c
> index bf54776fb26c..05939f30a5ae 100644
> --- a/drivers/mmc/host/of_mmc_spi.c
> +++ b/drivers/mmc/host/of_mmc_spi.c
> @@ -19,6 +19,7 @@
>  #include <linux/mmc/core.h>
>  #include <linux/mmc/host.h>
> 
> +MODULE_DESCRIPTION("OpenFirmware bindings for the MMC-over-SPI 
> driver");
>  MODULE_LICENSE("GPL");
> 
>  struct of_mmc_spi {
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c
> b/drivers/mmc/host/renesas_sdhi_core.c
> index 12f4faaaf4ee..58536626e6c5 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -1162,4 +1162,5 @@ void renesas_sdhi_remove(struct platform_device 
> *pdev)
>  }
>  EXPORT_SYMBOL_GPL(renesas_sdhi_remove);
> 
> +MODULE_DESCRIPTION("Renesas SDHI core driver");
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/mmc/host/tmio_mmc_core.c 
> b/drivers/mmc/host/tmio_mmc_core.c
> index 93e912afd3ae..c1a4ade5f949 100644
> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -1319,4 +1319,5 @@ int tmio_mmc_host_runtime_resume(struct device 
> *dev)
>  EXPORT_SYMBOL_GPL(tmio_mmc_host_runtime_resume);
>  #endif
> 
> +MODULE_DESCRIPTION("TMIO MMC core driver");
>  MODULE_LICENSE("GPL v2");
> 
> ---
> base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
> change-id: 20240610-md-drivers-mmc-cb5f273b5b33


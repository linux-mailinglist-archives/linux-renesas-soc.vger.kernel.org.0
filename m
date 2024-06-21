Return-Path: <linux-renesas-soc+bounces-6600-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A482911FEA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2024 11:01:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B1671C210DC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2024 09:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F1DF745E2;
	Fri, 21 Jun 2024 09:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VCRJt1Je"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A813C1C02;
	Fri, 21 Jun 2024 09:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718960512; cv=none; b=SHBLOXi8VT+QsypTyzSvdO72BtXIfCJWWtUTnZl+k8avOQ3FDoCeOkQMLjP6usDG5mPLmIDS12cCSUVNUvdgt9JqEwU1UrkBJGdGo1pxQe9XAjzWEtazocJ/uUCeNIEeRWc+nindp3hMdfvUu5ilrkksVqDPqY4uGUXLxhoq1pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718960512; c=relaxed/simple;
	bh=lbb3RlxiVSN5An+lcWwXEDj1fEY7J50BbOUre3XLuP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KLkruo7rxw5CPCpsX1zgk//WHRJj0qf3CWumXAnuLyAwi/TajDmiLBCiZ5VY70ffEXcHKUA7ClHL1C4oIdtS2Sb1FQDJknMK2eyq47jw6oiFQQNevM1JzvcdrKMX5AhwORLhoP9A0GEU9rbnhbUtFKv7njBYgZwIW2hipYb86kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VCRJt1Je; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-4ecf11aa0d6so567740e0c.3;
        Fri, 21 Jun 2024 02:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718960509; x=1719565309; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h8crjU+EtnhctEnFUJbd2boW5EyfjEiu3bDRE8jkR0I=;
        b=VCRJt1JeXMQkFljrzTXn7H9gaZKYbIXB/AIdP5HVD/cIBnXxDRoXYX+wLqJlolqTRb
         PXn1w6Yv2hM+pBRVNZhQ9aFiH+SBWvaD/W4JpqvZUzPDtF2g65LPp4fTSnmqmwcG2hOp
         V2krUdumZpOoB6kQYpOGogTKtYpHXHVuz4UC67aSKIyaWYy9gA2jKBsA+roewYJk1sSp
         eKvd8wMMTQ3Cw83IYrjwMt09EHwtPwVtiyuyT02BIt/vRSUuhJJYz5u5O6Nl9b0JtPZD
         b1ujz2wowSKT3ceSpo5JX2CkzZxirDaVk9mL7lfXxnZfccQfSpMia8h8tYOeyGb7KREq
         CO5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718960509; x=1719565309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h8crjU+EtnhctEnFUJbd2boW5EyfjEiu3bDRE8jkR0I=;
        b=QPM3D18bLgsodf5IsguVsZZp1OnT6EsltDEu9Xh0yblOwqFZKC8hzXyEq4dyPkEzSv
         CUih0sMZCBc319kL5oOR9E5fnXaxFdcgF9NeoRKbbcssihd2VgoaGYl9PidLL1hiyKWd
         OriOKrz6zT8UkKCUE9UF7T1Ap47U9DLBp1zmDVEhKwetV83bQ4+qx3MfFp8IfCHnsCuh
         aWMgcEKIY0kJHpgKDWOuuXxakkZSihMkYmy7p5y4pWUI9G78vpMsvr2D2nnNT2CB79Fk
         QTZ9+O2cXLaFvo240+kFWleiekoemlbqrQoY5oHkgpE0g72MEJA4pM12hhVD9w/fwpeA
         1/YA==
X-Forwarded-Encrypted: i=1; AJvYcCWn9u3A0y0JMx20WkE/4f8I0gucZwvG2J4z+ouVBP8lsEt/dN12tuL5N4xuZPIE65K6g5DgRTC2w9PerB+mvNYTW7Tay8I+SZybBBg2B6Jr4JakiQqqw5lUmpISzVDDuVsDEAX3Pj6OZeTn0aE=
X-Gm-Message-State: AOJu0YxeYzmurHYBczcbItsiph0e5f4L4YflwpYgsAmwxjruEq7mDH/Z
	VKUOnRo8SK4ro4jcdy4ODbHQ0qt7PolHcIhGtqaG9NotUyKq8ASXimTIMzti0ZT97pcNZZV7rcH
	bCEZyvRYgDbwFXyA7CcT/jF/tgB8=
X-Google-Smtp-Source: AGHT+IG0DMI2JXtnG2IQ0Z4GYCA31lk28r1AN9eOxXEJ7zK6hGuurqdOzOeHD+9STeRj6+FppoRGMWt2rDHHbeg3TlU=
X-Received: by 2002:a05:6122:3184:b0:4df:1a3f:2ec1 with SMTP id
 71dfb90a1353d-4ef27665f61mr7900622e0c.1.1718960509510; Fri, 21 Jun 2024
 02:01:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1718897545.git.geert+renesas@glider.be> <fbbc13ddd19df2c40933ffa3b82fb14841bf1d4c.1718897545.git.geert+renesas@glider.be>
In-Reply-To: <fbbc13ddd19df2c40933ffa3b82fb14841bf1d4c.1718897545.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 21 Jun 2024 10:01:06 +0100
Message-ID: <CA+V-a8uAS9vHrVZpfyUUQvE7DConmbWH2yPkPM9N0Wb7Rd33Gg@mail.gmail.com>
Subject: Re: [PATCH 2/2] mmc: tmio: Remove obsolete .set_pwr() callback()
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, linux-mmc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 4:40=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Commit ca78476e4888f1f1 ("mfd: Remove toshiba tmio drivers") removed the
> last users of the .set_pwr() callback in the tmio_mmc_data structure.
> Remove the callback, and all related infrastructure.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Laurent tried this before in commit 3af9d15c719017fe
> ("mmc: tmio-mmc: Remove .set_pwr() callback from platform data"),
> but it had to be reverted in commit 9d731e7539713acc ("Revert
> "mmc: tmio-mmc: Remove .set_pwr() callback from platform data"")
> because there were still users at that time.
> ---
>  drivers/mmc/host/tmio_mmc.h      | 3 ---
>  drivers/mmc/host/tmio_mmc_core.c | 8 --------
>  include/linux/mfd/tmio.h         | 1 -
>  3 files changed, 12 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
> index de56e6534aeaaa10..2af5730c21f4a98d 100644
> --- a/drivers/mmc/host/tmio_mmc.h
> +++ b/drivers/mmc/host/tmio_mmc.h
> @@ -139,9 +139,6 @@ struct tmio_mmc_host {
>         struct mmc_host         *mmc;
>         struct mmc_host_ops     ops;
>
> -       /* Callbacks for clock / power control */
> -       void (*set_pwr)(struct platform_device *host, int state);
> -
>         /* pio related stuff */
>         struct scatterlist      *sg_ptr;
>         struct scatterlist      *sg_orig;
> diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc=
_core.c
> index 93e912afd3ae5aa0..7b4256f0cbe77028 100644
> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -880,9 +880,6 @@ static void tmio_mmc_power_on(struct tmio_mmc_host *h=
ost, unsigned short vdd)
>
>         /* .set_ios() is returning void, so, no chance to report an error=
 */
>
> -       if (host->set_pwr)
> -               host->set_pwr(host->pdev, 1);
> -
>         if (!IS_ERR(mmc->supply.vmmc)) {
>                 ret =3D mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, vdd)=
;
>                 /*
> @@ -916,9 +913,6 @@ static void tmio_mmc_power_off(struct tmio_mmc_host *=
host)
>
>         if (!IS_ERR(mmc->supply.vmmc))
>                 mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, 0);
> -
> -       if (host->set_pwr)
> -               host->set_pwr(host->pdev, 0);
>  }
>
>  static unsigned int tmio_mmc_get_timeout_cycles(struct tmio_mmc_host *ho=
st)
> @@ -1160,8 +1154,6 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host=
)
>         if (pdata->flags & TMIO_MMC_USE_BUSY_TIMEOUT && !_host->get_timeo=
ut_cycles)
>                 _host->get_timeout_cycles =3D tmio_mmc_get_timeout_cycles=
;
>
> -       _host->set_pwr =3D pdata->set_pwr;
> -
>         ret =3D tmio_mmc_init_ocr(_host);
>         if (ret < 0)
>                 return ret;
> diff --git a/include/linux/mfd/tmio.h b/include/linux/mfd/tmio.h
> index aca74ac1ff69e6f7..8c09d14a3a286ca0 100644
> --- a/include/linux/mfd/tmio.h
> +++ b/include/linux/mfd/tmio.h
> @@ -100,7 +100,6 @@ struct tmio_mmc_data {
>         dma_addr_t                      dma_rx_offset;
>         unsigned int                    max_blk_count;
>         unsigned short                  max_segs;
> -       void (*set_pwr)(struct platform_device *host, int state);
>  };
>
>  /*
> --
> 2.34.1
>
>


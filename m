Return-Path: <linux-renesas-soc+bounces-6599-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3E8911FE6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2024 11:01:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0214D28F8DE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2024 09:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9E5F8248E;
	Fri, 21 Jun 2024 09:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b4gMevsS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3141043156;
	Fri, 21 Jun 2024 09:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718960465; cv=none; b=lO+/uyK+NWW0zUUAkbZAv8TVqsjVV/I0dmYhWmeBip7TdFscrbEq32hcoKXJlZKuAuuQHFpatTEg1g9c0zSkmMBgNSV/RnZfbwBKZ804gC9jxbmGSP5iXvz7GujqLg+rC7XK90YLZlNWJ6n2jRs35MTCmf+hym/9KsFoUPIKGEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718960465; c=relaxed/simple;
	bh=QESApowMfWWosKMvPg+qM/uKEyK3pBojhid9Y+eM8zk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ao5j/8WgmLD3/S8NKisr3EYIfti9jFbbUTf+S8adeLjC6JA1YtN0vOlTNlfCyV4QV7x/f4esANYo6O+EFlIswn0KtnYRUfu1r8UNLE05/uYMah/kjmNt+zWJGyOCZfjyFe6J2Q87GgiDsPJn383TrrEK6VIfekMrc9UG2/mUYE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b4gMevsS; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-4ed0c84c749so1647140e0c.1;
        Fri, 21 Jun 2024 02:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718960463; x=1719565263; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KLVXsYnoOHwAkQTxP57HYIp6uFVXgkZiep9Nj2pspWM=;
        b=b4gMevsSwiVcgicF4ANB/u8YYeC7FW73OJrjJ9wxtwKzS8gtH8L+qyJkK9GbafAZGk
         cLe29+GuU8Ouqk0Mm0N37JrEcYh74/NrhM2SkKpnTYPKaWyA+ErOHCthfq5UgiGsPatv
         tPxWZdLBw+9y8Yv37kN25mbsXWvsi0m3smgQB45CRkrLdjbca2jzIBTzVAR6n6yVEDRj
         /FGqDyYUMCirBO9VpqU1Nibzm+ooJ7ej0IiZb5Zyqw7qxFSoVVyM6a21Li1+dY2OQ0Ov
         BxKhGQCO4mxzZGIdfOPkcpWw6eeJbVjNl+Lg5Z3uUmK5wBPK2F3B8uEr3daFYB6nb7HN
         +xgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718960463; x=1719565263;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KLVXsYnoOHwAkQTxP57HYIp6uFVXgkZiep9Nj2pspWM=;
        b=YURwADhCBEA8h1jw4gBNjKFsDFyLjS8QwiHdxBhlEKtGvP86/8tT09HGUGLbJHwrWc
         BkBgM/82bmuMDk9wE97mApfLa8G2dXracTJKUBEpBcZhTMlq2z02X07poD04jqana2si
         MCHV4aRvI/nPPniDLRIvLhX9Pd7HD2BQLV0rknqpWGBhKgSRP1nV5lbZRnEi1bwJ/Ct9
         JbtfBSw/YbPJ4IkjL+beUnUVY7UB4IkWl9vhyBhYWVyXtrhmCGYY7dFSxcvQAW2VRvvZ
         JolSpUi6l1v5syKzUD2QNl1JadXnuIIIr2Gqnh/5390pE3XSej2m4oB+eHFylchze4VE
         M/1w==
X-Forwarded-Encrypted: i=1; AJvYcCW4VlVVqAoVuHu0lVvMpDSb4RpXC+RGTCNFSvNGf/rtzM49oCK/piS6abd++LnbyBPtSI1MW98PGzqYAYn+iIrd+5kRW9pB693NXMx7zhxEIkItNzZftuph8xncqpHQboxrKmScBAvNB/astlA=
X-Gm-Message-State: AOJu0YzSuwCi56LjVZsYH9V7pe1xSlUgVVaIRe1hMngzhm8jOScCRTgG
	eOrQzeq2ZD18qNYEUS0QvTW3x619cWX6uVfem7ypFPEahP/cApOlVJAaqUxjuZ5kyrSo+xD3ajP
	pilrsdVMJOq2Th/rbMk4Ag9fAUSE=
X-Google-Smtp-Source: AGHT+IEMLEm2wzhu8Ef3331nypFvC0EDFr+QPSsgnidzhTbPx7ItujOz3LMMh1tsW7mTETevIdkkUwW5qXbFNn9+f7I=
X-Received: by 2002:a05:6122:1d8a:b0:4da:ae51:b755 with SMTP id
 71dfb90a1353d-4ef2778808dmr7251858e0c.3.1718960463006; Fri, 21 Jun 2024
 02:01:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1718897545.git.geert+renesas@glider.be> <e0fa98f138a7b2836128178f8b3a757978517307.1718897545.git.geert+renesas@glider.be>
In-Reply-To: <e0fa98f138a7b2836128178f8b3a757978517307.1718897545.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 21 Jun 2024 10:00:19 +0100
Message-ID: <CA+V-a8tcGp0OTZMiNba25v=FD_bsA=AMd+ec+UwOT7=AHNOqNw@mail.gmail.com>
Subject: Re: [PATCH 1/2] mfd: tmio: Remove obsolete .set_clk_div() callback
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
> Commit bef64d2908e825c5 ("mmc: remove tmio_mmc driver") removed the last
> user of the .set_clk_div() callback in the tmio_mmc_data structure.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  include/linux/mfd/tmio.h | 1 -
>  1 file changed, 1 deletion(-)
>

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/include/linux/mfd/tmio.h b/include/linux/mfd/tmio.h
> index eace8ea6cda05a3d..aca74ac1ff69e6f7 100644
> --- a/include/linux/mfd/tmio.h
> +++ b/include/linux/mfd/tmio.h
> @@ -101,7 +101,6 @@ struct tmio_mmc_data {
>         unsigned int                    max_blk_count;
>         unsigned short                  max_segs;
>         void (*set_pwr)(struct platform_device *host, int state);
> -       void (*set_clk_div)(struct platform_device *host, int state);
>  };
>
>  /*
> --
> 2.34.1
>
>


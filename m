Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FF3717FE1F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2020 14:33:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727075AbgCJNdG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Mar 2020 09:33:06 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:46207 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728354AbgCJMss (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Mar 2020 08:48:48 -0400
Received: by mail-lf1-f68.google.com with SMTP id l7so1736192lfe.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2020 05:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=02YCpOcYgDr2RIZdF/x1NVUywRgMsFxtc+njZV4rLeY=;
        b=RkadbTZs67fU9rSXGjUpIYuJJqO/hjj4cQZTKNqQhWlzhil9no9aSQh/hdlLwNp+7m
         NA45dgJZ3moN/DxYshX5WzSk+mv/+Y9FCbSyQ13p/EcUB5p3PfOCeTdVoLFbacGbb3Xf
         BbdXyBh99t3+aoKRMOrsbF6ojIE5Zlcc7qlJjg3bgVBeecYhWRTgw7H4A6T4kQt9Iz2n
         dPb63B8RDKqNYjcnueVxQ2dIyKEYaMGCmZFh3pChz/bha8/K1P+f0PaKPArh88LuTNAV
         Nr353sAH0Y9OR+5Z0vj86pxdPS3uQ0upAY+n70y5hCHyVLoys7XULawzdWe9dT5XHnWP
         g0sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=02YCpOcYgDr2RIZdF/x1NVUywRgMsFxtc+njZV4rLeY=;
        b=BQYcopJVrBLCKMj9wzmCXq5u8kUgb4lwXGwtMVAOJet1UgCBdKIJ5+c82G8y+fof59
         kt4p6PKko9PMfwA/hGdg6fI/1z10Ras7Ffz3mf5aoaq9L6oySVO0LAH9oKI7hf6oGkGy
         funtQW+1oC1Z7hB61sTkMcJfDVI/k/8cVaXAZhmIkRUzZxQgZr0DdsuoNTpxH3orGV0v
         ER/C5NirL2ana7AAf8HcD6lP8c8SKJPIHOMJ2+ENikoaD5yefNU87TVnXf8u6GvOvq/i
         W4pVTHkQCxh1c0etd7aLVMLeF3V68KYd9lYLuYOIDxGcUFSbOI6nH+PuKRcSxXPlKv0n
         akyQ==
X-Gm-Message-State: ANhLgQ2+CkNAp+E/7iHMPs5MRPBFBnjAjNlf0vRbuohsf85Vj19OvFIQ
        6LlUHnjgY+Ll1ElHA39B1MpF5DuLpBI=
X-Google-Smtp-Source: ADFU+vsgmv0jq7AXXvtsvyuZoBOTHOnaupBq/z++CY1/zbVVC5+3JatnqiO1l0kG1KPSmZcEcESjhw==
X-Received: by 2002:ac2:5598:: with SMTP id v24mr499682lfg.139.1583844525496;
        Tue, 10 Mar 2020 05:48:45 -0700 (PDT)
Received: from localhost (h-200-138.A463.priv.bahnhof.se. [176.10.200.138])
        by smtp.gmail.com with ESMTPSA id b17sm23704416ljd.5.2020.03.10.05.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 05:48:44 -0700 (PDT)
Date:   Tue, 10 Mar 2020 13:48:44 +0100
From:   Niklas <niklas.soderlund@ragnatech.se>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v2 3/3] media: rcar-vin: rcar-csi2: Add support for
 MEDIA_BUS_FMT_SRGGB8_1X8 format
Message-ID: <20200310124844.GP2975348@oden.dyn.berto.se>
References: <1583838364-12932-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1583838364-12932-4-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1583838364-12932-4-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Lad,

Thanks for your work.

On 2020-03-10 11:06:04 +0000, Lad Prabhakar wrote:
> This patch adds support for MEDIA_BUS_FMT_SRGGB8_1X8 format for CSI2
> input.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Small nit, you can drop rcar-vin from the subject as this patch is for 
the rcar-csi2 driver. With this fixed,

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> index 39e1639..b030ef6 100644
> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -320,6 +320,7 @@ static const struct rcar_csi2_format rcar_csi2_formats[] = {
>  	{ .code = MEDIA_BUS_FMT_YUYV8_1X16,	.datatype = 0x1e, .bpp = 16 },
>  	{ .code = MEDIA_BUS_FMT_UYVY8_2X8,	.datatype = 0x1e, .bpp = 16 },
>  	{ .code = MEDIA_BUS_FMT_YUYV10_2X10,	.datatype = 0x1e, .bpp = 20 },
> +	{ .code = MEDIA_BUS_FMT_SRGGB8_1X8,     .datatype = 0x2a, .bpp = 8 },
>  };
>  
>  static const struct rcar_csi2_format *rcsi2_code_to_fmt(unsigned int code)
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas Söderlund

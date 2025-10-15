Return-Path: <linux-renesas-soc+bounces-23084-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C313DBDF4E4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 17:18:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CACA44F75A5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 15:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE8432FA0D4;
	Wed, 15 Oct 2025 15:17:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184932F3C07
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Oct 2025 15:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760541432; cv=none; b=mBeDCNAOPeYImdhJ0wEtGN2Ap6oArQ2N76PAcRCEmmF2Cqxhi1lWw74Ceb7yT7nNyyGItzOz9TFnDo2VjQOjrgMgWVgKD/bgfHxVp12pfUzcHHR6fauZS0KgwOvSTtaMFfHcQG93obsSOPmgbbGEQ2y36cF3V5hjD39kRGgoYZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760541432; c=relaxed/simple;
	bh=IV+GRifs/CZH3mBOt11ulcvrcGNrA2ckYSmyBrRV8vA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tuVGha5iAWaW0VLOXRYw9lLhzK4O4ytOqJnhiOTbbKDveQe5+aL1x31QEzNefnbz0NTA/+AvEsGnhI7+TOIjukzWr/LjFEMh3/l+Mx0TqZIOi1rPbn59yY14TMopIFh3DDrPxucjh1mPm50hgLg5yuV4gdbTFbEd5wEIfD1+SnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-89018e9f902so4035153241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Oct 2025 08:17:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760541430; x=1761146230;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gYlOVCW4Ai0uf6Aunon5QhuALTLV1R3/6FPdAypUrZU=;
        b=lbbopJWBxtVgxHHt/En8FpeuVez6Vnn0DNoN59CMlELvf6yGFca4AhW3FTUcMElY+a
         0MwPVo4eiu0epcV7w+wQZz0nJ1nxh0mkq7WyQ0PhCIkPT6Sx+6VSJyhq9qhUxvGYfaJ0
         LJN0YPqmI5qg9xdIn1mTKG9d70IRzZrY125fgxLY2+JTqjh5ZPtdSZp7CZ/v5ZhEqxkG
         3zSzKsIEqd8mDzuvsFGPCXhL2WfFtNW8hwOl9+NdHuBCxxaXb2WV35m5WD9w9KPTqktu
         WwSfQ6on4iLKzuquoT+QOiNGVyDu6j0Ua3LsOKwPawFks7CY1SvtzD528kuvbB2YYfR2
         popg==
X-Forwarded-Encrypted: i=1; AJvYcCVeERlTsgBwkYqbnuCrFvu6m+O55dFfhNL52yY+gUp+ygHXS/Rb4EKrPsLOA2gbmNrEgVIjm1Lq7C//rXCn/+2CbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFKtgtj0Cb2021fOqLeoSbKe7dMZuo9miRibJ+45Ur4BhBB1PS
	t1FZr4DmenDDo3ieaFBO4Bi/SRBrldRvySJB9tFoiWaYg4JsOgfd5cUzhKIQ5B8b
X-Gm-Gg: ASbGncspTQQwWOVD7SfzvdxcecgU7IKFh5TD2FsBqxHOAO6GEXzHahSSWbx3Y09DeJ+
	78s2sJm3p02VS5wL2QOlMUXZ76RULR3B63ptGPnJfVn/mlum4nezObuw0nkE1WBUclEnIldNIJv
	e/RtWQdOxFUPpRXhRKo+IGwp3ZOh/SrIDm0CGs7YIMrDiOgZ2Lv+GoQ336DxBMnJAqbtCwNaNa1
	AT2eU+4EIWf18uIFmNUEUEjz+s8RaEb5kpdNBPlS3Tsh0zLMF6uNn4rqwQK/y5RnFA0VX1mNdd/
	d1Yw4MySvr49n6x3g7wYjYrOnHreY/vz+WGJcQtahpKxaARZWL84U1q6D3WyvEi4tl5OUPQnC0C
	44SnIreSxZNJiFZPuGU4e0Rwtxi4SxVvvkAMNSgzUBIwxa8PDeviFM49nfyMC8z8K1LN5Q1Cgxm
	7s3YFtr/e0emoYqPZ4xWotW6XP
X-Google-Smtp-Source: AGHT+IHyvly22sUMVNPrK5i3CPlRlsyAGqC7yY4iIUnmk8mZUczIOC5t0yGPxjknBVXKRDzDe11bEw==
X-Received: by 2002:a05:6102:3f4b:b0:5d6:21c0:d0b7 with SMTP id ada2fe7eead31-5d621c0de2cmr4105600137.34.1760541427544;
        Wed, 15 Oct 2025 08:17:07 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d5fc927cf3sm5544864137.15.2025.10.15.08.17.06
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 08:17:07 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-8fb58f2b820so4142688241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Oct 2025 08:17:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW3oE9CIFLRRcrlGWCojP9pqRW/1N2jBMbFGtgyNl2hkB5pEl3TkS4PHZGsdhgJY4ATduY4n5ZOgwO1nkLTtBzdFQ==@vger.kernel.org
X-Received: by 2002:a05:6102:80a9:b0:56c:eed1:276d with SMTP id
 ada2fe7eead31-5d5e2323cfbmr10980364137.18.1760541426765; Wed, 15 Oct 2025
 08:17:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015150728.118296-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251015150728.118296-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Oct 2025 17:16:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVUos1===uyOVwVTsmqpf321sX-hYJ36L6LKdR62sC23w@mail.gmail.com>
X-Gm-Features: AS18NWCzpNv-DwB-GZVXUz-0WdBwxHutFcnJYtynPXM4j5XD-FsH8-0maASB2us
Message-ID: <CAMuHMdVUos1===uyOVwVTsmqpf321sX-hYJ36L6LKdR62sC23w@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: defconfig: Drop duplicate CONFIG_OMAP_USB2 entry
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Eric Biggers <ebiggers@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Nishanth Menon <nm@ti.com>, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Oct 2025 at 17:07, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> CONFIG_OMAP_USB2 is already enabled as a module in the default defconfig
> since commit 8a703a728a745 ("arm64: defconfig: Enable USB2 PHY Driver").
> Remove the duplicate entry to fix the following warning:
>
>     arch/arm64/configs/defconfig:1705:warning: override: reassigning to symbol OMAP_USB2
>
> Fixes: 91fe3315cdf9f ("arm64: defconfig: Enable missing AMD/Xilinx drivers")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Added "Fixes" tag.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

As this is not yet part of the soc tree, I guess it can still be fixed
in the original commit?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


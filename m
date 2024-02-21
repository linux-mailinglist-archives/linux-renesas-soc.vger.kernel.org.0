Return-Path: <linux-renesas-soc+bounces-3059-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1213885EAFB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Feb 2024 22:36:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7A889B29283
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Feb 2024 21:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 117A81272B2;
	Wed, 21 Feb 2024 21:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KYtTh/tM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B6F1272A1
	for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Feb 2024 21:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708550726; cv=none; b=UyZiL1lMVi9Qxx6rcD8MpQDPP/8ePMjJ/lL0eh6bk/CiZfItX5faGbsjO3YybRpbv2iaH1uMI1PXwuNFPWWruJc62RR68Kakc6km9wt01qpQJgNm2xIX+9Rv4ic8ibPJBkQ76n/OVMj6/P48MsrHvp/oY2GBZHrrt6VrT0HfVMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708550726; c=relaxed/simple;
	bh=vwcCEdPIttWiNnK38OUvrS0LIv8EPoiVoGqCGSZN+Ig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aG0NSZilQzrojYvb1vmJlnhShJYzyp2yzQZ/uU2gwJkU7kqNpy277cTn+ihZ8Ynid1b2NR9TZCQFN6GWQE0vZeT+WFezhDET6FfLsfUAoaMbXha7c86X812aJsIOqN2ZuRL30r5CyN9hTPr5Wd85ersmnmvcF83immOR/vJLo60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KYtTh/tM; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dcbd1d4904dso7892974276.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Feb 2024 13:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708550722; x=1709155522; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eQcwsvUVgzwUHzVYq2OUwFRsg7S9zwWdnAGogtH5/+c=;
        b=KYtTh/tMfJTsTc1y6dP8tFA/q548E6QS1sFLhJInyi8VYfynZHFK8Nmr5B/8YTrVRp
         gRMX3VJjb8bT5xnFExOW7JYcyqaCPkg6llkwW5eLB4dMbmgpj01Vdc+TEi51KkBiuoDi
         fElxgHErKjwrUtdeM8OYUJD1u/c4s6PU2E4YYIc123pgMXVggCLhFxxkT3884vqEd2hW
         CUclIIQDBKJHc+rfYbfmZdyfGCgFBsZ/SFqy3RFrej0rGhlH1KZ8Otj+u32NIcev7G/i
         VjRu0jrbHJa6UdHvxahSeqXtYWlO6Vlj1ydMLsL1XLGPt5Ci1sK5BWBveSUgvR0vcRf3
         DOVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708550722; x=1709155522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eQcwsvUVgzwUHzVYq2OUwFRsg7S9zwWdnAGogtH5/+c=;
        b=p4Ohm2Ey1AbtGP9kxO6inz2fgfhP6jA+JH2wVYK9vZA+hqD0Enr1qbw0RA3Qr2iTZu
         fhc1zp8Z3O0JIujMN23WuzXphYEdzt89NcrRBLbcmHnE9QpIkqmGaxiUx/gWEc455aeh
         JPE3NbKeJc2FdUiklTqZlUf9C10Q+Mt66ZLjjk10Y4e24exsEPP/N/Iam3rE/UVsp6BY
         zr84n45Uiov+kuhLnl2TO/9b1Z4ANtS+FvlwlGAjQkGDvUzH5H8FMjFmi9xbD+ZKJzhr
         orPIAFqA+7deHinF7RQqChQ0RHGIfAS6PnwTAZz9zGA5wxyJC0YJ0sZ66UcWBhduEGeT
         W4zw==
X-Forwarded-Encrypted: i=1; AJvYcCW4xkkNiFAkC3+AC0ZX5yjpKC7rtLtp69OsEdxo1JZ2aRD2xqkYgg0HOWQcLt8JZSIH3bvbPJl8FPt656aYpKqz/sFIjFl59tXBBzaac4+nSJc=
X-Gm-Message-State: AOJu0Yzrjs+nwJLdO8w5Lif9iJh4iLpMyj0bYDV3CeubUJ0tTB1A0ihj
	3GJbA5ZTAiNK/LEeKlwSwW8+GIc1/9hZ7pt/q4iJUcq+kJY43bng17n/yHqlyB+K9OtmBL1UcK5
	ihi4RHyVagoFEh4xQ+CputBDWdXFIsCkwq+CsCQ==
X-Google-Smtp-Source: AGHT+IH4UPI5wpOTg15rGTFngizg01v5P2orm8RiQzbgP6QMedeTpOkK8y3JHAR2cnL/aWUbEuMgAt7gdxYB8HxLYEo=
X-Received: by 2002:a81:b614:0:b0:607:f4b9:11aa with SMTP id
 u20-20020a81b614000000b00607f4b911aamr17260454ywh.21.1708550722698; Wed, 21
 Feb 2024 13:25:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240127-mmc-proper-kmap-v2-0-d8e732aa97d1@linaro.org>
 <20240127-mmc-proper-kmap-v2-9-d8e732aa97d1@linaro.org> <7f40cb40-1a1-532-75fc-d3376ed27a@linux-m68k.org>
 <CACRpkdZpyefnTyKEJXru_HZG8xcJF66Eb2pZhbk+HVvfzdh4yw@mail.gmail.com> <CAMuHMdWwuH-mPm1TJTfvf3FXSd_zj+yP7OL6uB=-TrqNOT+W_Q@mail.gmail.com>
In-Reply-To: <CAMuHMdWwuH-mPm1TJTfvf3FXSd_zj+yP7OL6uB=-TrqNOT+W_Q@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 Feb 2024 22:25:11 +0100
Message-ID: <CACRpkdaks_7PWpXF=wssP2x+tZce5SFsGTCddgxjJQ9erHp-6Q@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] mmc: sh_mmcif: Use sg_miter for PIO
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, Ming Lei <ming.lei@redhat.com>, 
	Arnd Bergmann <arnd@arndb.de>, Ulf Hansson <ulf.hansson@linaro.org>, Nicolas Pitre <nico@fluxnic.net>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Adrian Hunter <adrian.hunter@intel.com>, 
	Angelo Dureghello <angelo.dureghello@timesys.com>, linux-mmc@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 21, 2024 at 10:50=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:

> > I've sent a patch, can you test?
> > https://lore.kernel.org/linux-mmc/20240220-fix-sh-mmcif-v1-1-b9d08a787c=
1f@linaro.org/T/#u
>
> While that patch fixes the BUG, it does not make the eMMC work fully.
> It spews:
>
>     sh_mmcif ee200000.mmc: Timeout waiting for 2 on CMD18
>
> and no or limited data is read ("hd /dev/mmcblk..." blocks after no
> or two lines of output).
>
> I still need to revert 27b57277d9ba to restore proper operation.

Halfway there. I looked at the code again and now I think I found the
problem causing CMD18 to time out.

I've send a new 2-patch series:
https://lore.kernel.org/linux-mmc/20240221-fix-sh-mmcif-v2-0-5e521eb25ae4@l=
inaro.org/

Yours,
Linus Walleij


Return-Path: <linux-renesas-soc+bounces-16976-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8E1AB3985
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 15:42:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3869E178CFD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 13:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D040D2920B9;
	Mon, 12 May 2025 13:42:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE2A2951BA
	for <linux-renesas-soc@vger.kernel.org>; Mon, 12 May 2025 13:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747057373; cv=none; b=XaZ00sveJ7htGGopfK5m4Ne/4ELIHUbaqSTsvXEYqJlTNlWEQW8rY9pQXDV3mZ8JERuVSxVtHQMQP3mTml6DxHAQ8ZgrNkR5FqFz9dIdJ6KFgW12lZvKTSA9FsrRdCejLob8iFxvr7BiWadavkdusILRTm99DdFoRmimLSol/Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747057373; c=relaxed/simple;
	bh=uJw2iQ+QCl4AFJwSW/tsyiowqFJntKRQklfdFhVnnl0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UjCI52gM/n9iump+a30p05RC3gcX15sQmHzaqprma/Em/Yb14kkBls0Ne6/tSZMS3Y7W37X5WE7PTo0sTXGUEIg8aamK+AC6K/wjfb4WBFJE+YQr2RdqVgWBJamJpV0CEQNJi7FYFO8pOUO9+8Ep09YrI+eUTq5jPidIJgjnaEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4def6955e85so1071712137.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 May 2025 06:42:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747057370; x=1747662170;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=203/2JChaIjLwIUhhRAARqct2ljtqG1xPuXlYs49+PU=;
        b=fvKq20lLDDYUd+CxwPIH3h/MJHZHGW5PmBdJKj/jrMFT8meQxkuBZ6wnic4kRU+SKw
         ukUH84hETjcpEFHOHlcDBg9o4Lpy6q8hQNRp5KyIvSKLTp13vb4MX1KRzWcHUuaPu1VI
         JGT2VsKuV/QukXFkCLu+sj9jzh3TU5wPHLbG/t7neZqkMg0pc/TJ7TK29uURs0FEw2ip
         MssQEFH0m5JQuaSN1OM0OK0bMr9mc4XIUFAlBGoKErpH+I5BQl+WzS9IOdJ8xX9d9BIT
         GwLZ2BuV7lzTSRvwd61J6KM4gL+fpUHWeg9z+tmOI7dalmCURPZ9FkCBGDqEjkPZYHaV
         U3Yw==
X-Forwarded-Encrypted: i=1; AJvYcCUs+S4goX5OXBcDzQzLocRI0nEA+DpDDz+4tFcQDFkekS3lBOUQ1ZIud4HfpQogD5FOIzRaR0M6YfUUR8zUlIv5Dg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqHaZDFzQHuikc2k2H7+a3W9NroCG8CiIDw3ummYWi1oTfr9tM
	94Hph3t6PuT6i9DncIaR87Q+RmKt86m24WB3m2thbdQ8uTLdia3mNFU99ZfV
X-Gm-Gg: ASbGncuCLod/mFi2x8d+Mm4Ox0qIdTom1UPJ2pWfX9b+JljMkiQyjANaKsx/HPEUbWy
	bvqBzvqZlGMHEq/lXF4E215eQJyQQ0N9sPOMUwjUoq/S0MJscO1XVslTGrXLG3aCbumcxdQRjtF
	wSwci8uFoUlZWuWJPuZfil3rzmELo8GYj5ENGVUHWro/l7scwAMF5TZ5VFkK9/YQ9tNqfZ3J9Ig
	7+0xJAQivE4XVggbuWX/Ets3JTWFlF+4uh5SoWKoiQAd2M+wb+Rg+uez+Xcy2T7RVJVqLv9CUc6
	Ak/e3nxH8NjjTnkRte5ScXjltK2Gzp5+Wka9rbI9sTZHD0uYGCfXyJHHnOB9FbsvurhFnWUzDRg
	rwebYlPN9SBWfDg==
X-Google-Smtp-Source: AGHT+IEKPqkZnX8d6s31SjFBCsjPptsnD9qQCygxBJ9W/+IKGlN+YhApfoqQO7MXXMpT0q5WJVTk8Q==
X-Received: by 2002:a67:e7c1:0:b0:4c1:924e:1a2a with SMTP id ada2fe7eead31-4deed410e33mr11472273137.25.1747057370275;
        Mon, 12 May 2025 06:42:50 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4dea85b2ed0sm5144684137.8.2025.05.12.06.42.49
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 06:42:49 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4def6435699so991753137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 May 2025 06:42:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU7a4vOMFmHw/3txpn6YETZBIn+/kc8Zvt9J9ocwM69aZmL/QClzEGaeNRFEwzLXMwKoSicRGdPHPKmTiukCEhSaQ==@vger.kernel.org
X-Received: by 2002:a05:6102:5e97:b0:4da:e631:a472 with SMTP id
 ada2fe7eead31-4deed3e3410mr10285424137.20.1747057369740; Mon, 12 May 2025
 06:42:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <TYRPR01MB142843BDB61D280B348AC7CAF828AA@TYRPR01MB14284.jpnprd01.prod.outlook.com>
In-Reply-To: <TYRPR01MB142843BDB61D280B348AC7CAF828AA@TYRPR01MB14284.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 May 2025 15:42:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUvVLPGSOcggf_m_ROhwqPZ+Rciydz2hPkLj08o6BMBVA@mail.gmail.com>
X-Gm-Features: AX0GCFsNhOFwJvCbtMsnBWkAGoc1W1ULKX-bgZEaUCeqOvBuogmIGAghxUSU6eQ
Message-ID: <CAMuHMdUvVLPGSOcggf_m_ROhwqPZ+Rciydz2hPkLj08o6BMBVA@mail.gmail.com>
Subject: Re: [PATCH 9/9] phy: renesas: ethernet serdes: introduce register names
To: Michael Dege <michael.dege@renesas.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Michael,

On Fri, 9 May 2025 at 14:06, Michael Dege <michael.dege@renesas.com> wrote:
> The original driver used magic-number offsets because the register names
> were unknown. Now most of the register names have been disclosed.
>
> Signed-off-by: Michael Dege <michael.dege@renesas.com>

Thanks for your patch!

> --- a/drivers/phy/renesas/renesas-ether-serdes.c
> +++ b/drivers/phy/renesas/renesas-ether-serdes.c
> @@ -23,6 +23,55 @@
>  #define RENESAS_ETH_SERDES_LOCAL_OFFSET                0x2600
>  #define RENESAS_ETH_SERDES_NUM_RETRY_LINKUP    3
>
> +#define BANK_180                                0x0180
> +#define VR_XS_PMA_MP_12G_16G_25G_TX_GENCTRL0    0x00c0
> +#define VR_XS_PMA_MP_12G_16G_25G_TX_GENCTRL1    0x00c4
> +#define VR_XS_PMA_MP_12G_16G_TX_GENCTRL2        0x00c8
> +#define VR_XS_PMA_MP_12G_16G_25G_TX_RATE_CTRL   0x00d0
> +#define VR_XS_PMA_MP_12G_16G_25G_TX_EQ_CTRL0    0x00d8

[...]

I think it would be good to move this patch up in the series.
Especially "[PATCH 4/9] phy: renesas: ethernet serdes: add USXGMII
and 5GBASER modes" would become easier to review.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


Return-Path: <linux-renesas-soc+bounces-21065-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C425B3B7BD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Aug 2025 11:52:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10963987C7A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Aug 2025 09:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFC2A304BCD;
	Fri, 29 Aug 2025 09:52:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8010C270EBC;
	Fri, 29 Aug 2025 09:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756461128; cv=none; b=jq36xvDqf0a+h/YKii/aCvdPQums65N9JQAB2sXynghDkMnMUBgZCEy9g6qwtSZl2o4dh5zF76p1YHVH7w10xBnSal+I52Idec2ndirIr5VnWAf1FzKVuTMXZaqjTvC26yHKAPFmryWIN7mq8fpmdhBsZp8Mlr9rV3E6RGs31dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756461128; c=relaxed/simple;
	bh=1K8txQ8ZiVqdO4sBq/aGOKbBZrl33TWOfV6grCNaZEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V0lVlKIVKcGQOvdbvRj/xRxdWCvwKNWx/TQlqSLr9KcJ9nVVd0jQI6y0MlDWRMQ2L6sB/4yQQ3gJjsztVXk5RseCO3Ic6OKweJoDMzPtjnOEyG4qNtFsxh0cnkSr8+JpZ4jdHHRzKO0y3KsqHX+Iq+UmY6lCWLYW5gKXV/xo6As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-8942ff52c06so416090241.1;
        Fri, 29 Aug 2025 02:52:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756461125; x=1757065925;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8csdi4uLMwibFZeJduARoOsaeU7M/R3cD1w5z0w12N8=;
        b=DcqFbjejWJh5ubk4JOiuhx7SNq09Q7ciSZpZePipPuW2QLu11DPV9NKZu+GxdHLlWK
         BAPA8Mrz9UZt4i4Y3Y1rk+gNExiENXIlcvQ5aNEIH0cfHQzm4pHTVpz2gTGvSTLavdDU
         xrJ32I9y7RJZIU0B+zp9ieaPffqkLiWfacGbCwloTsYGOxJz7+4jiQ3Ql5lx7hBAI1fJ
         ce3UAvzZ8akjKFoaWW/Wc/m0bmtBMh18jz7VKHniE92NsuoNh5jDuxsoNe2hTTdA21F6
         Poy6PXQmoM8HVHNDJGXOHfhTplmGSKwBM5ONTvRu9u/a3UwNRSMbjRt3/mNNzRKT4Bp6
         RdNw==
X-Forwarded-Encrypted: i=1; AJvYcCU0p7KvMYVS4xECUJ8nTp5FGjMpNURUKYN60ETXT3hhN0MTfDdJcv2LQQT3NmjIR1DGepVJFMxAxIuM@vger.kernel.org, AJvYcCWtM70fjVf+QVj/ZWf/wxAGsXt3trTzs7Fx/1eXCLughqcpOVJtkoLu1PR1RZGWvNPOU6/m1R8+A9mhDyBXQrA2qig=@vger.kernel.org, AJvYcCXsXrRKeg2V10BUDlwNjyEyHLix7XdSeQ28AGFEUitKQV8jbcRRvu5oN7C+orqN6id97tpBhnPCQKik158=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4jNWZeCGVC4uPRp+GFuNhV0crhsO3lF5EiSTRLwEhDpsY+hWI
	2eVv33qGmOUssNb4aeZKYzMdkGX7TQrcuNycN3ssBF6r63d5GdjF7LxR/LGOWhnX
X-Gm-Gg: ASbGncvDTQ2I6qVD/qOHqb+SfwvIN4VgelajN207gByhNfZXiPTsJND7+rWN/t/VqjT
	Fx9CsRX7BggghyUWmDiTfMCCAaCCPLzz85gVA4zyTjIsX/6Fg4pIAogNBTKEKMK/5rmoq+7QTi5
	olLCb5Lf2BakF6G0TDQkUPMfVj90TB8alUiTI9he+yiDu2bJubrgf8Py14HlGb1BeNid7ADaBL0
	UGPqhhrJDc4tr986D1s9VnJx3j0j3V4o2NBR4gmvDU//B+zIUtQM3de5mCvb9A1AAvfPITXSAMG
	02epVTl6bfRtr3JrLV/PWM/SpusgSBK/lo93OVGBEwxcy0T28WhDMFun3qQRAsk5l6TGvikQQJn
	3mNcOQFbSfRLjnEH6CHIyxnvwoFCTJRpq3j8SPC5nqvuW2f7Y4I9bhf8yt4X7egSICOCc+Ls=
X-Google-Smtp-Source: AGHT+IGM/wS8FUKBtbbSC79rk5s4v6YeQCRWAlfKbEiwXmMIo6A3RCdgE8489T92RjFJsASn14kvHQ==
X-Received: by 2002:a05:6102:3e8a:b0:4f6:25fd:7ed3 with SMTP id ada2fe7eead31-51d0ecbfb1cmr8046458137.22.1756461125322;
        Fri, 29 Aug 2025 02:52:05 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-529b11082cfsm768416137.11.2025.08.29.02.52.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Aug 2025 02:52:05 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-8942afd0421so577090241.3;
        Fri, 29 Aug 2025 02:52:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUQVNi2EcKZbbQkmp4qv7ai93n6UgxCSbK+vneUMur0hQFPLI0GVc+Aefp9EWU1fj+3ZN4ePxMMxRwo8x6Ic7ksfnw=@vger.kernel.org, AJvYcCUWoKE5CHrRKx7dx0rvVWePTZdx8eo77JuVvXO9C9oYg8bfp+Ze8ZgnvADK22G7reEdhEHfmKm8ROe3@vger.kernel.org, AJvYcCXYFgcxfYNI+atxKiqg/ukZK8O42fGNBvkMYUzM8C/Srpt0JNiD16shv/QMO0OMwBMpyhfn6ccN2NFxu08=@vger.kernel.org
X-Received: by 2002:a05:6102:3a08:b0:4f9:d929:8558 with SMTP id
 ada2fe7eead31-51d0d22e48bmr8733822137.10.1756461124772; Fri, 29 Aug 2025
 02:52:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250730164618.233117-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250730164618.233117-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 Aug 2025 11:51:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWOMpZo0fVASyDV+XTLmh-o0ozqfF4Za_sPiydsh6LOfw@mail.gmail.com>
X-Gm-Features: Ac12FXxZO5xWNeH2K1TxNca62vOIxne09d893I_T5i4KtirOnuAEWt52E00AC0A
Message-ID: <CAMuHMdWOMpZo0fVASyDV+XTLmh-o0ozqfF4Za_sPiydsh6LOfw@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Enable 64-bit polling mode for R-Car Gen3 and
 RZ/G2+ family
To: Biju <biju.das.au@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-mmc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Wed, 30 Jul 2025 at 18:46, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> As per the RZ/{G2L,G3E} HW manual SD_BUF0 can be accessed by 16/32/64
> bits. Most of the data transfer in SD/SDIO/eMMC mode is more than 8 bytes.
> During testing it is found that, if the DMA buffer is not aligned to 128
> bit it fallback to PIO mode. In such cases, 64-bit access is much more
> efficient than the current 16-bit.

Thanks for your series!

I believe some of the SoCs that do not support 64-bit accesses, do
support 32-bit accesses. Do you think it would be worthwhile adding
support for that, too?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


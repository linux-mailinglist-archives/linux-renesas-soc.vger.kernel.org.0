Return-Path: <linux-renesas-soc+bounces-18182-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32876AD7129
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 15:07:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9126B189BAA3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 13:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D971423ABA8;
	Thu, 12 Jun 2025 13:05:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FB723E331;
	Thu, 12 Jun 2025 13:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749733551; cv=none; b=GP/B7IRbEIXR5y55FI+auL/7MYopfNp/KRGQu2J/AATKL7snQyEf1nnIBpG4UiNHvqRoh+mzRxsvJC570mbdxPW1gnRpIYBCVjAw63EJawBANKrL/NSbvcv4nEdGSQslruohw4I/jC6nBAnrY6kcspYcxRDwJoNeX342sifda6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749733551; c=relaxed/simple;
	bh=PSp6rDDi51y5VMJ4lgQdvBlJX7l+uOQ8O8x+eoYnpa0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XFKGKX7A5pA+BnmDOn0OxBoffNzmpwZkGTK2esDiUlxd8psZlf9zsalRnbDm48MDBrzOVkLSqqllg+U/HVkW+OdoUWxMDSKvit8XJUus+srO+QI4F1UggR0L1ylWyt3bkZI4ckL6T2aWCqHaUbSKLhRnBLUZkyXvYaGN8lVNWKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6fac1c60e19so22652346d6.1;
        Thu, 12 Jun 2025 06:05:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749733548; x=1750338348;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a5xyg4b9loNlKxHV/oZK0SPOTJLxOylLQs6P4m/8+0M=;
        b=tsqvqbPQMyuj+idMPgrILcWys4VQbbQa9rMYACZVZrsB5Do0jTrdcXt5pE4Zemt9Oe
         +HpHZnLLsKltGORb4+Yocyy18OTk1+L7B0k2Csc0pMrrdgiciR3Sk9I6FTKz+uYjEa2d
         AGbFDtALJX+DkjVj7b/iCf7Rrx2i1ylMS+yaWCRlwSL2n1bdgri/IdFYjH1Z8I9poO/Y
         8jPeU8FPwSYY10vUJg8dEjhbIncsD49sH0PGuGmDI6fBk7z6nRtrIqCHGMOGVTN0dwSR
         jvmJxO2UT+CcT3+h/P/8tPHpCfzgsrmBZFkBpM8jbb/iH3EDKw3eE32VPTi3u/Re+NP7
         uMaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlzG6aYXm8ktZ0VPFw+LDAFFkUbAiaXkHaVcyQ4EhVzGuTlVT7g96F5VH67CqYwYuyofH2rS/c8gSK@vger.kernel.org
X-Gm-Message-State: AOJu0YzpwCmHDTa5ykC+gBT9xZ0LoWbW3r5dJgItZo3Va/YXUB1UWteF
	XGsCBqZ/iCtkqYGvVBGbw6fbDn/kK5n6Bb1dNwo8NmOvr3xe+/PPzXTEywUXhIwI
X-Gm-Gg: ASbGncv8071QJobi5c3LwLzQ8TMhEPDeywvwk7UwUB+/jNBoDLAND51AteyQst3CcMa
	AgVC2DbaKLT8V+vheLLGeCdrUq0Zh2FYpITFxFwZB2kD7SjJ3Pld5SOjHv66WoLg19mv+EXYi+E
	AM6Ch67XWTm7Rvhz1v5zUZ99VBfnWGqL+9/r3fBpP77ROK1o/a3owQuyb9bYHzAMl6wiy3sgi+L
	vUbUrCILEWAVFsErSfSa5lIq3SVoHQmj6bNLTfqbZJNZ+Y3voWln+iCeAWw7lXqasGPRkSYW4sd
	FF1nMg7sYAJoh8QnhMio7GSzPbeqBU3sPYgIRbR1ZeUN42/cvbLCB4odDuhCrsOI+nIJIhLEzo1
	mQ4JtYH7IQRRjRy4XdXU5eaWjdRmeGSZedcQUpcQ=
X-Google-Smtp-Source: AGHT+IFYexvVtAE9HiIeZFQVWKfX5RWQbEFKsnvCpX2clFUzuO91Jc8cBKsBvEE6e8pVeFvZvSPZqQ==
X-Received: by 2002:a05:6214:20cb:b0:6fa:a625:be55 with SMTP id 6a1803df08f44-6fb3480470dmr50791816d6.15.1749733548099;
        Thu, 12 Jun 2025 06:05:48 -0700 (PDT)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com. [209.85.222.171])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb35b3036csm9855566d6.34.2025.06.12.06.05.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 06:05:47 -0700 (PDT)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7d094ef02e5so221643585a.1;
        Thu, 12 Jun 2025 06:05:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUG0LSGByzqj55s3tvtGhy1UUdsOo+RO60cPdB+9dMkxZdDXsIMbbffidb2tNUBJxvHqU39UqLwh0Or@vger.kernel.org
X-Received: by 2002:a05:620a:a215:b0:7d2:18f2:e8c3 with SMTP id
 af79cd13be357-7d3b2c6d45bmr470099485a.2.1749733546802; Thu, 12 Jun 2025
 06:05:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604084211.28090-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250604084211.28090-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Jun 2025 15:05:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXQ5HH1BDtwYNEN3k7sBu8SO-bhy0vshzuebL1bA95vRg@mail.gmail.com>
X-Gm-Features: AX0GCFuIsu4WDBAZIbRmYoHlXdOZ7pMHsV_J8jqNkvrcZa6KYmWsiA4841_4NjQ
Message-ID: <CAMuHMdXQ5HH1BDtwYNEN3k7sBu8SO-bhy0vshzuebL1bA95vRg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: renesas: r9a06g032: add second clock input to RTC
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Jun 2025 at 10:42, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The external rtc clock is populated on the RZ/N1D module, so describe it
> and add a reference to the RTC node.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> The dependencies are now in -next, so we can update the DT, too.
> Discussion leading to this result is here:

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


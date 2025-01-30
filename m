Return-Path: <linux-renesas-soc+bounces-12737-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15922A22A04
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 10:03:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25D2E3A440B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 09:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25C9425634;
	Thu, 30 Jan 2025 09:03:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9269918DF60
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Jan 2025 09:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738227811; cv=none; b=p0IhVxrzmJvqTET6VcWTMZAAw4pmBiGv7/Su68odpOHyozF0uEA5Rd6wkMR87B3tfWHY8iphL+aU46lgFEC8txe8MLaHNPjH5X7ht2sja1uq29DcS50cusW7RZQZboYkXfSUHtX5ah9LknB7Xt3GME1izXbv9Y0z+0TnW700cJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738227811; c=relaxed/simple;
	bh=Q4wcKs1NrEEn3+9O8a9Lk2hLaDkPh5JBoglNq961VPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PQ2AZ8ZsGhii8wKDb2lNcyEYDVOJshzZu6+9rQitcDF48pObIl5NkLPluLwGHaFnobomsBlCtjP9QQsVpYhp0jFwsJ4M+hr/d7R/PxFDfsBVfBGtkKQXfYqc/mvaUQTpLGTvg4Ylu5Mj5cYwCfqoAr5oHGwFGL+AfuFcUh+UZgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4afdf300d07so374053137.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Jan 2025 01:03:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738227807; x=1738832607;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K6pCLkUySXuvE2ot+OueCX8LTwAM+45fREeEKYQp2mA=;
        b=Percu+Q/RPEjnYHtPqHRqNxJifnv7S2FoaG2w7WD4mXRYKq2vRoabXiK6R5MyzhX2m
         QTNNZsqBI+Z5QqKYWXRI1bqUVgBlyrEab9/cijqRR/J7XuGrp9XmsGGWB7G1DNbnuk6T
         e2VAM6RxZV+g6ApRdX4Yf/tS5K+L3ly7hO4SG16SQRGb8s6aVbmuj2+F0nLzl7Z+a8If
         ZEN5x5kIVT8+tVD+/628cO9celhx2TSf3YhAyXJwQnxPfsyfSayk0vHu+JHbseYTa0sS
         biNKjkYGcMfnPvEnsSVVIIgF97U+WN/tdJ0X+ghAnJRtrcNKbU/o23GI1tl1IoK1BJx5
         7I1Q==
X-Forwarded-Encrypted: i=1; AJvYcCU8Kdnxh6VhX0oVhKyqgC/XJFoK8Wl2v8GAW5n4yYraxWRjlFsC8EEkUjV+KHVIP6OxE7B5VT7ZPbXmvDH+eW8Y5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzClsY0BflHO0cnCVlkJ7j6feMj8zuibg/t8KOGUrJ3cGORjuC
	z08sm8QOFO+5PilqWfg1JmjdWRCPsWopYkrsq3Qt83lnTuKq3eHAlDftysgb
X-Gm-Gg: ASbGncuNSvftWg1vKh9JvoS507IsRV3C1nQAE8INolVtaRZmKKdRjQxLy9fvGPbxGzU
	Gc0OEYUV5bA6Iv5tOLsCLnU9xD3IA1QvI77Mr0CroEDf1GP4SUsTzb4r28PMQjVKd9Ha3PxlbVd
	aAKlRMMhVan5S6bYIa1q2nJrvX8w5/lk7UykURLPgg5D9Ng8Sin0NYhOPpOfJ/yuSpHIsKl9s4B
	ce3c5VCBhXIuE8ZIHxI2/LfQd3BDN4FMnkPLFXRCFvfPBnfh/RutS/UHUapEsNRTflpYoxJ72Qu
	1jc9al1BODMJpA8RXuPaBqxyxgcHNHrHkFnVKV4VkU2Xx5dfk8gJSA==
X-Google-Smtp-Source: AGHT+IEYefggREQy+ZHcdHeNlq0ez0acY+C0r78C5/wmCHyUTsRaY0dRjbF8/5EMYh4Kl979AHOOCQ==
X-Received: by 2002:a05:6102:3e0b:b0:4b1:f3e:882f with SMTP id ada2fe7eead31-4b9a4ecab67mr6608488137.1.1738227807063;
        Thu, 30 Jan 2025 01:03:27 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b9baccd525sm156366137.23.2025.01.30.01.03.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 01:03:26 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4b63d564e13so370051137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Jan 2025 01:03:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXW0+wxeMfitQDpS+2wj4xgE+lbI757FIeio4PRAZhULtly0cO0BNTi9PkCYJNsxAyOsO3boJ1APlqBEbPtkx8cRg==@vger.kernel.org
X-Received: by 2002:a05:6102:2ac9:b0:4b1:1a24:e19c with SMTP id
 ada2fe7eead31-4b9a4f25ee5mr5781363137.7.1738227806317; Thu, 30 Jan 2025
 01:03:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202501300600.APok2iDU-lkp@intel.com>
In-Reply-To: <202501300600.APok2iDU-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Jan 2025 10:03:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXfZbH3bPjpDKm5-PMg-MSh2sDzoeYCzr6kkyvkD8cJFA@mail.gmail.com>
X-Gm-Features: AWEUYZmW56A7_7HJFKbvmHUgFJBvv92mFWPQ4viezAJWlG2D0Li4N3XPNOsB8GA
Message-ID: <CAMuHMdXfZbH3bPjpDKm5-PMg-MSh2sDzoeYCzr6kkyvkD8cJFA@mail.gmail.com>
Subject: Re: [geert-renesas-devel:renesas-drivers-for-v6.15 4/6]
 drivers/soc/renesas/r9a09g047-sys.c:51:13: error: implicit declaration of
 function 'FIELD_GET'
To: kernel test robot <lkp@intel.com>
Cc: John Madieu <john.madieu.xa@bp.renesas.com>, oe-kbuild-all@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"

Hi Kernel Test Robot,

On Wed, 29 Jan 2025 at 23:07, kernel test robot <lkp@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-drivers-for-v6.15
> head:   106b182b2d7f05703d27e37cbcf23a6fb652872f
> commit: 1e5827262bc7f29b3735889919009b744ea8f55d [4/6] soc: renesas: rz-sysc: Add support for RZ/G3E family
> config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250130/202501300600.APok2iDU-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250130/202501300600.APok2iDU-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501300600.APok2iDU-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    drivers/soc/renesas/r9a09g047-sys.c: In function 'rzg3e_sys_print_id':
> >> drivers/soc/renesas/r9a09g047-sys.c:51:13: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
>       51 |         if (FIELD_GET(SYS_LSI_MODE_STAT_BOOTPLLCA55, mode_val) != SYS_LSI_MODE_CA55_1_7GHZ)
>          |             ^~~~~~~~~

Thank you, adding "#include <linux/bitfield.h>" to both
drivers/soc/renesas/r9a09g0[45]7-sys.c.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


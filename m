Return-Path: <linux-renesas-soc+bounces-15170-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C5642A7666C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 15:01:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 78E7716971E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 13:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4115C1E1A20;
	Mon, 31 Mar 2025 13:01:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E88136352;
	Mon, 31 Mar 2025 13:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743426069; cv=none; b=E9tQvNtS4SrDRxXLQKa5Hwnbu0EuS/pq9b+eHtuw5jonrELeKZiuDvR6wDcHn8v9H1Cx+wycSANX4Ng84iD8UdgXYrUKfnRlTCY7VPVI4A1H1CSPg/QShLowAGBCEMi3Bz1DRRDispTLp0ZGXgZkncOHbS4f/3hOq3EsXcsHnng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743426069; c=relaxed/simple;
	bh=4zlBM/HtO2graVijF7aTHxzeS5g/k4ZIyFSxUsBrFzg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q+oJjNcb5pwCEB4arAF0fiSEZUWDfpN0xriAn6WL2wTgc3jwJheSuAIjnjobYVjsm6rJBr0yUrL8Ur+qUBAUgF3grJLEcThoX8VEiKJ1bLj41uLuVoIVX9b8cVKWH3KRcQumbegRfeAq+yGnO7bkzoeAZKBlfjYD373tV69YqTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-85dac9729c3so316055039f.2;
        Mon, 31 Mar 2025 06:01:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743426066; x=1744030866;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l2V2p/ZBy1j1EQeVHPgyXOo7UoloWvJZY2S9GcEZJHQ=;
        b=eGIVjAGfjJuoNlksfZ8gROuUYdGEvK9I/s508nHU6Qtxz7bAUCR7YvkJONcfxiibcS
         YhkeFXA9d54gve9tkaOVSuHH3L2smmiK3SGghIeVW6C0m5C9c0L3brjQVA1YxTQaMa/I
         fU0gbeMwzBoaKEctMp2hX+DGoDTh/hzmdh+ama5VrE4g/FjGNPOIgAeSRn7ryjS7QuYN
         fZor646tPqUe3634ynGbX/T5vOd/M7f2NX0pb8nJLAmeYXPZrzoNtjpwAtVvYIBBD+/O
         GDzIat7JwigOlv2njsCtmZeAmiwCyQCCTiFPQfOaNVP7CZhB6MohaeOxeLuIiswOwJQE
         +Abg==
X-Forwarded-Encrypted: i=1; AJvYcCUoGhcvT9mHR+SGO+65FfvglEUg84LnkT3/lRem+FLTGk9bUXa0LlbLRnbNs5kntad3tPwLG4ouEiTA@vger.kernel.org, AJvYcCWXS4iND27jNt82woeqaMJ455L5ODyH19MbvulpJ41ueZpy48FbXT7y1NVlMSPnvCutrsT4tlPh6w6E71XMz4pLXY4=@vger.kernel.org, AJvYcCXGahmfzERpFF5815wIaJ55ZbqPXwi8r+nQfWFOoOf9BDSSLbayR5C+9a0Jr11x4kQIR1kNvWo4zJFKSM1m@vger.kernel.org
X-Gm-Message-State: AOJu0YzppiEpVoNo5SxWCAFOM4fukPTXu4mQ9lH7H8Syzvv0IxPnbeDw
	139RVp4u39No7i/a+bH4NJ9T1+/YwEk351MhgSFUQgpSCgw+N8SdWv1PpZHe
X-Gm-Gg: ASbGncuBMXk+ztlRbZud3zeFdQhMPJ1/uFhGB4uOjjPg/4vKT9/YyJFOpx1LOf72cGQ
	/wNBXHYgfZmOpVyxHRdFtoesyu5hYIHLcsMYEQVJSZEj3CxV++feuITZjd8MX+YWrMA3FUUbRFX
	1fAUSIn08loH5WkXSnLrjkcrv4hjRvGpDXRorcYg5KmN8T40a2/QtXxeu8QOwddyd8fkkXa7Bui
	xgWhEareqBOiGCSOn0eVRyjkdGcBbymkGHYxqvlCwiRuOsjjBAvBgfMBKW4Fk5Qh53SQ27KoJBC
	0dkstAqAmTbjS2IMy5VjcOQhJ+ixDhHTZCXI/yH+Zay/iNcwbTY1P/sKqwvI9dBwodOOjvM5I2a
	P1qmM8bsDVCKpWTpFMg==
X-Google-Smtp-Source: AGHT+IEOXHxKCQIMyGDqTS4PORmbEDEjAl6b8b2guGqOqtcU7q7GeDq0Pwrn+p+oBqatWikFD2nKBQ==
X-Received: by 2002:a05:6102:b13:b0:4c1:9bdb:6188 with SMTP id ada2fe7eead31-4c6d38cd37bmr5083951137.13.1743426053655;
        Mon, 31 Mar 2025 06:00:53 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c6bfcb3aa9sm1549307137.11.2025.03.31.06.00.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 06:00:53 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-86b9b1def28so4176202241.3;
        Mon, 31 Mar 2025 06:00:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUJevXGShMAQFtRwZZuLK+evy6qfOJZ94hmmR93SVVZfjOvko4RfhaDfEjq7J+536Sf9EzoMje7PIywj/VPs+XxEzk=@vger.kernel.org, AJvYcCUrPR6zj/mGj6+pcy9VOvO5bm5JQPdPMDcyabHz29x5rQV0HUJGfWUloA63N9YT+YEqFItU4TVKBtUyk7eL@vger.kernel.org, AJvYcCW6H5r3RSfLeIdB0KxQY8gi0jf2HENiXYhvXJlTHcu/1f8q8y98/oW57VN452U+xljtf+9VhMjvTW8/@vger.kernel.org
X-Received: by 2002:a05:6102:510c:b0:4c1:869b:7db4 with SMTP id
 ada2fe7eead31-4c6d3886c27mr5256492137.9.1743426052272; Mon, 31 Mar 2025
 06:00:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331122657.3390355-1-thierry.bultel.yh@bp.renesas.com> <20250331122657.3390355-13-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250331122657.3390355-13-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Mar 2025 15:00:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVXw0GMJu2kY=9cri2+EdyAcNP8Qta1tOvCew-wC9W9VA@mail.gmail.com>
X-Gm-Features: AQ5f1JpebVIG-0-njlxNpA7CGdJh_HcTeUql-iWBBVtlnsEdF7buW74dqIqgT4Q
Message-ID: <CAMuHMdVXw0GMJu2kY=9cri2+EdyAcNP8Qta1tOvCew-wC9W9VA@mail.gmail.com>
Subject: Re: [PATCH v6 12/13] arm64: dts: renesas: Add initial support for
 renesas RZ/T2H eval board
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org, 
	paul.barker.ct@bp.renesas.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thierry,

On Mon, 31 Mar 2025 at 14:28, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> Add the initial device tree for the RZ/T2H evaluation board.
>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> ---
> Changes v5->v6: rebased on next-20250331
> Changes v4->v5: none
> Changes v3->v4: none

Thanks for the update!

> --- a/arch/arm/boot/dts/renesas/Makefile
> +++ b/arch/arm/boot/dts/renesas/Makefile
> @@ -30,4 +30,5 @@ dtb-$(CONFIG_ARCH_RENESAS) += \
>         r8a7794-alt.dtb \
>         r8a7794-silk.dtb \
>         r9a06g032-rzn1d400-db.dtb \
> +       r9a09g077m44-rzt2h-evk.dtb \

What happened? Why has this suddenly moved to the 32-bit ARM Makefile?

>         sh73a0-kzm9g.dtb

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


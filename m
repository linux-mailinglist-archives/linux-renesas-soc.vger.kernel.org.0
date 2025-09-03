Return-Path: <linux-renesas-soc+bounces-21281-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E541B4226A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 15:50:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D9CE3A5B8F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 13:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C06973093C8;
	Wed,  3 Sep 2025 13:50:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D52307482;
	Wed,  3 Sep 2025 13:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756907410; cv=none; b=DrS/7IIMGui6PI+mpvI/0tlkEzYFlpmcMMl+oCgoF/WlEySrV/77W3tszU7VXHEogYvURt0OxKmQ0J2431vtKNKpxU8ucU4EkeNYuCjnq/UaFwMh8zlsKx9QHLbLFxMQ9CN581Ccdecs4B7m+YZO8uXVtp/NDPYX2D/xz0f1UD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756907410; c=relaxed/simple;
	bh=TJurNdnojRaPB8XAx7uzsoHATSjehVoTdfBP+zZS3GY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D+HzXshYAmJU7jmweLA1S8hVtkh8xDzRyDgJNY2BnHW4zHtZzRaKMwuft/FOEmTIK1OtLd6RGG2D2NKjT4dGv11nw4V08iqpdKS1BHcj5I+MDF24Ln0PODyKmATIRnbnqIbax2VO5eXIH2SYAHNo/F6hpcEe+CJf0agPVSIEHXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-52a80b77d41so566481137.0;
        Wed, 03 Sep 2025 06:50:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756907408; x=1757512208;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zflRd0UH5qYXHBZPrnRVBy2Z45CFw7PhmD0OsIkq2+4=;
        b=MuzLg9sYyLGyA5pqHAcaCFtCgfK2ClT3ZEtHRsQ9SztAcDJc0BcGCtJ+9a2qbJ/8mb
         oGbZPFelvnwlP6yJzp4b2eej+wLJgnO4qzQyF3f8Ptqpn6NYzMDIcDe4Y8Q4g9CK3fOE
         RUfhjusCO1X1i8q+lKedhK4eo3k4Gbc+/cYHWWc3aDKWOW0Af+Q8+SObQA1aZIwWdRur
         OAzkitF1i0jcsMqTRArOW30UjLxefagH1Gta16Mdx3Gr2uu45FZTyT5MA9i90pZvzP5+
         HWSS+v+K8iu3ZCtFQBGlNq6fIulLG+jiu5HYyIaht6bJl12oKXRpKGy966axlgfHdy+F
         mWtw==
X-Forwarded-Encrypted: i=1; AJvYcCUeHFdscrTmNokfb3IMnTdm3zMEtKOvIqq5U+Mj0HCW4o5StVclbU/Lf0cgap3e5lg62ogc54Rq8Iw0wwF1uOnh5c0=@vger.kernel.org, AJvYcCVNr1hpU+0NBvKhY82SqxaJHNMWfoEz/5Y1Fr6Nt4DrEUSmKN5oC28kW+jdulnE0z1A+4WDTnxbcfBo@vger.kernel.org, AJvYcCXnuwFKcsRECPh64PqDvH2OXAkZk5Bi1R6bOEyyShKz0d4Htdc+mJAmh4q5JSQKmjz1e6wBXNuO1e6YSeEs@vger.kernel.org
X-Gm-Message-State: AOJu0YxlvdLwQSH/i0PBQiuItcW8BP8W7k3sO5wRGxTTfcjUFNSOfxbC
	SIMne12+bevFEsSPYVpYjMLJF7/2EuGFY1rhqJ13xcS7cvkmPqyoNN78McRiqoWd
X-Gm-Gg: ASbGncvuaHbTSftwJXdZ2P9263YuGg1UOE/SeoO0qo+ySbd+TZ1YNXE/vy7Jn2ohnoH
	Zy7bBS5t1M0sf8zdz6wUJYPew3CxM+kT0uxR9su7ge73i7GS+8owEXEl84MpLl18wERf+Gwi9i1
	z98B5dVEMSyw+OhqZr3WDnniMm53LnDx4gORFgC3ITU5oB/uyKrB8715PN8tPvXJYVCIIH7aGtF
	lh68kf7HFt/6xwUExtZYXYEZyoSJYw4OaFFFSl9FuB6zl8PqNi1FshzRmGbu3xFnr7nr3H/tVrx
	16/vByuHPbCoT8HrNnMyBaU/y8/iWc6/6vRjV/hD6HGFou8pNWGkMXcImEt15W862CURLa289OO
	1XGAmSaK/8w1PKHRsD4DdII6ikAeNwy6ZODW5MyxlryglNDujbJyLEMi0FB7Q
X-Google-Smtp-Source: AGHT+IG5+JxOL5ueekSZHCN0v9+SgAqTSPRBibCJ4qGyAmcLyi+4dquw91CBSkX+/E5zwwhedBBEYg==
X-Received: by 2002:a05:6102:5a94:b0:4e5:8d09:7b12 with SMTP id ada2fe7eead31-52b19e661e0mr5392641137.7.1756907407829;
        Wed, 03 Sep 2025 06:50:07 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-52aef7890d2sm5396164137.7.2025.09.03.06.50.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 06:50:07 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-8902ee514deso638662241.1;
        Wed, 03 Sep 2025 06:50:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUKk/A+XNiY0Qu0E2jAmX3LluGFjqX5/1JXf/zYDXmKNn0ychPvLEY5TJ/6vGnT7/fKM46z0a4Z7EQn@vger.kernel.org, AJvYcCVXKOkFN8x2Y4kdIs9PWb8/I0YiiNIPH5p6Dfa9VnJxa8we3hWs3u04D+5W9axxAtBHCeFxUcuJGsZ4cRsI@vger.kernel.org, AJvYcCXmSouDzJq2IInXUJWWM4+WWwZ6d4EIqqwWGaE4VM5SvBp6kouXreiSz6aSUFXYqBR8EuuDUaDxBxcJHtUvFc7zXnY=@vger.kernel.org
X-Received: by 2002:a05:6102:8390:10b0:511:db31:add7 with SMTP id
 ada2fe7eead31-52aed4eb53dmr5237768137.9.1756907406980; Wed, 03 Sep 2025
 06:50:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250821161946.1096033-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250821161946.1096033-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250821161946.1096033-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Sep 2025 15:49:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXoaz8ZJS5==-6_5ojFg6igSg+VUaXuDyus=2365g-9dw@mail.gmail.com>
X-Gm-Features: Ac12FXx4Ca-gHBsd-R6rjJclydkzYZXAZCXKqM5yHikGHzpNQpt__3xXWZ0uEQY
Message-ID: <CAMuHMdXoaz8ZJS5==-6_5ojFg6igSg+VUaXuDyus=2365g-9dw@mail.gmail.com>
Subject: Re: [PATCH 3/6] arm64: dts: renesas: rzt2h-evk-common: Enable WDT2
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Aug 2025 at 18:19, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable watchdog (WDT2) on RZ/T2H and RZ/N2H EVKs.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


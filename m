Return-Path: <linux-renesas-soc+bounces-17289-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AE0ABF04E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 May 2025 11:44:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A4E6D7A4CCD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 May 2025 09:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98AE525395B;
	Wed, 21 May 2025 09:44:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEDA254840;
	Wed, 21 May 2025 09:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747820645; cv=none; b=PQjsGZz0qr/dGjFQ/Dy6ZZKllvQFysf/gKC7VY+TJ2rjw7BR/n7gVzsraX59lQEuYoUPrAIV4O0a4rBYvySHIXL1JxJNcKLDr99N6WobvGJaPKCfhkrvROPWQ0AqKj2WkItusnUrL8xqlLqj7MWQdJX/dH4jc6OjGfGOUnN78mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747820645; c=relaxed/simple;
	bh=hOFuOTDsDFHSECVvjp8w+VurrPaRmgqRSaJL9fJa6D8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CgUZ+p11E2pZpOCQhTjhiqiaHPJM887gzJx9fg+MwKRZUEg0puRwlSXghERbwxWBn84zTo/cXVcAIxBPtno2mNwXC9rstUyZGxE8Vo/AXh3pxVbT611D3SvtDovRdos8n/Be6JADREI6674fDvfp5Lr3gE4TDQG51OCGv5H/qeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-52dc1eec86bso3193816e0c.0;
        Wed, 21 May 2025 02:44:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747820642; x=1748425442;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ltbPAYKK8mA7ZVbSts/TdR5vqMpsnaAPpiH+gy/aAz4=;
        b=Q2wS9aCJEqDmIJQ7wtaSuMs3SwPzAB6AZMguc0Yuzb+exc1yXd+Df/HwopGj/YH6dh
         jPaVgO2GjHlMoKBP+qsajfMb/cjd8qVNWK3oGlQxM1O1s7d9KXhhBK5YLr93ire7ViNJ
         Rx58EX09z2fgrDVLaG47i1SJpxc+ZGicisapu7pdC381VxDNLy9wBgefsUO9nxVUKGYy
         vkvqef7JEcbvUrmzxLgPfuWshg9vw62gCm6KOH8nPgrsZbJWxYgoD1yDVFpMO343MvjO
         ZktVCt35U4eIM3NtTqVE7FP4RJ5nU2KTUKNSEDAojCqBR7adRsEU9je1uqMQdd8xnPzt
         vcnA==
X-Forwarded-Encrypted: i=1; AJvYcCV15XLqjNcH97dJpxlKYP6zjNuBYP+brdz+7RYnj9V72SB58o/pVO8cfuww1U0TQQa90BeleOEaIGFa@vger.kernel.org, AJvYcCWGHFH5HJ3cE4zMiBLZKbbOR/gl+0zPTgbXzetvT2VAUWt13wg/6yrM3U0RZUMmPgrGoOSJpYx+V0+/pCPD9/FVMvY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEwn1S3DBbzCBxw4ucSblL/MyQY6XJ9B60rhlN3QBUoLzn6Uif
	MYgkWf2eXszpWo8tLVgkN00/BUYMNjxFAd8SsfJhvd863Zn8phRa7EDSoNCL807j
X-Gm-Gg: ASbGncugXPm9HPbNSTQLCTgzQv0e2gjgOTFH+P3uS2ow0a+VCVlsx2j0ZqR3dJiZKvI
	GX+XPeE3jiYvffv5vYCs03yzSbvd5KkpQfsMHb5fe+HqHM5YeGcXsLLL/VNSbbCiXF6o4JV/07r
	AvI+xrzWqXyqBP5ZgfC62On8DshfVORVIpmxOgaC7dmFVY9veQsXgfIJmhmOCCl19cNvL0xFNo0
	MvU3cZPF/a93cwrSAFYbCdju/Z4fQk0qOb0aOI23BbveN/VA156RQsv3dm0HBPmVeDBFCj+mG6y
	8bGLtrt2hAB0WvA7K/WV+ull6NH8Jjh5VI0jVtf5ccXzm56oHcErBc+k27BIhA6jAu9GMD9WwEB
	vOox71Ood2sFkdg==
X-Google-Smtp-Source: AGHT+IHbM7+3hjJ/PrjqTvjoWRR8Gyn+LQrnGO1uNP2S4yfCrGDNP73rofAYy2hE2S3y7Oa5ypsTew==
X-Received: by 2002:a05:6122:2c2f:b0:52d:bcd1:ab55 with SMTP id 71dfb90a1353d-52dbcd1aba9mr13299669e0c.2.1747820641886;
        Wed, 21 May 2025 02:44:01 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dba940919sm9840911e0c.17.2025.05.21.02.44.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 02:44:01 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-86d6fd581f4so4676026241.1;
        Wed, 21 May 2025 02:44:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV539ACzRcgqh1CnzcgwqpZpbz8uvlDEhPOimM4TlkQayOaXbDVWp+n/tGNNri4qP8vI/2HI2AmEL69KRBcr3TKSUo=@vger.kernel.org, AJvYcCVWKDqoMFnHBiabXhOaUH7vHZmS4BlL2Cck/3cVSkF1SibSeiBo4EbwnUsF4hN70DxlTavJ3sKzc8+i@vger.kernel.org
X-Received: by 2002:a05:6122:2526:b0:52d:d4cf:5754 with SMTP id
 71dfb90a1353d-52dd4cf58b0mr10604894e0c.0.1747820641474; Wed, 21 May 2025
 02:44:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508183109.137721-1-biju.das.jz@bp.renesas.com> <20250508183109.137721-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250508183109.137721-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 21 May 2025 11:43:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUaLUvcxaVScRyy4sTk_8MwxzirsdTuG=xxcW_gDZHhBQ@mail.gmail.com>
X-Gm-Features: AX0GCFvEFrng6penoCexGf6fGA1NnMA3sS6KIB3qfeJasByu-aL2YESu32arbnw
Message-ID: <CAMuHMdUaLUvcxaVScRyy4sTk_8MwxzirsdTuG=xxcW_gDZHhBQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: rzg3e-smarc-som: Enable serial
 nor flash
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 May 2025 at 20:31, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable Renesas at25ql128a flash connected to XSPI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


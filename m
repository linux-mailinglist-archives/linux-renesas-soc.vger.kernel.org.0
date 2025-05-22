Return-Path: <linux-renesas-soc+bounces-17362-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D776AC094D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 12:03:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96EC418981EB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 10:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 040B2288C91;
	Thu, 22 May 2025 10:02:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D5E288C3B;
	Thu, 22 May 2025 10:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747908156; cv=none; b=Cdv4jDEgn/pJSAWHzWMatTBexALjQu76cA374vzzX5kY85Ok4WPypT1h8V+MyNbvfIXEapIOM80e0lHiq2Uirn7+2V+/ZH3HOp0lvtOJTf97wuV7yDdCABCBj+QO0pSyPiQGTvByiTfOzqr0QEk4GDd9xD/aLA4WKXWkXKIqaE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747908156; c=relaxed/simple;
	bh=DQSfa/XKxya9CA8I+Avi7UjSjod7DC5D08QC/GTDoIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MEc/3rc1MC88+E+w3V8AsG5k3v3aC6TOpB17Ikdv8QWcruN/RmemQ2cZqzgrnQfmRIEn0ngYcIF3oXU8cC6RVBCF9T6CYmzuAXKWHBoHeLfKmjGeUWQ36CDE7GVJ3scQ/u8AKB/4bGVsER16elHe3Oga+Ep0jdzOJ6fJgjtMyPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c922734cc2so872277185a.1;
        Thu, 22 May 2025 03:02:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747908153; x=1748512953;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Bx1/ry+CLMBCmJV5RjQgyb85ksjFtGR8OFSfwWoOE0=;
        b=EqU7dY9RJemrAWUX+goHc4K5eTXwfJPv1+AjT+UuaQzG7+t19YGynTvdwtj3ElIRbO
         I5KA/E06zBdvAhdXut3XN5oinoHm/65s6mSBfA4s6KBXPBB+L2uR1MkNcySsURZQ75X6
         AWC20KKqxcfqpVKqt72El1SKa+dt2TG4FTRVHdoZcMke1w0OTkh/NE5T6/w5dhEeq8eJ
         7Pg+JR9zgCMq9B2CSm66iRaJGUiuuKQUdhnJ3hKGWgCJpGx4R7VpJKBroq+QUeLHxg+J
         1aFczwpkopwExLpPxMNof0dHXN/IQ7Pkz5qPUubMDNCv10u5xxeeose+L0XQDHMRgFH0
         hq0g==
X-Forwarded-Encrypted: i=1; AJvYcCUawEb3EYqfnVA+q4BDDkd91ecOU0OQIdmPGe6TZGlOI803HTzvS93WP/udmkItpR0qJoJb/3OzNEhjuTc1@vger.kernel.org, AJvYcCVG7MWfI8nfnF5zpHRgLi5qAkU8OGIDIfWFWvEzGWs9byiLx+659u92M+VCr0zSL3CzZd/F7++DG3iy@vger.kernel.org, AJvYcCX62EBInzwDF0K51EVjjWJwV1qNs07RJNrB7rVcyH9Shn12UHCU1Ob9hPfkkHsURv19Klysv40vfy1TrcbqhT4kQnc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzD8kmI3J4DPU7p7gMudemtaAd28a8AfhJk0OEoQJwtljbnVpFA
	OeAbWhnsnBAVkz9v7BMOWV3WY2psK7n4zced4DlEOe2kaueDnldYol0bL2hkihpO
X-Gm-Gg: ASbGncseLJqk6a4hBjLU3GTOUv7mUncMWdUumZO4mSkIygd6FxrfhfWO7FFKX44CPTr
	VBdf4+OqBQqmyD7E32+oWMzWB8fdrldgbpbyb9vdiXEO4jiYUJh9JRnMmSgRcsH6drOOwCrIL1h
	xYJ1cKAnpiQeeg8kBNjV/zpcSx1S3TF1t6db0L7zPpIhxE0yJ6dc10gsIPyGKv/2xMuuwvK8gAm
	CIwd1sET5vIvLFtMVlsyEa6K/E/zFZVD41R7aZqk9D0AyekBQm4qeanFX3V6faUVZeD/NX63ZtE
	/JZYeE6HPrqnNkkSD/tj1YcaNx/2w1gAMy24JrsL3JKUord1U7gbw0+fUK37vQfgUcsQW8Er2He
	QG4J1vRym8z0d9Y612A==
X-Google-Smtp-Source: AGHT+IFQvSB8PtSvF1bK5CcLW6WN4z0NJkUA6jvtp0A66hszt68ovZ4Q921yHNzUUr5tcIIrGwmrUg==
X-Received: by 2002:a05:620a:60c8:b0:7ce:b782:8931 with SMTP id af79cd13be357-7ceb7828b4bmr2016915085a.2.1747908153265;
        Thu, 22 May 2025 03:02:33 -0700 (PDT)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com. [209.85.222.180])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd467f174asm1002100485a.64.2025.05.22.03.02.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 03:02:33 -0700 (PDT)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c9376c4dbaso844995085a.0;
        Thu, 22 May 2025 03:02:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVYcSw5MmBW3U+WHwc28VIfc2j15a9L8Tq8CdlPVVWSsncqILuNw1bwvrF02nmgGtzmV0uHUuasBHU9TrYx@vger.kernel.org, AJvYcCW/x4WNxqdRxmWeD6TbmQadNKkqW2fc66FL9J6CXGgCKelcrG8IK4DOhVCFMcfTEqfYVpRewCg0QOgtYeWUqRpMeO4=@vger.kernel.org, AJvYcCWse7ttd5ACITNaf5kVqxSHJ8exQYa3it3ic6MEJHhE0FDb4w84rR0KFCoJ+6LsiZvjKy9fb6zZhruB@vger.kernel.org
X-Received: by 2002:a05:620a:690c:b0:7c7:c1f8:34eb with SMTP id
 af79cd13be357-7cd39e1a9b4mr4811793785a.23.1747908152318; Thu, 22 May 2025
 03:02:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514101528.41663-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250514101528.41663-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250514101528.41663-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 May 2025 12:02:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXL8xEZ-+rR3-Z-ttxqsjGMH=6z=p+Qmsx4=e+gSZrQBg@mail.gmail.com>
X-Gm-Features: AX0GCFs8MYFl4Tf7exIop4XSO5P9YNWJbJTwO7qsAs8dxZOnQFjsmzJ-TyQSraU
Message-ID: <CAMuHMdXL8xEZ-+rR3-Z-ttxqsjGMH=6z=p+Qmsx4=e+gSZrQBg@mail.gmail.com>
Subject: Re: [PATCH 10/10] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable
 Mali-G31 GPU
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 May 2025 at 12:15, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable the Mali-G31 GPU on the RZ/V2N EVK.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


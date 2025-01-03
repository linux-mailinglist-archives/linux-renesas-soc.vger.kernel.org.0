Return-Path: <linux-renesas-soc+bounces-11829-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EF1A00E0F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 19:50:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4FF2163022
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 18:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39DB51FBCA0;
	Fri,  3 Jan 2025 18:50:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1C2155C82;
	Fri,  3 Jan 2025 18:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735930232; cv=none; b=UpTwI08PfbdbaMkF52RcAk0dWTFJ5+G1Meg1fVzMoDdkCn7pyUousZ/vLbjdTMkz8sELT7VpHiCwBbt2jIeAkU4yjzC/KU9tsjMCzU7U3Pad+4Wj4fk6XGv+V0RQZkE+yhiuIavVUwk04pqGIBrX1PXPZrgUi79uewRUUdgPhX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735930232; c=relaxed/simple;
	bh=qs7+TlF5Gd4BaPUzmmF07Wy4Q7KalFLgrmj/KXpYi84=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bbn8QwlFZLJgVdt7Ytgtt95iz4RaZqd2cmNPRxI8nML71IOz0j333BJzaGERXhr8SRr1AZYN6qDZ4TQQwxumOxVrUV+8gn0/5YSAZ1M3kt8zIH9HYZ0EzI+ZV4UF/pkKSI2lZSWbEartx7XAFE0jocrwK2LibMTLtItI530qKxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5189a440a65so7225450e0c.1;
        Fri, 03 Jan 2025 10:50:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735930229; x=1736535029;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6dwa/j+bpjMsyKKJbDUow2UUVPKXne3IqppIDNGP2vQ=;
        b=hVn5z1R3GH42brEsuVohLIcJq8gPIBmlHhWuTmPnvYMWiLZEpxDcjYVRySocAcbRRu
         s1IWjlLp16YaTT4kSGo9+//FovbAMY4mf/2C5gJ9hUYz5Jh/JYtuvafykQNKmjwQd133
         sFv6wBX/POXFCXOODSBn0ErBWfr8F1BbJ/sTm6oH9GUXJgYKF44XlWbnXWGS5TGxdIiO
         nfoiuoDoP6GX0n+MLw3ews3Sjj2kioaRebrk+l+HY0AbXC7Ds3OJr8dH0lWsCPnNfKat
         BrsnaKQWTkE5cBwcG7FcxUzQxDZAqA39tOO9TquTAe6zP6Wj0G7jOzuxJ3EEx7V+jNXJ
         KUJw==
X-Forwarded-Encrypted: i=1; AJvYcCUXP5JrVbFa+TXA7FxB5anvyfAQwN7jfve879RxqUqlkbqHYqjMc9ItcG/i5TpDk7ET7qeZmtxQlC+h@vger.kernel.org, AJvYcCWqnZ4h1nDov+BR0XrV9mt9rC64rtIYPBF2R9tFB50oRjRj8WYuHw0rhTisdnKB2LXB4K4naQ4DIfohgiLcMQODuEI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzF3EruEXIrPTUHkyUH+8fV5I/U76KjoisNBphKVko8L3R1hDuC
	M/tCvSks4pxKiEe9lo0r8mnc9uiCnbQVudSApfnOFFRy9Ss0KkhlZylGNsko/ls=
X-Gm-Gg: ASbGncuUCfFh9U+NAe2MrFTryqNH4aeDr3GlcVegkcwSnzrnSa0ftroJS/kkBfIYTOn
	EtID6uhYaDrcAPlsLbw+bB0voe8w3pkZMX92MyoHXO+h+b73xybxqhAyNnJ4520EPQA16V4SRej
	uyEUQusCV9OurN1AvpdV3G59yQDRu0vG5Ui46FJcqfZiUvXYs+zzzUh7QGvdEuCjfx6c+i9iRRW
	Gwuqv9H778bl1gzZvwSRPwQwceWsBjWd4QaQIhV6Xy7uIN7hiVk41FtGSkwj9RQX8NGSpCLhvHh
	IJ1OPxm34neSA4CdLww=
X-Google-Smtp-Source: AGHT+IHxeSz3503ySKlNdDMMb9wl1UjY4GUBB/0w9taEJGOSSwCUmb5lt+DHZYoWBksjgX1OWwPFjA==
X-Received: by 2002:a05:6122:80f:b0:51b:8949:c9a8 with SMTP id 71dfb90a1353d-51b8949cb5cmr26713181e0c.9.1735930229181;
        Fri, 03 Jan 2025 10:50:29 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51b7f003249sm3007429e0c.40.2025.01.03.10.50.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 10:50:29 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-85bc7d126b2so4971053241.1;
        Fri, 03 Jan 2025 10:50:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWxLgluLmsSJ+PhnANqnC23CclRGZo7vFt9pFPp+iQoe26rXPNTn2Kq1bZXvaiYGSPb1ghP1J6am1QvVEm4wMK5vKs=@vger.kernel.org, AJvYcCX5OJxBhsuOQStMsHpMtMHK5HUExrQs2u0LzkZI2wDIJGukDAWOdavMRu43Dxs7XME66L039MV7pHuY@vger.kernel.org
X-Received: by 2002:a05:6102:5093:b0:4af:597b:ef with SMTP id
 ada2fe7eead31-4b2cc360609mr40360347137.8.1735930228820; Fri, 03 Jan 2025
 10:50:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216195325.164212-1-biju.das.jz@bp.renesas.com> <20241216195325.164212-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241216195325.164212-6-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Jan 2025 19:50:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX-csDhMVfcesPUUQC4WniJWGpqhxNbhQMgYe9b72-zeQ@mail.gmail.com>
X-Gm-Features: AbW1kvbXKQ1q4TRoTSqCiOb7CbuNu_SU6aAv5GjBSrFAJd2CG93IrE_Xb-zuM8Q
Message-ID: <CAMuHMdX-csDhMVfcesPUUQC4WniJWGpqhxNbhQMgYe9b72-zeQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] arm64: dts: renesas: r9a09g057h44-rzv2h-evk:
 Replace RZG2L macros
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 8:53=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Replace RZG2L_* macros with RZV2H_* macros, so that we can define
> port names in alpha-numeric.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3->v4:
>  * Replaced rzg2l-pinctrl.h->renesas,r9a09g057-pinctrl.h header file.
>  * Added Rb tag from Geert.

Thanks, will queue in renesas-devel for v6.14.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds


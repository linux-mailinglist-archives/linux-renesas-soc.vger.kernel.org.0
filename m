Return-Path: <linux-renesas-soc+bounces-26408-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8C2D02986
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 13:23:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8EEFB3069D72
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 12:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C9B9437869;
	Thu,  8 Jan 2026 11:03:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C0F3A89A6
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 11:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767870184; cv=none; b=kNCB02jOOa5IlytwCfBolfjQMXhXFQc+03HKbvKWmZWwoWwAtDSTtoVECwWvOjUUaElqQbXkKyS+9/sHRRvsh7lAGGZbJnbGMC8/MnsDhrjoiqdVioTVBQQWxjvhHZhNGKf60lStKMGf3t80qc8PxXaGGe+IrggaI3zTrPDErLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767870184; c=relaxed/simple;
	bh=9pjsYg6g6Z5yVGQL5SMh8FgG19+X42pgBIntAFg1Sbc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DMrfnX15RNRVrV2LgTT8/RgQ6Rf/175jkEm8qWcujYqitnhrQdgh/fVfBQ5xo4xheVuQTpRxhIZ3TV6bi7AD4gNRHv6gyzboL/Ro8+y4xaqJJRRmQ54DusT/ruwT+sqf6ED3p5Vf8SlZm6S49hSM6rXdlj0w/vEYovkg33t4kCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5eea2b345fbso69885137.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 03:02:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767870174; x=1768474974;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xy73dxu85wsryj+tVzoQnHxxuOeOWru14RBsTZB7r8I=;
        b=gtQQulX+uplSQWytveep3VbezKR/U9JijgAXkdZckmuAbcPsyXebZp/RU+K6iyQAmG
         MZWxKlJjcAG7uo2FEhdq+f4tbAM4HCMBr0fC11uE3xiwlK2g/ZjaMx5s/I0c0FdCmyCz
         Js1xDP784hx2jKqbrAyz3cMkLTlK+D5rhY4pnN16W6Ti02fOT6ow78fVT4l9CQK4zPac
         tZ7mwV3ffuT9t7o9qxawJBdZ3DIubiS3WUkDiRgyH2VABkpOtI30ZaIAuyHzIdk3/7t8
         z02Ow8og5mjWbFCKvG0QvDrIKBQqN1DX7723W9eJqb+Wcu0pcq1J14uYmq4PL0ruAEBx
         nXcw==
X-Forwarded-Encrypted: i=1; AJvYcCU1WTMRDU4ND6mXzHQxLsZBhXsTW+iCiCR4EQCq5F03LIDrpVDXErACqcZLm+nMd/DlXogJgYJNC87S6/4TWil9cw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMvjY2sJLkdUh0d9IHEUDBWxjeRS/Os3qx6uZ3dBXUD77Ifurd
	bn1rhprQHVRk+rHZUFjBWKOmka9UZj2qQnJeduXF7gvfOxtzcRgCUkHc38WaJP2z
X-Gm-Gg: AY/fxX6QEeQIQzOtWnhlr5kcb85VY+QmCqOKmnpD3DqwOc17AEIbPEjGgw/kG4/mVxt
	kN0/IMGw5GAllMWgjAh7pDqV76b4+8iIhLFAU9z6O4UGRQCijas9/DtlIz5IEEpu2VwNvK+gvDH
	vmKzDtGJn6iNri1BhQKlb02/CkbR14KcrqWfK7I5Qx0EpxmnTe3FiKTt8WGFmX3ge7taKmO/T6i
	Q5zOSBbU7BDnVqM+wT6mcytSEunfpqVHr0KZi0j4JtMEO0nN2rfRnFc4asWN+GVgi2tDqpGbGjC
	auJK1rgtOcOyRTDd4eqefetvl+4Lk+axv6FesvKF7ypd3e4CzG9ZLxeVnDmNOJTAotcFfXU70wj
	i0poQzkQGt7Sq3qGHTSuDFVIUxmPX7Hd7VVS/VehqgHtlfrOT2eTBpNNy71r22D3Awie9fHxtmy
	irO+tDX1ncefFh2zke/z/Geyu2MO+UVas9gMQezUvRgST0BQIO
X-Google-Smtp-Source: AGHT+IHgCe+eGN64nQI/YehJ4I/xZP0KV2vKxDUF2OeK81hOS7bESAtkb23TOso+FV+DtgJNSqSWGg==
X-Received: by 2002:a05:6102:688e:b0:5db:dbd1:5540 with SMTP id ada2fe7eead31-5ecb5cbb711mr1637054137.9.1767870173647;
        Thu, 08 Jan 2026 03:02:53 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec772af325sm5885419137.10.2026.01.08.03.02.52
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 03:02:52 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-93f5b804d4aso976579241.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 03:02:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXEyVlq3D8pBSzt2b+44M0TC5roUlpT8Lcx52fQMFh/hMhXcj7Ml0frlrIC+jZv3y8tCw/CuuTdKEU0IFk8uKNHYg==@vger.kernel.org
X-Received: by 2002:a05:6102:4a84:b0:5db:2b4d:f1ee with SMTP id
 ada2fe7eead31-5ecb687a389mr1813465137.17.1767870172180; Thu, 08 Jan 2026
 03:02:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251224175204.3400062-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251224175204.3400062-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251224175204.3400062-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jan 2026 12:02:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUCos_ZmnJWXL7ELScTPjqCMyY0Jwwg5kW6Dknq97-cpw@mail.gmail.com>
X-Gm-Features: AQt7F2pRN5f9gLfqruKSlmzOD5BROLUZ5LeNS3iibk92SDwjrqzAak7JISwhCNE
Message-ID: <CAMuHMdUCos_ZmnJWXL7ELScTPjqCMyY0Jwwg5kW6Dknq97-cpw@mail.gmail.com>
Subject: Re: [PATCH 3/6] arm64: dts: renesas: r9a09g077m44-rzt2h-evk: Enable CANFD
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Dec 2025 at 18:52, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable CANFD channel 0, which is available on the CN55 connector.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


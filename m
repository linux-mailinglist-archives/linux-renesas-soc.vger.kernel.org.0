Return-Path: <linux-renesas-soc+bounces-14053-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B16A5483F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 11:45:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB611188E192
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 10:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E945204699;
	Thu,  6 Mar 2025 10:44:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684072045B6;
	Thu,  6 Mar 2025 10:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741257853; cv=none; b=QjGd3g0g7ZwqEOVS8Rx+37WTOlgzG4vT2l/c37o4sGthZrFWxTxpyE/o5sqow/eM/LOXByv5XhwfHqA/oEKgV16L6PNd+YBIZwxrL1J2wnErC61UB6oIJEpHs/QFMUVyNRuEpQrJbLgkkGwuIe/BWc2xe/ccQQQRGNfIDt3Q+s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741257853; c=relaxed/simple;
	bh=P8XjriI7X6FR/CaBXIoCfYPnI6nFSjGvLxBBS1waTFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bAePgz1xJQBEnSLCNf+DIZRM7f8Uam9eU33lZwPzFMeTupTYt/mRJbj+Tvdd18qkkCoOxuYCrZVISpvAK0/on4AeyZtFeL07bmkXmtjepRvwFOmOrl4eKI42ClcQ5BHc3v93wObnspaYCPix/gl50yXQfCsMn7sXXDPAX+7VKc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-52378c0c2b1so217066e0c.3;
        Thu, 06 Mar 2025 02:44:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741257849; x=1741862649;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O+5nayxfnPRCzUVZCiQTx1fMYq6e1kRVi+VCNp0f9o0=;
        b=qp90HK6O8rjCXe/Z3NUyWtaqdd7t7tC3fuHI7SGIi26HHb/xnj29Ca/5s8TsJtYBwR
         CI9luE3OivFaAu6zWOzAf5lRVSxal4dveF+MzHHVJOvrk9XFNDHa2100m+kNZkwzIwff
         9cyFHNwW4Gl/e0vSd6XoHDk234eFhNf1RgeNPoMw4Dl/Uy5hjkAd9RDaxlarL3058Bax
         ENRIvSeAjADy59fBSfZ5aWBOO1xRYojAH0rVOzBEdhF1ZjQDjdAk6/TScOVWHcoXWTyU
         nTwG5j9XBYSeBE03kH/I8eNuVQawQSDQi/pZYX2b6i8cYL4CS52oAaGsTzmTZbwVCd++
         WdEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUv32k+ceLXVpkPo87TZzSXrC6RuY4RbP3eOIACrh/cRAyBg3v1uz9H0dGq7ubuuC7G5eqmOf4AC3JX@vger.kernel.org, AJvYcCV2deFjTyzRYfc9VQrnJ/a19I8fP1qnhvT2KIs6VMRoIMvUGabcQY1BaJ/BPiYSe0EAXARgwHGa/+lg9s49rHiTRt0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFnMlxgxfZNf3CvTZKh3kSKWZgV4XgH7XVoSy6Vxfb3uZRRzqT
	YLkyzN/N/zx7u42ZIU63UHzH9oxXWyXGaeLP8OQDKujDcOSF4TNsqaLAbV7k
X-Gm-Gg: ASbGnctDStcsEmnXFQVRcEJIpxHOlc0X4lQ+Dj7MDzhzAUMCwfxkTztdFrgAFSZkwhp
	14VjuLJSJpZhAfZvmPtms8eeC3aejxKiJ9T4ckRAbGQ5d92KHProdm0xiJeURkxgqBqrtWrgXKs
	pNjRtddbyqnXVdkhEd0WNQ88RswRDt+F/46ie5mA65TyQLsACt9Y02utbPHvD/a+YPZJlA9oZyS
	jSNcwWrz1PNCeQHjXtB8DTVmIqtthnNWPxxR8ybsisqo5Xd6AmjSAqaxE4bU1ZlPNxS9rFARV0T
	19O5b1o9bxMbIcpxHtZzkamJLsi7ONPWXs5mSL7vYYoSUcCRw2WEOCf2aQVNn7s9U/8xJR//+tH
	02vjSAqY=
X-Google-Smtp-Source: AGHT+IEcziIZpDGieDeL9VA2e5BP9wgAEPOLhwoK/JVU/4LLNeW8EjI2ic63ZNmxTTj0NoBkvgV31Q==
X-Received: by 2002:a05:6122:2218:b0:520:5a87:66ed with SMTP id 71dfb90a1353d-523c616d455mr4098502e0c.5.1741257849447;
        Thu, 06 Mar 2025 02:44:09 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-523d892a9fdsm147173e0c.0.2025.03.06.02.44.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 02:44:09 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-86d377306ddso95586241.2;
        Thu, 06 Mar 2025 02:44:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUe/GB6xpvJXcZesX+nUdqTR8C5YBHGtlamMKemQIpY0tpXdV2os8LXee3ENDM7uI33nILCvjTJXwS8Gfrr6FJmiF8=@vger.kernel.org, AJvYcCVHHmN2BzG4CfEBQqDg4+4IRsSMMqzk/vbs4MklGhxKLAK2r1XoN4ZztLKXPtxm6HsfEhR74OFWvnXb@vger.kernel.org
X-Received: by 2002:a05:6102:d8c:b0:4c1:86a7:74e9 with SMTP id
 ada2fe7eead31-4c2e27c3a9amr3785446137.10.1741257848679; Thu, 06 Mar 2025
 02:44:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250228160810.171413-1-biju.das.jz@bp.renesas.com> <20250228160810.171413-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250228160810.171413-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Mar 2025 11:43:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXOd0QgnWiptLJ2u8MwgYqw3=UufozdB2Lubt0yGc2BXg@mail.gmail.com>
X-Gm-Features: AQ5f1Jo4-c3HSE601hzsm4mxVJXLkGjcbtfnw1k_-xjAzYZN1bWgUfUctJNJeUY
Message-ID: <CAMuHMdXOd0QgnWiptLJ2u8MwgYqw3=UufozdB2Lubt0yGc2BXg@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: memory: Document RZ/G3E support
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Fri, 28 Feb 2025 at 17:08, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Document support for the Expanded Serial Peripheral Interface (xSPI)
> Controller in the Renesas RZ/G3E (R9A09G047) SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory-controllers/renesas,rz-xspi.yaml

> +properties:
> +  compatible:
> +    items:
> +      - const: renesas,r9a09g047-xspi  # RZ/G3E
> +      - const: renesas,rz-xspi         # a generic RZ xSPI device

Is this the same variant of RPC-IF as used on older "RZ" SoCs like
RZ/A1 and RZ/A2?
If the answer is yes, then I do not object against introducing rz-xspi.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


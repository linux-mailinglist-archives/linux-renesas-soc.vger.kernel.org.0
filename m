Return-Path: <linux-renesas-soc+bounces-17890-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD83AD014A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Jun 2025 13:41:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 440AB175AE8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Jun 2025 11:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C5702882B4;
	Fri,  6 Jun 2025 11:41:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A8D286D6B;
	Fri,  6 Jun 2025 11:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749210074; cv=none; b=NAtwB6FqVBb3kTgO8J48OOxdAme4ql3zkgVCrAzXNURvnKMzwu4RZUIBzt5vXGSDTlGt2CgJ3aMTBzX1pVIETFor/n1HPljEn9LiZFuotoImYmEEaPXdKOHLTvLdPVVkv4k/7QM5Ja+2Q2y9ED8kX8cvWt0nBqlMBvv5DWm5WpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749210074; c=relaxed/simple;
	bh=SajjnsOGNyMztboKpGndMTSP/bW3Rxv8XBK0A9GDHnw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qpJvsGkz69Db7ACIPytnMxD4T/GapxQT33ImViLidbQwFX7k06wBE2Yw6vEDNnAWh7SXqoLXMxPuHmih9ufT6YH1Yqzr66pMxe4S5ajwkPMRGsUy7xWvo+ViJN5uOhzpAQGvFzAhRP6ylFrvJksv5XAA9+JHhYQgRXPgmSJsE+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-87dfde2aea2so616077241.2;
        Fri, 06 Jun 2025 04:41:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749210070; x=1749814870;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=obGKc6TF0CZlt+kXLitZOmRI1163thyelu1UFpSgtqg=;
        b=rSF9a/wsjQA2UeEj1DHQzK3qgod3xE3uqlH5Gr5rjBI2/OAfDjPLAC0foZQovjUb1N
         9qyP0VVKuUVO6MFy9iPqRAZSM+O1bmBtOR3zy1Lj8N4hP59E2hseAs096G+7/zIDWdd1
         jIii4HlbSs7e7Fmo9Pw1uOccKv/hXATYI85czndLOF3zBHMy+egetaoelPEK8jVKCCsW
         j7NTM5pX/STZoxzsVIGQMWTdd/49UZ43v2CqAXX0YzRD3G1zBK4MO0fINiF1AZgF2V1i
         sDn/QE6DZ4lFplIylCHsxIW/jBTFPyL4dfhqQ+hFaMhzi0ew4PieRfEe5/u1SidLifgQ
         E36Q==
X-Forwarded-Encrypted: i=1; AJvYcCUBvK9ET81DzTMiv5NFb6oZy007D06qvgsqFV32g+v/XY9aQlsff8zahIgYA6rWSTj6mn3vHbTiTyVO@vger.kernel.org, AJvYcCVhAZSI0QUEMHbbQJc5ipXn2dqhroea4BQ2df+ZpYW8lM4vX19GppODfskeg/raZMOTMMOdsAuvqEtBHj87@vger.kernel.org, AJvYcCVtMR5wnuNnzAS3h2FOJRJ1nOJKsocSQYCMQLiLCJ0FzZgn0eYuyT5ew+8Gv2p1sFsIq+GprjB2nWKai6xrVSv9sr0=@vger.kernel.org, AJvYcCXbWVcW+4VLbq9n/wG2DPIwxwI9zepApw1CgAVrgQfmDXltQMMJ5I7aJTXJOOmHE6w5hxCt/jtMfwEn@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbf7iI8R8GvjUsGeH/Zn8bXv6fKjkF7nZ+3XwYcoeSvyPBCQcE
	OjUEZc5c1/lbumcAsSZqA3/1c4kVZx3Id3pbu6lcwM6Gcm4K5ym2SriSFEAZpwzL
X-Gm-Gg: ASbGncuTJMO6vE1MrGEfK/qoKaVxm8Gjp5rtx0TUC74LF1xcuUTiCsRGr8czdVk4tQd
	3IO+l1yT4W6N56EodteIHGLZl/B029JSGI8eQFj9i738m7YpeN6ZQ36EDDXVL15Grts2jEciXcE
	8U5OJbytyE5AdWa/t40tFomf4wbRCz2UODF/nXFG6ddHa/eL05lCwFhROhtAs2f1ifFjWEKawm7
	EW9e0WlydZNceS+cIB+Zfxrf8jU28mYLmzDwKtEkeyMOc1T14mCLe0FpH3WwA7cVe8uWT4dOMUT
	590aCU9uUSnb/NQ+yyxzyfliyKprl8YTV126cZiHCJQyFZRFi8sDZgVMA52c9z5BX58W5UXiR0F
	B+/ijaQwm7XTjK3emNTwpyvMO
X-Google-Smtp-Source: AGHT+IFlIQPwHFmHHjYg7X+61jA4Kyb4tWg2rvYm+lb+X0kWxGTV3VeJcvFqL9PmCLA/MI5zIAlyyQ==
X-Received: by 2002:a05:6122:7d0:b0:520:4996:7d2a with SMTP id 71dfb90a1353d-530e48ca509mr2498592e0c.10.1749210069770;
        Fri, 06 Jun 2025 04:41:09 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87ebd219ed2sm973201241.25.2025.06.06.04.41.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 04:41:09 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4e2b5ffb932so704362137.0;
        Fri, 06 Jun 2025 04:41:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV1IeGwejkPQ+Iuf4CgqMGc0beXfGnSVXM/PLKeqizVdJfy/VgUDcJJktSarVF4W0aNhPs258ZwLztu@vger.kernel.org, AJvYcCVubHymYATcAQP0sMZTjAx5yP61q9EUPPjOUwgH/4eQs4W1ANtbVkhGlbeLmKaZiUIG/PyX+P+gQSb7@vger.kernel.org, AJvYcCWpDrAvA30H13NAOS1jEJP6LDBvPQeMd89v8yYwgU4kwr6A8juk2Svf44mGh+VVOr/kckQzck0REpLQ4EMf@vger.kernel.org, AJvYcCXKNcdGMZgTqZ+zjZd8cFe9fDLeJw7dTTf5Ya5FDG1wRc4BOlSzobfMRrm5LaZIas9eGp7OfCIYhdA8Ouards2ziMU=@vger.kernel.org
X-Received: by 2002:a05:6102:f13:b0:4e2:c6e4:ab1e with SMTP id
 ada2fe7eead31-4e7729357e3mr2299629137.7.1749210068682; Fri, 06 Jun 2025
 04:41:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528133440.168133-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250528133440.168133-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Jun 2025 13:40:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXwGvGQt3qHTzYLgnPqzYFn3NNHWDUaG+JuE53sHu_gPw@mail.gmail.com>
X-Gm-Features: AX0GCFuOPwKiL4pHcUMej3ah7pjMpYntaCkNCAJjJjAydth4VrFVLuDiDujv2gg
Message-ID: <CAMuHMdXwGvGQt3qHTzYLgnPqzYFn3NNHWDUaG+JuE53sHu_gPw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: renesas,usbhs: Add RZ/V2N SoC support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 28 May 2025 at 15:34, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Document the Renesas USBHS controller found on the Renesas RZ/V2N
> (R9A09G056) SoC. The USBHS block on RZ/V2N is functionally identical to
> the one on the RZ/G2L family, so no driver changes are needed. The
> existing "renesas,rzg2l-usbhs" fallback compatible will continue to be
> used for handling this IP.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


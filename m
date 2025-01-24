Return-Path: <linux-renesas-soc+bounces-12472-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1BEA1B7BF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2025 15:18:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CB4E162F80
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2025 14:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B8C8130E27;
	Fri, 24 Jan 2025 14:18:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4C741C7F;
	Fri, 24 Jan 2025 14:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737728312; cv=none; b=kjVmbbXJeyJksvHdJ9nXs3ke5W+X9cGA+AFbjSzzNNXpr240apILhZRgf15IbGpJ9+xKIfOvWs+IQRHUxL3FRfianAd4v8A44fnjhlpgL3EOGA/aIYWsT6oNbV8REfrW7Q3IhLuQkNkPRNCwKbgTmzxwhVI2J724lbT7JFrWgR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737728312; c=relaxed/simple;
	bh=oPGfeDN8BxpZfPVanPjG8RwsPoSZ7gDj8q8W0IJ0SBc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ogqcTEi6WI0ESo6D1HNlLT5dmh4e5rHJEIGf2NyU7oXCKmU3EeMD5PXLhVfXyOMMx/lu7fAnpgFUiNvdn+LV/FbpLnVuCGJr7oX2HTUHCKfMDgONKwVcXBFEWc8opgInXGRB12rzjhQXemmFTvQ7n/lHvuaK7zNsonhRPlSCTHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-86112ab1ad4so553992241.1;
        Fri, 24 Jan 2025 06:18:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737728310; x=1738333110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TsfrmxN2iYV5rOJj/oxeLARnp4+E0S/4buOX6YjxHJM=;
        b=CkRzLgcIpGhsG9V6T6LHTmOAFNeiGf7xpnUSWtsgnU6nAT96m3zZodLub87m+KlOG1
         0xw6VnT8tvgsJrGutOwjt5SwStMlESmh8NlYbz86kLUXXSfNUz3jcBaU8w0evguwRlO+
         hXld+K5MHswjasuAOMpECp/cXGp8hla+zgwrvLWcvT1EDDpT6lj4FS08M8UoZlX9Z56z
         39Y0BpQEsRzLRpY7ez4g7eM7FnbUdunoU9WtnfwgXuWrrkAsdBCpmwvXNSL1PqDv8IRh
         PQRkiZZIh+CeNat592HhcUCPU3zetksqxS/OLnZ49kIMfUTFbwoPWI7N+z0OaVG3hxCQ
         KCgw==
X-Forwarded-Encrypted: i=1; AJvYcCVwD4kg4/8jXNLUP1w9fWOtUvfrmUiRmuVA4MnwVt0UOSHDhNTJlJ/q09fQlZ5uL7C2V4Ucc+34EUjQ@vger.kernel.org, AJvYcCX1G5jNEyzuXhDVFDLxfqwK8Dbekoi/Cvl7NnOS0bbYWR2XoLqD6FvShcNsPI0I+sI3yu6DCNxO/+cbrpSFqfwmhg4=@vger.kernel.org, AJvYcCXEqJAJFGySosdQLyXABVw+KxGSJP36i1JPdELhNBO3uggZQwETLKctRnMyQepdOljmOQN6u2S6e1d8k7ge@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/zgN6hyCNhEA54RbdcDrN4hfHkLfywA+FcvPWR4dr5Li2WtVq
	SkgmtjvfnR1y0CfjeTbbhbmZPNEVhm7rhvEGKtmoKp17GyDQNS+6Nq4Crq1O
X-Gm-Gg: ASbGncs7sdt+v4q2SyWdNxipD3OFFfHAlrcH0qzWQpxAfSq4Lm0IiivNd0MV/4e3e3Z
	mklP1mKo67qi4TDaz6QB4BTmPWIslfKgj4Ck+bFl3r0iggSywK6/N6GEZB4JMcbpLEjFanZ+b7A
	eY+MPnDbyiyBqgtEDk/4NY8EGJWhEm5d5AcqjbVBEYyu7FSB0Q/C71LlF54e9ei8N4i0XvmFLQC
	KCeQzixScRLXjxhrctdZrFaMPC8AbQrAkyMEFJB8gymOG85lmaoaKOezyTUDBgMW94vzs0UcDrF
	o097zAiuA4blly0bZyGwiAUXD2NqoWZ/TlykT5NYksc=
X-Google-Smtp-Source: AGHT+IGiFU6UPFhqK9TvCwvmlzvHZO56rXHR9UIMxwjruamrZ/N7KUOXBE+gkMlt0Eh1Oi+RTk1FMA==
X-Received: by 2002:a05:6122:4892:b0:518:8753:34a6 with SMTP id 71dfb90a1353d-51d5b39b873mr25558172e0c.10.1737728309632;
        Fri, 24 Jan 2025 06:18:29 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51e4ea35b27sm383366e0c.4.2025.01.24.06.18.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 06:18:29 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4afeb79b52fso623762137.0;
        Fri, 24 Jan 2025 06:18:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUxNnf02ktSgNKf0ChZhUbhIyQbWygV4Ij21zDjvMrEjsik+/4OLJVV9Ht1KaxdLi0PR/YZeYrUjT6s@vger.kernel.org, AJvYcCVa8wGJSwfBibOjYD4zdOrBAEsGf6XrET/T/qZ9p6THdVmjY+U0uEc4oXomPqJT+rU1jiecCa2dy3W4MXIJ@vger.kernel.org, AJvYcCXdl6i8lqJ3tVr5RtjAX6eIdO03qj8kgo7J89bwskSE4PPu1nwJq0TNjBoqFbHTkp+2wfFsZKMzz1ldvbLxSGDxA8s=@vger.kernel.org
X-Received: by 2002:a05:6102:4b15:b0:4b0:ccec:c9de with SMTP id
 ada2fe7eead31-4b690d322famr28549752137.24.1737728309101; Fri, 24 Jan 2025
 06:18:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250123170508.13578-1-john.madieu.xa@bp.renesas.com> <20250123170508.13578-3-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20250123170508.13578-3-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Jan 2025 15:18:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX09pjKQhrfvxsfPUtLazaHS8E9C_KHpgXYN_B8MHrrxw@mail.gmail.com>
X-Gm-Features: AWEUYZkXPPsK8W1DtM_O0uajKfJywpxO54zOiDltIZKPE-XVADLbgVIzO3tORLU
Message-ID: <CAMuHMdX09pjKQhrfvxsfPUtLazaHS8E9C_KHpgXYN_B8MHrrxw@mail.gmail.com>
Subject: Re: [PATCH v4 2/9] dt-bindings: soc: renesas: Add RZ/G3E variant SYS binding
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, biju.das.jz@bp.renesas.com, 
	claudiu.beznea.uj@bp.renesas.com, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, john.madieu@gmail.com, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	magnus.damm@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 23, 2025 at 6:05=E2=80=AFPM John Madieu
<john.madieu.xa@bp.renesas.com> wrote:
> Add RZ/G3E (R9A09G047) variant to the existing RZ/V2H System Controller
> (SYS) binding as both IPs are compatible.
>
> They however have different SoC IDs, RZ/G3E has VSP control register
> compared to RZ/V2H SYS IP. Hence a new compatible string
> renesas,r9a09g047-sys introduced to handle these differences.
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
> Changes:
>
>  - v3 -> v4: No changes
>  - v2 -> v3: No changes
>  - v1 -> v2: Do not rely on syscon compatible string anymore

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.15.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds


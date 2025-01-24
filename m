Return-Path: <linux-renesas-soc+bounces-12476-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F197A1B7D2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2025 15:23:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D17C188BD09
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2025 14:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ED3986339;
	Fri, 24 Jan 2025 14:23:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7366E86335;
	Fri, 24 Jan 2025 14:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737728605; cv=none; b=KJjiAvb37QvwZ0yFfNDFaGuQEreDSFDe2sCsdevtkKJpZNAZzeRC3/q7VVz7gRVWL/cRrFoMxJaAsNPk7DVYQ8JXlYTGmYKP3aoyMGq8j93e483ZgQ1bPRn2TMJuiWzoyNSbesgQQnC9+zOyU82pWgucgb/qZwrH/avyR4dpz4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737728605; c=relaxed/simple;
	bh=itEhT6RigDFoVW1vNAjWuZt10iRiDCsxLwirMsOpREQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XJWN+ru3p4rhdLfHEEcfl2R4Qst5fNt8ANvEvXArejE4suKUJNB6W8ujBlUvWcypokJYBIQvPdPmPwVv1Vsajb+0YI96YS1u8PNHBjc7aUh1rvNTATLFL4Xlvi+CsexAQWhtjLaqKLxEbC4dYpWE37G4ooLFDvmVcBXfZNWLzpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5174f9c0d2aso704259e0c.1;
        Fri, 24 Jan 2025 06:23:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737728601; x=1738333401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q9ddPv+Sp3SZ6QnrHEPxuKLhHk2hQigC2NAbEaaLXsE=;
        b=XkQ4fIytvQphxVy1TJbLD2axKtABX3OoAkcNGBD2pU84CgWCGdHolomNOjReaCvh2c
         7bG023BCUGTJAx7LcZpdtYRJ5x7yCrHIlCyD28WWU2B+GN4J6lSnnnLeaDdSYWZ1s0a4
         mRMC6rDsGgGi/GOvLckpjkLKf1JvlDCJtRtxO86mgGJ497lux15IdWE90+st9VDyVpAK
         hqfc/ZrOyoFNSdyM00946MQwIxIpFYdBLmblX2vJPYIUYCw75tgInf0JfegKdldIIkqU
         K+6Bolxedzp6UFivwdYFn040T3VNZOryG943A2JE9JGlXgn/5Cbdh8NKw4DhuzvmVeUZ
         5XWA==
X-Forwarded-Encrypted: i=1; AJvYcCUqTVnxJi8Y61yU0gikYr7qXP3eDdaG9De/IbBVxgqnGXEZu7fu+OGMw+VUAa1E08wV7Rk4clX6VCNB@vger.kernel.org, AJvYcCXGBJ3ptYCsysB4E4Pc5cEjuUlXQZwbLJ3KcxMvnROKz4h2vYB+Lku5FPki2DdGHpCQr8YWmY85lcPCGjcz9KS0F3o=@vger.kernel.org, AJvYcCXtW5KY6tf5eOJo8uvEjjT6LnsmYw+jB+6RRsLBuO93mI148JVN80LINWq0esytFkZBUPK75Al/MaJ6bos7@vger.kernel.org
X-Gm-Message-State: AOJu0YyLppThtNimZVr7pDj6yQ1yL73SpY2sInM20SrGVJCy+tg+u/At
	sT8Pne8U+fzY1ogqwe1XpaJH8RkBvUuTm2ZMs/d4NY4o83enbgWpufaqmQc8
X-Gm-Gg: ASbGncvJHKxsFbEGrtUgCrAvAcP9hC1FEVmmSjsTbuk++d6NCIFnLmRFxtnNcY5wWy7
	qzEDjaOfFRxunxGfHQnCbFhlD5PVLeCeAn1efpUKX7lkn7wOjY/xUIitjEHic6CTQ1eniC0Ndaf
	AiUJHgObqOPksgg4TtJa9Qq9C0dLwyP3coMNoTp40IC0ypMcdXEi/Qx81fNTtVM4xurHQa974w8
	3BUMw23z8OTv4VBGgpIsdaRfzfI+XOQsUNT51V+ifCxhCDinVuqtD+JUedgMF3OrUJygQu3TYFl
	jW6Dl1s3mlomDZceuiIlCGkh75ORfCMWN9EpE4iUSis=
X-Google-Smtp-Source: AGHT+IEYTG7ckCvq0St1igNsi84asgTIG1k4O8N8BJlcCwkhqnt2hKua/IgVtwoMMJ5iWeFGEB+jCQ==
X-Received: by 2002:a05:6122:3d46:b0:518:a261:adca with SMTP id 71dfb90a1353d-51d5b301146mr23967980e0c.8.1737728601352;
        Fri, 24 Jan 2025 06:23:21 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51e4ea78a0fsm387635e0c.19.2025.01.24.06.23.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 06:23:21 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4b10dd44c8bso630683137.3;
        Fri, 24 Jan 2025 06:23:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUyl6eM+mCKwTw/nmEJiRW+vZnQiXzOq8MTfiBvCCOaUB7h1KOggThUmOIAD5ua91jeuPi6cpiYAOJdxEXP2XIHzeg=@vger.kernel.org, AJvYcCVQsZ8Rvak8hBJs8f+tS1kTxis9eVmqE1AYtOnnnPEf0RiPe46mZqo9/YNZ+V1q3tpPae9OoDzbZi7kZC5i@vger.kernel.org, AJvYcCWsmhloQnsjKt4rXQZeq2VVe3bhI5wtN7FPLRdI6JSYpAhcpqpqVV7S+FEFODNPtgxUoyVw2rbEtTYe@vger.kernel.org
X-Received: by 2002:a05:6102:32c4:b0:4b2:cca7:7d51 with SMTP id
 ada2fe7eead31-4b690c6a5abmr26902990137.19.1737728600272; Fri, 24 Jan 2025
 06:23:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250123170508.13578-1-john.madieu.xa@bp.renesas.com> <20250123170508.13578-8-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20250123170508.13578-8-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Jan 2025 15:23:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXotcwUZJnrkqBdnVoZk=_gNBwoB4wn=MzpYqZNSO9Nvg@mail.gmail.com>
X-Gm-Features: AWEUYZnUTXkvkr-8jVOfEqHw-j_SXWbQbN8fxTEDjMYMzFpligL4PDozaJ5wUKc
Message-ID: <CAMuHMdXotcwUZJnrkqBdnVoZk=_gNBwoB4wn=MzpYqZNSO9Nvg@mail.gmail.com>
Subject: Re: [PATCH v4 7/9] arm64: dts: renesas: r9a08g045: Enable the system controller
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, biju.das.jz@bp.renesas.com, 
	claudiu.beznea.uj@bp.renesas.com, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, john.madieu@gmail.com, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	magnus.damm@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 23, 2025 at 6:06=E2=80=AFPM John Madieu
<john.madieu.xa@bp.renesas.com> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Enable the system controller. It is needed for SoC identification.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
> Changes:
>
> v3 -> v4: No changes
> v3 -> New patch

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


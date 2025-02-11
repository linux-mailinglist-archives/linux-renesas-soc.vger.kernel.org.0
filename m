Return-Path: <linux-renesas-soc+bounces-13046-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D796A30C0A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2025 13:50:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD59C3A351E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2025 12:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 669BA206F02;
	Tue, 11 Feb 2025 12:50:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F831FE453;
	Tue, 11 Feb 2025 12:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739278216; cv=none; b=hDjlHTAmNb8wlK/xbpq31sRHxHpkDj6VU3W+FL1ybO1whetw0rl8TnYKOQfkITmbNIvMVFnnCJipp7Ax4lnz0fmPncw4IJnl08vnl3NoTt5i3IHkKLYuBOdtzr8oLYG9te6TeiWR2GcLCxeRB/ZiNiAvAGL5i5j7YHLrsT8nRm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739278216; c=relaxed/simple;
	bh=R5bE0SrCd8IRFTkz0rs+Is5G7L7DWCnbKtETKU3FDMM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PkAdqVoCHigN+y9tbUgK/tNNRgabG5ERXcwubKS3LPSF2jMvSI8kyMjF1iZhqR00dzbgN83V5r6ZA6fcDSJHMpNeC06Et9yTBI1WB92fFsAQC6htV34gubyOyidBnic34wyH5N2bjHmHnxd4mlMTzDYzXF6RQ7gRs3qE0sbmWYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-51eb1a714bfso3433135e0c.3;
        Tue, 11 Feb 2025 04:50:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739278213; x=1739883013;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CFpXlF+GOIilkK3WVsrT06jLGl5+Aot6r0q3o2gCvQk=;
        b=Ozk8sI5TOCdHY0hMiwJocYiUFrH7voJJfyUukLIwJsUYE5qtkaPkSVZZtMugmbd5J2
         mIZ2FehFdQxR+g74CU4ntBI6jUVenudBxxHTKmNyd09AU4xqPFfkSuwGpMNKOEEMrovm
         zYaVQrHYXrZg3w2ocW59B0wHPJeQg2yHxcOldHc+DwXyGCMyWMVdkFpi9UGsmcZoc14G
         rAcKPxDs2/MAJC0TQ2jwCsHO+Y0dHTNvN20n6nDfl1UNGFzK5+92m4Jwp3+DRX+njq5P
         fSIrF7V2wbZ4Q0skaHyQgy0MUQTi6qXo5b/qwzoKiDU96RMxNxoSpWH9sX/fWYPCM/kX
         n1Qw==
X-Forwarded-Encrypted: i=1; AJvYcCULiKAdzq14ZtkrnJD+nPA3fJDzj0u5LNLXeYNO4yknrmTe1QnVLF+JkUxccwf1IK+okVoMM8CN0YxxiEO8XReu4vM=@vger.kernel.org, AJvYcCVJ8Ov0FasM+K28AAn55euFyZ/1GFKlCcku0ftWNsgXuq/xZL01v4A3e695R8Cy3WVJbPXR8gvA7LLl@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmfup07bFp6jy9gcsG0kLT3eD/HtLfxhsSyU1qKuJuRYrEqCsy
	OFseJfV7gsTJQ6myPosdEdVl7L6+b2M7C7x2LM0k9llW/ykBdkAdgWvpLcV2x8Y=
X-Gm-Gg: ASbGncuVlAW4M0W+PfA8m4guSCWIv2eDUs0O/d1ssamX2RtlSfHzDN3Ig30Oi06zj16
	eJ1ac0chSSkipTyKFcXdt+o44fhbKboFgD3WwPwa2mKNGOQECiACY4m3YdvadK6zI84bpiZhHt+
	5HlQl0ilfXf5ZTr39I8/fLUiIdnTxTw3Pi4VI0xGlI6qfeSnYB7kDjz6RipXYfsvdj9tHeZIkXc
	/BOE+eOsJVLtgxh2tVIWN6bv3qlK2eY7/iURcSB4azanRjYxvZS//U8E7KU9cbvAC5rKHX4JdlK
	HFJKWvhibBh5Mwnj0g7YEsdVuRjRM3OsVZoot8QT/3i94mALfgOkUw==
X-Google-Smtp-Source: AGHT+IFLetUpjZ1sVYA4pJarH0xwotgbYbXqpk/UydJ3CF/JBtD1E9jc8Te17OulJIarBG9iHN7agQ==
X-Received: by 2002:a05:6122:469d:b0:520:3536:febc with SMTP id 71dfb90a1353d-520353709e2mr5797578e0c.8.1739278213016;
        Tue, 11 Feb 2025 04:50:13 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-520580d4af4sm207572e0c.42.2025.02.11.04.50.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 04:50:12 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4bbe31ef430so469798137.3;
        Tue, 11 Feb 2025 04:50:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVQLPHquj2ZkAs3vD+X4CbE94Afu+qzLAGWn5AzGNsTgKBhQBHn6DcNegJKaDRzQXHmkgOaA2bO1jDQO5FvTEcuhiE=@vger.kernel.org, AJvYcCWfFNG2LlauTjl4+IwUBGGY0WxkeTORqOtlVGKv/p+mZJTNOU06ENEIKpxNIyELbRqnRz7FAg7GfQHP@vger.kernel.org
X-Received: by 2002:a05:6102:509f:b0:4b2:ad50:ac27 with SMTP id
 ada2fe7eead31-4ba85dc5d9dmr10821607137.9.1739278212450; Tue, 11 Feb 2025
 04:50:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206134047.67866-1-biju.das.jz@bp.renesas.com> <20250206134047.67866-8-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250206134047.67866-8-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Feb 2025 13:50:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWX79zKuOo_1bLPDmX1NmER4zNe54uJNa7E5yiibLF8eQ@mail.gmail.com>
X-Gm-Features: AWEUYZmZasyNkWEIhnvP-5epQf-jfZV6Q4JOqVX5fTzE1QT9LDlLPIPZkMmjRX8
Message-ID: <CAMuHMdWX79zKuOo_1bLPDmX1NmER4zNe54uJNa7E5yiibLF8eQ@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] arm64: dts: renesas: rzg3e-smarc-som: Add support
 for enable SD on SDHI0
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Feb 2025 at 14:41, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add support for enabling SD on SDHI0 on RZ/G3E SMARC SoM. It is enabled
> by setting the macro SW_SD0_DEV_SEL to 1 in board DTS and setting the
> switch SYS.1 to ON position on the SoM.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Dropped #if guard in pinctrl node for SDHI0
>  * Renamed the label/node sdhi0_pins: sd0->sdhi0_usd_pins: sd0-usd.
>  * Dropped overriding regulator name.
>  * Updated regulator phandle.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Queueing in renesas-devel is postponed, pending acceptance of the DT
bindings by the MMC maintainer.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


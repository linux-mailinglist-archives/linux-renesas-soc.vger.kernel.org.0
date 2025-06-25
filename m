Return-Path: <linux-renesas-soc+bounces-18746-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 80750AE8878
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 17:44:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 409EB1883B45
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 15:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31EEB2BCF6F;
	Wed, 25 Jun 2025 15:43:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40E226A08D;
	Wed, 25 Jun 2025 15:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750866224; cv=none; b=bBsNt30+UwUp0Q2aRSApWD6feJ0BNXkySCSQl0NaOHVXZr1JTfOnV2VZoWOvaDK2dI8LBDRbXYHRUt9kcM7ZbvFCbzSHFfN3VeNaGVhAF8EfGfIaU0a+wFgokHUEHDFPLsuN9TrJ2qOt6EEEQ6BLXEi5moK/y7rYuUWlup/cXmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750866224; c=relaxed/simple;
	bh=vfJCFwpb2oYttG7MhVzUN6b6iWd3YY9ZB9sdhucB7xs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tZ8YTGhYf5DL/OQWjpgPOECtj6hjUE9+6lBf7P3st4CD3yGQDdQJoOYcYzx3mxot9fkU+pdC1AFXFWB32FHTKzaL/tctiO4j0e4qzhcVTaVrUsgHib5JTSIwY7Z1jLNW0t/eTkrucQ1xLv0c7I68oJClyBi2dlZ6hfSBMCdvwak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-532de49b7e2so11118e0c.0;
        Wed, 25 Jun 2025 08:43:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750866220; x=1751471020;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m+hGEamRUavLkOmRMK2+BsQ6C0d/pPb7Jt0McjBVVOA=;
        b=xHBqupA/v+cX7uBcMuuL1dfLeu98RzF8/B49V1C5obv385jpPjMJ60XZIoKbrWX13v
         KD9W491hOZMcpfCft7dpTkAcMtKlmNJIjHR8YszYTvbk1cXQl7M/dvybLXuCTRlPLXWv
         jyaOL7DoGOGklTutByC9cyDL6oB9IlSycrALbc2hw4MhLY9yUEBr+TxHhlwTb+X14DXz
         M7yvCLL+S68iZRIOn3YUJtUnfsOH15bPn5fEQ81qd7xlxhGTrnM3vC0noE9zJemP8XJv
         1hD36qdHPuU7aqq7qThjzQeZqRG/z9C0Lq442XGbyTANI/+B4CscxdeAUoX4mz8rfLbS
         qgSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUS+c4eE/sHgJEXIg4sGSr+d/OVxxg3yzvDYCGhtS1t9Wj0Kst2JdEuTl829Wkw67UO3LOCNcjQlloG4KJ6@vger.kernel.org, AJvYcCUm8Sfjms3AsBa/WRloB7gh9LYvdmkyl5RklTSr5QuCZPkuahbgqK8GyFSIMEgvfj1kaAyyqtReT019KTsE9yp5dCk=@vger.kernel.org, AJvYcCV2IkfaLaybX4dMEIK0U4Idm6u9+icQzdhkq5cyrT9BY4e9qQxpi1tVGEf5x10+yR0sA0Pc1vM07Hza@vger.kernel.org
X-Gm-Message-State: AOJu0YxajIEYFZoWgCuFY6g2rXJn3fJn6w73AczjH9kBsR7OfNFuabxe
	uU5d5nhYYJEwFQJCz8bJXMnwf/7hvn/bECeIejvTSMeJLoucngnWY0LPXAQUMo7v
X-Gm-Gg: ASbGnculJSQaMVAGmuwkIWKaXqDmJAYqkTdR8EHa3+k/AbfeHX2w1sP8DkKJtFgkQve
	GfTO6H/7tJ8fWpEug4yrGZPIDAmZnucvz7IKpIFWJjnSobOeiA47AN7J6XGVu7sHhzwiY0YH7mY
	QbpmxQgFdcY3eMmX4peuOlxar7jh+QeE8jjtPFYimd//liDsF7vHtfTHAhl/Ld/sOW5R00oInK0
	3QyU50aVLBXGFCFAVndSIJfQuZ2evLcA3cbPMtl3OzJ9mImy1rmKKIJvF981Od0F4AufJaImkcr
	SfBO6qa2U4RjIqrpAx+P4VY2SMwDFR/dXSWXDcEPnojNuQ+D6cBX1beCVpNRI1UrFS+B1ceZD2r
	0JOlZrTy2TrNogytaw92KzD9qdzi9ZFck5VU=
X-Google-Smtp-Source: AGHT+IHTjGIiwg+1RcE4NHXCB+nFlwSJJ8F4XTbc+953lhxJXJWkjNMCz2O3XKgIaG7lOBCnieDNEQ==
X-Received: by 2002:a05:6122:a1c:b0:531:188b:c19e with SMTP id 71dfb90a1353d-532ef392371mr2673444e0c.2.1750866219558;
        Wed, 25 Jun 2025 08:43:39 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-531ab37d83fsm2036173e0c.36.2025.06.25.08.43.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 08:43:39 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-87f1b3a3e7bso6386241.1;
        Wed, 25 Jun 2025 08:43:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV+OWhc4bjUjfEmyzD/97yFcgiGD4/1yGYU3lJ09DljIdd5jn2V76H3qG75/jLGcm2o4SimpAoAbu5W@vger.kernel.org, AJvYcCVDm21Eel200O1u+Dol4dn1Pf+CfSlxBTOYtV1M+GADIVMbxptzhpgEBY+eQkmK5ZWUrwRqkHKHC6oZYTjrUiNkcZU=@vger.kernel.org, AJvYcCXVQMTejB/1yYAgeEss+vwVo1dN99AfZNCFCxjteaWKU+Gg445ybbdFOQEiBX+DHrEhZEG2seUl9JutWwug@vger.kernel.org
X-Received: by 2002:a05:6102:3a12:b0:4e5:8c2a:fbee with SMTP id
 ada2fe7eead31-4ecc767e811mr2310952137.15.1750866218878; Wed, 25 Jun 2025
 08:43:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620121045.56114-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250620121045.56114-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250620121045.56114-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Jun 2025 17:43:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV_qX_JCA3B93nWwb4-BUtPdTKrenPygCpPse65bGRkqw@mail.gmail.com>
X-Gm-Features: Ac12FXxZ7FfkWNkfL8xSQZeqhO_KwM4dRgZIT9Y_cdssJVft4dXZEBqfJcoR_-s
Message-ID: <CAMuHMdV_qX_JCA3B93nWwb4-BUtPdTKrenPygCpPse65bGRkqw@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Rename
 fixed regulator node names
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 20 Jun 2025 at 14:10, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Rename "regulator0" to "regulator-0p8v" and "regulator1" to
> "regulator-3p3v" for consistency as done in the RZ/V2N EVK.
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


Return-Path: <linux-renesas-soc+bounces-11771-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF3A9FF7DB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jan 2025 11:14:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C04F67A051E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jan 2025 10:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8C001A3BD7;
	Thu,  2 Jan 2025 10:14:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19A819068E;
	Thu,  2 Jan 2025 10:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735812855; cv=none; b=fcV7RsP8ObWeT07aJGPKC2VxTtuiai5k27wGbDbSyc/0qdWwQNmy10smXb+JgVaSq92Fw5Qee4bqOayuhKF2aDEqotcMOein4/MgVLP1Sm2i2vjrRomJP4+SKFkZp84VRnlAYHn933MOy/xsEdR2wnNrXkaD2HMA3lPxMZ6K4IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735812855; c=relaxed/simple;
	bh=y2u5TwkphcfFMtIsl1Zk44r6MuWFzJ5nCPqmhrxzzQc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a/XDahCph61Sp4/n4hr78yoM2BgYGtUrx+7M2JRm4SvovCdlBsdncBFsXgzZ44IYfXean6rAYTi9DJ74gd8401IGFygEjLJFzEbOMWE6J+lgfCncuRLXfJ22ref45YCMFWBv3pmke6oWQfZeVMY28AZmMtRiI+vEsMsXwA4O0kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-86112ab1ad4so2741117241.1;
        Thu, 02 Jan 2025 02:14:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735812852; x=1736417652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uT+UIBWP7hUzwMzZac7PYBAqJCKPWg2m1Ijv7L0iqyA=;
        b=pn/FykkY+xEb6Ut6DZ8RFt/YjW9oLd88Fs818cP6QSCNy6hRsNvwN0faYTRImoJAU1
         OHzABZWgC+jNf5ppsxfMqcychtzuVnHXz5RVVndzLgl0WNnWTqthI/KCv0QEM3WyzhHN
         GaF7R4X/YKFYhHWc6HZ5hWQ7anqsXPw6potLKP5l0wGxqoFgb/mAd0fg6pW9Rs92vgzJ
         6Na26aTKYapRRY8sVdNeCpE4mIOHexj/p3gExRHBZI1iFizYCtX3h4PYtW5FJc0tHwpy
         nqEkHn1zVc3AwC+ldeYySoI09SroMLSvQ1W66QmqItC7pppEhxHMytqKM8ElhbIl2R+a
         7FGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWA/uJfDzMfpPt9XW23xIJBjN06fjHUmhzr/7nmabxFaXMnu1dJPQIMKftXRTfBvBre0btL/HrCoRll@vger.kernel.org, AJvYcCWIvEtizJNdzsdP9T/ylR2M/OEgQLoeOdWfraHJMysd28U6uPGHtquTQ+NnnUuC7SwBj1l665peiIEW@vger.kernel.org, AJvYcCXXtNTpuo8uKMMM9o/ESmtV+uC1pMfw+iZT1QNQSGflzAZyK5qSx/dCiqrx540QNKYwQ3KpvZli3MZJqxkm8swesL8=@vger.kernel.org, AJvYcCXdNaOa7zxue0bVpM/EzWIk8vXW9T9eI3hnGHkP3VN7W8oHImewaxSG1hNwMEVlkrIb6U6qtmIkAAiGzEEs@vger.kernel.org
X-Gm-Message-State: AOJu0YxOmLFl4TliWLpjtiFx5B3DeOSdy9AcIU5iW2JuUNEWOWg3oMCO
	VNfbdkNIGjDv6kJWp19EMCq95hbduNI4pYu7FuuEFrZPeandtqiGsYG0Hw7B
X-Gm-Gg: ASbGncu6nKfUQ8AcdPOq+2yqU3kwLoXvvVtladjKn1a/V7N5Zcn/ijx/vMiWUW3CyG1
	YCaKjfsOGENbcQeOqfNio/qqB5oJwTzRyAbTUgB+0uCoO2ul1UXF4OMt+5UVoq04wEOph75DWtN
	reCpwCe7lySVFUahAw0rR/Kk8Lqs0jfZ1WL0sZALDylYmSw0xdm5Q2gNxnq+hs+1if/DtDwOglA
	d0fIlrFtxs1jMqBXrf69XMSbL787eOmxBLeto2qUIHNJRJzkSXmBoODf4A2SO47e0ewsHVHQnfA
	kLs3t7Kko14dXaHscOVq3MI=
X-Google-Smtp-Source: AGHT+IF9+YYusiV7mKcfHU3Ourrd2LDXDjpVpn6W2Gpynjm/OiqKp/QUkUOoTmROE2g9qxZx6nNIeg==
X-Received: by 2002:a05:6102:160e:b0:4b2:bdf1:c1ba with SMTP id ada2fe7eead31-4b2cc380883mr37027062137.13.1735812851881;
        Thu, 02 Jan 2025 02:14:11 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ac1f8a8sm4914344241.7.2025.01.02.02.14.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 02:14:11 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-51640f7bbd3so3368614e0c.2;
        Thu, 02 Jan 2025 02:14:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU3eJ9MzH3sq/Uhi1CL8ZkK17gMbQTVetnG1X2OkLiMZTJvWLjywAYiYs6V7m415sUe97PZ+wAdOvkjpfHRz/r1hdY=@vger.kernel.org, AJvYcCUkKCBmd6buOx/cMmEmPCMCHVS9oYE099is5Ce/whH/Wrv3O1iDyfmACUcZhdIRbam8xrPbStqqbLol@vger.kernel.org, AJvYcCUoy/c7AU2alFAaq6JhE1ImoDsQP7Wm8X6S1XDLWNxq3WPb2R2ZDttT72HY0Ah4LpLVSUkezjaKvMwtw+VG@vger.kernel.org, AJvYcCVTMottdUfOxHK8h3rIRnaZAbVgszarODsKAgvCFc3CoYtYwTpO3hWKFMrwa5AATIQKDfo/HZ5yZBaU@vger.kernel.org
X-Received: by 2002:a05:6102:b04:b0:4af:be6e:f0aa with SMTP id
 ada2fe7eead31-4b2cc49d580mr25571636137.25.1735812851430; Thu, 02 Jan 2025
 02:14:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241220-rcar-v4h-vspx-v4-0-7dc1812585ad@ideasonboard.com>
In-Reply-To: <20241220-rcar-v4h-vspx-v4-0-7dc1812585ad@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Jan 2025 11:13:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXUJW-gYQRXvX5iRu4ofsufmc4mnM0iYWQV5uyN5=6k4g@mail.gmail.com>
Message-ID: <CAMuHMdXUJW-gYQRXvX5iRu4ofsufmc4mnM0iYWQV5uyN5=6k4g@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] renesas: r8a779g0: Enable VSPX on R-Car V4H
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 20, 2024 at 10:15=E2=80=AFAM Jacopo Mondi
<jacopo.mondi+renesas@ideasonboard.com> wrote:
> The series enables the two VSPX instances connected to the R-Car ISP
> on Renesas R-Car V4H. Define clock identifiers based on the MSTPCR id
> for the VSPX instances and defined device nodes in the V4H .dts file.
>
> The VSPX modules interface with extenal memory through dedicated FCP
> instances named FCPVX. Before defining VSPDX, define and enable the
> FXPVX instances as well.
>
> Testd on V4H White-Hawk by reading the FCPVX and VSPX version registers
> during system boot.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---
> Changes in v4:
> - Changed the patch authorship to my +renesas address
> - Link to v3: https://lore.kernel.org/r/20241219-rcar-v4h-vspx-v3-0-8fe8d=
2afb268@ideasonboard.com

Thanks, will queue in renesas-clk for v6.14 resp. renesas-devel for v6.14.

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


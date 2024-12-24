Return-Path: <linux-renesas-soc+bounces-11697-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C609FBD96
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Dec 2024 13:55:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BAC891638C3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Dec 2024 12:55:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 538511B4128;
	Tue, 24 Dec 2024 12:55:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E581392;
	Tue, 24 Dec 2024 12:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735044911; cv=none; b=VLUsMPlSS9LD/5UCgMEP93ORDjNs4TQefALDAI59lvChd+esr+npJFu1NXV7gW7i+/SrbuRyRr6tYVGkd5xH3g3WBtI3toDFTE6EblTMmaNhXPNqWIgUoqy4/iEHU0x4XUZH3p95SiWDLz+wlso3PPONcBz0vM/WZfruY0wBuBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735044911; c=relaxed/simple;
	bh=fkNVPn9R1sjRs6kvph8dSEhh3A1tKA6Hd107uxLLiF8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nchmn/1bTIg+BOh25ileuaeb6Mk5B8SdO3zKbSUmv0HfHEsgRr8tKGK34gZQdfpO0Y9ksyy/O8IBc2qPRHJbYqanB73ZvujhBEs9G5lNOxbM4wbvCUwEccdCVOUT5R9H80+jf1cZkoQHSHd2/5kggLTthIUxdZCmgTD9szeUY+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-51619b06a1cso2924290e0c.3;
        Tue, 24 Dec 2024 04:55:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735044907; x=1735649707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fpjCeAVdSwRPdWUW6IvEgqiV+bPnm1uJ0WGp1QMeJH0=;
        b=uZtJVBEPJJeS8qXPI1JLnKOOM3LkEZn1tj5qLvOWOlgHucwd8l2bQsrqEeT9QEPikW
         Z+ojvW8v/fTbvgvDZDsHZMFWJQI+LsmTAjUWC8Bz6anWuM0RHOj1HfkFp7x9uBssgrse
         bLPorGBTOOsUzdrfD0GKfsuepkDTnfaW4RI8r0IiPehG0zkfKKibdW0wj60ilTBtCV3Q
         5JzMk5kjYzjCDLq9x3E6V3sUS56Zlrt7ij9JRYKj/vURN7ch5PG9QUpurRIntVb8rP0G
         8fBHKnbifmHEAwu1XTequ4ZiUjbbP18nCwwiHZzfCgcllzzrY9VqhndjODBcTpItuxAC
         vorA==
X-Forwarded-Encrypted: i=1; AJvYcCUaLgS2bko0H3LPgeeh0V9/XXxuXlsRUOgTAsdWN+2FCV0zCvja2aS2bPH8Ouzpjeot4g53W6tsjx6gyb8g@vger.kernel.org, AJvYcCUi35NKXYUrCXz490FBVJ9iXTB0C0Z8KpgvJX3x1s5+7P9PHG1fYErRAMatWefjt+1+kR+guyNLkEupbJvn3Hiidlo=@vger.kernel.org, AJvYcCW5kzTsfCHKhwRxp7w0epZqQLiEk+0oVPO90l8srULYsgF+H3s6HUagltH593YG8Yh/JB8omM154ig=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRocIPzjqRxz8tFNSt+BjGK0q6RqmFn6uxqkPFWwBXS7+hm4Ri
	Nc0VyHu+al+pzQ5W7uwvIXHBvbp7etfD9ecASro2dCP24yQSw8kxXzbLUyMa
X-Gm-Gg: ASbGncsRtM9ux6tJq0KCQ5oKFBnltK8Dj2u6/k7JKdQ+mIm00zaQsJyw/4BzhkHRMNK
	Qi18yQRhqFHucP9V+qQLfrz6jo8QKYJE/lGztRHPlsSFpNZedAtKbfbfWS/iqmsEBRffsKwra5n
	nWq64gwBsuXdFRVTuKmrWTBSP6hpU0XA4tyibUtjabcNrelrb84u49esPXtqf3OCzbbGTWbmRLB
	VtMRsNF42i3W7wfIMlUx17T1RIVFgouWe8ADvg4PWCMaoJERDGbmTQUhsY1co5MSE9v4TpAocFb
	Auw3lJVnqlzriBaZr+Y=
X-Google-Smtp-Source: AGHT+IFuLRladAEWPvKUlUKNa9zlzKMSYf3iJso48l8xSqTyx92Ql0366wJKhrbRxnvQlP2gEbxdUg==
X-Received: by 2002:a05:6122:2519:b0:516:1106:4c1a with SMTP id 71dfb90a1353d-51b75d6b15emr11549028e0c.12.1735044907627;
        Tue, 24 Dec 2024 04:55:07 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51b68bb4751sm1172522e0c.18.2024.12.24.04.55.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Dec 2024 04:55:07 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4afe2a1849bso2854783137.3;
        Tue, 24 Dec 2024 04:55:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU2PO4FAwVK5NZ8JHK167oqukySnErPgUhzclrC+rkHbJNHh1vtVAhMH5u3SOwjiYEXAQN5o/ywQXIjVT90@vger.kernel.org, AJvYcCUm4klVNh4IfOUIUK0pwr3s4yGNPuvQLr5KsuKQjWMjPdjMOhHQai09IfwYibGoHSwadbH22TiAGH7dgwgUKsnDA9Q=@vger.kernel.org, AJvYcCVQzhBr0d2Pcgu585i4MV8w9IM66lGCl+51wLqxHDxgShVxMYirAQmBCJtInxBtIGPhL4djrnv9G4Y=@vger.kernel.org
X-Received: by 2002:a05:6102:41a2:b0:4af:4cb0:a310 with SMTP id
 ada2fe7eead31-4b2cc3612a4mr14335513137.11.1735044907206; Tue, 24 Dec 2024
 04:55:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241223173708.384108-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20241223173708.384108-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20241223173708.384108-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Dec 2024 13:54:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVe15kQK-4mXkeUE9J9faf-_--Qx485GGimx2W02qLMOQ@mail.gmail.com>
Message-ID: <CAMuHMdVe15kQK-4mXkeUE9J9faf-_--Qx485GGimx2W02qLMOQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] clk: renesas: rzv2h: Switch MSTOP configuration to
 per-bit basis
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Mon, Dec 23, 2024 at 6:37=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Refactor MSTOP handling to switch from group-based to per-bit
> configuration. Introduce atomic counters for each MSTOP bit and update
> enable/disable logic.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
> - New patch

Thanks for your patch!

Early review comment: the big missing part in the patch description
is the answer to the "Why?"-question.  So please elaborate.

No need to resend (for now).
Thanks!

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


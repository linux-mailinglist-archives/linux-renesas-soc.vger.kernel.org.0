Return-Path: <linux-renesas-soc+bounces-24952-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F80C7A54F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 15:56:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA45D3A05C1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 14:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87FA72C029C;
	Fri, 21 Nov 2025 14:54:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEE91F09AC
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 14:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763736846; cv=none; b=nGlw8oN4Vc4RCSpZIWYibQjmCdsAjXfJ3rcNtmZgiAGPdwALwXR5dYll8Y4+j7cL6iRvTjraFEAMEaoS4QqwRKy/aSKh6WzqR61ez3zDWqhm3ERGnHT6OFmro4iW8EWu3KTMrdl5QnXDbGFuxiZT6mIQAGgpWwHKt8UOG5qELag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763736846; c=relaxed/simple;
	bh=/i7nXXYJ/S35e1DDoqCsekWeTret9cPBtAsRNgYtitk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qs8SdQIu1BKlkxCH2CDH9s9G5ZO3AsyuW24Y4s+GzBVqs4f2lfpT41kNuXMUbKgzNBFFytY0aDRoFCPy59n5rmLnRjve2Cm55/Mj2V5PQu2mifjb7RO25iKjM4Ae8wr5FlNxID2u3tFYHHcIHlaqabtIXn9sOD55pK5uXEN7mwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5e186858102so746625137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 06:54:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763736840; x=1764341640;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T1emL/2BfYYpJgkMipS6IyfAGtl5eimxGIDnmxM+aDY=;
        b=MCNAzpqhkTqZjhUmY6EgOk5z5oHuRq66qOBrKXUHGPkYbPpYhwD8+0ZN89hh1yAwSO
         cWXntCX+yaUo9paRi66Z5daUAdUATA50l7e0XrElnMc42ftkWMaTXsnnlUmyvRKkoHfy
         A4N2KVXD5+KkIMHV1BsHUlywCCgpnx9BYvYckHlWkiYcmloKYeX7YI+GEdvHusnUXwce
         w/rnrFXER4TrsL4dbzslveDpmcgeXHiPutCE67oOxxEzxx+oXwQhWYc8hVpecqcPb0cH
         tH6Lq+A6CdtksdKw74cVVsnwSXXJOyVE4jgo0tqU+Bcvg6Bifjm0i4sJMbhH4vQMSNtf
         vSlg==
X-Forwarded-Encrypted: i=1; AJvYcCXNmHTWmuxwSR3fyqn6cBpmvdNdVoz96Rw5/QdWMjQme5G+7PYonQW0CLJS6/dXtDCTKiTZnxSU3nsyM2XlwEpvYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAyx7sh/KL4Wdq62qRSnk+4HBil8C2heLvrgMMBrLIppY1Pt0S
	6CtOu3Io/tmmujUDG3+4wWy4bJFQw+HFIkqnPEhRVKjAuyTPKYR6q2Ajv33GqMR4
X-Gm-Gg: ASbGncuJoAdunWhyMLkfeGHyQtWDGbzqqn1StVYv1nDDBXBcMKksVUDGtwH039CQNYA
	iQHXahIRjJyljn4e3Dnn4DAY3XOxM2NNA6nTK0bKCWqMiCk8TJ2qsrk57sgGHqvxwJf446wttpT
	1nZLE9V3hwiDekFp/jKsdT5Dxb2QAnMyKzqKTB0x7Bau0LBA7XT04J7cbGpU93820+BcinrEhTI
	DisPtBS1K0Xc+6B05gIGnZpaqsMlfOrJAnMCZ63jyXnLEaU6YVM/35VR4G+YqEHaEyRT2B3hwfu
	VUcXIhN0DHdTUACrUxQMMosV7CGwxjeCmWnGTFr9H4jfqRWdfB9Vj7H13O2DbpOXQxZdm9QcHLs
	goKzxX8Pn5mhokzfGF0OITPP2QrkvSZRqn62v5ooSUQ89i0dAc8/USRFv4twsfO0FhTiU42HEIo
	NEI0EiSr4rIw21lCwVWMHetEoQs62LM69/NpoIT94TEpYR8kZt
X-Google-Smtp-Source: AGHT+IG5ho3ZZYbezr8qZd85FWOJLSubLHgJ5aeKWJ/gGZFsZRZXXuJEk9eVm2QcGEJbFwboPwg7WQ==
X-Received: by 2002:a67:e708:0:b0:5de:8e5:222d with SMTP id ada2fe7eead31-5e1de3c8bf0mr659655137.22.1763736840043;
        Fri, 21 Nov 2025 06:54:00 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e1df0a7f93sm784969137.0.2025.11.21.06.53.58
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 06:53:59 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5dd6fbe5091so898532137.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 06:53:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVMXYgcNxNng3KBQHY26XxO1LxB3FuxpE7wPcXxwkhnFJJ2gwLXa2DI5ohCDNe4bgTYjjToWjlpzPyjcZMxqcc8NQ==@vger.kernel.org
X-Received: by 2002:a05:6102:2914:b0:5d3:fecb:e4e8 with SMTP id
 ada2fe7eead31-5e1de13755dmr737744137.5.1763736838284; Fri, 21 Nov 2025
 06:53:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251114105201.107406-1-biju.das.jz@bp.renesas.com> <20251114105201.107406-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20251114105201.107406-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Nov 2025 15:53:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVBoRtm8ULLfUK_cVECfx47tRArNHFyYD0C+B7MM9Mneg@mail.gmail.com>
X-Gm-Features: AWmQ_bleERgqdogMt-KCM4u2kemacgqay0PsYPcAY6PFTObuXA-J-VDhL_sWOrI
Message-ID: <CAMuHMdVBoRtm8ULLfUK_cVECfx47tRArNHFyYD0C+B7MM9Mneg@mail.gmail.com>
Subject: Re: [PATCH v3 03/13] serial: sh-sci: Drop extra lines
To: Biju <biju.das.au@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 14 Nov 2025 at 11:52, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Shorten the number lines in sci_init_clocks() by fitting the error
> messages within an 100-character length limit.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


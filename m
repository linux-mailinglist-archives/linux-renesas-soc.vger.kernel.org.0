Return-Path: <linux-renesas-soc+bounces-14831-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B057DA71418
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Mar 2025 10:50:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C39A18831DB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Mar 2025 09:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51FC91A83F5;
	Wed, 26 Mar 2025 09:50:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D05189919;
	Wed, 26 Mar 2025 09:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742982602; cv=none; b=E+Lpo7vIwfhDs793/NRRc8LQdVa7sNGPt2ibDVbfWN3Zr/y+BclJZWVuCG55bi+YIzgyNH2VUCvJSNEKkH5e9g9G2lViNCmSnpM9rvDzfGQmgt0S4RjMUCb78L3s0FtJF7qAQjkwoXVscZdZzXM4/vXKSGkmZUIUrbICtl2Lask=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742982602; c=relaxed/simple;
	bh=SmXL+JiIJjhi5GvCwXWqvq1ZakYPzIcHbkmSh7WHMLw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JKo3h38TsQA96ucclLZowTDT1GcSN8pq+zrBVvFOMh8loqp879nEuj0RtruVRizVD0BOaowwJ+2TToWZk4VPi2UmNVcVJefnqw5jpIcN1CWiOVQSN8+11JmItmRw6D88VBk+pv/w9TAajj9JDprAb1B98O5NKG440e7XeGifROc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-86feb84877aso513510241.3;
        Wed, 26 Mar 2025 02:50:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742982599; x=1743587399;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jKQO23Cx9d0LvjJBqoaXpMi995oqQPpXgcgXRWzNSKQ=;
        b=ADLWTlo8YZDaSS948sCm8e+MlWzfP4pFPNqeIVYV60krTcufcL1KM6HOy8AAWqQqkI
         XqAKp9b1EYuLeLyVvopLrxZlyaC+EWdNi7tV0zM5XxX7rPuGf9p54OxZ6lQPwvnBPpeE
         nPIz25FZys2liBljn1Jxymkc6NhK/MnA1nwPns8Eoa6NfbxvnCcqNJgHlqfYbRrF4uUA
         Z9IHve25bSbf2mUoc7YEjxItQK1QzC/NPEGnrt4fTSjdU/padKmFvjGllRfqeHWKg7iX
         MqX0dquWfSn7ZLmpE7g9Z87N2skPnd9fEBoMOOgQ3RKGPGPgUlUrPSH0Q/eQvQJlUd0t
         6w6A==
X-Forwarded-Encrypted: i=1; AJvYcCWiUf7bhsymNEHP9g6b3STyv1Kl5IzrWa/FIe8dm8sxOPWKj1XH4RjHeg7n2gbxgy+vee6OEgGmhITyEfPEqEn0DJE=@vger.kernel.org, AJvYcCX0DULBs0c9Fzkvceu/fdDamMu9McCnm78FZZuFJ//DnQZgQ8TwJdEpiz5cWjZzhglR7SXqoyhQSXjW1KU=@vger.kernel.org, AJvYcCXmHQ3SLgenj6UhU45vygkaibwV7/hY1CusF71wya5oEPKWK0HzA5geik4ievXwVbrr7Z90HdTGtFYXAgb0@vger.kernel.org
X-Gm-Message-State: AOJu0YzJy9znsgjGTLxCOPWvapx0Q93vMlDSRgHMQ2el2OjivB/n6vfS
	V4L3W3+vQgXCiL5c14gjI6Or3/hqVtezB0RAnn4ioV27+AIWXOI9625ITd/YgPE=
X-Gm-Gg: ASbGnctFAorLFlGFJI8sZEArxPNDL/UVVjjHHp/jqUBtEr4h43sDC6AaH6dr/L63iCW
	Z6pBhEK+JG/ALV/rorp8vk4UioVdM6TYYwHAR35fZouzSv93QaAikCdZedDtfM+FB+bA7OdOlmO
	eVYadurGAhRMo56/7nw+dCUkf7e+em3QFC5ukdBhcVVs62GTw1b4AW0nNYvhISc3K0ZsFb4eDVj
	UjJsYIDBfv2Wuy4okgUsNfKHX92nbrA3b5OtPMVGHrtaIGzxpS5G4VFaf6aa0yJlgmkJ4GWfy+9
	6HkpXUYIhI3U+uKaKt7ic5pejVpei6abrV8vwc5mPNyeIW6uL+kYIrst25op3+GViCK8mRSimrp
	RoaeRgSHxGYz1yVuxwg==
X-Google-Smtp-Source: AGHT+IGSIQIrLPlJ1yxx0QKt6Drz5lBprJ8+ZBSCsuZtGJ/IGUo9ksb8HCdhUOdXwD3vkDSjKrcy/Q==
X-Received: by 2002:a05:6102:5091:b0:4bb:e8c5:b172 with SMTP id ada2fe7eead31-4c50d4d117emr14592193137.8.1742982599060;
        Wed, 26 Mar 2025 02:49:59 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-86f9f3c2d01sm2469491241.16.2025.03.26.02.49.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 02:49:58 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-86feb84877aso513501241.3;
        Wed, 26 Mar 2025 02:49:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUBtWlt2/NfzxGNjZxm/7Xcte/2jUpc8s32AqEwHqn6i74YKW/psMz5VTuiBB59QMcnbiHtbcablLmfybT6AQmELzk=@vger.kernel.org, AJvYcCV/eYUv9K9r88Xcje1N5dqjIw81frbfYqK4gkkIKxxFHtKXmb5kZxO2dfdZMPMDj9EJnfYTq7ndOHvK+Tc5@vger.kernel.org, AJvYcCWabhW8L4xXG++WNszBgtMDLIwFuXffa83ZKb63oJokPsxWKBfLEAr8GH00zivBSxuT/rYLTRyUpkcZbDY=@vger.kernel.org
X-Received: by 2002:a05:6102:a51:b0:4c4:e018:326f with SMTP id
 ada2fe7eead31-4c50d513aa4mr14555149137.10.1742982598730; Wed, 26 Mar 2025
 02:49:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325160904.2688858-1-thierry.bultel.yh@bp.renesas.com> <20250325160904.2688858-8-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250325160904.2688858-8-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Mar 2025 10:49:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUsdk+qDDwE_4vJrLRqK9Dhb8Mc_tDEXMHeLL9P_u3XuQ@mail.gmail.com>
X-Gm-Features: AQ5f1JrSAYUiq-6TpwJ18nNff1QGHnNZxD4aPKNO7SMpE-lLvCcSuM5mkMeIRhQ
Message-ID: <CAMuHMdUsdk+qDDwE_4vJrLRqK9Dhb8Mc_tDEXMHeLL9P_u3XuQ@mail.gmail.com>
Subject: Re: [PATCH v5 07/13] serial: sh-sci: Fix a comment about SCIFA
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org, 
	paul.barker.ct@bp.renesas.com, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Mar 2025 at 17:09, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> The comment was correct when it was added, at that time RZ/T1 was
> the only SoC in the RZ/T line. Since then, further SoCs have been
> added with RZ/T names which do not use the same SCIFA register
> layout and so the comment is now misleading.
>
> So we update the comment to explicitly reference only RZ/T1 SoCs.
>
> Reviewed-by: Paul Barker <paul.barker.ct@bp.renesas.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


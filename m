Return-Path: <linux-renesas-soc+bounces-4392-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE0289D2FC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Apr 2024 09:26:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A226E1F23775
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Apr 2024 07:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B8BA77F3E;
	Tue,  9 Apr 2024 07:26:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA577605D
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Apr 2024 07:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712647587; cv=none; b=KCHiUQHYa35bfHsv+eWdYG43ddcAO/hXvbcnQQqCYWMFmikfN7t/sf0qs9t7uXAO2GIoBO0RuBHdfVdtAq4Ip6vEUC//v9q9JbJ+DRLiAL0iGvMta13gf6SBchGIecrqMSZNONHRS39UftY1m5aE7iCFqTPhRHEB6D8H77X6Ix4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712647587; c=relaxed/simple;
	bh=QsA0GgrVgEkG0391aWuVJDGEp+uXYRGmgYAoAwPjV9g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NEA5OShithCZ6JakBajLXn4VkWtBhO6ut9xu4F/jLQ/40Yf2e7RFvw0BiNW8UHBiZHo6udq6ZGM9ocabyX09LBl3J7iZyUmxUfHbvM/uyDMC/GEn9gR/09l0+/d3/lEqtNuuSsjlmYQ77JrPlmgDIr96TQ501bz6xtmA2gnkeDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dc6dcd9124bso5072646276.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Apr 2024 00:26:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712647583; x=1713252383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K2D2NxqoL1l9jyG6ojmX1gkq9KHg+FeoueDUkr0UItU=;
        b=WAZ30bkmdJAvOL+GEa2QvCFK1q+BCAsUu65Vc69us3Dnel7bocGZuM4+x4+wES1JVE
         vgLb6U0LEShpWqRMnx0IdldYpd0rykbdzLGFkuGRn+6Gu4UxCiM1eFwE2U3VEXTDKBUL
         Sy9NJG9+bYksWgm8MNJIwZ0coUoySKlE8Sj0fD9PSKh/yKtJHSHsqSB0pOh8qi2QBPAv
         fkr2uPGawDYcydCplKJyBDEoyywIyD2a36rylnd9Q3+x9dtc+m58j+iTBIs1/ZBQYS44
         IBSTWH5lRahz45twdlB8CYL69U/mBYiiuyh8L++1A9LIulEl0TKnZRF3NH5CiEzZgk3P
         1clw==
X-Forwarded-Encrypted: i=1; AJvYcCVE2K1slFMsyfJL3ng42Bepy7KrijAeUUrJrSaNV9auuBCZOVgWdUDP7ihJho/5k+pxwKwvfmNpUHT1tj5jJPuFyxkGZyI1pheEDVxY924i7FA=
X-Gm-Message-State: AOJu0YwHRqxiY9+/n+LVXdiaK+uOqw+L7QFeVGqpgwzRL7TWKaV+KaKL
	YlNKVniXu7UEwDIHHM1HH40A6xo9PFpdgh/k94JbQNmd11tBM1xlPWYnMi6pMmk=
X-Google-Smtp-Source: AGHT+IHJhK/RDAUDdmYjEnw/dl9EVTu+CZtijRvdJU6CL1X7sOEyH404SEq5dP0X0A/41tkUji5LyA==
X-Received: by 2002:a25:2e09:0:b0:dcb:cdce:3902 with SMTP id u9-20020a252e09000000b00dcbcdce3902mr9431516ybu.55.1712647583203;
        Tue, 09 Apr 2024 00:26:23 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id e17-20020a5b0cd1000000b00dcd25ce965esm1641339ybr.41.2024.04.09.00.26.22
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 00:26:22 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-ddaebc9d6c9so4678774276.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Apr 2024 00:26:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVa8P9lDx+/TYs6FZ+BrOlC3UQk2vXaD6Jdb1oQP+JgsMCf5SESd73MCC191IVBNV1x7eHu4kk2bWJFzik1KoLPqt2N9KyghW1YLwb0iccLfug=
X-Received: by 2002:a5b:11:0:b0:dcd:1f17:aaea with SMTP id a17-20020a5b0011000000b00dcd1f17aaeamr9375656ybp.26.1712647581850;
 Tue, 09 Apr 2024 00:26:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240408170426.9285-1-ville.syrjala@linux.intel.com> <20240408170426.9285-21-ville.syrjala@linux.intel.com>
In-Reply-To: <20240408170426.9285-21-ville.syrjala@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 9 Apr 2024 09:26:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWGyeGnWOhxQsiPWp8XzAMOUuJGfndQ8c32qCwBe1zrLA@mail.gmail.com>
Message-ID: <CAMuHMdWGyeGnWOhxQsiPWp8XzAMOUuJGfndQ8c32qCwBe1zrLA@mail.gmail.com>
Subject: Re: [PATCH 20/21] drm/rcar-du: Allow build with COMPILE_TEST=y
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 8, 2024 at 7:05=E2=80=AFPM Ville Syrjala
<ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Allow rcar-du to be built with COMPILE_TEST=3Dy for greater
> coverage. Builds fine on x86/x86_64 at least.

Also on rv64 and m68k.

> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: linux-renesas-soc@vger.kernel.org
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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


Return-Path: <linux-renesas-soc+bounces-11535-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D7F9F6734
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 14:25:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59A411898ECE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 13:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 143FF1A23B5;
	Wed, 18 Dec 2024 13:20:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01885199EA1;
	Wed, 18 Dec 2024 13:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734528054; cv=none; b=Adw5ZhNZoH+h66kiYf7g09CM4sInNwvtkAIu86DPxLWxyG/yh6+9EmX7QpBtHTaZ5fIYyedFJrbNdWvATnjNUVg5mpJI2bjyxczewpjM+IXhCYLdjm7qgc2GYzZmYX8aABVaCyt2nZhUjRb6ly1JHfaBICvlFTFi1bNbds72wFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734528054; c=relaxed/simple;
	bh=a1BSUEs893iycCGCB6jFeEd+6ZJhybg7WEIrX8ZX9gM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q7CUXOC5M5vDY6C+BZTLS4a7rnZjnyxZ4gCucI2/L2PmcvuVM7J+38YgbBtX9KFkmNaQvFipZw1riF8oU/Vhxjcp3G5RQCJn3OQhj7+DKQsROFu93J96jTKRZTxGEfD+ZnabaxCUk+PG/AxZMqqF+nzoSPXigCbCoUhTswoX9fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4b1279ca1d2so1619593137.3;
        Wed, 18 Dec 2024 05:20:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734528050; x=1735132850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lpX91+xTuZGWxk6cD+WQRDjWTQ5kmN3Sw3Vj40Nz2VY=;
        b=EtUw2Z08AD5bK3h3gavbUn/g4B5+cJFYcK4fMkB/yGElnNvfvFeUXnVo1yEUfLSWPt
         zYLs6apu8DBVoq36Pyo+YPJ7/OAsdsyW2oyFqfZuCAkb6Eba2cXkKoS7H7wIpjonow2N
         eifyVuUUbPYf8oLyn3a+dLzN98zakfn7hpr3T2zWhyLRjfCkzO47UAzZrCVks38ul0LL
         pV2peGKpDwva0X4JaljrOGkTVBJhCxIxGmLRMH7mwYj5qPk6dZmHFDoS2l63pUPAJbv7
         LjnI8MazryxRzCMmUeDXaQB1TeB4TYJHJsK648xSaFhDfrv37vlIreGWYYUxdk4M035S
         5k5g==
X-Forwarded-Encrypted: i=1; AJvYcCU/1oj45ax5F3l1lyv+XlEPBWXQ5mABV9R2x5Ko+OgFBXcfFfRrRgUrj0SPISPlZLg7DMy3smhrauTA@vger.kernel.org, AJvYcCVfG8DbOaoIsp3EnTGeHGVgD7hZZiCq7cJERPl56B6XGo8MnZ/xIFjN/FpXkLEixyDsethrCt/i0Q33CXKinX5qhg4=@vger.kernel.org, AJvYcCWmMGNmJjI9x+yWgYqGEyObLEVVMSi50XSf0F5CAou9ohMOTS+ekyZrN8Xpv/cuLqJ8jJBFjyyR576k@vger.kernel.org, AJvYcCXT+RQNKwxQvDTGNJvvk+jPEalLz/RoCJXyOx/aHUsjsCXuvcGVoG1oKE5gAV4+njNZCxCTdAE26HQ9+hHn@vger.kernel.org
X-Gm-Message-State: AOJu0YygN0IpZPUwNKk9UbhZOaXkwATBRYAUuivkJG25Opx7f+389pEO
	thk7mzdE+U9pa4JnMNbNGbYcAMNF8KRso2zKn4HN6aSEE9itWQbdvGtsqrWj
X-Gm-Gg: ASbGncuzoXlSxiRakwrE3XogZ1Up6MK2gDTrhUlt+vPC9hBSDUMWOk+V/ZO4ixWP7UE
	3RocUbBg0JuyQhgpkMntAvCUOMVDU/JzfQT/dhnwYrXZ050WKvSvYeRdVrr5MXgsOw9+kEf8EJt
	TEAbNHCUTs/8fujKsPlXrd4RtWD84Gem+hD3A1cN9UORDiYW3D/G2+F/2AB+UQRploIR+Bigqmc
	A3HXBYPC88tTEK4wlJ64ZkfMBhImly8KiCPN2HlHeVCtJxFD0pnW0hdXfbuDDAVpE5LQqfumMJT
	/BWW2QWlR9d/RKTZZQo=
X-Google-Smtp-Source: AGHT+IG7eNYXC8PC1MN6BZeHP8GHqL9eHODlZzRlUcRwddG411g3ULIUWeoklMoNQ59CJdcTV6dN0Q==
X-Received: by 2002:a05:6102:570d:b0:4af:fa1b:d8f9 with SMTP id ada2fe7eead31-4b2ae7270b8mr2117697137.7.1734528050022;
        Wed, 18 Dec 2024 05:20:50 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-860ab6d5cdfsm1570335241.26.2024.12.18.05.20.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 05:20:49 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4b11a110e4eso1711531137.1;
        Wed, 18 Dec 2024 05:20:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVEDeQDfL9MRoS227Y6I7HGiLFalypqbziAj9IZWwrMwXt93a+IJ/kIhgjLEkzPhZ+W2moPitKryNslNOt6HChjB5Q=@vger.kernel.org, AJvYcCVsQYoTx+GecWfSOxje0azNI5Tq0QJp3E3vCE6Qm9QgiFvYc6KlRZsWR1Gd04lFEhXqfrsDCEvvz1Dv@vger.kernel.org, AJvYcCWUu5rj4GVxVsGkd4rJ7uhLdhLTE4rt2oA+QPuJs19a3ECuqyd+iZsgpOHgffqNf0AQO9wzaPKKh4nV@vger.kernel.org, AJvYcCWmH/hVpXnvs7HN/uEVUmNw93v4Lh6Y+l1EBgUwFP1RFlyiqAgkjwKGRqzckxXRQ+OtOc/S4TYbiAMG8zn8@vger.kernel.org
X-Received: by 2002:a05:6102:3ed4:b0:4b2:4836:cd82 with SMTP id
 ada2fe7eead31-4b2ae8152c1mr1747338137.22.1734528049393; Wed, 18 Dec 2024
 05:20:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241218-rcar-v4h-vspx-v2-0-c673647d96e1@ideasonboard.com> <20241218-rcar-v4h-vspx-v2-2-c673647d96e1@ideasonboard.com>
In-Reply-To: <20241218-rcar-v4h-vspx-v2-2-c673647d96e1@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Dec 2024 14:20:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVEc3YSFoCHnqNud0M6rAXurQ_w5qUuGvLb4rf4EtGo3g@mail.gmail.com>
Message-ID: <CAMuHMdVEc3YSFoCHnqNud0M6rAXurQ_w5qUuGvLb4rf4EtGo3g@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] arm64: dts: renesas: r8a779g0: Add FCPVX instances
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 10:06=E2=80=AFAM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
> Add device nodes for the FCPVX instances on R-Car V4H (R8A779G0) SoC.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>
> ---
> v1->v2:
> - Re-sort nodes by unit address

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


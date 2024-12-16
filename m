Return-Path: <linux-renesas-soc+bounces-11406-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A0A9F36A0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 17:53:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7DFF416C5D2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 16:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F9B820A5F0;
	Mon, 16 Dec 2024 16:45:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7448220A5D9;
	Mon, 16 Dec 2024 16:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734367548; cv=none; b=RUvcSaayfdeQ7WbbtHBe5hj30TRSiJgO8r8FAhhRmw/V5ACgUAf720h+lRS/NVocPmdsqklH2QisyPr4Mm/6wScN1B3a+Wtro/9NF1Nii4umMFkbbiSS3qPmjEUuBQ2d6NqrQqegPeqr04um7k/oOAURH9tgdFf/jMhraDRqbCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734367548; c=relaxed/simple;
	bh=wupn5RghvaCMM1AQJDqyyyEqxp6FlOV5WF2P12Ec3kU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mLACd55lbMfSL1fcrV85MrFXQgMAZVu3950M7D1il/3hv6TzAj/7JfeIgQ6yXpLcsAJ5B9TJP6Ea2JOI0FgJVAYhEYHQOd+STiWlbz0exgGPqPZ80c1FO+BW8QHcB2Hura5tLV1VBdumR2VVLWMg9Gxc0k+ghx/cDclHnYCDeWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4b11a11a4f0so1184556137.3;
        Mon, 16 Dec 2024 08:45:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734367545; x=1734972345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R8cR1uQKQYcj8k4ZAOfO1iFYHNTOWb9GeDkVHxNKWSI=;
        b=vMpm37GVeiu+cumh3La+MfjxMhZ9UB8WE0JPyF3DxmbubmfkxuvrX6E04INC5NBRBo
         o+ug8ATgUIde4bQoiFxjEQTwYIOmrL9Er8b3BqUIcUnngXxoz1vd7W2eeQnmCM+w+Y/+
         /Zao/0HhuRiEcD7IHTcMIH146AHRJHNTOQ9fN5p40rGhstDK/mapP7406WpcDBqNQ7En
         +CHCLI+gx78dNaGz6wG8G6Fzmxa1f8NI9bY0Y31TwAmgPC7nQ08qN56QWG/EeAHaxv+f
         rmunFY9+N4OhFiY20YnX+4pQPGp6BvmGngHDnkia0PTegghbKXMu00N7WzKkN7mBMG5U
         87Rg==
X-Forwarded-Encrypted: i=1; AJvYcCVS22+vF1ns8nNmicaZ3oJ6BCUVfSSNNMN+ws3JHJZ9WsAx7LEIS5qoZ4U3sapLu07DbDz4we003jECOs3Bl6TO0Tg=@vger.kernel.org, AJvYcCXL2sTR/SpxcrdMF95kWGXBJFEmu3YmiFL7tqq29EAhWJylQ+nd7fj7XuT0L907ZhXjYbmGHvtCCJ3l@vger.kernel.org
X-Gm-Message-State: AOJu0Yx97kIJ5Ap6+QRVjAp4thx0SQ+4F6sq+9DpWMxMuAn6doFag3/R
	MCNvuhpT6Tsgg8ewof7mjbpG2HI/hE+QX1jpujYWVOxPatOyZPmfLELTtFMW
X-Gm-Gg: ASbGncs038+1O1EUiB9Wwh84u8K6H4yS6YUyfhZ93MjuB1PSo8r2uxrLdpwFmLegNRF
	0n87+bKx0jp9tedLQWr4ML4FK+Ai7B7jwje5HJEMe5Go5k0HjpzET2Y5GQXAd2cPPM8QHhe6Hoj
	5T9LOyk0JYdhIxyuDNMHNY+mKu6peM0vexKU/oLSem7Nxdg+AAIoS8V8Fw5tHfDT/lCxYhiOaZT
	rRx5bEdphuFmGetQa5vzFPeS2dFcUhD1a/nP5kEhufoUZwyFwEfS3sZmVPdL7tyvnjW6Kit+ns9
	KQvrv3JxlHqcs2JEwlM=
X-Google-Smtp-Source: AGHT+IHgiPLzlydlXPzSecMzxW/uvwFHJfn+L0gRXk3KvQQdv4L9DfgLYvP4Rb2U4LgToszB2mes5g==
X-Received: by 2002:a05:6102:4190:b0:4b1:ed1:56ac with SMTP id ada2fe7eead31-4b25d9a6ce3mr12856063137.12.1734367543665;
        Mon, 16 Dec 2024 08:45:43 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b270233610sm850792137.10.2024.12.16.08.45.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 08:45:43 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4afd56903b7so1070922137.1;
        Mon, 16 Dec 2024 08:45:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU+dEySsH39ZUzWxbEGxk1GSjb8Xe/efqX25wf6KaITQuZv5WnizF//SYXZoo+XEHD86H0/u7u5rrww@vger.kernel.org, AJvYcCWfwldSyEjx0u+5Z1FOSD1YM5fRENwoq+8HHuAHj2oxPvx/46ffzE6G7a0IZEMFUKA4f2PI4nvI+bSvs2eln63xle8=@vger.kernel.org
X-Received: by 2002:a05:6102:2b99:b0:4b0:ccec:c9de with SMTP id
 ada2fe7eead31-4b25db5fa81mr14302689137.24.1734367543057; Mon, 16 Dec 2024
 08:45:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216120029.143944-1-biju.das.jz@bp.renesas.com> <20241216120029.143944-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241216120029.143944-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Dec 2024 17:45:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX_qSA7d4MuZNn8ku4i8qVzRWG2zLzqr4ESw98m6NUd+A@mail.gmail.com>
Message-ID: <CAMuHMdX_qSA7d4MuZNn8ku4i8qVzRWG2zLzqr4ESw98m6NUd+A@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: r9a09g047: Add I2C nodes
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 1:00=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Add I2C{0..8} nodes to RZ/G3E (R9A09G047) SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.14.

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


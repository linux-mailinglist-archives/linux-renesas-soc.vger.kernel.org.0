Return-Path: <linux-renesas-soc+bounces-9191-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8467498A702
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2024 16:29:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B66FE1C21B37
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2024 14:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7F32191F9B;
	Mon, 30 Sep 2024 14:29:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED001917C9;
	Mon, 30 Sep 2024 14:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727706565; cv=none; b=bMiDoM2Jy4BLI6eYMXGwUFSgRZ0PkYyUd2frltYqeLEcHvOotgi44FuQ9i0Pgui9220CVuvH3jR/uxX8W9s/07gyTFyCjnh1LeLszaQOb+TDiWZXzG0f2H9xbV6nlXYPOUGsrrDnQe8XvuO3pthfjCD76PcZTLURJAWgM4yQb9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727706565; c=relaxed/simple;
	bh=pSxg5psWEc8WD0Y94p7YVi6Bnjlh155i3Ldy4y2SwG0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YMQTWbcNe8BN5CFZDCJROEEqrJPgdJ3542e+zmUTYpQlY7FIaBU8O+2yX+oWIaoYeCSTcxSwBC2roKL/m7FtUSTG9CqBt8WCaWwSCiZNq2G7dZOkuY8FNWjJWcHeys+cYndJU1lgmkTzcrSqal6G/7xCZqZTAEmZqTHN3wo39+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6e25f3748e0so14247087b3.0;
        Mon, 30 Sep 2024 07:29:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727706563; x=1728311363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DUCaYTeMSf6u72o5URXRuUhpyz51/hLyw6HAXqDwvHI=;
        b=FAFIcN+o6j7EQ6sCNH272JGDAi4xBGrAm0M+TrfInbOWimR0mGdFfqs5OaxChBS0tm
         qWURyzcMN0MJvnhcGPOc3JmpGJy1NCk1b/RqpvWIobJNVBPXpWQkJ/l1wnyvNbDo/Gxx
         eSBt3IeWo/+q2C2sK2auXlIqEwYFbJnGVWYyTxOoeoHW5OiQm/0OvvN+MbryhNZaHkh7
         sxfqfP+dIWX2hUzCFK+61qO9VIOZsOrOdouKsOqMfTZJyCHZp8FXjASmAkEHZHtAqYQi
         sbULBRzeOfSVjWICORCRaspzhjna2+MbKhLM6JFnCfq/Ww6mI8SNwg4PhA9XzxEG9cZk
         tL2A==
X-Forwarded-Encrypted: i=1; AJvYcCWMEo68/wpZIyPmXaylkQK9zAAooso74NL1oVFw+ARjucOC7dcSfGOFEP+xP1xMcnUKEIc3o3TCdxgx@vger.kernel.org
X-Gm-Message-State: AOJu0YyDUaAMW+rPcm3y8yYwrgYDUUp9i4m/19X2xwhOvSe/p+Ov5Fw2
	n1WqGeCbBAiD01ZCdenB0YcAIFvXcYrGBHzDJmJ2c2B/SlST9vJyHDSQ+Q+j
X-Google-Smtp-Source: AGHT+IEvZt8I9LDFK7pUA4vs0L3MjvNqbPzNuIWAMM/2k/mFq5/EZODpSncR/d3HWZmS0AVknsuiMw==
X-Received: by 2002:a05:690c:638a:b0:6b1:3bf8:c161 with SMTP id 00721157ae682-6e247544fa8mr92827787b3.13.1727706562817;
        Mon, 30 Sep 2024 07:29:22 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e2454a1dc9sm13758517b3.142.2024.09.30.07.29.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 07:29:22 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6c3f1939d12so35882577b3.2;
        Mon, 30 Sep 2024 07:29:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV+phcma0k0lUqhjiDbbrjBlylbDIuLavn/742geeSExkt3Vc86gLDiRfge51OfIX/RimHJD2R2LFMq@vger.kernel.org
X-Received: by 2002:a05:690c:6c8c:b0:6dd:c851:2940 with SMTP id
 00721157ae682-6e247544ea2mr96173747b3.11.1727706561812; Mon, 30 Sep 2024
 07:29:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240927095414.10241-6-wsa+renesas@sang-engineering.com> <20240927095414.10241-8-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240927095414.10241-8-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Sep 2024 16:29:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUMGm2nbwC-8Z3yw365PPeDf1eB5Lc6zLVoZ7GauT_R_A@mail.gmail.com>
Message-ID: <CAMuHMdUMGm2nbwC-8Z3yw365PPeDf1eB5Lc6zLVoZ7GauT_R_A@mail.gmail.com>
Subject: Re: [PATCH 2/4] ARM: dts: renesas: genmai: use interrupts-extended
 for gpio-keys
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Fri, Sep 27, 2024 at 11:54=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Use the more concise interrupts-extended property to fully describe the
> interrupt.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
> +++ b/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
> @@ -67,8 +67,7 @@ keyboard {
>
>                 key-1 {
>                         /* JP3 must be set to 1-2 (default) */
> -                       interrupt-parent =3D <&irqc>;
> -                       interrupts =3D <6 IRQ_TYPE_EDGE_BOTH>;
> +                       interrupts-extended =3D <&irqc 6 IRQ_TYPE_EDGE_BO=
TH>;
>                         linux,code =3D <KEY_1>;
>                         label =3D "SW6,SW7";
>                         wakeup-source;

Given the changed code was introduced only very recently, I will fold this
into "ARM: dts: renesas: genmai: Define keyboard switch".

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


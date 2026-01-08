Return-Path: <linux-renesas-soc+bounces-26426-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F10D03092
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 14:30:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0D4A23023506
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 13:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D1253FB572;
	Thu,  8 Jan 2026 13:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D/uvnkbf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6E23B9602
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 13:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767878852; cv=none; b=Ao6ve5uoCWWMedQTWmp4oztQidaG8xKl0dD6UncKK1UK3HfG4b6YGfsYY6tg6LmVbb1ETH0ubcwAHZqIt1tBDvNaeGHx0dNhwnpTpuIMnLIcqQHyBcaAjd4ZeuQpyfs9NgYj6mWltOiXYxcgGVK+DFSVsRgVFDNLidrvjesSrl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767878852; c=relaxed/simple;
	bh=CzgFGKs6HS/zf0Y+XJiMsF0ZMAFz2xG9sHuo34e/vss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j43myp2OhXUPhSqeJMPbLBBur2KuqZCHgx+YUzCzCIP+cs3brw4G2Xz+5q1nAG3/6VDHhZmqM4RK3RUqjEyN9QI0Jrc0MxPGr+9X+3f4iCHryU7EHy3oPJmRoPhjtjIJOiwDrAgAcKT3TuEkYW0wAZQv0e9Tl85WMSAbR7fdru4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D/uvnkbf; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42fbc305882so1644152f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 05:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767878848; x=1768483648; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qrDwI8d1XgXdXIPyff9BEM4755izxCfosEt2rtEy3EU=;
        b=D/uvnkbf77VF1hFQIeyFuaYJue7W9V2lYrPPvEW/0ySyWIzcFJTLU/4fxZTYu6XA+g
         Mz4HBYOHjpX1WGhiS9qoWAewsuPng+Ka295S3+ZqS+X0a2YyKv3z8mv0TBpm8al6SepI
         C8nrLckNsealW7IV/H7H93g+4hgp39+YPRiMWDw3q1Wiqspeo7OsbdqtDMRGYa+ylvGS
         y2zEmXQAUVN9/1N/cxAgdokMQ3Hb5RG8jAC4TIcUxF6HRW9GffGQQBBCmL4PSSd0/Q/y
         aLcdjEamhfgL3UHCDEzNQhM7gdu0VVBQKbTtR+twbXL8iiLQw+4erXh+UoUyLlZe35Wr
         LCdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767878848; x=1768483648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qrDwI8d1XgXdXIPyff9BEM4755izxCfosEt2rtEy3EU=;
        b=HJGaj0ky2ts/zR2BkNWndxS6vBZWhfgtfZAgorlKpe+4k15cbZWWi0Csb1MR1tvV3I
         Fnkp50jry4gV0HfFnSItbF7FauIOMde7h+gBf0x8m+fYia1pOAB/4YYcahDUlAR0aKY4
         U6OBK1/LPejy78yULvJkg2Yth0Ohfsa5oxLstOU6kL08m6GSdngOXC+nhUWPSwNHoxt7
         1+xW8m9vYcP61/ApR5HIxXLsYDpwPEaKjAxv1nW9cWv4uYjuhJ89ZrNHa0CQvClBSdnR
         a55PY0K3HbIwQ8RLIKXCzfdX5jk+sfSIY3sTgM/T8slnsIOPvtv1qPFQPRMghIxgjzwA
         mOpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdSRpoODw8hl3MAKXfNaoEyryLsv79DkatHl3RoG7mg5BtIYTT/+3ht3kK3f8bZx9MGwZ4Kv4gIQ4GdQHRAKpCXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfWmKmwvybJJ1qoAYv8wEBUTyfXfqytVCuud9A6mt0fvGDNDYP
	L3hiWTEr0z5r6LTroit+iU3PcD1LqfQqq2IJnWmc7wweOmy0OQEk8Lwd8RaSk6w/L9CHyVg1COX
	Ke5D7Oi8g4JxyRwJ4tbgG/czPcS40eHg=
X-Gm-Gg: AY/fxX6EvHhNGtts9geXfGGRL6y52J9NBiEMSuaikUzTc6pHbmU0MWs72N5JWeYZqnL
	3rCBpwGtv1Mi2HVQAzbm46fb9mwS4RkRsM+KBU7zuWdz29vz2qpexC+DsYR/NF46HBu6XJpjY7l
	HkRwWr8eNsbmb6ynXzaWGMoYHEE0ZleaJVe5ISF0shAhX34HOulVAM2GmMXCBzLdiZ+21PlCW0D
	ptrPdIGDddnPsWn/Advcp1rsuRNCaEwiykx7BAeKpasSah+hVQa5NrryFHwsYYySws+UgG9weCt
	GJ1T8VjR0oqulvujv0vOVjfX++dF3BPuW587GOfDuB5eUvxRPXYRK/lJp3VhRB4L4yGpe7HqURl
	RQIu/2pcU5U/0/Q==
X-Google-Smtp-Source: AGHT+IHZNMPZoabAevWagghi/XxqV/1z4IYucnFW0BxW4DQVfZky9VEvN5CnFse6qxelLN61y98xL3oRSsimunAyf7U=
X-Received: by 2002:a5d:64e6:0:b0:432:851d:3676 with SMTP id
 ffacd0b85a97d-432c3774267mr8110940f8f.57.1767878847545; Thu, 08 Jan 2026
 05:27:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222164238.156985-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251222164238.156985-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWCskceV-qQiUsPtzy8U_c-rsoFzUHfm3fsrq3CkXtg_A@mail.gmail.com>
In-Reply-To: <CAMuHMdWCskceV-qQiUsPtzy8U_c-rsoFzUHfm3fsrq3CkXtg_A@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 8 Jan 2026 13:27:01 +0000
X-Gm-Features: AQt7F2pxFnzsh-4XES-ACA8O6vgHcTncNbVwqui2BozboXpV_b2KnbqYFWLVhL4
Message-ID: <CA+V-a8t65AcFO4QTyGHxy+17aNEOxHeMuDsE13hrfCbxvr-SQw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g056: Add RSCI nodes
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Thu, Jan 8, 2026 at 1:04=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> On Mon, 22 Dec 2025 at 17:42, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add RSCI nodes to RZ/V2N ("R9A09G056") SoC DTSI.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v6.20.
>
> > ---
> >  arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 220 +++++++++++++++++++++
> >  1 file changed, 220 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/bo=
ot/dts/renesas/r9a09g056.dtsi
> > index 5740f04a6222..35cd6b70856e 100644
> > --- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
> > @@ -922,6 +922,226 @@ i2c8: i2c@11c01000 {
> >                         status =3D "disabled";
> >                 };
> >
> > +               rsci0: serial@12800c00 {
>
> I will move these up (between rspi2 and i2c0) while applying, to
> preserve sort order (by unit address, but grouped per type).
>
Thank you for taking care of it (and also for patch 2/2).

Cheers,
Prabhakar


Return-Path: <linux-renesas-soc+bounces-17771-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05445ACAAA9
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Jun 2025 10:36:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA708179255
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Jun 2025 08:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EFDF1B0421;
	Mon,  2 Jun 2025 08:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ql6VNaH+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486581474DA;
	Mon,  2 Jun 2025 08:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748853370; cv=none; b=n0i8B0AtPHkFiTyWunH5InPFT8PI21+mDhLpFASeMA9Qi1GKYRGcAnqT2MSQ7o4vK6K2i5fPMlUgn9SRg3UgMSpOfWt9f4+asNID4PjhN7mIyHNDhJ0Ql23pjW70obxAnYg7jskswpHJgca9wXr+iwDvnbmDWaM80LUfEAbaCGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748853370; c=relaxed/simple;
	bh=ReE2S4t4eNnXYC4QcPdCyI65wJEE6x8E+xUxw2N25lk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uhuaBVt1cftExv2UZLFUYFPzYI+u/v932PBHz7uR60iGKOxDE1Y+DmNqSRke1J3RQ7QuAw8y0Kr2uijQ900fQ3d3UDtCzCrXo/UzdTWrnkFno1c3lE/2XMd/T2eJwBVmJdlDXSSnjfHTC8X7TGyzmXef9jZOSCbOw2mjpfFj+0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ql6VNaH+; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-451d7b50815so7250085e9.2;
        Mon, 02 Jun 2025 01:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748853366; x=1749458166; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ReE2S4t4eNnXYC4QcPdCyI65wJEE6x8E+xUxw2N25lk=;
        b=Ql6VNaH+d2JFXP/02fFFFZSstTTwnw1PDQgzTaFpSTu9brJhFTn364UwaOtHELSRPa
         4VQD9LxOMgPU2m+sA95YOmKMnoJ2aVqaj+LeOS5H+C08X1W9u2dZje6LrKP0gHIA603k
         D/V0KcQQjzn3ROxlHdhypRDSklwpEfBxUB8YR30yQO0KCPnirTVjbp7XMHny0Bd21dbv
         cifzAI5asKBe6Um7Irw6H2Fvd7wLhF19ZnHW5KzLsYKEBWAhATWqzX+EExMlKWFjCdZE
         V6HJYfKBbHPX6jV6CDJtT1MXUT+kXjPh6SoGLw71sifS8NCLNrRS84wiMMICB7G10Fvt
         ZnFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748853366; x=1749458166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ReE2S4t4eNnXYC4QcPdCyI65wJEE6x8E+xUxw2N25lk=;
        b=DX1/SRF7v6bWsw1bnDk1shQ5Co2fznD54CLvbxmwrs9IWRy4mQpFPy9Jg9cCyRvc1y
         kFP1NjAdKmK6/MCLP9bJPy6CpGdizOVQtytBLof283uMWU31E+d1zgmriRO1dnvEA5dR
         qcrf8RaPdSuWeGG6SSeIQpO2b+TAE64eG5pIe30C9guOoqFxmIEd0LvOIiY2RQvGhvD+
         smBrniGFBmw24nuNoDvi0OuEb62ynETJx1i0IBJlSzl+nWWnVDqbYjA6WGahdV3TJDRU
         Mlqiwdpt6kqJtOPlm4fO7JvxygDHLKADXn2usQ/r8MnxDvxhKpatIN0iJUqz9rTfedB6
         Ovfw==
X-Forwarded-Encrypted: i=1; AJvYcCURXgUIPm8YD5BFZac9bFAlAYIzRfwuYAb0kKlY0fPG8gkKp4B3n5y8ZiFGXogKOl9If6iVTYNoqVbp@vger.kernel.org, AJvYcCVd9aE8VOyICsJUAXKyzbl/VF6QgvOG9I/JfPWsLX6Umf0TUIgDKies7QrxYR7fxMOZvhJTnZLs6olMRMNFXuKO5mQ=@vger.kernel.org, AJvYcCXa1lIa+ueR61eQCC3oRxxlnoyy8LzJVKh/IPhmUPd1sLAZq8mwcRsgBlkbmCsd8ceHJOGb4uQoWPhm4k9U@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8B+mSMtWvNDeeImki/T8Fj2fkH1d+nH8+ZeUkyQXtVKGuQhyB
	eqJleH4Wgcbll/Dv3AOYXa+Ne5M/kitZLEjComVDDxjAsDFd+0ZEbG9CcxPp8X7RQiKSs2VlqCD
	cIDeWXFnKG26ilLYwUrftBv+072jk6Ac=
X-Gm-Gg: ASbGncvGVQx8dTZ8kRmtNGQtvm+jUXJqhlAiZoHAnDyNTjiTwwftopBaGiyeMyVN9UV
	lm2L6EE1tsSY+h2bz6tLHzYKCZ18qQk3SGgj/Db6wdNHMIHS8YewDGiGUEg9lqTZgX19zjEdwgb
	gEQZwmW7gSW/p3MxYimp9cyZLgFIvAu4RDQ19P+bi4yd0t2FmZMmukxeT/H4NSSsvDDg==
X-Google-Smtp-Source: AGHT+IG69W12ZGCu5Ibciyi2Few70A36JIuKBZMWYr79JALU3NtHlWhrRdJTCqzf2SQLeYSHqe3MtZ5/V8bjZkDa+Eg=
X-Received: by 2002:a05:600c:1553:b0:442:f482:c42d with SMTP id
 5b1f17b1804b1-450d884316fmr106851685e9.9.1748853366163; Mon, 02 Jun 2025
 01:36:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530165906.411144-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250530165906.411144-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <TY3PR01MB11346CF2602E4EE4E85657C868660A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346CF2602E4EE4E85657C868660A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 2 Jun 2025 09:35:40 +0100
X-Gm-Features: AX0GCFsFXa2JOBjYEpsHfPlVUmvrmRBndrkCsSDYAoOZHvKxkEjaIaPstCsLrCA
Message-ID: <CA+V-a8tXt+ky-gSPN-mthkj2rcX4q86QbF_Bm409_rSAmdsYgg@mail.gmail.com>
Subject: Re: [PATCH v6 01/12] dt-bindings: display: renesas,rzg2l-du: Add
 support for RZ/V2H(P) SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 31, 2025 at 7:35=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Hi Prabhakar,
>
> > -----Original Message-----
> > From: Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 30 May 2025 17:59
> > Subject: [PATCH v6 01/12] dt-bindings: display: renesas,rzg2l-du: Add s=
upport for RZ/V2H(P) SoC
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The DU block on the RZ/V2H(P) SoC is identical to the one found on the =
RZ/G2L SoC. However, it only
> > supports the DSI interface, whereas the RZ/G2L supports both DSI and DP=
I interfaces.
> >
> > Due to this difference, a SoC-specific compatible string 'renesas,r9a09=
g057-du' is added for the
> > RZ/V2H(P) SoC.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
>
> This patch is already applied in drm-misc-next [1]
> [1] https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3Ded6a6d63513ee5=
199841c0a0dc2772ad944e63ee
>
Thanks Biju.

Cheers,
Prabhakar


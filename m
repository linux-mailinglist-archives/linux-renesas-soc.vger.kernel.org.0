Return-Path: <linux-renesas-soc+bounces-16637-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A47AA712B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 14:05:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26BDA3AFA60
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 12:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 254F9248F55;
	Fri,  2 May 2025 12:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fBJES5Yl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E80722A7E2;
	Fri,  2 May 2025 12:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746187504; cv=none; b=f/giPRIYlZRay/wex4ZI3lIDbbR21Qw6T+8WI7C4IvLPGWGJrpHvemQ2+0wq34iaqy8IObwj3oOT3OjLf69c8AeRo7Z2k0kQu88ItEcUXtWzZhmrh+pltlc63kyN+HQjvoqyalq8ac6aA91WGV39nAbQQQSEuaLAilgL7ENue1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746187504; c=relaxed/simple;
	bh=/zQuV9t7KLyl7C+XtlriiAZKTFDvqkK/Ub5Q1h2TXFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f6EpJ+wLBYnoqY1/LHjZt8PR3gn3vVzxRaTk0EenAFyfL2unSYP9RXOH+DPXThP77b3uKoB+Y2oF1kZ1Nk4vtL/ZwBlGDWUGIRxGzD4EagKJD06o5sWmkwhFdbFRWgyVAI/NuRsD1rOBmt75s10QI+fyX14qaKS27WmDhY7Ut+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fBJES5Yl; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39ee651e419so878474f8f.3;
        Fri, 02 May 2025 05:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746187500; x=1746792300; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yUHgqJ+LWoH5VY4W/85GH/C6KSeka4dwhIk1e2DuRQc=;
        b=fBJES5YlyDBOizea7tAmC83jW9CC+RIjbgmTMLWWq8qfMkbVF7Vufn8hCfhEyPlgVt
         zWbn5e5SXnTVIuVDC0e7nB4ZaRvAFgCpFO4yo6bk7b6DNXvdyNyWom1S6pX0Q+EVSquD
         S5/9kUP75KJYMoIYNkoIu9MZd13HAXQOi18siHpZX+aWzdU1QeLdzXXBAsBhr5UljLWd
         EaqmIAxO9a+i3ou/gUCwaUOq7Ql/sbqg458NiE1LUkk1ki4aBebYTvVJeIodcIImvcQw
         D4/bKnUDYGbUE65jsihgwEyVDRehNFKhLycDnQM+DouBO2RQtOJL1cDMCWOoqzL/KvfT
         +uXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746187500; x=1746792300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yUHgqJ+LWoH5VY4W/85GH/C6KSeka4dwhIk1e2DuRQc=;
        b=JryOXv5SuWnGe2VBDC0tjDetAQ2MNVMnqThPalCx9bEGvSwilme7UMoIaQ3O6vIgWJ
         8PMvoJtT/U1GfogSKepqfiIBOSGoJ9SK4yK2bwxJgY0WaU6+ECrDlVGDaTCWSAd1L/cs
         5SszYx4Zyv8p1mJRoQJGQroA/JPnRC9DJsJ/Hzztu4HBExkIayBfB259w+W+K/rDhFA6
         L6Kisz2kMXJKdI+7Rk39bHsSHhl4Rl/d0/usPIgJ2335CFcWx/NdcTxGkyip/18E+fLH
         bFyrnIs5IksIca83+d8Vf1otKp56CyYR1YuTM+xjyr0qcbvDkzL/wV1SM/0/paVclCQl
         Lwyg==
X-Forwarded-Encrypted: i=1; AJvYcCU9eacmpFkmOVXAeDHh1qckMdgRznkSySvH/N5OeBH04IrTcKv75pEc+FBqcJ8IYzXq7amzx7G6kREpkKRI@vger.kernel.org, AJvYcCVjpGmSLOF6P/5mFGgkNnv2a7GMUbVRvd/T5pECwOF5sc9HJPSCZlUhPp95td7iFNY5sT8J1bP3qmjK35paJISf1N8=@vger.kernel.org, AJvYcCXzgGC/X0GyM3+X5hbAuXh+ZSNx3TlN1gsBayPUI+wXTowYKCDxc8dYUBxOwsON8Ncm8yJlJGUc6Sw3@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa115+voEQfXA2lQyC2Qy4XYiAxxFMuZuMYxjz4ilvovkrLE1n
	0xHtaxEov2rSqwf/19E0pxW7VgLQXW1JFxrhd2Gv5H6VNUnEgScA4vOCiV966qgpTi9JtXeNrE4
	Is8OZbDQvr5PS0psJroegPd210iU=
X-Gm-Gg: ASbGncvHDYT0y7vNuFdzEklz+2OV6DPPaDAX5ztwcQHGdLvIFv1zoquRKFVMT2O/CPP
	aJFfF4HhW3CSZVLjzaPz8OdFkao3fE/Nq8+ppJreb/ZhcCWjFbLVyx2wMp1rKjKxyc+kmJBxLDH
	Sx0bVF65OTxN8G16aOUn8vZBY=
X-Google-Smtp-Source: AGHT+IE2auQ0A0KtW0kC0aKhecu39LBRzglwU/tszC76jWTDR1QoRecH0YXD3lt5QVn7PkCmCVH0kYqvGLkyQT+mm2U=
X-Received: by 2002:a05:6000:40db:b0:39f:efb:c2f6 with SMTP id
 ffacd0b85a97d-3a099adcb13mr1822546f8f.33.1746187500433; Fri, 02 May 2025
 05:05:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501123709.56513-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250501123709.56513-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVjCE5-X3AmDy1=UHGPb7kmi_kpBX79s1t0g76-__sc6Q@mail.gmail.com>
In-Reply-To: <CAMuHMdVjCE5-X3AmDy1=UHGPb7kmi_kpBX79s1t0g76-__sc6Q@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 2 May 2025 13:04:34 +0100
X-Gm-Features: ATxdqUH_j2VzsE9tT_fM4FFgrG85qJiCrbTtjzlXZqZhUf9hahZQD7LXclNR2aQ
Message-ID: <CA+V-a8s-+x1-OAJCbizOdW1ygtTYON6AybPg=e-x7M-AL+4F0A@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: timer: renesas,ostm: Document RZ/V2N
 (R9A09G056) support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Chris Brandt <chris.brandt@renesas.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Fri, May 2, 2025 at 12:53=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> On Thu, 1 May 2025 at 14:37, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Document support for the Renesas OS Timer (OSTM) found on the Renesas
> > RZ/V2N (R9A09G056) SoC. The OSTM IP on RZ/V2N is identical to that on
> > other RZ families, so no driver changes are required as `renesas,ostm`
> > will be used as fallback compatible.
> >
> > Also include RZ/V2N in the list of compatibles for which the `resets`
> > property is required.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> > --- a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
> > +++ b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
> > @@ -26,6 +26,7 @@ properties:
> >            - renesas,r9a07g043-ostm # RZ/G2UL and RZ/Five
> >            - renesas,r9a07g044-ostm # RZ/G2{L,LC}
> >            - renesas,r9a07g054-ostm # RZ/V2L
> > +          - renesas,r9a09g056-ostm # RZ/V2N
> >            - renesas,r9a09g057-ostm # RZ/V2H(P)
> >        - const: renesas,ostm        # Generic
> >
> > @@ -59,6 +60,7 @@ if:
> >            - renesas,r9a07g043-ostm
> >            - renesas,r9a07g044-ostm
> >            - renesas,r9a07g054-ostm
> > +          - renesas,r9a09g056-ostm
> >            - renesas,r9a09g057-ostm
>
> Looks like we have reached critical mass to invert the logic?
>
Agreed.

>     not:
>       contains:
>         - renesas,r7s72100-ostm
>         - renesas,r7s9210-ostm
>
> ?
>
OK, I will update it as above and send a v2.

Cheers,
Prabhakar


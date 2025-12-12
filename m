Return-Path: <linux-renesas-soc+bounces-25715-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5172ACB8BBA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Dec 2025 12:42:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E38BE302B137
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Dec 2025 11:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1012A31D726;
	Fri, 12 Dec 2025 11:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B7pCzHPK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E17A31197B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Dec 2025 11:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765539737; cv=none; b=iQ5sw+TWt5fW7GZjvP0WQ9iyEHq9bqS1HE5T6qB5GmSKHh/eCsft5J+GDudjEbu4s6uIIJ5GAV3Gi1pWX2azpRymcmBvjOa2jBPRS3olOhU3gFHOorH8UZEHI84XN5uMDQ3IIntIZfogWWgMtzzGKZ/1Yeyjb4oRWHvIwVIwdjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765539737; c=relaxed/simple;
	bh=Q5lXCdsnpFiBlImBw0foWBWrJ41BWMfPAkFZtfhVrH4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wdv/+G/3inTaf/Tiy7t7RbsYymd/N3F1BNkwUlEonDIba1FkaDHplQ5R56+g0VI3izD6brrpw3d1tPGShwZRY4pzUKTZbleySOyaORod8auCXcIfJREJj6xdPMOm3PtgECN4rt4nyvwunqFWfVLxkgK4c2n+FZK7i6ms0f13vMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B7pCzHPK; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso14457775e9.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Dec 2025 03:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765539733; x=1766144533; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SqSZrdF7jKLudHWaIP4Cuhl8OMfNTNFnO+QuvvYTlPQ=;
        b=B7pCzHPK3WCou9Lwjo7AAx+5QpEPh8ZL4ahBZYu3VCQyqKT0I3nJUemlCS32IokoJF
         9Odtr7nK8PT9huPw5SUrWRUgU7OPco2O5F+SEbPFEA+2DvuOiNTHT+JhhMwwOh1rMW0a
         HUKu87bKlnelG2QYMJ9xvM/rZFxdFMqILZ/Vci81/7sbR0TxuEUkIDAgIgy5tKstU3iX
         yVaZEgJJCcAkg5zrLFxL1YRgst0pnT1TE6JacYzgUS19CQIAY4gH1pMMa3j8Uemd34a+
         i431+b+8ubSPuF4fBf4ZrwipK6oRM0zBe5qvBX/+jGuQo0Vq84LFeUF/w2yYwDBWnkDX
         wVSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765539733; x=1766144533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SqSZrdF7jKLudHWaIP4Cuhl8OMfNTNFnO+QuvvYTlPQ=;
        b=abx5uZ1HQ4+L+k2C/v1CUBUr5Ft5QzMRG9qRl/6ANci3zxfseWOpb2o+gGwLnuRip4
         4/OmKH8AKuZSbDNEgWJclGx1NjlS8LCQPuzEZ7FzajaYh1t+ekMgVaazpvUiQBt+6LFQ
         F/vCHRWnD+uYknXjydoCnUSV40yFlM/nh2dQfbdB/nTBpfRRACDWuzBc+eAPQ/Q8uMA2
         dL/XqBzUgj1/GA1yNoPJCNX9dEBBTn5+qb0BwE1nOJN21qxY+zKi4wxzVgm6q7I2MyI7
         X4jGeuHyLy04LhNwfndGsbc1e3q2BFdVJdIlYOsS8JgI1oBSNQf3EcGw574+nOzkzFjI
         ESEg==
X-Forwarded-Encrypted: i=1; AJvYcCX8aL9ELOUODUNxR9Ioneu0kxMFgz1xn2D7EgyAUzfzjtNux15gahDrV0I5H8oiudBXZlyuUpsVIzqpu3qYqoUiRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWjyo2CCC9SJJEZVfSJyO8Zb2RL3nYgkAc0QZKt7Dj5WtyQWW5
	eqkOJDIf1/4Pa5PdnF6KHazLV5i0RlTg9u87OvsdgPHbfly1+FbnWKrtlTYl8EBowBgNlMw8oK6
	goD5sxGNQYqV331S+qS3rx7ihpnOH4aQ=
X-Gm-Gg: AY/fxX5cU3AfIA8SLJQ4W30weJ77/1JN4b6SblSw2+tvk7eYal/n5VycJt1KxivcoD9
	2eRiyv10Bc3I19Q+r/MX3NWBXpu1D8HkuDW2zvwOvYsLGd3PsnA9rw51VB6TfMXjV9SHovA/Uko
	K2X6mqxAJ3LIRgOYQ+ooqisy6QtsD3kxIdG6TfndZuze+SJd+CyxjqKqF6oTvJeSvBPkXScj7DG
	ZY0TQYXkh/RNK5tKMxT7JPAFfS8xdFWSoZQ+dJShT5pvj3wxpQq8RVx1TKqx78GFgTga2aALlKW
	dlX3vkdBFuM3qCxDSeCtv7Lcz2shiL7E60uIzg==
X-Google-Smtp-Source: AGHT+IGB6ZPeprIBn465w28lxcpG+FFyYAfospB99IhQBKnitIaifthTf3hB8ej0Epzg1+wB0r53roPeiiO7MzdMr4c=
X-Received: by 2002:a05:600c:450b:b0:46f:b327:ecfb with SMTP id
 5b1f17b1804b1-47a8f8be22bmr18376915e9.9.1765539733324; Fri, 12 Dec 2025
 03:42:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251127162447.320971-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251127162447.320971-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <176426377371.294874.17331116412829860585.robh@kernel.org> <87o6o4ebgn.ffs@tglx>
In-Reply-To: <87o6o4ebgn.ffs@tglx>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 12 Dec 2025 11:41:47 +0000
X-Gm-Features: AQt7F2rfQo6KTuZLs0_stvZL2VytvDba8D1c8Rke5WM0EXPG_Jjhav4f1icK94A
Message-ID: <CA+V-a8tzoS2EGHy0n66rtiCivSE7Ghir5bfgEVtr4fdYRt-ExA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: interrupt-controller:
 renesas,rzv2h-icu: Document RZ/V2N SoC
To: Thomas Gleixner <tglx@linutronix.de>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, devicetree@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Conor Dooley <conor+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Fri, Dec 12, 2025 at 1:27=E2=80=AFAM Thomas Gleixner <tglx@linutronix.de=
> wrote:
>
> On Thu, Nov 27 2025 at 11:16, Rob Herring wrote:
> > On Thu, 27 Nov 2025 16:24:46 +0000, Prabhakar wrote:
> >> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>
> >> Document the Interrupt Control Unit (ICU) used on the Renesas RZ/V2N S=
oC.
> >> Although the ICU closely matches the design found on the RZ/V2H(P) fam=
ily,
> >> it differs in its register layout, particularly in the reduced set of
> >> ECCRAM related registers. These variations require a distinct compatib=
le
> >> string so that software can correctly match and handle the RZ/V2N
> >> implementation.
> >>
> >> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >> ---
> >> v1->v2:
> >> - Dropped using RZ/V2H compatible as a fallback.
> >> ---
> >>  .../bindings/interrupt-controller/renesas,rzv2h-icu.yaml         | 1 =
+
> >>  1 file changed, 1 insertion(+)
> >>
> >
> > My bot found errors running 'make dt_binding_check' on your patch:
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings=
/slimbus/slimbus.example.dtb: slim@28080000 (qcom,slim-ngd-v1.5.0): 'audio-=
codec@1,0' does not match any of the regexes: '^pinctrl-[0-9]+$', '^slim@[0=
-9a-f]+$'
> >       from schema $id: http://devicetree.org/schemas/slimbus/qcom,slim-=
ngd.yaml
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings=
/slimbus/slimbus.example.dtb: slim@28080000 (qcom,slim-ngd-v1.5.0): #addres=
s-cells: 1 was expected
> >       from schema $id: http://devicetree.org/schemas/slimbus/qcom,slim-=
ngd.yaml
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings=
/slimbus/slimbus.example.dtb: slim@28080000 (qcom,slim-ngd-v1.5.0): 'dmas' =
is a required property
> >       from schema $id: http://devicetree.org/schemas/slimbus/qcom,slim-=
ngd.yaml
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings=
/slimbus/slimbus.example.dtb: slim@28080000 (qcom,slim-ngd-v1.5.0): 'dma-na=
mes' is a required property
> >       from schema $id: http://devicetree.org/schemas/slimbus/qcom,slim-=
ngd.yaml
> > Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /=
example-0/soc/thermal-sensor@c263000: failed to match any schema with compa=
tible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> > Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /=
example-0/soc/thermal-sensor@c263000: failed to match any schema with compa=
tible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> > Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /=
example-0/soc/thermal-sensor@c265000: failed to match any schema with compa=
tible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> > Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /=
example-0/soc/thermal-sensor@c265000: failed to match any schema with compa=
tible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
>
> Confused. How is the change in
>
>           bindings/interrupt-controller/renesas,rzv2h-icu.yaml
>
> related to the errors your bot found>
>
My understanding is that the bot printed out all the errors there were
present in the tree while running the validation.

Cheers,
Prabhakar


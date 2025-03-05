Return-Path: <linux-renesas-soc+bounces-14039-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7555A50DAF
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Mar 2025 22:37:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C18741757EA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Mar 2025 21:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AA18202F83;
	Wed,  5 Mar 2025 21:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UAv9NrNK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6E320011E;
	Wed,  5 Mar 2025 21:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741210544; cv=none; b=WMTbXJOfPkvflFlwVfRzUGN8xNl322B8b9b4GNsV/IoKo2e/Os1i9+kO/bt9m1vwatW8zueWfS2TAoS0iTSEhR0EDefXCgwrbQEFg6eVFZoqPpePUuliHPJA1A5MYVDlrJ3LecEOinYNf4Ao+dY9wh9hq5upizamaCUUXJWx5o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741210544; c=relaxed/simple;
	bh=LbyAsoOCuX9MkXJF7LarN8OmRMg41TTh2ni2G9R+2XI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l9nPEowWwOS7FAUrfBoQ+ebTtocXlx5Y45J2HVc6EH58ZKPtDWCiu/msMY0cZ4BLNEHPY3IETXEBucs59NQyQXm9Bs5SXJ3LGuQimgY/VQvB2zhW+hnHq+gDcFbnOEHMev0xZC87aVTScaGqtO0FCX26A2ye/4kAvoIgJlIee0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UAv9NrNK; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-523b7d9749eso1264334e0c.2;
        Wed, 05 Mar 2025 13:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741210540; x=1741815340; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1+VM6UwBdgJ3iABgZCtb00fc1fZZvevDlMU86jLfwI0=;
        b=UAv9NrNKxpCLxL/KewH3lLmcRC8DM7QNVhzgYOTEOOTNIg2GnGS4/6zR+cay2uDITi
         +xgjkex3fUP+FIscJFojS6RrtbVniAbqUKw1PcSzrv5un0zJYYD6ErJRea3LQH4fDaP+
         D3cUCD3u/mwX8027TQcWNUlR1K8Q0zWe74rojoOt/yD0bkAos1vF26mxrWerJzBY5qC5
         AZYGCohtV9zjJc3aadgdpoY5TUKygmqJPxtuaUCNfmOjgZhLv1+gOAj4B5wNB9biKhMe
         kkgfBq2/AHEXcCR7C2t5yRZlrHlf8XbbFk3ekKji+H5NDKT0r1Qd8q/Lpy3His5Vz6rG
         1y7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741210540; x=1741815340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1+VM6UwBdgJ3iABgZCtb00fc1fZZvevDlMU86jLfwI0=;
        b=V7JnoLL95knnprCqOpc8onoZVnVPeK8hptGKIQlcM/It9fqu42Da+hasu5n0fg6JVh
         RZWwhZuUgKqPfA/QK7Kkt6m8XFqEfdYivEcTaiTQDb92TqieAr1ROJF5wsxrun/WbqOC
         CfTY6evNZ3Vd6kp7zUtx1qOqY05JM6Co8dlYziYYZ2n90vBjViDTbKXDAMVLJ89sxJhe
         Fj6OsJZTNI34gun2Cb4mmZLiH4TTO5FKhGU/SYJj5YzLESaB+cL8UBLgYtx5c1ZoIXNK
         RmRA7LdxFPB3WdfJZuh5kJM6JSSr1qn9tk6eX2zq19XgwFAUO+1aOoll2lK/8tK4lCBv
         rbbA==
X-Forwarded-Encrypted: i=1; AJvYcCVLYZ5tjomigY+MyIgFulpwtTuj7w/wKMD5NHvUqsZyOiaEEGZpe60G26qyYZDAfqs7d+XoM6opRxvh@vger.kernel.org, AJvYcCVmf9PGdd7hXnAu81tokQimsfzsZS7tAdmDdBLz4U6cwWx6wCxzshJIq20yCTkL29b+L5zbrDIyQ+XBPkCl@vger.kernel.org, AJvYcCWvl3EfwRCZWW5xWv+jjfaMb/m9Dk7vUUk2mp/1PQ2XTbjZbgJXX7d5yegjsRpGnY8GArUg9PN8lg9OtZIVI2zhQWI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz872TiZjIzZPlCF84QELIuxibkraCRWHOgyy6J9E8pYS1jjOlg
	jEfpKG/T1Am4mikNwgiUhKT19uQdog+dCgUoOFTtb+lpKrsR6qNwum0DI4L1FrSbMVqL5SodNrv
	suq9ioOnq8cxur8S5OlNh64c8avQ=
X-Gm-Gg: ASbGncuZ8tla6NNa1u9oCrNImikeKbioMfHD3Kra1rVvOT1uOa2v5PKA3UAOgD2vvO6
	xRvHmsiHZCrAqzPNTwjMjzaRWXWflmBzSMabbC+77gFPYKzcKhVn7mLGX/FMa1eGnhyqLtoNJch
	mRuomAelsUgDahGcsZCFe96qQ335plOJSfBkfyxFIkCXYBWOiD3s1IjCB5
X-Google-Smtp-Source: AGHT+IHiGLhWN1mDXvC2JfCSqiQWp9pAGM2/KKGL7ptJ7CuBUz7iJSpQGrDSP6wJIP7Hjldsh6PjvWRCL8BaEoYLm7w=
X-Received: by 2002:a05:6102:b0c:b0:4c1:99bf:5c00 with SMTP id
 ada2fe7eead31-4c2e29c51dfmr3316009137.25.1741210540183; Wed, 05 Mar 2025
 13:35:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305123915.341589-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250305123915.341589-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250305-cesspool-headlock-4d28a2a1333e@spud>
In-Reply-To: <20250305-cesspool-headlock-4d28a2a1333e@spud>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 5 Mar 2025 21:35:13 +0000
X-Gm-Features: AQ5f1JpKzWredmmHodR_d4f9QSHGKO8I_i_AKgfKK5QUbeUWw6L30hHLZZNUVrQ
Message-ID: <CA+V-a8uQTL+SHYqVU_J0th4PT6YPF7q6ypzDu33nS_6onWLoOQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: reset: Document RZ/V2H(P) USB2PHY Control
To: Conor Dooley <conor@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor,

Thank you for the review.

On Wed, Mar 5, 2025 at 4:26=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:
>
> On Wed, Mar 05, 2025 at 12:39:13PM +0000, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add device tree binding document for the Renesas RZ/V2H(P) USB2PHY Cont=
rol
> > Device. It mainly controls reset and power down of the USB2.0 PHY (for
> > both host and function).
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  .../reset/renesas,rzv2h-usb2phy-ctrl.yaml     | 56 +++++++++++++++++++
> >  1 file changed, 56 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/reset/renesas,rzv=
2h-usb2phy-ctrl.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2=
phy-ctrl.yaml b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2p=
hy-ctrl.yaml
> > new file mode 100644
> > index 000000000000..ed156a1d3eb3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-ctr=
l.yaml
> > @@ -0,0 +1,56 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/reset/renesas,rzv2h-usb2phy-ctrl.ya=
ml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Renesas RZ/V2H(P) USB2PHY Control
> > +
> > +maintainers:
> > +  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > +
> > +description:
> > +  The RZ/V2H(P) USB2PHY Control mainly controls reset and power down o=
f the
> > +  USB2.0 PHY.
> > +
> > +properties:
> > +  compatible:
> > +    const: renesas,r9a09g057-usb2phy-ctrl  # RZ/V2H(P)
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  '#reset-cells':
> > +    const: 0
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - resets
> > +  - power-domains
> > +  - '#reset-cells'
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/renesas,r9a09g057-cpg.h>
> > +
> > +    usbphy-ctrl@15830000 {
>
> How come your nodename isn't "reset-controller"?
This is to keep consistency with the other similar IP blocks found on
Renesas SoCs [0].

[0] https://elixir.bootlin.com/linux/v6.14-rc5/source/Documentation/devicet=
ree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml#L66

> Otherwise,
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>
> > +        compatible =3D "renesas,r9a09g057-usb2phy-ctrl";
> > +        reg =3D <0x15830000 0x10000>;
> > +        clocks =3D <&cpg CPG_MOD 0xb6>;
> > +        resets =3D <&cpg 0xaf>;
> > +        power-domains =3D <&cpg>;
> > +        #reset-cells =3D <0>;
> > +    };
> > --
> > 2.43.0
> >

Cheers,
Prabhakar


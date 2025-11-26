Return-Path: <linux-renesas-soc+bounces-25165-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C9624C89B25
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 13:11:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 002753A33EA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 12:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 587483254BD;
	Wed, 26 Nov 2025 12:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4MyEpi+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A20126ED5F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 12:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764159070; cv=none; b=Jv2pDMvj+pHwmS3KhVNjqgR9iVgkyw6pc8QuQaRuG6ycPoMVVgtb8JS3HatiCRul6MHlHJc+DsAv2Fbx4otDU57Pv3r42LROEDb5A23vyllob+GlU35IEZvY+qN4oR9yFBxpNV82Pioy4Pn3fRORfih+lwNZhOUOGGTx70vYnns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764159070; c=relaxed/simple;
	bh=A/iiy+Fp1kAykWnlOzSoYnOlxAMMKyuoGr+9DwSiOQc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aMAE0JuoiAxhZ6ovrhjbr/f6W4p6tEYfAkbIgmoGcEqVrse00iEwqywiUukoNCQE2Yf3IRypaHnp0FA2pLb9ppRTrzfsovw1djpKz4mRyaog2wEY4lJ+R5LsL/TxrqlbCjM/BFbPvBUL0q3sJ/H7J392nDLv6HhzL8oxQOQYIvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h4MyEpi+; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4779a637712so40868755e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 04:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764159066; x=1764763866; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9jAY13IDhoBX88jeAJQmVezaHbYmh2Vhoc27H1l3dI=;
        b=h4MyEpi+vv0FHF59vvCj38TW7jfl/WBP2JXP2mc5I2THiluJX3BEoUXCo/pEVuDsJp
         geteYMBq0gNMmCfIt8k8we8SoZOZFTh83KpH802VDMPJg+jkmTMpaqDs557iEPgt5LWr
         kRuzDYkqa8b9iMGobNBsCUqj+ENyBBq7W6OLsr1EqpVYGZLDHTEMJlbYBk82d/q2Y667
         Mat7m8lK1S8xjY9PV63AEzdYg/f+nxHfIDWeCskeg0iZ3tgWhNMjB3uCbi6YZdD2KYir
         4YRdedf0KjqanKF1T2XlmblJ6Wu1VEkuKKc7+R2nECLwUIizkG1Uzt+tWGCRzzcQg3k8
         dkCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764159066; x=1764763866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z9jAY13IDhoBX88jeAJQmVezaHbYmh2Vhoc27H1l3dI=;
        b=L8GGcfyaaRhVhTpFVlAMpthK4Lc+a1BEDdko5LOHm71HhfuS4zFB0IUVmI4RYHnxZi
         FsNEnZOLjcpIin4cPt33CmsTA0+p90cKhIOKm7cNv+9x9hrOgiuV4Cor9WZbkVyReRo6
         HLO50nWVGJJZlewz6UOrD2Yfs58/G9zceFpMZITSwYpATY9/P70HlEAH+Gqq+bOy0Lhi
         bfcq/RyMSNv6DYsX9v9nA03oBSG3KZ5cxWj6AP0xBHh2liA8ykM1xL4MCawjW3/otDJ6
         6Rg/HmGzoS7FO+hOLCdw5mRzJrCNYgqtKYDgeCNDeoeuAq30pixol/ImkF5o/3NX/DZz
         twWg==
X-Forwarded-Encrypted: i=1; AJvYcCUVpnkDtc73FlilD/CqFbnkqrUPZGU46P7gYfakonRrSta8WMbogEfkBn0e+RyNgQbfnhl5ZK/FI/JX1aM/B5Dx4w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo/aamA/Rq411B7Yi+poudmaNeOZohoiLYm3mRv9J7Qj9ma5lj
	Yt18ENkpVcU36bUl7BAgs0RV+D9xhoS5nOzarz/wY6Levlsha+7+1zXVg//yrR4gJlxY8D5Rf5A
	NTLjk3KxohnQGgVlfpx6AuARGZYECdF0=
X-Gm-Gg: ASbGncvIdP9+E+C4QL9V8Y0WSs1bblBdsUp/FDVSNXiCmYzsooyVdWUr3yLmTwwvroD
	S59ZPtXE0BRX7PUBp/38FLdjLlvgCYnTCglIlmoERZPydVnty1hgcP/5zizpVpbBRWTTxZZM8yQ
	J5/oBG9Nb1fD7S9724H3d4ul1p3GV9pD7zIEDdCOrEISFFoBotnxTG54yIMw5wk2p2n9Bu9TdvU
	pnhVGwKFOmBcw8MNo+wPIZjI0UmxvLl28RhRBY6+YPG9jNev1WZCtp+99T1D6gwXjopDQycVNf8
	zCdquVUk
X-Google-Smtp-Source: AGHT+IHC636RCi1541Ptvl75RzMnsiTIVETO1sWQDjqj+JrAZ9vxfXHnCrioMKRVqEbU6FVYIm3EdyVyxe4JOxXwHlw=
X-Received: by 2002:a05:600c:154c:b0:477:7b16:5f88 with SMTP id
 5b1f17b1804b1-477c0165a5cmr180904235e9.6.1764159066280; Wed, 26 Nov 2025
 04:11:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125214529.276819-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXD3f3jN2F7c+yHmEb1C5Byc-e=sEXt_s=UpBQLv_F=Pg@mail.gmail.com>
In-Reply-To: <CAMuHMdXD3f3jN2F7c+yHmEb1C5Byc-e=sEXt_s=UpBQLv_F=Pg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 26 Nov 2025 12:10:38 +0000
X-Gm-Features: AWmQ_blZWyGSSPNsufLhVifRnEBMhm6m_dSKdeAvhR9B3oeWnomG5gtFBihklV8
Message-ID: <CA+V-a8vDzG3_CKUPRLmFv9Z3qjqcgAp8vhpBHkGs=EA3o3Zxkg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: spi: renesas,rzv2h-rspi: Document RZ/V2N SoC support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-spi@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Wed, Nov 26, 2025 at 11:38=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 25 Nov 2025 at 22:45, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Document the RSPI controller on the Renesas RZ/V2N SoC. The block is
> > compatible with the RSPI implementation found on the RZ/V2H(P) family.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml
> > +++ b/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml
> > @@ -12,6 +12,9 @@ maintainers:
> >  properties:
> >    compatible:
> >      oneOf:
> > +      - items:
> > +          - const: renesas,r9a09g056-rspi # RZ/V2N
> > +          - const: renesas,r9a09g057-rspi
>
> I am a bit intrigued too read that the initial value of the SPI
> Transfer FIFO Status Register indicates 4 empty stages on RZ/V2H,
> and 16 on RZ/V2N, while both variants have a 16-stage FIFO...
>
Both SoC variants report a value of 0x10 for the RSPIm_SPTFSR register.

Rev.1.20 for RZ/V2N mentions, 16-stage
Rev.1.30 for RZ/V2H mentions, 16-stage

> >        - enum:
>
> Please don't bury the enum between two items.  Put it at either the
> top or the bottom of the oneOf list.
>
Ok, I will fix that and send v2. The reason to do this was to keep it
sorted based on the SoC part number.


Cheers,
Prabhakar

> >            - renesas,r9a09g057-rspi # RZ/V2H(P)
> >            - renesas,r9a09g077-rspi # RZ/T2H
>
> For the content added:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds


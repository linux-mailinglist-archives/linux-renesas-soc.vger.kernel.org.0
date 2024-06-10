Return-Path: <linux-renesas-soc+bounces-5999-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C5D902101
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 13:59:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88E4C1F22455
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 11:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FF257FBA2;
	Mon, 10 Jun 2024 11:56:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CFD7E78E;
	Mon, 10 Jun 2024 11:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718020619; cv=none; b=J+0mSuzccZEm50tJZQMLO+mWJt3lPWAlR1F7WWUrmBEigkWrjn2QrX8qfqIO6lycD6s3ashdTS3CMvzWWi0cNwZeZdS+2s7ScBsUF23V0a1OC0t6Zrgn6Dk6XNKBPNAVykJhgAB9wSCl/V+TuDyi6lE1e84QcAzPJEymurqnkpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718020619; c=relaxed/simple;
	bh=yfvQPJysBAS5tq4DgyRk+/g0oNJiaAomBFVbp3DexF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IsFR+yg5GTgjzxuDAtTYzxHvRm9zJvaFJvnUMsPltOiMnNs3hk+h0CefruzsDUqlW/E2+sVKqaP1UOPG1ueCQqd5upmJWLWxz8hnwGMICO22XzbtWCS35HBBznCcJyZQf9J9fBhr60GxJDtmjIBwq5OfDBnQZP5v4gp+OIqEuss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dfab4375f94so4572884276.1;
        Mon, 10 Jun 2024 04:56:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718020615; x=1718625415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zcLA78389m9B5qQY2E8zkAEsIi5pEwW58EBR2IWm7wk=;
        b=pfZsvbwXFzRJYialU3AA1JB7Kf9f0h83MB4Mgy9/dI7gsvi+6FV5ban48/u9PT1yRa
         5iwzOTUTiiYRLyeIAwVCoK00IU2gpKC6k7NJag5nzR/mKoWEJWN8KMct9mcmXB+8A1vi
         6AF6Le+7xtLH+pgE8hrLqZ94z164RXty/sZY6sLTmIt/KsKMprI0Cs8lu/7ioDSiB+60
         2YsWTQ8LvT1zI8/O0nPh6Wh89MRsArMN2a3s9/30pKXYlTJhEXZDCi89H6vYCCfxtWBB
         U5jmeA6hSkxD6NQTB3XvHBZQTlDu2p8D8kuhHHJaTcpuqSAHpHuV0UMxMzYAoFJSLqHW
         +XlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVV2r2PHenevhKFr0MxFxMtI58iEVrdQoog+ko0IcB4771FlRXEFfsaCXZ9S7a0dbR9agGyBoRtIXHsGST1C2VOoC2iobo5bH9kNTaufE81VEPCk1nw/kH3FqGKOWbujdYLikmw6E1TDKpRJLCO
X-Gm-Message-State: AOJu0YzUP6HgjrUK4DN/0tuwvOlPqww/EVXltGc6j0QK3KcLyXrMhMh1
	GZQhlWZCkqGA4HmM4oEwCvOVczpdwMpsmmsZluagkFXCsWNd4YD2LhfKIPMp
X-Google-Smtp-Source: AGHT+IGI9nqb29/xgAsn9EMJ0chffCeAAfJ/0rPXNf/nSiSu7k5uCNy42+a5c9qreEjWnU6qQV5i7A==
X-Received: by 2002:a25:8007:0:b0:dfa:5895:781f with SMTP id 3f1490d57ef6-dfaf64f175dmr8078310276.37.1718020615336;
        Mon, 10 Jun 2024 04:56:55 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-dfb0acd1c62sm939729276.44.2024.06.10.04.56.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jun 2024 04:56:55 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-62cecde1db9so20161807b3.2;
        Mon, 10 Jun 2024 04:56:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWtx8h0/pRJ1Wa27u86JzAnI+YXKGxvanLFcdRkxfXU4v3TjmTEkpTDRVyeXLKxP/hsvWfULKC66+85GrZlWI/O82jthZ1dXkgf6r8uIv3Bq7xHNxFaTcEfLMK630OkqNIj/zNCF9b+d3IoXves
X-Received: by 2002:a81:84ca:0:b0:61a:bc2d:5186 with SMTP id
 00721157ae682-62cd56622famr92553337b3.32.1718020614672; Mon, 10 Jun 2024
 04:56:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240609095049.17193-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240609095049.17193-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Jun 2024 13:56:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVLrEcRUCJzxUKfoOKE5WzV3QNr0f4TjJS-mz=DZ7M7iw@mail.gmail.com>
Message-ID: <CAMuHMdVLrEcRUCJzxUKfoOKE5WzV3QNr0f4TjJS-mz=DZ7M7iw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r9a07g0{43,44,54}: Drop
 #address-cells/#size-cells from single child node 'endpoint@0'
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	kernel test robot <lkp@intel.com>, =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

Thanks for your patch!

On Sun, Jun 9, 2024 at 11:51=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Fix the below dtcheck_warnings reported by kernel test robot.
>
> dtcheck warnings: (new ones prefixed by >>)

What is dtcheck?

> >> arch/arm64/boot/dts/renesas/r9a07g043u.dtsi:85.11-94.6: Warning
> >> (graph_child_address): /soc/video@10830000/ports/port@1: graph node
> >> has single child node 'endpoint@0', #address-cells/#size-cells are
> >> not necessary
> >> arch/arm64/boot/dts/renesas/r9a07g043u.dtsi:120.11-129.6: Warning
> >> (graph_child_address): /soc/csi2@10830400/ports/port@1: graph node
> >> has single child node 'endpoint@0', #address-cells/#size-cells are
> >> not necessary
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202406081329.snoMrZsJ-lkp@i=
ntel.com
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> --- a/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
> @@ -79,12 +79,8 @@ ports {
>                         #size-cells =3D <0>;
>
>                         port@1 {
> -                               #address-cells =3D <1>;
> -                               #size-cells =3D <0>;
> -
>                                 reg =3D <1>;
> -                               crucsi2: endpoint@0 {
> -                                       reg =3D <0>;
> +                               crucsi2: endpoint {

Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
does not document any endpoints under port@1, so I do not know which
one is correct.
Note that the example in the bindings also uses endpoint@0.

>                                         remote-endpoint =3D <&csi2cru>;
>                                 };
>                         };
> @@ -114,12 +110,8 @@ port@0 {
>                         };
>
>                         port@1 {
> -                               #address-cells =3D <1>;
> -                               #size-cells =3D <0>;
>                                 reg =3D <1>;
> -
> -                               csi2cru: endpoint@0 {
> -                                       reg =3D <0>;
> +                               csi2cru: endpoint {

Same comment here, instead using
Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
The example in the bindings also uses endpoint@0.

>                                         remote-endpoint =3D <&crucsi2>;
>                                 };
>                         };
> diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot=
/dts/renesas/r9a07g044.dtsi
> index 88634ae43287..6a5496dbb05a 100644
> --- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> @@ -710,22 +710,14 @@ ports {
>                                 #size-cells =3D <0>;
>
>                                 port@0 {
> -                                       #address-cells =3D <1>;
> -                                       #size-cells =3D <0>;
> -
>                                         reg =3D <0>;
> -                                       cruparallel: endpoint@0 {
> -                                               reg =3D <0>;
> +                                       cruparallel: endpoint {

This part is OK, as
Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
documents that port@0 has a single endpoint without unit address.

>                                         };
>                                 };
>
>                                 port@1 {
> -                                       #address-cells =3D <1>;
> -                                       #size-cells =3D <0>;
> -
>                                         reg =3D <1>;
> -                                       crucsi2: endpoint@0 {
> -                                               reg =3D <0>;
> +                                       crucsi2: endpoint {

Again, under port@1, so which one is correct?

>                                                 remote-endpoint =3D <&csi=
2cru>;
>                                         };
>                                 };
> @@ -755,12 +747,9 @@ port@0 {
>                                 };
>
>                                 port@1 {
> -                                       #address-cells =3D <1>;
> -                                       #size-cells =3D <0>;
>                                         reg =3D <1>;
>
> -                                       csi2cru: endpoint@0 {
> -                                               reg =3D <0>;
> +                                       csi2cru: endpoint {

Likewise.

>                                                 remote-endpoint =3D <&cru=
csi2>;
>                                         };
>                                 };
> diff --git a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi b/arch/arm64/boot=
/dts/renesas/r9a07g054.dtsi
> index e89bfe4085f5..f37034d136b2 100644
> --- a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
> @@ -715,22 +715,14 @@ ports {
>                                 #size-cells =3D <0>;
>
>                                 port@0 {
> -                                       #address-cells =3D <1>;
> -                                       #size-cells =3D <0>;
> -
>                                         reg =3D <0>;
> -                                       cruparallel: endpoint@0 {
> -                                               reg =3D <0>;
> +                                       cruparallel: endpoint {

OK.

>                                         };
>                                 };
>
>                                 port@1 {
> -                                       #address-cells =3D <1>;
> -                                       #size-cells =3D <0>;
> -
>                                         reg =3D <1>;
> -                                       crucsi2: endpoint@0 {
> -                                               reg =3D <0>;
> +                                       crucsi2: endpoint {

port@1, so is this correct?

>                                                 remote-endpoint =3D <&csi=
2cru>;
>                                         };
>                                 };
> @@ -760,12 +752,8 @@ port@0 {
>                                 };
>
>                                 port@1 {
> -                                       #address-cells =3D <1>;
> -                                       #size-cells =3D <0>;
>                                         reg =3D <1>;
> -
> -                                       csi2cru: endpoint@0 {
> -                                               reg =3D <0>;
> +                                       csi2cru: endpoint {

Likewise.

>                                                 remote-endpoint =3D <&cru=
csi2>;
>                                         };
>                                 };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds


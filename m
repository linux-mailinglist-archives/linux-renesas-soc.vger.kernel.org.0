Return-Path: <linux-renesas-soc+bounces-9063-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E02986EBE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 10:25:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89228281180
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 08:25:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 119DF135A53;
	Thu, 26 Sep 2024 08:25:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE6E1A4B71
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Sep 2024 08:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727339152; cv=none; b=CvWePMjkYBde63ttaIRxUry5UHytx5smSqqoDNGepCntc2WoVoIzRdbSoheY657LPO8T9PKCsPkIMqETpyeS+VgA32TIatnrrpnMxbTBB71AH1t8csQK0ExN9Me8HsVBPLup0BeiUv2qE3gao7UqGhEOAZwvAZO+8sJ5c/MsaqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727339152; c=relaxed/simple;
	bh=lPKXgCgE3qsh+TlbeAH10Lq3GbuQL46fqYwH+1A26wQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EmvUHV5Ylr5iP6kAUB3dTk/ogt+JOkQO26X2csGsTy6ixVwGSkqBt3uV2Ng28HN6lk31CkvpQyxb1dpbW0WH76JvwrEFxxm8ecV+TDs+KTOSon2WEAAGsaOCCP52b0qOQMxwnGpzPA3u7dTRxkGCL7nI0Z0vDJ4CKxBVRGrq0Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6da395fb97aso5633797b3.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Sep 2024 01:25:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727339148; x=1727943948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vCv+QxWrG+3ks87xtzn4Ak3hdS+gT362kSJA3yglZQc=;
        b=Lvtag6Y7rKtcG/BXydh90w1aVlRwohn9ps/uoCJYKO0YWkGDZYDJEUL7bM+SeRVuod
         XS9Whh5iCF/NvETUqePwSQxpopxjlsecw531cf+uLuySIbH+zRKHnbwa2Jpt46evkBGD
         HY0BQET3T6vyqmvJVB75/po0Pq4uDSjvmAsOHyFSRYvqhhEpIPjyMI37Emb8gkZbd7/w
         +t53NU5py15hQQ6pdJRr7OcxoaFWoCANDcWI2ysIiIaU8LpxwNaw0rP/XYNUumLkBiWv
         6TthDX3yS+x+hd6Ov6Rriw269HCVMZdfN1hV6M8kDmQqCx0tylkP//7n0p5Y+TDf9D3l
         XkYQ==
X-Gm-Message-State: AOJu0Yx9xVZ/af4zgOlzSyCFuhDglPdmwyCUlURurFeRfOz13QSkxIMZ
	V8EzxjDTCbaq++9GRpY/s9SPnR5OWlxDwOmecm1CWBK7uuTduyfONklenEvV
X-Google-Smtp-Source: AGHT+IGvim8E0K8tWk8CnSeb6dwDWVzf8dL+rwJck49lZXHfsuljCJOYPAuK7eM1WQAH1Wr5bSF39g==
X-Received: by 2002:a05:690c:d85:b0:6e2:1842:c2b1 with SMTP id 00721157ae682-6e21d0ca6d6mr59077587b3.0.1727339147886;
        Thu, 26 Sep 2024 01:25:47 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e20cffe3fasm8937657b3.27.2024.09.26.01.25.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Sep 2024 01:25:47 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6da395fb97aso5633677b3.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Sep 2024 01:25:47 -0700 (PDT)
X-Received: by 2002:a05:690c:4886:b0:6dd:eb45:cf11 with SMTP id
 00721157ae682-6e228b180d4mr36392087b3.43.1727339147125; Thu, 26 Sep 2024
 01:25:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240926075724.6161-4-wsa+renesas@sang-engineering.com> <20240926075724.6161-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240926075724.6161-5-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Sep 2024 10:25:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVBAWny2Z1e6_D+v+=jd2y63a=HDe9+cnRMwfNTeh0cpA@mail.gmail.com>
Message-ID: <CAMuHMdVBAWny2Z1e6_D+v+=jd2y63a=HDe9+cnRMwfNTeh0cpA@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: renesas: add proper node names to (L)BSC devices
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Thu, Sep 26, 2024 at 9:58=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> (L)BSC should have a "bus" node name together with its register set [1].
> Add the missing names, and change one with a wrong address not matching
> the register space.

Thanks for your patch!

> [1] lbsc: $nodename:0: 'lbsc' does not match '^([a-z][a-z0-9\\-]+-bus|bus=
|localbus|soc|axi|ahb|apb)(@.+)?$'

The "@<unit-address>" part is optional.

> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  arch/arm/boot/dts/renesas/r7s72100.dtsi | 2 +-
>  arch/arm/boot/dts/renesas/r8a7778.dtsi  | 2 +-
>  arch/arm/boot/dts/renesas/r8a7779.dtsi  | 2 +-
>  arch/arm/boot/dts/renesas/r8a7792.dtsi  | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/boot/dts/renesas/r7s72100.dtsi b/arch/arm/boot/dts/=
renesas/r7s72100.dtsi
> index 07ffd9ec96cc..a460a9092c43 100644
> --- a/arch/arm/boot/dts/renesas/r7s72100.dtsi
> +++ b/arch/arm/boot/dts/renesas/r7s72100.dtsi
> @@ -36,7 +36,7 @@ b_clk: b {
>                 clock-div =3D <3>;
>         };
>
> -       bsc: bsc {
> +       bsc: bus@3fffc000 {

In the absence of a "reg" property, shouldn't the unit-address match the
"ranges" property?

Actually, I cannot find that in the DT spec, only:

   "If the node has no reg property, the @unit-address must be omitted".

>                 compatible =3D "simple-bus";
>                 #address-cells =3D <1>;
>                 #size-cells =3D <1>;
> diff --git a/arch/arm/boot/dts/renesas/r8a7778.dtsi b/arch/arm/boot/dts/r=
enesas/r8a7778.dtsi
> index b80e832c9277..ab0b76eacd3c 100644
> --- a/arch/arm/boot/dts/renesas/r8a7778.dtsi
> +++ b/arch/arm/boot/dts/renesas/r8a7778.dtsi
> @@ -40,7 +40,7 @@ aliases {
>                 spi2 =3D &hspi2;
>         };
>
> -       bsc: bus@1c000000 {
> +       bsc: bus@ff800000 {

"ranges" says 0x1c000000, so the former was correct?

>                 compatible =3D "simple-bus";
>                 #address-cells =3D <1>;
>                 #size-cells =3D <1>;
> diff --git a/arch/arm/boot/dts/renesas/r8a7779.dtsi b/arch/arm/boot/dts/r=
enesas/r8a7779.dtsi
> index 1944703cba4f..3c5746dbe639 100644
> --- a/arch/arm/boot/dts/renesas/r8a7779.dtsi
> +++ b/arch/arm/boot/dts/renesas/r8a7779.dtsi
> @@ -704,7 +704,7 @@ R8A7779_CLK_MMC1 R8A7779_CLK_MMC0
>                 };
>         };
>
> -       lbsc: lbsc {
> +       lbsc: bus@ff800000 {

0x1c000000 according to "ranges".

>                 compatible =3D "simple-bus";
>                 #address-cells =3D <1>;
>                 #size-cells =3D <1>;
> diff --git a/arch/arm/boot/dts/renesas/r8a7792.dtsi b/arch/arm/boot/dts/r=
enesas/r8a7792.dtsi
> index dd3bc32668b7..471a2913e51e 100644
> --- a/arch/arm/boot/dts/renesas/r8a7792.dtsi
> +++ b/arch/arm/boot/dts/renesas/r8a7792.dtsi
> @@ -84,7 +84,7 @@ extal_clk: extal {
>                 clock-frequency =3D <0>;
>         };
>
> -       lbsc: lbsc {
> +       lbsc: bus@fec00000 {

0x1c000000 according to "ranges".

>                 compatible =3D "simple-bus";
>                 #address-cells =3D <1>;
>                 #size-cells =3D <1>;

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


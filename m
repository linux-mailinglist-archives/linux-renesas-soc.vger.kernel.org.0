Return-Path: <linux-renesas-soc+bounces-8267-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6EC95F127
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 14:18:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E669B21BFF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 12:18:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B29616F839;
	Mon, 26 Aug 2024 12:18:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D9313BC3F;
	Mon, 26 Aug 2024 12:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724674687; cv=none; b=M20189t9G6uZH8y2/s8OuKq95vVFjKlhoVHPOUZOxr29ihJmYxXyyNnDtTtgj58L2b4d2gSkV0vz+0v8D73JZo5Ijs/9xn63KEIZBIABLbQttUn+eQ6FUAUS2DuOVXE5iugKqip3kL3t2zkkuJvkIhR8fxwZQiVGU39FBubbcvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724674687; c=relaxed/simple;
	bh=ntpVWLB5Doc8EWeQ/tzd/K4/zGASTfLa/jTy8p7w1wY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RUncI8EDfgOYKaZ7Qa9hzvShG5x7RMduOuEcIrZ+h673qPuWtObM2FYb7Sp9Gy+nJ9yBqzo9iPXo/kFrkHMdZlbM3kqEKM6pVx6qliTDz79ICgy2pOJj7i0tEBlG5dJiHeAw77aaqxA2xRPM4c+VmA2ykcOC6hV0c0drrwlWmP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e13d5cbc067so4356139276.2;
        Mon, 26 Aug 2024 05:18:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724674684; x=1725279484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jhpgtKr3dh0AsOBTCJwBp71vRKXSTrPRL4HJL1BkAiY=;
        b=ZmkTzRxhs2xaqKgeTWPYtA9Dq9h2UXN847886KFkvIWiqR2V853RMd9LEAe1FoXjqN
         3Ka+w5m8DUUUdcKJJB8z9gfIMs5UJvG7kvkeOHE19H6hduHb1vP1XXvxzykg+QZGCeqF
         h1DybjkN67ARtarKOA/8RSSfR935r4x2ffV3qPTzvhKCAO1fNA9IYR/3ov/FFWwHJrA0
         Zn3pndqNXcEibeGOVXtGby2GOi8O9DBA1IdbyGFEKGSzdKN4JrMYNdEj0F0DYg7Q/70M
         Wrr3LDa+W9iRBmV/IGABY9PeJEF7uJHquTWaBQ857955gNvfteeGk1BtnGd7PVRIrDu1
         lzhA==
X-Forwarded-Encrypted: i=1; AJvYcCVAMZXYGPSH9BLO36Scd6ywsa7kbc6UOXbjWDKFeq+bzCD0vqVXpH4Lc/M43c/t2BLlUIZ19yHPDKDsvuEYERGKa2s=@vger.kernel.org, AJvYcCWnWIHSDQS30T2BypzXeZcgSfo7OEjuDin0g6SenqEIKMZ1v4mx3ObgwTFeeHqcKbUgCZqWFp7XxDSU@vger.kernel.org, AJvYcCX1C2ju0GKZ6/gHXGFzh6Z58Dnywy9HE9zmCiZWCafbuIgHVuasZjZNFslxY19uhMQjYzTzTV+EspB0axzE@vger.kernel.org
X-Gm-Message-State: AOJu0Yy279879H3KvKpk4FftZYKZGXn7dBCzSNoN/gxxgYMQAWmfUErk
	+zcwt00a5p6kSNhVLdPVLDwepvKxezWp5+sOmWtdQnzUqvXfZ5Ug/qf9hcV0
X-Google-Smtp-Source: AGHT+IF4FlzKBI546uxsJl19n9hsCflDuOC1RQyYnsyU6G8Bqp+yYdrW0mcbnArY101ECZBQf7lj/A==
X-Received: by 2002:a05:6902:2411:b0:e0b:ba20:7f87 with SMTP id 3f1490d57ef6-e17a83e713emr10704835276.25.1724674683974;
        Mon, 26 Aug 2024 05:18:03 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e178e4637e1sm1951427276.15.2024.08.26.05.18.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 05:18:03 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-69483a97848so40705207b3.2;
        Mon, 26 Aug 2024 05:18:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV/Q+iWqEfxflzv53NE5+7QxVJAKaLChZ7BgE6B8WZwlC8sSo9hy5BHJV9PsHcQEMRBGAfmXaJ2n5bUa6rB@vger.kernel.org, AJvYcCVOgH3zAwVhKLIJNbTYenZECVZjLK8fZvxYaXwfzq1P1zCY6k8WWqdOtb9kOLlCzrVfoSCvmNtMu146@vger.kernel.org, AJvYcCVZWj1kYRdxoLdwKXtpsQXNFVrx3TEdqIRJ1PJj3FyouzhwIRnBRmbF4WLHTKTvvmsT0vLXfecrgWIGxh3r1IlPXZE=@vger.kernel.org
X-Received: by 2002:a05:690c:f94:b0:6ae:1e27:c993 with SMTP id
 00721157ae682-6c625390575mr113494377b3.7.1724674683260; Mon, 26 Aug 2024
 05:18:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240821085644.240009-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240821085644.240009-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240821085644.240009-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Aug 2024 14:17:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWQodA1NdmCEXmW7UYjAbdLFP-YS=rnKffHbEP7zH+ErQ@mail.gmail.com>
Message-ID: <CAMuHMdWQodA1NdmCEXmW7UYjAbdLFP-YS=rnKffHbEP7zH+ErQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/8] arm64: dts: renesas: r9a09g057: Add RIIC0-RIIC8 nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Wed, Aug 21, 2024 at 10:56=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add RIIC0-RIIC8 nodes to RZ/V2H(P) ("R9A09G057") SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3
> - Grouped the I2C nodes
> - Dropped clock-frequency
> - Updated I2C nodes to match with the coding-style of DTS

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> @@ -201,6 +201,195 @@ ostm3: timer@14001000 {
>                         status =3D "disabled";
>                 };
>
> +               i2c8: i2c@11c01000 {

Usually we sort the instances within a group by instance number, i.e.

    i2c0: i2c@14400400 {
    i2c1: i2c@14400800 {
    i2c2: i2c@14400c00 {
    i2c3: i2c@14401000 {
    i2c4: i2c@14401400 {
    i2c5: i2c@14401800 {
    i2c6: i2c@14401c00 {
    i2c7: i2c@14402000 {
    i2c8: i2c@11c01000 {

See e.g. the scif nodes in arch/arm64/boot/dts/renesas/r8a77951.dtsi:

    scif0: serial@e6e60000 {
    scif1: serial@e6e68000 {
    scif2: serial@e6e88000 {
    scif3: serial@e6c50000 {
    scif4: serial@e6c40000 {
    scif5: serial@e6f30000 {

scif3 and scif4 have lower base addresses than scif0.

The rest LGTM.

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


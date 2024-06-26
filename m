Return-Path: <linux-renesas-soc+bounces-6806-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7390491822C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 15:19:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A645A1C232EC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 13:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B87C522A;
	Wed, 26 Jun 2024 13:16:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D79186E31
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jun 2024 13:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719407788; cv=none; b=aWUeBSPkzTJID3mL45G8Y2tFTWnDc8IbJqL/CSPCmpbZZMNm0M+TceLTppwcc+/fDeFkuencf+JcA9QAV0/pekrc467BJ4zEKzRN1vTnGa+rrwjYmD6TSslmPcY6P5niwXLrq4yUZ+cDw8+HoyzESL732rVOnOaYmnQXnIB7E1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719407788; c=relaxed/simple;
	bh=qc2FncAm+89rHdOWs6rWAlT53xDuPO+Gdea8eufBRMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c7UyRZo0qVHrp8zUxBwnk/HWjiN2qJycU0OCj4ke8hNt6kWFG4EriSL6n55kkYpi535LldUaveynTc9yX6mLGIugXVzAELfGssw3HXxqUolz4zqEEps/k1H0lTSSqkOA/iXCthQHDJ1RmH8zPddbADG2nInCZyFcDl4w/jiqgOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dfab5f7e749so6131425276.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jun 2024 06:16:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719407785; x=1720012585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RgrhLKpGqf4hGkCLsvg0h6bKjHqYx4C0U2zB2WIAQjg=;
        b=pdwPZb9DLmxhfRmj8v60bfuHsTq3mYjPyDSYqY+PbqUaryh/uvkdhX+5NnSYbsIKEI
         udeMDKle6EdXRmlS/brfZEV41Thi1Iqd9tbOQJe85kp8aIEIHZBS9iyVpfDq8gIKKW9I
         4aXtrbrna45rJkmzbNbjDkm3qm0d6MJMdxbP3wOmXMmMgYdv5WDrRGp7LseUkMA26LWa
         HvMS2NHSV0BdPenSxHdgzOea58eSfjVVelnhpLQ6467ZZYQYwETYL+rYEBqnVVejF40Z
         jeTmEf0ogcoEQlnrs5Jg8C+OfoHWcalhPaSkOViB0rXat4JWuAWqrCpIUSzW1CzI+ku0
         SCRw==
X-Gm-Message-State: AOJu0YwaeYno5XFCmmpjfTB4ErubyZZqdyrMOsYn8VwKbpmLdc6scuRE
	G2C9dk4XBd3huPQd0e4x2LO6fx9dglGsnSm8mHc21vumMNRDeoz+j9Fit4Sp
X-Google-Smtp-Source: AGHT+IFzc8JdtSWxNy2xJ5JahQA3AtITcUEhc5pqploODyDBHTBdi9pr0+dB9Qy2ph5AYm1MdkbBug==
X-Received: by 2002:a5b:dc8:0:b0:e02:c4c1:7833 with SMTP id 3f1490d57ef6-e0300f4b25amr10541075276.21.1719407784611;
        Wed, 26 Jun 2024 06:16:24 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e02e6116e96sm4290177276.1.2024.06.26.06.16.24
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 06:16:24 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-63174692a02so63159737b3.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jun 2024 06:16:24 -0700 (PDT)
X-Received: by 2002:a81:7709:0:b0:643:aef1:fb9d with SMTP id
 00721157ae682-643aef1fba9mr99413187b3.4.1719407783796; Wed, 26 Jun 2024
 06:16:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87jzifkxi4.wl-kuninori.morimoto.gx@renesas.com> <87ed8nkxeq.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ed8nkxeq.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Jun 2024 15:16:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWJGdSHCfGetZz57s+EwPPR7dMFnZ5V9wu=HXztp3NytA@mail.gmail.com>
Message-ID: <CAMuHMdWJGdSHCfGetZz57s+EwPPR7dMFnZ5V9wu=HXztp3NytA@mail.gmail.com>
Subject: Re: [PATCH 3/6] arm64: dts: renesas: r8a779h0: R-Car Sound support
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, Khanh Le <khanh.le.xr@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Morimoto-san,

Thanks for your patch!

On Mon, Jun 24, 2024 at 2:16=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> Add sound support for R-Car V4M.
>
> Signed-off-by: Khanh Le <khanh.le.xr@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

The Sob-chain does not match the From:.

Either there should be a "From: Khanh Le ..." at the top, or
a "Co-developed-by: Khanh Le ..." before the "Signed-off-by: Khanh Le ...".

https://docs.kernel.org/process/submitting-patches.html#when-to-use-acked-b=
y-cc-and-co-developed-by

> --- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
> @@ -1464,6 +1471,67 @@ dmac2: dma-controller@e7351000 {
>                                  <&ipmmu_ds0 22>, <&ipmmu_ds0 23>;
>                 };
>
> +               rcar_sound: sound@ec400000 {
> +                       compatible =3D  "renesas,rcar_sound-r8a779h0", "r=
enesas,rcar_sound-gen4";
> +                       reg =3D   <0 0xec400000 0 0x40000>, /* SSI_SDMC *=
/
> +                               <0 0xec540000 0 0x1000>,  /* SSIU */
> +                               <0 0xec541000 0 0x050>,   /* SSI */
> +                               <0 0xec5a0000 0 0x020>;   /* ADG */

No need for the comments, we have "reg-names" below...

> +                       reg-names =3D "sdmc", "ssiu", "ssi", "adg";
> +                       clocks =3D <&cpg CPG_MOD 2926>, <&cpg CPG_MOD 292=
7>, <&audio_clkin>;
> +                       clock-names =3D "ssiu.0", "ssi.0", "clkin";
> +                       /* #clock-cells is fixed */
> +                       #clock-cells =3D <0>;
> +                       /* #sound-dai-cells is fixed */
> +                       #sound-dai-cells =3D <0>;

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

If you tell me the correct author-chain, I can make these changes
while queuing in renesas-devel for v6.11.

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


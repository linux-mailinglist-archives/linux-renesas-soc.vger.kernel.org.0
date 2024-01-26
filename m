Return-Path: <linux-renesas-soc+bounces-1888-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DAB83DB32
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jan 2024 14:53:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D49611F2621B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jan 2024 13:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 386A41B956;
	Fri, 26 Jan 2024 13:53:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE221B943;
	Fri, 26 Jan 2024 13:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706277195; cv=none; b=QGQfPp9epZx2lZR0uTIwoqiv0KQf/XeNpzzv34TxLZSN6ruC8Zsto59XCu7aKomIDvHwOdd2uY6cmmFqCQsNv7ZqIIOoKu9RN9AAf7HrD/ykatnk/4Yhh5Hy7N4jH/9Y4ZvZM95Uen6riqxwE19u2V97HBkbHzw+DSLSJPsdALM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706277195; c=relaxed/simple;
	bh=Z6I31NT0BcGf7psD17XzyIlVKaXrRZiIAJ8RzTvC1l4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RqAmDmi4KVZNcmjY1/Mv/amksC1FK/iBPH02+MYVUw4uS/2F/37Z9iV3YIR3AYShvktMMNdWBuQuyAKo6EdzmK87Mlg4qHK88zsoXmrCEXOGqZsNRSSYwupStcFVqoR/zE88DvZydR0KfZbepdrqtOUAS03TVOOeFQ+96VSLD9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dc226dca91aso380717276.2;
        Fri, 26 Jan 2024 05:53:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706277192; x=1706881992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NhvF8nacolHiA8n/Jg7CYQM1D3ZaUoBxjgtxv4pX148=;
        b=Q3m/8NuhMKooPk/jthbnLvYv0CVA+inaXuB4h2E6JUbCb1E7O9HkdhYtEXT/gKLlx3
         R57+MC43xG3RCLhoR19MW9fUY5fSN4H21u0hB6Myftc64ra/DwDPzklzd95Hz9iHBDyC
         UaJLkNQTysvPzFBrUjJhbHuqgdMYyuiT4UyDRQ2BqMaDR/v3VcE45nBsAnuV2AGQM60f
         dOd4b0y8/dEOqGzO5RYfSQxxp3x5j3uUeUfCRZjloR7dJUr6V0SX4owiSHiNlzIB4gSD
         0OhLIMGAXTXWik7DnqAree2fBMIy6G8+esf7CYShxT+1ztg2liEdPyKMqjA0QHIRxy1w
         MjRA==
X-Gm-Message-State: AOJu0YzPufX8gEVqAaprsIIYBqeLfY9SzWyFCQYGaN9s/pUie+mQ6X9M
	EDwdgja3X6p5VJXO8OpGBXNBIJtQIzbaW/jzHOacVvDntZ8/ilmVaCeA9b7IZE4=
X-Google-Smtp-Source: AGHT+IErh3yNnJjLfe5X3czrTIy+dfkAZPFsEL59r62stsg4HCfqYayJ6EHW8huJYjRIO1ejcwmdPA==
X-Received: by 2002:a5b:c83:0:b0:dc2:3618:c119 with SMTP id i3-20020a5b0c83000000b00dc23618c119mr1063056ybq.116.1706277191830;
        Fri, 26 Jan 2024 05:53:11 -0800 (PST)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id k8-20020a5b0a08000000b00dc22f4bf808sm385169ybq.32.2024.01.26.05.53.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jan 2024 05:53:11 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-5fc2e997804so3973147b3.3;
        Fri, 26 Jan 2024 05:53:11 -0800 (PST)
X-Received: by 2002:a05:690c:398:b0:5ff:dee3:b866 with SMTP id
 bh24-20020a05690c039800b005ffdee3b866mr1462172ywb.14.1706277191099; Fri, 26
 Jan 2024 05:53:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240126133116.121981-1-biju.das.jz@bp.renesas.com> <20240126133116.121981-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240126133116.121981-6-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 26 Jan 2024 14:52:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUa+wd36-ErDRgb91KpRbryNYzA2Mmhvzjx0-_47=zfdg@mail.gmail.com>
Message-ID: <CAMuHMdUa+wd36-ErDRgb91KpRbryNYzA2Mmhvzjx0-_47=zfdg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: renesas: r9a07g043u11-smarc-cru-csi-ov5645:
 Reduce I2C frequency
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Fri, Jan 26, 2024 at 2:31=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Reduce i2c freq from 400->100 kHz on RZ/G2UL SMARC EVK as the captured
> image is not proper with the sensor configuration over I2C.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc-cru-csi-ov5645.dtso
> +++ b/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc-cru-csi-ov5645.dtso
> @@ -19,3 +19,7 @@ &ov5645 {
>         enable-gpios =3D <&pinctrl RZG2L_GPIO(4, 4) GPIO_ACTIVE_HIGH>;
>         reset-gpios =3D <&pinctrl RZG2L_GPIO(0, 1) GPIO_ACTIVE_LOW>;
>  };
> +
> +&i2c0 {
> +       clock-frequency =3D <100000>;
> +};

Is this a limitation of one of the I2C devices on the bus, or a PCB
design issue?

Doesn't this need a Fixes tag?

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


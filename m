Return-Path: <linux-renesas-soc+bounces-25278-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE56C8EAA3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 15:00:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 92F2D3523D8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 13:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60ED6330B1F;
	Thu, 27 Nov 2025 13:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kf8mDbaM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EA5246BC7
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 13:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764251943; cv=none; b=CRhM+hjpIF8UBDxzv4mmhgBhpA7kQiokOIKh7qzFy8aNJIsEJR7i/3QAH9q/lp8EUfVueRgQk8qwXgqPI9qpLN/bvYNc8+2MUb7rn/bo8A3ag/MRFnqPV1MUHxvFUU/h9588AYuiSko0NL2AUrv0WC+Hx+u6DSpiRYOyDxwlXHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764251943; c=relaxed/simple;
	bh=0u4NVq7+BdTxKgnzLEFnd3CWygfvgTqRVqIPAJxU+jo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JEJlm279IcNmRJnQ1DgT8siZDrxyA8urHaU6IRD46dN8sbDzTL8RYjgcVjbtUhECois65NKPx3meHynHNrtZZ9XkV41DJDZnRB5m5EMfNo61OTpXrwXtcHwb1VzHhCDWhwud+mi1wnyBzOWuTnL+YxAbCBkcSd3jNea+UgfUqJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kf8mDbaM; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-429c8632fcbso614647f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 05:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764251939; x=1764856739; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gnxISG+deFt7GHt3BFpEdGiXVoglGnvqHxBF0MY3fn4=;
        b=kf8mDbaMzo2NBwwcWQHZYrIgku6clvqGgEDztMlUlNT+PFpDwwbyIvSnY2SNmxVoJI
         a9t+RrO88jq2i1prtNV6gVZXLV86RN90Z14lFL4y4PyGO/lpzcF4kTiAqLZ6beww2faZ
         PBDfZz+uYf8Yoyl6NmzXrM6luEuMoMSM4H75LrxgigR3vMoKUm6J+UM3F1MNfxod/RI1
         yVBZuPOfgkCDSNtIKUEV0kvDdXB3ZBdL59DUSVC4h4atk5urJa2AcDW3LwaaK6mQ3GC6
         bq91sXMuofJRuxAnJu1UZoqlxBToFvlS/V498CZgar2x0QCzvk1JeJF+m0XqZj8MpYA+
         mT5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764251939; x=1764856739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gnxISG+deFt7GHt3BFpEdGiXVoglGnvqHxBF0MY3fn4=;
        b=nd1Tldwv2nNceEqc3VpBGzFYmpXV63Wir+DEHfZat8IUnw93mRHNwVtlImHOPA4Vmd
         yOcpIz/Qk+NvEEIRYkWzLl7SYJd3QMoOkQFxUnI6ZtdEJFUBNC7rfQAYsWlLrtBTj48e
         Fpy0zTiaqz6lwY5zvpwDrokGOgbUao7mAYxpUDt7jLXrFwvk6rAkXQ+42UeB6m7mQUrv
         8JFWVloO8CENJ6Go45gl443gqg4E//CxDxns5htqYExT4/3OopY6S0DvRlZTNHoq8Mnz
         2Il0dXlV1CJuruTlRPL4sGYL0WyZIk1wwG8AF7o0QLeZyd4fGr5ITd131ckrs0kngPd4
         JxGg==
X-Forwarded-Encrypted: i=1; AJvYcCVPzomtbIFiY/INqf4adECS5oJsSxSaVX6pcGtwFnnQef/T9Xxls+hbDgmGcdIKZ7eYzLl/2AesYOe48jOiJ1fbmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YypblRTOE5mOl8VgTdT5JXMfR4Ls9A17zkhEayWjYqYAkFkx2n9
	m1C6InluzK7JYx4qxvlh6kjetmxQJDgYmVN6X0TTV1Ct/cT9EACBbBy3RM4RmhjxheUK94OXY3G
	Ot3hYCMiAcJXpCeJLuebCtDgW/+UTW8I=
X-Gm-Gg: ASbGnctzHAQmtXL5w3+05KiHokosRWPIWRMKDC9SU9V3w3C0lVe1tUK8cRWZ+Jhmemc
	mLaXQ7g2Jnhn4gg020C0xEE8qajPcqIMY0uXGfz7afJPEq4HSf+4y7WFJTr2MXzJQEXbNtJRQ/c
	ptGUyLQxlCnRF2vPXWARb6Oo1o5IgjMXyocYUDcxLb2ocKiyL9J9y3jLrS4JXIndJtRcT3GsFT2
	2kiJJ7cOoU4O7ONgXgOfULZ9Onx9fLnpIzgjJqEwuouNZzmrAJeMDUZXUeHn5/cwmCY+IrMhg==
X-Google-Smtp-Source: AGHT+IGNtcCSrgQktFnYqTZxYZ6Hs3cgPF9O8J4034qoPLGkbQ8PDMY04xenTjU1D4sevAYqeeqaV7IhvGcdhUjbwBs=
X-Received: by 2002:a5d:5f44:0:b0:42b:3701:c4c6 with SMTP id
 ffacd0b85a97d-42cc1cf3c16mr26528101f8f.38.1764251938487; Thu, 27 Nov 2025
 05:58:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <53d45eed3709cba589a4ef3e9ad198d7e44fd9a5.1764249063.git.geert+renesas@glider.be>
In-Reply-To: <53d45eed3709cba589a4ef3e9ad198d7e44fd9a5.1764249063.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 27 Nov 2025 13:58:32 +0000
X-Gm-Features: AWmQ_bnedgFk9dq1Mtg11dYj8-7z-L3ilTlE5DIq5awUXGvPaKMvycqmu1EzW3E
Message-ID: <CA+V-a8uhbh280qUQy0ryHQmQ4qzFELaWcdo0gomsJ32nbsM+0A@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: renesas: r9a06g032: Add Ethernet switch interrupts
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 27, 2025 at 1:13=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> The Ethernet switch device node still lacks interrupts.  Add them.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> "[PATCH net-next 04/11] dt-bindings: net: dsa: renesas,rzn1-a5psw: Add
> RZ/T2H and RZ/N2H ETHSW support"[1] will make interrupts and
> interrupts-names required.
>
> Based on the example in the DT bindings[2], Compile-tested only.
> To be queued in renesas-devel for v6.20.
>
> [1] https://lore.kernel.org/20251121113553.2955854-5-prabhakar.mahadev-la=
d.rj@bp.renesas.com
> [2] Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
> ---
>  arch/arm/boot/dts/renesas/r9a06g032.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/arm/boot/dts/renesas/r9a06g032.dtsi b/arch/arm/boot/dts=
/renesas/r9a06g032.dtsi
> index 71d655b0565af1a5..5530eb9e891fa45c 100644
> --- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
> +++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
> @@ -453,6 +453,12 @@ switch: switch@44050000 {
>                                  <&sysctrl R9A06G032_CLK_SWITCH>;
>                         clock-names =3D "hclk", "clk";
>                         power-domains =3D <&sysctrl>;
> +                       interrupts =3D <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names =3D "dlr", "switch", "prp", "hub"=
, "ptrn";
>                         status =3D "disabled";
>
>                         ethernet-ports {
> --
> 2.43.0
>
>


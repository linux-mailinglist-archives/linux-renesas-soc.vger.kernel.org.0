Return-Path: <linux-renesas-soc+bounces-26855-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0960D2496C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 13:45:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E78BD3016AF5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 12:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6509939448B;
	Thu, 15 Jan 2026 12:45:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD91346FDA
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Jan 2026 12:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768481155; cv=none; b=P5hLwM0p2d5R7iCzD2+rr2zGL77UYomgsECQDxAcL8gepvGxyKlKUc1iC8mf2seB8er8ZhNMjPqk5bMnzja5qdtWm0mQjjjO9gaa08zNIYuSx/P/1fen5P22A7KK0Q/7oaU33C42dPITCxgETmBgrgPj8GzhrVbmOuoSjX31ZEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768481155; c=relaxed/simple;
	bh=G0llLSNnn6NcC6KSkN6kYKOlUKIgvNvU2oPhikHdlbI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cV+BUjS+ayk/tV2bNnmccws1oxyxNdEVTX9Q3qciyAT5PAo0rJwcoZU+3L7G4Rrp0kF401zJL6O3oCwZAsV4Oygsm0/xx2ycleqTAZMEN95EAeVl+nWU1pf56SZjUbyWyQgPTBh5O0lbhT2IIsszFg4FqimPX/6x77XtIwN4iz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5636227a6e6so282456e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Jan 2026 04:45:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768481153; x=1769085953;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bTjFGVrWlLy/q+nJJcYxgEGTZ7R4mxUKMHt8K/er7Bk=;
        b=FVe7coVxDHnU2FlDwlJK+4TFjhu4EEUQcuYFwOKpa8ij3JmQvh5pw20sVY7Sz6mQny
         yZ8QcphdMsyKA1hQK70EobN8CkNFVGj2rlh23y9FdmknEPXoZUlVcCIDnMWZf8dBycK8
         EZROPz4ZbOFm9EJSNmGK3iMe6RMz+s5JzlBEJIcAqA0U0cgZDFaVRXyBK1ZoZE8XEngC
         z+pmlylgbkMHPOZvETTPzo9UMO+vAxwS8OyF2toLMf6kmJGxCHM4Y29R9NBg+bmLi0ZB
         vs9OLBH7RjkfnzYzhJyQFBdN70qOtVS/EpE4AnuCKwt6zg2XFWn0FsZM38R9k7FO7c6a
         Qbrw==
X-Forwarded-Encrypted: i=1; AJvYcCVYY+h226EwACIjncJ/oFv06knvVcMmA5HOSiJeiAB4AsXOvF0kkjpmqStRVo7h1T13demm7s2AZbe7urPa4NgyWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQMIZ99yi8ANg+9CIJ7Re803JZABrnyM1rkGw45k15jS1Q7J1w
	Az5Gw7kBDaNuOVlNpw88v4sGVjbnpojveGqxwar1M+Uo2+Np+KU7N+GYZbhaE2xEi2M=
X-Gm-Gg: AY/fxX5nbLJSjJeBwz83BN++bIaiI/8+HqrIfKMeLEFAwpszMDstAJHFiU0R+M1o9JH
	26oM/cMqTD6dNG+/zPBPkLLVX4s//C7ceCY6HpQ5xllaLMuogv7L95csqwy/9ngRyLOWyoqVf/3
	F82V/Q3pU/oFXSiHOVhljKPd+NFiq9PRDEfvBVqg9J6j7f5ewo8prfn05xVxqg5XN857m9TZzMj
	vJ+P80bt+1IuGNO2WQcrxrpExXy9WTf15pfTtrzIqk9mIsFsKl26/hwnET59LW6HBtAhQFYXgzx
	rGPeGWW0sN0jv1c61sA9kwmaSAtKN/t8crW5lOdg3vJRjt8KD+Jq5hzhU61VbqSO8FzGNdiq5Xy
	A6NFzel6Ir7ue4LCBQ2m9cGFkLFeA8mdWuqvk2hVnwRytmbUj50/g4rnAxXv9MKaZ4H3OTEXBDa
	zeIvvmsDmHzHDqZl6H/lVYLDAuuce/hm6m3VBSyx0JjNfGMQ4b
X-Received: by 2002:a05:6123:2e6:b0:563:72d8:ea6 with SMTP id 71dfb90a1353d-563a0a208ddmr2276772e0c.10.1768481152971;
        Thu, 15 Jan 2026 04:45:52 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5633a1ea810sm25169529e0c.5.2026.01.15.04.45.51
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 04:45:52 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5ee99dec212so308187137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Jan 2026 04:45:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXRG5vkKfm5J6J6HCxSgl5ZWIPqDg01FwO6C9D87ZU5BLLra6ZnR9VXYnwcZ4pja7iTZ0QqISi49BkBjsnZoHW3LQ==@vger.kernel.org
X-Received: by 2002:a05:6102:3f47:b0:5ef:b3b7:6e3f with SMTP id
 ada2fe7eead31-5f17f416e55mr2503254137.3.1768481150952; Thu, 15 Jan 2026
 04:45:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115-schneider-6-19-rc1-qspi-v2-0-7e6a06e1e17b@bootlin.com> <20260115-schneider-6-19-rc1-qspi-v2-1-7e6a06e1e17b@bootlin.com>
In-Reply-To: <20260115-schneider-6-19-rc1-qspi-v2-1-7e6a06e1e17b@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Jan 2026 13:45:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW5hwNu-07-7xvyWdcGKUZy+pCX0=W=JNgd4h7m72wQFg@mail.gmail.com>
X-Gm-Features: AZwV_QhONECo5-MoxTpQjjP-7GyvFR79J783OyYxOrmcopvq9NEZH1YUXPhgpUI
Message-ID: <CAMuHMdW5hwNu-07-7xvyWdcGKUZy+pCX0=W=JNgd4h7m72wQFg@mail.gmail.com>
Subject: Re: [PATCH v2 01/13] spi: dt-bindings: cdns,qspi-nor: Add Renesas
 RZ/N1D400 to the list
To: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Vaishnav Achath <vaishnav.a@ti.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	=?UTF-8?Q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Santhosh Kumar K <s-k6@ti.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Pascal Eberhard <pascal.eberhard@se.com>, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Miquel,

On Thu, 15 Jan 2026 at 10:25, Miquel Raynal (Schneider Electric)
<miquel.raynal@bootlin.com> wrote:
> Add support for the Renesas RZ/N1D400 QSPI controller.
>
> This SoC is identified in the bindings with its other name: r9a06g032.
> It is part of the RZ/N1 family, which contains a "D" and a "S"
> variant. IPs in this SoC are typically described using 3
> compatibles (the SoC specific compatible, the family compatible, and the
> original Cadence IP compatible), follow this convention.
>
> Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
> +++ b/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
> @@ -80,6 +80,10 @@ properties:
>            # controllers are meant to be used with flashes of all kinds,
>            # ie. also NAND flashes, not only NOR flashes.
>            - const: cdns,qspi-nor
> +      - items:
> +          - const: renesas,r9a06g032-qspi
> +          - const: renesas,rzn1-qspi
> +          - const: cdns,qspi-nor

Doesn't the need for (at least) the CQSPI_NO_INDIRECT_MODE flag mean
that this device is not compatible with cdns,qspi-nor, and thus the
cdns,qspi-nor fallback must not be used?

>        - const: cdns,qspi-nor
>          deprecated: true
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


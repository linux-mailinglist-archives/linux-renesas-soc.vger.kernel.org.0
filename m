Return-Path: <linux-renesas-soc+bounces-17026-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B177AB4CF7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 09:42:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3FA01B4205C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 07:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 845FD1F0E2D;
	Tue, 13 May 2025 07:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ktega5MC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24711EFFBB;
	Tue, 13 May 2025 07:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747122166; cv=none; b=XTMzlmdUj2sdmf7A+4uQ7GRaP41Yp0CyIET1O1Lnk/qh0U4QPvbCcZHd7wDCxXNBl0Kjphupw/VqQFg9iTl6gmC14v9xsY48BJTC5N+cxWWhhqQF1ScUcXlF2lLLQn/9fQatgw9J1K/+nsZpp9Fa34uDWAiAQkN2hAgY+TJ8csM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747122166; c=relaxed/simple;
	bh=1zvAcaVW+58ODWkgEa130IxE5WroYchmXUDNj1Zwx/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JmzpAiUD2WxOMCTYtENoCzhskWjmFR79nUqeYYvOPAPtoPt8dKwbRUqMEgzI3y4P5Hq1ADWgYsUr++1j7Uvy8a4w6zNJHlArFr9h1qUtxLZId3+vdsrE0fQYFY1XVTKagdWElw2g40QBYAECyLTXVd4ZzU/kYn7FDfW3mwnRb88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ktega5MC; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a0be50048eso3982391f8f.0;
        Tue, 13 May 2025 00:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747122162; x=1747726962; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D5EeRPV8Vs99JUS6VGOzkhDsirZOs54DCeOjcjXBhCA=;
        b=ktega5MCSdLGJSKVPsyD/mOe+/Lr45sMpLAVMnO+bz9MlfPTJVoG+ojEHQPLbj4E0D
         ZYGIXC1nCCzEVcO/XP8g5fueTSuMuwhgGrxLskIpE/w4tDW+CYp0csd+IOEIo9qK48Xp
         KbkB4u4noQS1tcnURuvghnV/O92kDjHWA9lP1ULZo2T9b5j/u1eNuIdRyIaYrhXoZbSA
         fH9s4UKAF1whnjQG4EebbaG8L2Fcy/5EcXWnXrlZXYARUNYH3YEhCzl/CBnYHbefKdtQ
         oCETprer03Pq4tL+9zv04BSOWSg+4RIaF5bFRRiZ8e+wcY/LLGxBqhgGrM69dsoZp9xe
         OMQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747122162; x=1747726962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D5EeRPV8Vs99JUS6VGOzkhDsirZOs54DCeOjcjXBhCA=;
        b=tCMUSqu7r8+6RJlJVAL6JCQufF1juY3yLMg8LyjE1bsXEhM9XuM6aSooeaOvcTcAeo
         /hsJU+BgD3+OXylq5BEp8eu9Hlz0Ywprtm83ntYu+ZBx3J9D7OoESxRA5QPJBaiTfb2S
         QXbVd9ORBkTqepitmN6BcoO18+ZWpi7JRSTn6f6jAPUhXc70xVQfhhHtwsbXCTSfsnmV
         h1ct+KhWpHWvS7b/T8Gj2fion+NCP2NbcE2BCm08m3oWQOWC+j5lRlZakhoBEMQ+N2qp
         pyWASzMmYKu9e3EOUknfuGoL5X+32C0ykNqwhc4JKZW3I09Gs8+qxiCERfG+DEVc8ITD
         y3NA==
X-Forwarded-Encrypted: i=1; AJvYcCUH3p/g4Qvf4dG8Ug7en3wp88ertuOkxao1G5RgQq88ZTBXYo5MkOCumGG33QCvGJ+w3DxOH0VOrw6BqeE0@vger.kernel.org, AJvYcCVkMbjWtn8WOrx3100gFv6LXw+h0vsMgnMHrV38UXnj/l/W5nA9xLHRlKaoNTRHw5cRGDLnkFHx0IOi@vger.kernel.org
X-Gm-Message-State: AOJu0Yxym9AUDSq/V7gOFRr17bWWaPZ7sQlZytP2eT/ntalQHsBU054l
	tZYHbmocT88CpPhs+4ALCYR+uoboust4jU/1Bwd1QjJEaeveObwHQ9qDb4qQpMhYISJDCDiFBXA
	3J/tWNA8YfatqZ+zXUIbhAOY3w2Tlf3VH7wA=
X-Gm-Gg: ASbGncvNz3DYC378DcFFcelFrT3snePDv6fWEVVnSQK15AYGZtAuLrXYyYxNQzoW65X
	YBhkV7HYAVTm7fcIto0tw7ZKjCEb5p8QoEKz3iYNf71ozC5ySCiAoW8d50eQIkl0Zn99QRTw8pd
	r8hl0sntQA4CLNwDZ7S0ESluQAYMxEQaQW0F4=
X-Google-Smtp-Source: AGHT+IFXL/hE4jmoKOkbg3iKF2uwGvdj6kGxF++bvbioySStQ0aLhC+48d08yuAr/x6Z1Pv/Qwpygt+YjxKd19udHHM=
X-Received: by 2002:a05:6000:2485:b0:39c:13f5:dba0 with SMTP id
 ffacd0b85a97d-3a1f64328bbmr13087447f8f.13.1747122161833; Tue, 13 May 2025
 00:42:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512-daily-saga-36a3a017dd42@spud> <20250512-sevenfold-yeah-d40078a9249e@spud>
In-Reply-To: <20250512-sevenfold-yeah-d40078a9249e@spud>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 13 May 2025 08:42:15 +0100
X-Gm-Features: AX0GCFs3WUCcJVNPxLJlOrk65mHejbVofYUQyPp4oSEDskZVj5B6_lOINocEbfQ
Message-ID: <CA+V-a8sKAVEZDOxgok94YHWdE9Mgw-z3DRa8UTSf=myxe5O9pA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: cache: add specific RZ/Five
 compatible to ax45mp
To: Conor Dooley <conor@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, Ben Zong-You Xie <ben717@andestech.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 3:12=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> When the binding was originally written, it was assumed that all
> ax45mp-caches had the same properties etc. This has turned out to be
> incorrect, as the QiLai SoC has a different number of cache-sets.
>
> Add a specific compatible for the RZ/Five for property enforcement and
> in case there turns out to be additional differences between these
> implementations of the cache controller.
>
> Acked-by: Ben Zong-You Xie <ben717@andestech.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../devicetree/bindings/cache/andestech,ax45mp-cache.yaml     | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cac=
he.yaml b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.ya=
ml
> index d2cbe49f4e15f..82668d327344e 100644
> --- a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
> +++ b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
> @@ -28,6 +28,7 @@ select:
>  properties:
>    compatible:
>      items:
> +      - const: renesas,r9a07g043f-ax45mp-cache
>        - const: andestech,ax45mp-cache
>        - const: cache
>
> @@ -70,7 +71,8 @@ examples:
>      #include <dt-bindings/interrupt-controller/irq.h>
>
>      cache-controller@13400000 {
> -        compatible =3D "andestech,ax45mp-cache", "cache";
> +        compatible =3D "renesas,r9a07g043f-ax45mp-cache", "andestech,ax4=
5mp-cache",
> +                     "cache";
>          reg =3D <0x13400000 0x100000>;
>          interrupts =3D <508 IRQ_TYPE_LEVEL_HIGH>;
>          cache-line-size =3D <64>;
> --
> 2.45.2
>
>


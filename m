Return-Path: <linux-renesas-soc+bounces-20623-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6188B2A6AB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 15:46:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE85058331B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 13:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9707F235C01;
	Mon, 18 Aug 2025 13:35:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BD4219A7E;
	Mon, 18 Aug 2025 13:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755524131; cv=none; b=iXk3cdLkZCoNhqN1J78wZI5jZCXK7+T6fLcnOk5NB6VYbdVU9SadquaapLs6sSz5x3fxL9BDILiP+he8aTl9aDItJk0TjYZEbTb2gxwQ2oEz0DH6cUK01s1u8MH5iqzl3FAhtG0goBgUR2cyZ8IDlCrpCzzetfSndTPKdBrej5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755524131; c=relaxed/simple;
	bh=FFk4lxuD4SyoIsa+aExvl8WUVHmOcdqwXInWm1Hb688=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BL3+u7isgdC0TpZYGvKJmmlKgiRgMvR2uEB2p/Vac3yFCAAC3wqWJVsky/3VqNcKI1+3apd43IybWPVjdZ2K9YLjISMLhU8QxMc9kqoVYgntcZjBXfwe4giWbrpSa9Zrlr0dH2tfzQzWvCC1mIkIzDxmU8eCTSQxV6L+HF/wEIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-50f890e3df6so1139332137.1;
        Mon, 18 Aug 2025 06:35:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755524128; x=1756128928;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2fMWk0aIhiEOHdItL0VQeAoX+vsElOlkJLwpPVBBBXY=;
        b=lO5/xESwCfroLey9KTGCDox9VMEY3M3mq5zjiDoqKzh4SkjUC5+SCUZy0eHrtfCGkl
         IQpYfcS0epSktclfPpSXcBZKRcOci5sBLt7H8mcdIE5JwwdWKweoEcZ0Q40i1iz/MBJY
         m2OavlX2RmM4hYtF5VKx5rcGVbgA9tqTIBeE8ypUKLdECC4E1XJsto0qLEVgiNvgTKng
         F9pJ2Kp+4oRzEjqPS5QmQFOFckOyEWEiQQaXLEpj89kNcSmzWwyxWf0YRqJJiLcAqkN/
         prWYyfEEtP18v9TKGSGWC4QKcHGvW2QTqjZSLTmhuWFswdVgSKHibQbdbc6cs4ivw6B1
         Txhg==
X-Forwarded-Encrypted: i=1; AJvYcCUDBeAeAeXx7bUFdlWT7NHy2jh2lfgO/heb7M/OVVgc60USkokbtx5h87VKHjjDm1SiSz0+VEfn5xPu5u2qgj6fqTI=@vger.kernel.org, AJvYcCUVqmqb2Z1b4ZQ/CauJivjO6ROmKWwDq+JVd9bSrPAJXc5YVQ8J4cmVQSUTf0CCNMSdTAr9D4/pPpP0@vger.kernel.org, AJvYcCWfoiMQehyaw850fr6OTJEBcCN2NwwsU1wKz7OrQr1a2pA2yuzwmNIYvOlw6L8ogKOECOx4BEg/WhUFqkru@vger.kernel.org
X-Gm-Message-State: AOJu0YxZp1OAlJ7PCphTGVullidtdtLkMYDB3OmGg1KnWdp1cHrLpSdu
	5dW8s0igopSQsQzgl3KZlKXbvyi/txeEajNlWHSm6m801nwF3gGWFz6j5OntR257
X-Gm-Gg: ASbGncuu79ClBcPY4AgCirlnrW/wsKcARM6GXtRtHpmoSRoxUDni/l6W3j9f1F/z7ov
	YiameATaGqaYA2GGTi4oywyygmLrErdcJ1k5mz11+4o9YCvBtUaB4sN2epKmuAaqkvvEkinfk4D
	vINuCBsNYG+8qENvmq4uDCeL1KGPTvsBtWfnovJi18JEnjNyM1VEAUqquI0QCc6n/usYEqDJqoy
	JZ2aZhyv9Uobvru05zLHV59OnSDfP+7+GVIQ7bn2N8WJ32EuOFA5wz+gGw1tI8ED1zJhLLfXaLu
	6syvkjOtC8A/Efkt7DFQTqp+c/GDigaCYkA6RSzz/+qHCUBdAOp3sOVeWG0BEyAkJCnQfMcxw6W
	H5804C1UYptq8pLrwqsHsy8zBvfqsKNthzghbFplJbiqmsJECUedVu/zpDDCY
X-Google-Smtp-Source: AGHT+IEnrFieyn28Xurz+VBWN0/z8UHPu0b4A5c+M4N0QI1ecAFdHiTWw4HnazdovI9coeZsMvAnDw==
X-Received: by 2002:a05:6102:511f:b0:4e9:b899:6f4e with SMTP id ada2fe7eead31-5126af21a91mr3638526137.7.1755524128384;
        Mon, 18 Aug 2025 06:35:28 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5127f2269e4sm1990193137.10.2025.08.18.06.35.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 06:35:27 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-50f8bd5ea75so1227741137.3;
        Mon, 18 Aug 2025 06:35:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUTj9xpLIFfqVAvxRHO1raDdZK4jAajexqLAmyLrRtVGckaVx1Zo0YuYWPPZoBecoBi5PpyXFEmzYuILuf2@vger.kernel.org, AJvYcCVRhS4NRvZIhzyEqFypbrFK1oLlA9yhpWAOyaJ7n8NPIyK1U5GT/GH7zud57gcgc3RGz21ptv12V0Fp@vger.kernel.org, AJvYcCXmU57w/iYtURotXKAnR2fYCoh5dLcKOGhKnbBMEPNMMmCyadcOsFUteMXP0dn5lIhAgr7SoqamwAEvvrqE9b7ioyQ=@vger.kernel.org
X-Received: by 2002:a05:6102:1622:b0:4d7:11d1:c24e with SMTP id
 ada2fe7eead31-5126d02aa65mr3973292137.21.1755524127298; Mon, 18 Aug 2025
 06:35:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812200344.3253781-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250812200344.3253781-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250812200344.3253781-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Aug 2025 15:35:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWJCAa_A-2NZMPNL49A6LmhGn7hokU=xfDwytz08pR4dA@mail.gmail.com>
X-Gm-Features: Ac12FXwisJAErPD4k1kvMS8MXvsa-xd52nR7zk7jwgM-sEMP3kGHlS0fXiGbQrw
Message-ID: <CAMuHMdWJCAa_A-2NZMPNL49A6LmhGn7hokU=xfDwytz08pR4dA@mail.gmail.com>
Subject: Re: [PATCH 07/13] arm64: dts: renesas: rzt2h-evk-common: Add pinctrl
 for SCI0 node
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Tue, 12 Aug 2025 at 22:03, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add pinctrl for SCI0 node.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> @@ -5,6 +5,8 @@
>   * Copyright (C) 2025 Renesas Electronics Corp.
>   */
>
> +#include <dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h>

This relies on RZT2H_PORT_PINMUX() == RZN2H_PORT_PINMUX.
So perhaps it is best to get rid of the latter, and always use the former?

> +
>  / {
>         aliases {
>                 serial0 = &sci0;

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.18.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


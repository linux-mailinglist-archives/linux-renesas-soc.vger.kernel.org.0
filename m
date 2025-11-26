Return-Path: <linux-renesas-soc+bounces-25205-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 09755C8A74E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 15:53:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 20FAB4E291C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 14:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 043B03054D7;
	Wed, 26 Nov 2025 14:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WIPIsv9j"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCB3304BA4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 14:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764168564; cv=none; b=SRCh6CS2pTXD45ruy5XpEIshhK8vfd9zXe/lu9BdoLeqw79dE6X5LKMwm0aONqAnCxLbgzwSKFyC2fuWxrSa+WzUJ5QJRS49UvAs5WwiWQ1Esoy4jpi51MX1VgOhOQNhzxO3B93IgAmd7eLXqZ4VeY4hU50PVa0cnNOR3UqUmTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764168564; c=relaxed/simple;
	bh=X90n4/xEsNNtTW5M+ViLnoEWViGG8uOjy8+up5i3LJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VBf/MYj7A8AeLvg9Chb06Gc1rk2usiuEJomg3isZ0tNPrx5ocncdlL/kcpQp8j/yO5Wa/ZTwRXJ4qZ99AsBKOAhe0UwgHS9EJCp8MfS2vx1pW04ubZowVhloUtdqIUq3oNi6OnUft//JcvJivYqozHS1OFyvFxZK9DwOUlgrzdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WIPIsv9j; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42b427cda88so4632731f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 06:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764168560; x=1764773360; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RR1JCp797O9wqgpyCvTsdnJYxWjCsl8jJjbbc9t7CdU=;
        b=WIPIsv9jcg72v0TnOX7Ovj5YHF/9ImpaIzbJXg34bTUKA/9EqRaeVIGVyVALsP6fPn
         52Ln4kLR6aBUA465gl4TnuhQRSUUuySm53BF6r6nq0h6+NnlmA9GaCu44aSlEDmNRZuO
         bbK4mrDlliwQOGYeBymZLvFOwOjkXOILWHJGE0PsKgDhRAHaEGOQpOTq2kKf7plAZ8IU
         400u5Eg2oFaCJLqGzjBTQcteHUXd4wnoGD1DDxq74VM1B8yAIhA0nMgzMzzrRM78uqNl
         4b31dgxzExOVU3kbSl7kmdfX4mQJ4kdAZZq2u1VTC6r642eucT3tqWiRwUQitmO46KN6
         lpeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764168560; x=1764773360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RR1JCp797O9wqgpyCvTsdnJYxWjCsl8jJjbbc9t7CdU=;
        b=wL/mIofFQaP3Gw2+bnLx1AJZ1LpZf7YGOVMKsjRiNfSxtrb7dPU1vQp3JANraki9QV
         V6Qz8ag6mugJHk+oVqR7rAG2lkHPQBs4uQ6gNelF6I/FiEPc8CVQAbZ4WkpyD+4czTFm
         Zd0Fwh3LDpm/j5KJXhMC1EKY/NOx87GAv02u2K1Ip6oe//DEIrC96IOBVa+MSWc2kTTZ
         UPrH8TW8zbSX3j3/DeZg1MdipE8/1ISP6h5xKfn2yXJyT6GAk1YwtPUMztAJw1843FLA
         CLU/yVp2oZQkIBNw623k6t+WINmgd2UktI/1ukVssCQy7dAiCUiuQHbboNGldGQ5RyXf
         Xjlw==
X-Forwarded-Encrypted: i=1; AJvYcCU4EYAimZ+nipvj7iPramWsYTvKCA8CRAe3YHT7Sjl7e8heSIRQGnQPhAsqwVLrZNwjS7/JjJlCPJXQPJcessbgBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQVCIQFEcqDZvwzy2xP3D1IFccefQAgcRNm/LZKMn+DZnnXy86
	GrobV6MOSdMEK0S+ZsqrJVVLYirK/CWNrLW35xHHZjSffbQuL9WHmsJCYCZtF32thVqmOtrBmrp
	azwMgP9JzKXH0aM8rt4/dS831AMgTZZM=
X-Gm-Gg: ASbGnctgd0OhckL4yUj0X4lBlu0917GypNZ4NkGPXgNTMLocSwYLiqciCOOFOUln3Pf
	GgBJa69Zr5ZcKlxg+qb7mOEaJwe+a5Lf/FVA26YH19rsEiQIw2V7d6XytvMPOTpusekRwqimaAC
	kkcnzcDkDDaPoWy7eKBeFtvh9MmZ5MC08VRyGkTcnOyT7NaR7mAZC33bO88AimvL9G8a1ydYnHx
	O8gD5OY3szrUBFvde0Nw/PtAyTJiRmNyy9OCdpcF2pBxwzaT6mKeNK38NuzqztpYKO3C5MtFpbe
	3eUVljuzoZ5YNky6PXyVwz3QtOC+
X-Google-Smtp-Source: AGHT+IF5Rmaefo08E8uWq2fz5qazbUVyqew0MeAiJXekiHj02o9RunhH9RATwPSBkkzppcMA+GzGSjRvFEoUNvQDr3E=
X-Received: by 2002:a05:6000:288f:b0:42b:3246:1682 with SMTP id
 ffacd0b85a97d-42cc1ac93aemr19306237f8f.16.1764168559442; Wed, 26 Nov 2025
 06:49:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125214529.276819-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdXD3f3jN2F7c+yHmEb1C5Byc-e=sEXt_s=UpBQLv_F=Pg@mail.gmail.com> <b3e31f95-fa05-4a57-8983-88f237240068@sirena.org.uk>
In-Reply-To: <b3e31f95-fa05-4a57-8983-88f237240068@sirena.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 26 Nov 2025 14:48:53 +0000
X-Gm-Features: AWmQ_bm_CBLe2VBBiM6Kx1K4mZfwMTLznI-p9OWjk2jULfQ4JKiHB7yS_be1yyg
Message-ID: <CA+V-a8uT+Vpp=3eBEtYm4QC7pbFpebCWg=Obq82kXSknFMkXTA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: spi: renesas,rzv2h-rspi: Document RZ/V2N SoC support
To: Mark Brown <broonie@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-spi@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Wed, Nov 26, 2025 at 12:34=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Wed, Nov 26, 2025 at 12:38:28PM +0100, Geert Uytterhoeven wrote:
> > On Tue, 25 Nov 2025 at 22:45, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
>
> > >        - enum:
>
> > Please don't bury the enum between two items.  Put it at either the
> > top or the bottom of the oneOf list.
>
> Can you resubmit with this reordering done please?

Done, posted a v2
https://lore.kernel.org/all/20251126131619.136605-1-prabhakar.mahadev-lad.r=
j@bp.renesas.com/

Cheers,
Prabhakar


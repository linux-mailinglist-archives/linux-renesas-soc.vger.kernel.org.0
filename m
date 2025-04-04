Return-Path: <linux-renesas-soc+bounces-15406-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 352F3A7C08E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Apr 2025 17:29:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF3AC189D841
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Apr 2025 15:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD2EB1F4E59;
	Fri,  4 Apr 2025 15:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gB809ruG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB193D6F;
	Fri,  4 Apr 2025 15:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743780561; cv=none; b=tWuQB2dwAywjKCRpioUkqFhX7n1xtf0PSyct2Bu+bWWuWwUL2de34hR5kvvmQuSKVssAD0Mq94O/PybciKC9lCF+l7XJsnGPbyXx6xO0OnkG8GZYOdHAv6lnTVt3zGqFYjOJdQMMIhIs79Bsp0jw5OFvbH5fyJZKYZC0d0Xa3gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743780561; c=relaxed/simple;
	bh=uM40pu9Z6r9Jxlm4n/4Au8nRalfUeAyiv3GTqd3/fOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BSPKTZVFXRtZk7oq65U4T5eKdFsV0gzvcrgmTHcYQwB7THFOA8EOHgMjhui3+NQiqr+ATrypnzrU9KexMfOrCXLIRhkoiaEWyqNF25lh0AVa7MzzcZN5rSf9v8BmuXKQ8e6rqNd59MwkUTBqAo2ECptEHm2lAUEBkr0SzFgxurc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gB809ruG; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-523f670ca99so998151e0c.1;
        Fri, 04 Apr 2025 08:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743780559; x=1744385359; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k02HlloNIozkkFN+/8qEPF7E5OVMmHSryhg37d8ULUg=;
        b=gB809ruGJyitx08ks1QuyuNAJpQ9HQ//4fOJtorM/rKJJjhKVdDewr2Lf5oR21QQ6y
         ujOR8IFGGLHVTjYiaWqWtfLTjiJw20Oud1RL1pH7OxP5sTThN2F8pAdV1OrE3lxFfYnd
         UpZdk+xqm6szd3+ikI3RQ0EOM9Rx0LFeGddOtNNmzUrRjNB63jtKiD0CpbppIiD6le9T
         zLf7PHrZO5zQRUeMaF461IW2hYUN/DHniHbbIM1PCddACvoKM2vbuJQpfxHndYLJlIl5
         poJ1Io1xCOxs8cTA06yTNfUjYMy5UPUFUd+MfjP9xGGwr0IFpIAeHUfNKyE7hkN7ponp
         Dr4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743780559; x=1744385359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k02HlloNIozkkFN+/8qEPF7E5OVMmHSryhg37d8ULUg=;
        b=EDs/Q0yt5dwdXRlyZ+lJicj6JmiK9HmZnG7nLIJeGHoLjJgcSdzTD8njki8oad+siV
         T0BCPBN5O9KLcVKmfNvi74KhhoflvkeiVJ1WblUUl1eNHVTOM1rUqcwkI4/BnklmHCbn
         RTRmnQdkc/JTsxURcKqIEUTG63a4ruxmE/XU7jmeeG3fySqrIAreNDVIBFTgPbrWznFk
         IHShgp1cjN55zyMGdNs5G+e0zulXssMOkAfxsPnPYg6IKkm2zafnMPbOl7aw0955xBfR
         Yb5xblanprUmptZaovKuDRIo3z2WcZej9/ma4C/Jidz4yHWcRyrAAcAA7hW4V3gnxMzH
         3o1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUBM0dV3ww+HPi/xQZAUFUKc3ZXsbCTbXUPb1k8BsPA43aN8cbAKVkJFeLoNsiO1GJ9N5mfSssCRdw2X4R2@vger.kernel.org, AJvYcCWMfE67997lZXvBhpJWaCNuFTqqojhSsWYLXnXGV5A5SePPKlnduhsenIg/wKGRDnd6jLTU2zTYVP0IqTcr6itYeho=@vger.kernel.org, AJvYcCX8pGm0XUirq4/xCDU1RpcvEj5O44qov1JX/7tlolJ4J+mJqDPjewbOfok3gv+h7kXy3Vr9ZuhpCtdK@vger.kernel.org
X-Gm-Message-State: AOJu0YyJwyCRDtQYOvTVBvZjGWYwVEDZFUdMpZt3dPRMNTMnfJoS5dXN
	DHQ4E1ZN1GMoYPRd5Z8OSTuxI8aja4bci31CjX7skGWDy/QccHmVB0T2/eYcVawRpTO0hVBAFUX
	JERVCmj5XgqB2CjbNCMdId9hv1OA=
X-Gm-Gg: ASbGncs/OLmaV/RtF06Fe3J11HS2foKubL9YuEiWLHuMU31NgB52gjxqfagS6ncmJAI
	FFPTW+GDp+tnXI+VNU35KA8MuuJWSEUGf+gznZKt3KYnJwYSckA9ThwJvbx11gwy+KAQoql+853
	p+GB75xc31C9vTN7RJxq0KpftSw8Emiy39tXK786s4aEnV5xVQGtcUKMaX+Q==
X-Google-Smtp-Source: AGHT+IHGVVs8EyWlZYsKs9eWMXJxof9zZ51Qwfke9s2QlG6Zpc9JizzFAA318HQ7P7E5ruSFZneG7kVoVCI04RBljys=
X-Received: by 2002:a05:6122:6585:b0:520:51a4:b84f with SMTP id
 71dfb90a1353d-5276444fe9cmr3378844e0c.4.1743780558933; Fri, 04 Apr 2025
 08:29:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401171432.101504-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250401171432.101504-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250402-beneficial-dark-mosquito-6c3641@krzk-bin> <4fa7112b-ade4-4396-b085-16b1c5a7b84b@kernel.org>
In-Reply-To: <4fa7112b-ade4-4396-b085-16b1c5a7b84b@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 4 Apr 2025 16:28:52 +0100
X-Gm-Features: ATxdqUFocy1kzNDdrRv4ErZQ6hx4mOj8G5uoaZwdki_6HbA2bHSD7rGX8QnvL-U
Message-ID: <CA+V-a8sWrZ4gH0_JhPFOR32z5EapkoXPxt0GyiQ4bAgbKkquHw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: reset: Document RZ/V2H(P) USB2PHY
 reset driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Thank you for the review.

On Wed, Apr 2, 2025 at 7:59=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 02/04/2025 08:57, Krzysztof Kozlowski wrote:
> > On Tue, Apr 01, 2025 at 06:14:30PM +0100, Prabhakar wrote:
> >> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>
> >> Add a device tree binding document for the Renesas RZ/V2H(P) USB2PHY r=
eset
> >> driver. This driver controls the reset and power-down of the USB2.0 PH=
Y,
> >> which is used for both host and function modes.
> >>
> >> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >> ---
> >>  .../reset/renesas,rzv2h-usb2phy-reset.yaml    | 56 ++++++++++++++++++=
+
> >>  1 file changed, 56 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/reset/renesas,rz=
v2h-usb2phy-reset.yaml
> >
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> Actually one more thing:
> Drop "driver" from the subject and commit msg and instead describe the
> hardware.
>
I will do that in the next version.

Cheers,
Prabhakar


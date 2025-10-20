Return-Path: <linux-renesas-soc+bounces-23341-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6D3BF3B9F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Oct 2025 23:26:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 363EC18C4521
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Oct 2025 21:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 985B0334C01;
	Mon, 20 Oct 2025 21:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T7MAEpQk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3D933468F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Oct 2025 21:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760995560; cv=none; b=PjenWxJrhp5hP8FRm5e+QPv8YfM858Ju1Da3iA6DIHfYljgskkqkQ5Ql5gzgebnWVyMwexcDstLUo10U8nLWmRTzXE9Y8qpE4gtZ+cjdyPvcX6vxKNxbTDXd6JUZ5qN0jCRtG0cnEQXZa735uNsTDLV4N1ZDugsxscaaAWDbydw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760995560; c=relaxed/simple;
	bh=3ficstr08eO/ho+LvgoSlORtGJi90d5fGOsDZArihyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bdFUHaHPdtrtAAvQSQn3sTNOpOG/V/4u9usT00QuxaS7VBH3gVl1Q6VvPBdjTnwJyB8aBROtpmztJU2tkrBfHqBGP3SmVoc1k1sBeOHpl8aO9UeHg4GlXKGkGM+x8G2E7DEEHIAQXScuFo1Z+yuujvB5KEHblpTLaQWVztDKmMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T7MAEpQk; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-784826b775aso28187457b3.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Oct 2025 14:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760995558; x=1761600358; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ficstr08eO/ho+LvgoSlORtGJi90d5fGOsDZArihyE=;
        b=T7MAEpQkVpGf+lELgQcarCHJ7WfDW76bSwYS25Bouli5STkVhZ0xIorybcjQzOVGeg
         UUcqRPedHJqHdW3KnqaXyyD6v0+bqV/pfZ1Z0vv6jlrSXif1atKM91WdS5nqRv/enrke
         osXULzwnQmS3n0omif9E4ewC0mcmjZdQrxZioeLwZyyLiGEydfI6C1kWtuCK5FmaE2/L
         t4vIVxQSBPy0SQerNyju3kg25mypmH+zDldvugz9FrIJOPWIuEQ8je4ZNFQUAqruXIMK
         QFyeSPmrIwhMtzX5YzjmEwwu1y5eaJJZkVPXvG4jeJTL/IpLKExUUQ/ZIqsrE6w9iv4M
         Gjgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760995558; x=1761600358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ficstr08eO/ho+LvgoSlORtGJi90d5fGOsDZArihyE=;
        b=VphtMh61MOiO1RWEuGvMJ2zce9vq2rjnK4X1kQB5yFGp4lBl+4pWlwHHok7d0QOuu9
         DSnOwCD59IAeMDgOb5lSkxby2/3rKrs44UvMSqGwT9fui3B1Q4aAt3oJ6vlR0iA8goBA
         AGdmKb/z+vq2D0fYnPkANSO+OwRM8TSMQg4GzhA7sokYiYb+bqAlKkCkAYwR3F7eApVm
         5+oubJrjfKup9b7Ruf+UzxOBysXYtaqqFxWfd5IDlRnOWXaNVlwtzf8Z02A4yqsQ7YG6
         KLlnoL0W56//kQeSXqTaFjd3JxXZcGcTTWsPs428JtfdVgv3kYSNI2/STngxCuzUGJfh
         MlMw==
X-Forwarded-Encrypted: i=1; AJvYcCVljBVcq9L5FzyYotlF7xbunsDttoD2p3/2ivIyf+YdIi/0dO/7p7iM+iKigYFoTWU4LzeDRVf1rcXpmlKyD61HOA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw28aN1Ix8FqtJRPGsfSd4ohjC+uh3z5VZNP5+Th5gkGT1dzT76
	ZVmRgqbr3SbbfPzi3XRzsMWxOW3GxcYaHI4nOAtH7ABj7vXcz7cSNle+sqWZCJu2z3Zftd3WkOf
	k8JXiYhLJ58bXQE7wn0borpCqbbGNchGl4vCLvQxOyA==
X-Gm-Gg: ASbGncuTQcDxrB7fQ+t9RZvaT2l8CPXuAOtd2bdGJNBJrTXI4B7V/l50WJpfPIgkCZy
	7fyxZopmSy9uCtFIgUnbLdNourVaWn8Qi6r7CEAUGJ9isCwy3OE4GYS2bXZZvtohwR3yuyZbx//
	YYhRnw3WNTfNpUMqqJtO5fFVDC74521GJtLfmeoijMCpHb0zE7gYlQRhc3lTAg0Hyvdm8fLF3/7
	pXGZTYbSOKw/5Kni3vH62kbWqH1IJcC+ueQDV9V/JRN3NgVomO/TLL1dq13a2CcY4MKZlw=
X-Google-Smtp-Source: AGHT+IFEK+u7rcHcFq2YCBURn2SZqsS5EQVHgyo+WSTkrxddRAm9NFxgRGfkZifZkr4k8srGrUAoxt4PUGQB/cXcduk=
X-Received: by 2002:a05:690e:2505:10b0:63c:efd6:c607 with SMTP id
 956f58d0204a3-63e160d904emr10557853d50.3.1760995557991; Mon, 20 Oct 2025
 14:25:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014191121.368475-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251014191121.368475-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251014191121.368475-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 20 Oct 2025 23:25:45 +0200
X-Gm-Features: AS18NWAZD7qKc4BMmb2MB0EYqlsiZhHQMPkiNfMmUGQwwkY6EwztrFsHH2m1viI
Message-ID: <CACRpkdaNJ4g_yYkwJHORtOdtxgYWMgmN1FZNj6yjDtZyc01CYg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: renesas,r9a09g077: Document pin
 configuration properties
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 9:11=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:

> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Document the pin configuration properties supported by the RZ/T2H pinctrl
> driver. The RZ/T2H SoC supports configuring various electrical properties
> through the DRCTLm (I/O Buffer Function Switching) registers.

I was going to provide some comments but Conor had already given
exactly the same comments that I would add myself, so looking
forward to the next version.

Yours,
Linus Walleij


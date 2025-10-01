Return-Path: <linux-renesas-soc+bounces-22508-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40014BB0165
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Oct 2025 13:09:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB3001799BA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Oct 2025 11:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EFC62BE036;
	Wed,  1 Oct 2025 11:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UG+ZJM+F"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869172BE647
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Oct 2025 11:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759316953; cv=none; b=srxFyAR5onY/Qo2JefpCKMkXeDzE5gYBaXD0twnAIAqDzCBruuXer6NYJ59yDxJdX9lVTjRladvBUdYpon+9nkcxKllamM0mBWyMn6rouaD6QtlUPVmvl5vz2yU4NhrusOh2cOVqae1sb/g7VqCy3PJ9o4mnj99fHgiwM13kbIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759316953; c=relaxed/simple;
	bh=M0I3kYZ7l8Sp3ipz6zF/OIoci5Fwg8ccQA1jT9mCF94=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OZKTzCUiVKWF5/nQjRQMwaydQn7IeFjkrZ/wriMaN+PWswwOnJhBUa5NqyNRaGVPWVBLqRjraazYAy2L1t7yghYpLoYnug3GtboNzDx1Tv2kplxtZIqFtRFXY2xq54LG2e6z3O7eUUWWbC9mnCiS8TAyMbIpx9ZvinvW1yCtCro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UG+ZJM+F; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-36a448c8aa2so59857971fa.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Oct 2025 04:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759316950; x=1759921750; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0I3kYZ7l8Sp3ipz6zF/OIoci5Fwg8ccQA1jT9mCF94=;
        b=UG+ZJM+FjpuVvAmGTaFLeqJWy0XF3RQFC4YmF2iA1WLhzz7tmAjBiW0BKOwQw25Kmh
         pQKhKBo7bMDJXnRSRyFjjSr+pJpKXwg6QJOAS0EpG7BTM5iWAPgRoU+GifeTA7+vcYE0
         mcB8ZBsRDQZ6QAl0fY5a5uPcIdhVUgkLH00kTuiR1i4LhKb8YuYa9oAceHTOot8VLkZA
         WAYJIt5bNF0W2inR3EoGtXHGhHNjt+WEVHiAJ/TRAOjdBOW+CSH0we2eQThfqRoEnofZ
         jIhtNzC5d8ID5QD9umE0m5lV8GVWHMVgNlJsvZQ3N5zp4cWzXv2D8fN+vROmen5GXiBO
         NNOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759316950; x=1759921750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M0I3kYZ7l8Sp3ipz6zF/OIoci5Fwg8ccQA1jT9mCF94=;
        b=hiGmndEEAZW2Er8f6gBtsfGKwVUseAToNJXFqpCSHP14mZAhxvM0G0UzX3AE38oc6Q
         4AHyppE0gBBrTptLhpITa1kFKo9b9gRkVDlL658K8zCXowcl/PS8Wgv54Cyvxtj+hzVi
         +0aDzymVRcvpEs426DenrEcfV+LaYoakiam5ICyN+lCEDhgCApYnGtSOF0gOqzcbsEq4
         1MtT54NMjzLNTZ6Tw+KJmROfhk5Vsy2FC8CC2UJG6N/ZAFomMsahfOj7DeqA1x5jhL9b
         yDmgyKrgXXYJw/Kg84ToV84dv7aQ6fJ5tDQWbMTsOZhaGUXJ+sfMRche7OJtyTwIGXcA
         jCcg==
X-Forwarded-Encrypted: i=1; AJvYcCVW8Sowt30RQT9XcDbQUXMsdQm6gqMz9vTzdeEcgr4Ov5xrZYVGCRaKJGA5+2VaSWJY2OuTtxLv8xwi+otfUpx1ng==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy74EbiljhSjFUuhCTD+ql7yB8xy0kv51HqAthWi086ofR2jWBJ
	4PS19Nvx3G3H+5ZlJnRK2iBpL41ePAHJloI+5XMofX0dEnrT4BqTdkVFigBhyehbDM+zn9i8hnd
	VC/P+0Fq9n/zFbIFQHzMhcfuIscOGiDOWxlgc3mspzA==
X-Gm-Gg: ASbGncuggqykpF/cJ1ucFBmeTmNpiPx6R4Pip7cqEbd3jJoqNym1ud0611OtewSeAf6
	2/KCZ8tb0BDAGIe4fJ8pZpr/Kl9UFg3if2j34/z+Sw+iv3OZXpTtKPmmX7LbXqDMWByC2mOZYAm
	6TF7ihqBJtmFhGVYmGSEs0DfCOYnyv9GihBv0U47+YibyaX33sbQ+m1o845QF1zLr9yc9EK+Jc9
	0931et6GL1A4iJys3Rfu/YQdyeLieE=
X-Google-Smtp-Source: AGHT+IFy9CWT3bu76of2jYZb51gRK/Cq6YQPN0H+wluFSLdTiVauO/GCXAncvl72byP2xI5nDha1WBbbYYwXFWOfJAA=
X-Received: by 2002:a05:651c:1502:b0:372:9e15:8979 with SMTP id
 38308e7fff4ca-373a73b9d30mr8076211fa.24.1759316949664; Wed, 01 Oct 2025
 04:09:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250922152640.154092-1-herve.codina@bootlin.com> <20250922152640.154092-8-herve.codina@bootlin.com>
In-Reply-To: <20250922152640.154092-8-herve.codina@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 1 Oct 2025 13:08:57 +0200
X-Gm-Features: AS18NWDfJ_jX8XpCwqHlGuZJbQzWdgArWZS71xjJ6JCb9D_RiGMuZ4KagfHEr2I
Message-ID: <CACRpkdZPURiag1cUQZ319_QA83u+qOCSRALxpe10_+cTcevy+Q@mail.gmail.com>
Subject: Re: [PATCH v4 7/8] soc: renesas: Add support for Renesas RZ/N1 GPIO
 Interrupt Multiplexer
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Saravana Kannan <saravanak@google.com>, Serge Semin <fancer.lancer@gmail.com>, 
	Phil Edworthy <phil.edworthy@renesas.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Herve,

thanks for your patch!

On Mon, Sep 22, 2025 at 5:27=E2=80=AFPM Herve Codina (Schneider Electric)
<herve.codina@bootlin.com> wrote:

> On the Renesas RZ/N1 SoC, GPIOs can generate interruptions. Those
> interruption lines are multiplexed by the GPIO Interrupt Multiplexer in
> order to map 32 * 3 GPIO interrupt lines to 8 GIC interrupt lines.
>
> The GPIO interrupt multiplexer IP does nothing but select 8 GPIO
> IRQ lines out of the 96 available to wire them to the GIC input lines.
>
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.co=
m>

This looks like some complicated code to reimplement hierarchical
irq domains.

Can't you just select IRQ_DOMAIN_HIERARCHY and let
the existing infrastructure in GPIOLIB_IRQCHIP handle
this?

This kind of remapping and handling is exactly what the
.child_to_parent_hwirq() callback in struct gpio_irq_chip
is for. This function can fail if you run out if IRQ lines.

Inspect drivers/gpio/Kconfig driver that select
IRQ_DOMAIN_HIERARCHY for examples of how to
do this.

Even if your GPIO driver is not using GPIOLIB_IRQCHIP (in that
case: why not?) I think you still need to use IRQ_DOMAIN_HIERARCHY
for this.

Yours,
Linus Walleij


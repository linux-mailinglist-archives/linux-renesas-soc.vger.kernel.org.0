Return-Path: <linux-renesas-soc+bounces-23350-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B273DBF4EB7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 09:21:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 031AF50537C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 07:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE85F2749C9;
	Tue, 21 Oct 2025 07:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b8z9VVcO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2B325A2AE
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Oct 2025 07:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761030831; cv=none; b=sjqSfQX0p6XotPkMJ+50ETfd40DfSVNfl7LpbwEXyv+dW0b0pTrmyPL5+gZ+dRY/cP6pbM8H0irgxnp0JMNw1c+LxDlAlZrbV+i2V7tELzVhhkQZSGzIuXlxKz3TaPEPEPcVuGSS7/siWAboRaVM6KLnyqvN557d2J2DQ20z680=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761030831; c=relaxed/simple;
	bh=shnocEozDkLvjkbbYpfPCYmb3LZ8IOs5v0zgxrtXZUA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NRwp1ScNC52PE2LhKVG1qEuh8/KrKqfI5QFGM6eP1mOZvu/0XJow0+28cv74IbiV92cIVMimjcmXOKzy1aasbRvyFMNzLaU3xo4Bq6BkiyWH6soR/TWpmiZvYqfxwYXIAAn1WN7tvzF/wGg8b+DxVYqba8+ke8iz4K46m1hFpxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b8z9VVcO; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-371e4858f74so62625651fa.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Oct 2025 00:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761030827; x=1761635627; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AuafyjGQlDm3fykSpNADHjSfG+tYdvPkfZzAXtiw/Co=;
        b=b8z9VVcOmmTUtezm8NH6uyAlUgkYd3nhzDiMQfBc/a998Q55CuP4YskghZ3rr4OyPp
         VvvPx+pfflk55QdmUM0iHBu3FCkLjWVluHP+tDFR9iJpGREP6ViN392s37StstEM2285
         aWbrzFcrCfPqB5peC7ChUkk5UkIgR1pfiAasAALOD571jgXg1THRB7ij65LHN8glO/Dp
         MIQQ3DIXB4onaD8yTFFNoaLaW2kReUXR/rDBqQ5ate2w7NQFDtfy//w2Icphk8eXkDtb
         iA1wla7kmHEZSEjcNzt/14DmXufVALtH4WUZ0gceiTCl7zwnWmL2sb9flC98dsNwsiqB
         x9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761030827; x=1761635627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AuafyjGQlDm3fykSpNADHjSfG+tYdvPkfZzAXtiw/Co=;
        b=jxsQFueIZGBn3mVezQeoUYn+9Ww7mV4ELAZsUvXk2WDximw7qx7A+8D9fGflOAQpJH
         O2QNexCt48zge7Cj7iFcFmYkva7WL/GLt//zd6bVliHNowclFLalbRENo08+trKizVuY
         F3aduLx4odT2E0KNtqRBIrGqE5xYKGV2HPlTAfWG7mwGKNJLSN5guz8OM4UY7hUxyd/L
         +Fx7uI709qaOJjCUEDR3upfCMkDdy6svfzWjkh+lnkUj7sKnZyO6s3/kyR0OpcezPo7S
         DDlnP8VOMNo7Eua8Tqk3AWqKLFR0j4hqkUv4VQ16pt6i9TiRQaWtImZ3w9n6tIBWqwmQ
         L+zw==
X-Forwarded-Encrypted: i=1; AJvYcCU7SKRFzxuKGp22kjsE/sf7Cb4pybWabM7Eqsb/R1aVnWSGIa/e7vZiIP3Nga09CRpwGvkdf+/so2ba+ppOq0j4cQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEogbl72qgzk6Dz3bn6dDK33kXGCeowSTpgPJYxjDz1CPiecbB
	dQZ4OjmZU3eV+bFs+czr9rNH55A5Vjesvtrs5Sc49XGYr//AUcxSmysH/z9n2QsQ8KMblgZyiIH
	bKQGlngDNYRbXAy//Xi9CSvYJufawRYl88DHHxfdSzg==
X-Gm-Gg: ASbGncvalgc1dbuMsneyR1RolYIcS95cUrjCfoYPG6K5L88CdFY2nreK177K97/21W/
	pqIGWYnOl6lR2+opxX6yAv1a/WuxMfOx3eiAb9detPQv7X7ncydFi2xq4s4X2BrLkDfjgUunJH3
	Dp8hvNVVyLsRu0x2EgUi433sgZqHH8brV7SvlIJhqMkVsGrDLMloBrKiUP7v89JXydEY6sYmhOZ
	zNxaYDikJgjQlD2Bb0FI4ubmLWarBYO+YZvzqgkvM0oH5+eZTKRlSKeX88dWi91O07SNsg=
X-Google-Smtp-Source: AGHT+IFXewE5inD7CgvvKJbWyXxMNEGciqb/dhdvor+BMXV8b4ojerJafcr1lFElVmRq6Yah9RSUyGHsXMPY7mK9Yhs=
X-Received: by 2002:a05:651c:1118:10b0:376:2802:84c2 with SMTP id
 38308e7fff4ca-377822498eemr50953931fa.23.1761030827133; Tue, 21 Oct 2025
 00:13:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251020080648.13452-1-herve.codina@bootlin.com>
In-Reply-To: <20251020080648.13452-1-herve.codina@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 21 Oct 2025 09:13:36 +0200
X-Gm-Features: AS18NWCX83cFiM9B--nMGIfUIvsXguic5HJGZGgd7PDtP7ogZyhxvv6xui0ko10
Message-ID: <CACRpkdYwG_rQn7eF9QNfApo+h-BGuC8Q_nPyeAKvcuUh+Bf=Xg@mail.gmail.com>
Subject: Re: [PATCH v5 0/8] gpio: renesas: Add support for GPIO and related
 interrupts in RZ/N1 SoC
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

On Mon, Oct 20, 2025 at 10:07=E2=80=AFAM Herve Codina (Schneider Electric)
<herve.codina@bootlin.com> wrote:

> The first patches in this series are related to a new helper introduced
> to parse an interrupt-map property.
>   - patch 1: Introduce the helper (for_each_of_imap_item)
>   - patch 2: Add a unittest for the new helper
>   - patch 3 and 4: convert existing drivers to use this new helper
>
> Patch 5 adds support for GPIO (device-tree description)
>
> The last patches (6, 7 and 8) of the series are related to GPIO
> interrupts and GPIO IRQ multiplexer.
>
> In the RZ/N1 SoCs, GPIO interrupts are wired to a GPIO IRQ multiplexer.
>
> This multiplexer does nothing but select 8 GPIO IRQ lines out of the 96
> available to wire them to the GIC input lines.

I had my worries about the multiplexer but seeing the whole picture
and the nice refactoring with for_each_of_imap_item() I have to
say the patch series looks very nice.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij


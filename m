Return-Path: <linux-renesas-soc+bounces-23417-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A7033BFB358
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 11:47:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC1D919C75FE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 09:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E55130FC2A;
	Wed, 22 Oct 2025 09:47:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0EA3164AF
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Oct 2025 09:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761126422; cv=none; b=NC4DskN370zObg88ekBrYKCVpuu8/1/AK3j/m9c5mmcSJpJeK+ylrRauLFhN4MJBTMWRcHI1EaqcJkop0mxxSq0QLnxb78UMNtvtPl+iviOgFZZ0dOurJFJKCnqvKXLqZkMOtWPdxI65wcQw03wab8sb44e1ioXkqsLIMNutBHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761126422; c=relaxed/simple;
	bh=lH987uMtoK6xnMwA4BbVRHByVF9cGbMudrj/IH3pFUc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FZvc/k7Xwi6U77StrUbwcIrsejfyIsHFeBL86dESgpqpGYtCoycug8cczwH8AsVl0pbDcRiYx8y9jEu8Qdcaks/GJcRrWNG1GGuR5gMt/l7VfwZhFs7nDtCYWj4MJSpiUCO4D9v7FPqOajQ2cP93qsLlTAEKlu5ZNCeEwutTdwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7c2766675adso4042046a34.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Oct 2025 02:46:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761126418; x=1761731218;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i9oPjoXljJJlUVHMn87s6VhA1+MnxIqFzqOvfh/e2MM=;
        b=nuWJeWPPF7IgwgVlwqwstN/dlrED0liGkoNkHTi1N9sg1yxX8JNhFkqE6Xb3ssmoFM
         DczMVfEROCdou2NMtpHgsQ6Nlw9Mx76wOiEI3Ym4+/rz0SrOkT2/7mhzAgW05Z6MxboN
         6jJU8e+HShjDZiPYBEjvzSZ/2gUbk4n7jF/LnPmsNvAcfsdgl8AZNFm3ZW/7/tTg04N9
         L7m9KxU+J/EAHR3R88tBeXEetDj714BbPWS0bViRRR0ojqgu8qWyNkygFEnXw5ReUhlY
         6v2mpOp3SCyFljakTO+SvU6zrLjmz4Fyd3ljm2HSqYrh5kIt4+MXCTxcdauRMnzs1RCD
         NJog==
X-Forwarded-Encrypted: i=1; AJvYcCVp4r7kBp1pL26B/jNlCWLT0mJSUAv7O8+CW/rPFCmEVsAJrTS/k1Sg7boisvOFRhaOJ3um0MP5qpKYRiMJsUW/Ag==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjHfDtUODXKBkRZPNjh/AYi6OibvQvYq/kbXk3c0ebLpxUuRH9
	if+KkwbTJ8lmkHfizk4+ACJ+rB70DnfijT+AkwFH1PbrjCBAq6+uvPoyvdB6igy3
X-Gm-Gg: ASbGncuEfaQrjkkP6w7/O7K8bO9zf2e4hM7MC19e88TVjk+BJh7Caw0l6fQEgDrMwqr
	UEnbrvjlanDCvlbQqrj2dmhpzzKk8HQLDFEP3xCF7UixAxMErpDudTMCgFOiaXRGKISPyAdUTFo
	e8e7sDTDqN7HDbej+N5fCsEyJAi75A+a9Z6GTRne/rLC/JhbzOcU6X21c++E/TdCOYC0/6kAlld
	DVtVegwVfpil5F4HbGz8XfAY6IFwnkVFyUsp4mgOtdbDEitUUEg+1aZ5Llm8suOhrcoJhxFf3HU
	ggchTetxGOLwQwuBe+6fi/6uZnP2XTEsflH+UVQGkiLLYwddJmvPAdghTKvzzFqiFkwSthc9wjR
	iab8JPuGyHuN7TBLnA7I+2KsD/9lkiRq1WoN+5CYRGi+LjhCjoaE6Okvt8tGKHxdcKZZEIr6jtK
	UB/Cne7SYnxbSLgqGq+88j5gSBIJkWLlZaGZOxV8B7E99FU089
X-Google-Smtp-Source: AGHT+IFqMJ885IPl6VyrTgf8iD22aiyb/HSumvGZHpWXEa9XqnpR364mHFJTUNGyXjh3dehtGGvZUw==
X-Received: by 2002:a05:6830:6adc:b0:7bd:1f6f:715f with SMTP id 46e09a7af769-7c27cb08572mr12329293a34.14.1761126418346;
        Wed, 22 Oct 2025 02:46:58 -0700 (PDT)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com. [209.85.210.48])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c2888eeff6sm4465731a34.16.2025.10.22.02.46.57
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 02:46:58 -0700 (PDT)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7c281c649ccso3369049a34.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Oct 2025 02:46:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXqbJGuhufPlT7XSOEsZZP6RktSBm2OsjdmOQtZ5k6swTUgAK2X0VdkHX5jC1Zi+6MQPlqtPYyxZqQ2FAmOWxBwdg==@vger.kernel.org
X-Received: by 2002:a05:6102:a4f:b0:523:759e:b0cf with SMTP id
 ada2fe7eead31-5d7dd6ad6bdmr5856194137.21.1761125966715; Wed, 22 Oct 2025
 02:39:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022033847.471106-1-marek.vasut+renesas@mailbox.org> <20251022033847.471106-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251022033847.471106-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Oct 2025 11:39:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVpVkvHwihk=jVdq37Xi01oh_6O2p9Z2b645ViiuxpFTw@mail.gmail.com>
X-Gm-Features: AS18NWCLE2aAyAzKtAQbH4VnFmVWNSxcs2C7oaQZc_Iov4xWvW3S_J-Tvmn1Aps
Message-ID: <CAMuHMdVpVkvHwihk=jVdq37Xi01oh_6O2p9Z2b645ViiuxpFTw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: renesas: r8a77961: Add GX6250 GPU node
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Matt Coster <matt.coster@imgtec.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek,

On Wed, 22 Oct 2025 at 05:39, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Describe Imagination Technologies PowerVR Rogue GX6250 BNVC 4.45.2.58
> present in Renesas R-Car R8A77961 M3-W+ SoC.
>
> Acked-by: Matt Coster <matt.coster@imgtec.com>
> Reviewed-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se=
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> V3: - Add AB from Matt
>     - Disable the GPU by default

Thanks for the update!

My
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
on v2 is still valid, will queue in renesas-devel for v6.19.

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


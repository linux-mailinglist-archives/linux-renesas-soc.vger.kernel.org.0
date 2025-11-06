Return-Path: <linux-renesas-soc+bounces-24251-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E35EAC3B8F4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 06 Nov 2025 15:05:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC24D623C6F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Nov 2025 13:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A8C1333452;
	Thu,  6 Nov 2025 13:56:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895F8335072
	for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Nov 2025 13:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762437380; cv=none; b=t7L10sF8XYRDRIR5GkmZ/TXQaUWiiIlhif6zmCTlkFCYID6MBw/dCobuKPM/e+7CWirSTJKWp+2jnEhfA33ehgYiiMA1a8DhgOJm13LfyLvG2d1nbgdHJfI04k7tbdKhwElD3ZwwrGnsifRTluHaTrvc4KBzRe1byaxPCMCxko0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762437380; c=relaxed/simple;
	bh=Nb3p1gTky9VLu5X2fI37eQDtW0ejW0klrb32kdSV6RA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LMSTsO+pNWROD9Ior7gsmNznTGUyJdG5S5Ary7NkgmYar/jTKhv11iJ+tlryzq2/L+G2wAu19+boSFl170wpsA4rCSAtEvOP7oGUqt3+bWJOrQ+Yw0VgzP21b8QkO9TPGX1xfzL5TJWkfyUlerYORQbiwTHHnU39MFq1deyo9oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-55966d7e871so544045e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Nov 2025 05:56:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762437377; x=1763042177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q4yuPcnMfQtBgtQPnkkk1N/Kdj4fagyAFwBx7OzVvoo=;
        b=XR4cO75S9YqpFqoBe/aTp0Movy/43OlV9Sb2eHaMQdS3x06heNqSWABO9++iagi0xa
         zk+mSDAA9d8phKsRwbbfm5Nms/LVsDi2FMuVGgiGsfpRovpb8SFxmXzW8OrRn8Kj/8UX
         vdco4M6cBufGxHO48mSkqqKYyuc3gV79dSQ82h4oxvLdBWyFiz8LCfSbrWeRT3M1ijFP
         PAJBTWwYxRt00GxKPh5HPP5feo5yW+XrIR3W2p5YDUn9hH+5LwFn1HAP0Qu1kBUq8MJg
         dDqlD0QPfPmmLEt80ZfYi8kijQ4nTJukLkcR1JbHPC4KrHO2gFvtzAd/nPL0lIBendm7
         JvCA==
X-Forwarded-Encrypted: i=1; AJvYcCX6zFp8JTlsjO/iG014GndG59lNC9CpI8FhRaNWK5Ox70iAh+BAyr5v/4q1EOxbCwuVUhY0B9swLy6VYXusra3bOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdCBI+B4pfgXotUGd/+okUApBBrEDnyoE7JPljShAD8bcCxy0j
	CUi6FQvLnUJcKgbhrNkkFIrM95dad1UitF6+LgCzWdU6xYPGIz/UY5nXmUqPvmUH
X-Gm-Gg: ASbGncuVFt2zM8A4fXsFMEKiJJqW3HgRtFnLhTwfZeAMhdzkK4B4d/TOTqBgTPPhJyl
	1UtBpmrKrpxgnxauQecwjgp177r4vZhoYyGBcjE0jqrxXSSI2EKrJ4gcMublj7pnn3saO0TrfbV
	60ZJIqx5S+7qkAmkGnR9vCVRGy6b0o75zeofl76HF0XnxbH9m8ano78udQ8ihCvsyxxpmP24Zxc
	RfaWKP2PF7bSnMQ5MneoB/OljSQhxz2fBUsXbGujA1+hXXtVDy7bsSfo8e25CP7c5e2bJ7yFxH5
	27pKcOyi7Yg7NvJEubqFRahKlxYIliPdAN+xIiL5cyEmsVTfadviaaRFeoUpBf8yeCNt1zwUsvc
	6Gu28ZE4ftIgd80gD5Ebwg1+HZsEdxwAVNeheSO4v9qQUOPKYzs7SeLC4RbV9NABhOh7nwfOP6S
	bYJ2usotVNmBCtfO4tIRXfgch8rcRhjw9uGaqEow==
X-Google-Smtp-Source: AGHT+IF22MkpyRsF6cmc8cAGg+y/3Uo2xYrph8T3L4qydM/YBvdfKnqauCjdcNTDz9EJNuGHg2VgNg==
X-Received: by 2002:a05:6122:a1f:b0:552:3366:e822 with SMTP id 71dfb90a1353d-55994e06152mr1085373e0c.1.1762437377247;
        Thu, 06 Nov 2025 05:56:17 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-559957fb342sm1328638e0c.11.2025.11.06.05.56.14
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 05:56:15 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-932c2071cf5so1180397241.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Nov 2025 05:56:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXvfW31/gtF7FDX4JFrOda4c5xuibuI2gkoEj18g1c5JN1hB6vzUdbufMa95QSKmuwi8+VI4nkMwTtxXAHEuQvA1Q==@vger.kernel.org
X-Received: by 2002:a05:6102:50a0:b0:5db:de8f:3278 with SMTP id
 ada2fe7eead31-5dd9fe53cbbmr1029811137.10.1762437374166; Thu, 06 Nov 2025
 05:56:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251105232737.1933437-1-niklas.soderlund+renesas@ragnatech.se> <20251105232737.1933437-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20251105232737.1933437-2-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Nov 2025 14:56:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUzK5gMh8V4hjYcfC=H3kfcEeCtJfATr_cmupgqg8xXoQ@mail.gmail.com>
X-Gm-Features: AWmQ_bmbsl231GCYVdw4Orr5ai-by8fSvYdIEmo1Rdt2iWJzgxM7V8AP3oPqN98
Message-ID: <CAMuHMdUzK5gMh8V4hjYcfC=H3kfcEeCtJfATr_cmupgqg8xXoQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: img,powervr-rogue: Document GE7800
 GPU in Renesas R-Car V3U
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Matt Coster <matt.coster@imgtec.com>, 
	Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 6 Nov 2025 at 00:28, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Document Imagination Technologies PowerVR Rogue GE7800 BNVC 15.5.1.64
> present in Renesas R-Car R8A779A0 V3U SoC.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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


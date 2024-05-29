Return-Path: <linux-renesas-soc+bounces-5578-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 238C18D2CFE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 08:16:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC9C01F24A7D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 06:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B35E715EFB0;
	Wed, 29 May 2024 06:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m0gsXUsf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0C415B141;
	Wed, 29 May 2024 06:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716963354; cv=none; b=ToP2r7xhFLUl0iNK2JCkvOTJLSgN4UgdufbkyZXpLL9MYcjcwXUEZi22n3+hv7/gaS5236YEDC7bT+dxNMwP1QLbnzJAdsSgU1A62BX9qj+ryVH4VHZmzww5iSXqPFSMT2wswBXeMbMJ2xS0g+9IVLTWxw0A5SZkxlz0SyMFhlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716963354; c=relaxed/simple;
	bh=7UL5tAAEjUHcX7+hcSy9AlEexa/1+pvr7uBA+iBHPMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hzOInP6puocw9Dw0IeVtZeahWZNU23gjDX24so9GubEJF/LyS/SLxXQw7TLFJ1qma4IGL/lJXvOx0vpkPxOxEVHaU33x2W4FN4rBbbsdV5GZDfy/P43XV8j9ae465phPS0cxuVuXm8hy0VnXmQ6ll9j9QU6qeo3Jl4fTFbFSy7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m0gsXUsf; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-4e15ac35809so502075e0c.2;
        Tue, 28 May 2024 23:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716963352; x=1717568152; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3R+ZHPYoSGUqMaWR0E46qOgK1Bg85/ubJnAG+H028Y=;
        b=m0gsXUsf8dPiJB3Ruh+zifOIqfkoN1RKXTuBAe/4TKWrdydxYqbmKqhM1KLvDCu+a7
         kSt7ww6AcJlC80+T8k54iQyCmVFgCVuReDEdGuC6fx2iFlX0mJSt1h3bqdwLBmX+5jpY
         NN38JOGUQUMZtw5Fe65XSSUJT+quj/kEFEmvHR46JB/VLMvqSK/MDJQ5XI4R54rE/3um
         WQV0+9CeuArtJ+dw00wGnAFLzuHF8Q4V8NqSGB5bpZBlgmBNQJ9bgdQFSQlnu2q4GKFJ
         VX+I8v88fI3HBh3p+5OT1OpUHTs6+U9QVJ7Puz2H0JZT/Ef2rybRZnNuRAcUjIFh8RA6
         r8dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716963352; x=1717568152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L3R+ZHPYoSGUqMaWR0E46qOgK1Bg85/ubJnAG+H028Y=;
        b=g0A2tYdFt8Lt82hJ+Sc8NqQuIoEbzmVX+DS/IHT8FG/OvJVmdeie2aBUuHIjfB3b9Z
         5BiXsp7SIcbGDDvIEm1KAoLt4Z5IMmYuLBEQ8rVeixTIfPWLn9Ki55Ggg5ZatylfN3V2
         BXVjLmceraO56DtpjdHXBhWfYGJqqKyIReuaPZMCCC/f6Zel6pQI/oh5fFdYbo/Pc7NR
         Efg5AiiOghDbcucjkLxH7ALJfMLKI5hnfIlJlr8+dSPn3H6IPYCbxNbLkZjsixVRKuuP
         lG+bw9DkJgB7/uOX1eA0k+6VGczXKWuJIJ3fMQbVj4fA1rLQk18diG8z8xD6lqK2a/zC
         Nm2w==
X-Forwarded-Encrypted: i=1; AJvYcCVd7+QES5QbmcWVCKxHjhsanC3UnySu9f7Yi2INq7/foTdRNsaSh8OwU5yX4F8cI0oDLJrJtabBnZvR1VC25EmqRUnaxuO9h5uAp23Hr5YLlOGU9v9kYFXraiIph5bVLvGpaZSrpiziphDj4/q9nobhylKE8gZnO+c1qB33FIGk3V8SyJtm9b6aJL98TN4vSJclTQn49PRcaqs6fFvU+2XKffAyimMHBCBr
X-Gm-Message-State: AOJu0YxAz0m7dygPpOzPiFyeM/UwTg6YJIrZ53BGi5fENZg9pcagYtOY
	EmqcVDM5elLGPmjyeFmqFZnhoCjybdyRe3w12TwRGGVobPs10SYQoGTUtu1puqXVpM5haeBCj/j
	JUdsrmYDzLtzGTCj2zAzOZCJisWM=
X-Google-Smtp-Source: AGHT+IGxKzOO4a6F70I0rFUbkqpZcal23aCdcbs7VzaqdTx7dCQeaRBwHMmX/dZwoneR9bkFVUJGsfqXYFNe05QHJrE=
X-Received: by 2002:a05:6122:1798:b0:4df:1a3f:2ec1 with SMTP id
 71dfb90a1353d-4e4f021b92emr14545453e0c.1.1716963350441; Tue, 28 May 2024
 23:15:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240322144355.878930-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240322144355.878930-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 29 May 2024 07:15:23 +0100
Message-ID: <CA+V-a8vQr2jxrW+C5VTcmEHmDgNp6S8=3KcAT1SzcKusFaP7Gw@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] Add SCIF support for Renesas RZ/V2H(P) SoC
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Fri, Mar 22, 2024 at 2:45=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Hi All,
>
> This patch series updates DT binding doc and scif driver to add support
> for the Renesas RZ/V2H(P) SoC. RZ/V2H(P) SoC supports one channel SCIF
> interface.
>
> v3->v4
> - patch 2/4 reverted back to version 2
> - new patch 3/5 added
> - Added new reg type for RZ/V2H
>
> v2->v3
> - Included DT validation patches
> - Added a new compat string for RZ/V2H(P) SoC
> - Added driver changes for RZ/V2H(P) SoC
> - Listed interrupts and interrupt-names for every SoC in if check
>
> Cheers,
> Prabhakar
>
> Lad Prabhakar (5):
>   dt-bindings: serial: renesas,scif: Move ref for serial.yaml at the end
>   dt-bindings: serial: renesas,scif: Validate 'interrupts' and
>     'interrupt-names'
>   dt-bindings: serial: renesas,scif: Make 'interrupt-names' property as
>     required
>   dt-bindings: serial: Add documentation for Renesas RZ/V2H(P)
>     (R9A09G057) SCIF support
>   serial: sh-sci: Add support for RZ/V2H(P) SoC
>
Gentle ping.

All the patches have been Acked/Reviewed.

Cheers,
Prabhakar

>  .../bindings/serial/renesas,scif.yaml         | 136 +++++++++++++-----
>  drivers/tty/serial/sh-sci.c                   |  55 ++++++-
>  include/linux/serial_sci.h                    |   1 +
>  3 files changed, 154 insertions(+), 38 deletions(-)
>
> --
> 2.34.1
>


Return-Path: <linux-renesas-soc+bounces-26421-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A92D030B6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 14:32:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CE89E3102E1B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 13:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26E8E3A4AA4;
	Thu,  8 Jan 2026 13:04:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C7844CF2A
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 13:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767877497; cv=none; b=brCEnEFxZ2upOMa5OuZmMaIbE1rWxdxPeQgJh8BDQFd/Nnt26dB7EP2bpEqfKTccWUGg2H09vf33ndcOo2sm1mt4okiuDMZkEnB7OnuV8Huomvg+4YnN5jqsWhPyy8S/28NQE8qx6FDv1QOkihroRYCPeZZNrmuzYHhFF8QfVx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767877497; c=relaxed/simple;
	bh=UZBP9LltUKCgdKghtTpFSSv5shldPOHJBJ+GUwodsig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DjGxQsofhPxVSbrBKxDDI5YBeDbmkh3B/fQeRtmZi/SMASr13zFS2afA4nl3O/aLqkYuIm3UjNUfBJolrjYBqastssWY6c5Ss681qdGHjoBnNKzFC3fVHUHBydyN5qXMHfBukwHPCuB61f3tXOllG+WEZtOyDkFZPhfcXYFxqCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-55b26332196so956668e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 05:04:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767877494; x=1768482294;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rbirfKArtvPXfcrolWVTN+mUFNZXS0ov5PTdW+8bcGw=;
        b=KyP5Q3de3OeXGMxI6PSKMvcRNUBd0L2rWZSUhRAWZ4kBgqgVJxoSXlWNJYDUwbxoHw
         8OqIyZoE5fh+N7j5FGOzX84W0NpcmUyAzSwKGqkaPIH1bULhK8MtbMvO3xUvPLE6J+ek
         ahXdeLrXP8bljvDhxR2R3JYCaEsOvxkCJC7DYGIDSkZdM1erquZFwBY9O3UPAZdmL7sm
         ExudmvNqC/LzJKp7rrCas8JeK2DjPuXx5XCzAOiCVgZDyIrkUVh4ihQUAjXJUzcALpQW
         zzoUjbwX9y3af8sqV1qNJvrYk78wZ4Qh2gYGf5ld5ZOH8aZRMumTXOnFLxlI8czbMgQE
         7YQw==
X-Forwarded-Encrypted: i=1; AJvYcCXnwzo035jM/KLakPKSMuemUPqbFvhAJFq3cuVRctsZWn5PXGj6FSHwCwZq1D7vTuIwUJsnzUAvHxeKVlB4qj0TxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwzrqIp9vyVf8Y0ytdjpD+2krC1VK5O7xdQD0AbS+rmx7vHhQj
	Cfq54lTvnkoDURTo1XPYVE86FHUQst2onk18cKf2ma5jS6TF9RGiJGBVaQSJzOsm
X-Gm-Gg: AY/fxX6yQiEeou0Nk6EXrSaxP6jnHGfNHa+2TIJk2PRt0Oy8DCFVtdFK6NZeZUuGpXI
	1bGibg5pAhJH/V0QW6NaBWw+qm50URr5GcRFPCTQwRl3USX/LXSLeUsV/D6BSY5rEzt6JnIBdl+
	4IjwNI3xwoG/NhrbuJ4xDuigqN+avTgWaUplWAg6mHlGDRtdoYgUJXKXUbDG0s5zBbzSROyjhPI
	CcKRfQMY9eGPoPzl2YX0wPad/XXbg2ik/xVmZNMuaF8wtsDgY0LJl7UQStNV9lasWdr1fpnUd08
	Sr68y/UalYDJ6CnhpLtrI4cWOqv1R7uA7noVC5Z4zWVMuR1ojDfyVyOSHn3J6oJzwQPR7EsJ9rx
	9JXG1kbMRS4N4tIoox+/upUOFTP272V5irmmUQazdivlnDgro71CfNz8rBr4Hbl7psXfBWcBXKN
	DAj0ANCWwZDWCbLAfHEMW1rrEp1+AMvZWKkXVPLmNUFrGiPaZgkX94
X-Google-Smtp-Source: AGHT+IEPhvk4Xnyv6p+TnwtL+ccAv9s7mMAHSS+89Jvlce9RKfwwfQjzhdnFjIb2WdB9DHmu6PqNLA==
X-Received: by 2002:a05:6122:32d1:b0:55e:4bcb:6baf with SMTP id 71dfb90a1353d-56347faf5e7mr1868094e0c.11.1767877492593;
        Thu, 08 Jan 2026 05:04:52 -0800 (PST)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-944124e97b1sm5753806241.15.2026.01.08.05.04.51
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 05:04:51 -0800 (PST)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-56021b53e9eso924916e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 05:04:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXtWTPNAlu5hhgTXKqOk+mcHalCd2QerAdQeLm7UwVYNR8mhvSLwqyJ7gYiL0iFdgIMh6jJZsy0r5HgB+yRpMgDCw==@vger.kernel.org
X-Received: by 2002:a05:6122:2210:b0:55e:76ed:e6c with SMTP id
 71dfb90a1353d-56347d4b3cemr2104979e0c.7.1767877491037; Thu, 08 Jan 2026
 05:04:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222164238.156985-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251222164238.156985-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251222164238.156985-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jan 2026 14:04:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVaYnFnu3Z0F1xCYkCRXRapaSfnyQEjWZjXMN2P-V=xfA@mail.gmail.com>
X-Gm-Features: AQt7F2r2vN35MH7pxD4ru9ycuOzZa4x7pBwoQoSqGriaeLsEyjncMZxDZnkFNRI
Message-ID: <CAMuHMdVaYnFnu3Z0F1xCYkCRXRapaSfnyQEjWZjXMN2P-V=xfA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r9a09g057: Add RSCI nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 22 Dec 2025 at 17:42, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add RSCI nodes to RZ/V2H(P) ("R9A09G057") SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.20.

> --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> @@ -948,6 +948,226 @@ i2c8: i2c@11c01000 {
>                         status = "disabled";
>                 };
>
> +               rsci0: serial@12800c00 {

I will move these up (between rspi2 and i2c0) while applying, to
preserve sort order (by unit address, but grouped per type).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


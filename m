Return-Path: <linux-renesas-soc+bounces-18552-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43520AE0A45
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 17:23:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD766167307
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 15:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE38B22A4FA;
	Thu, 19 Jun 2025 15:23:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51109221286;
	Thu, 19 Jun 2025 15:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750346632; cv=none; b=oqYgZ16bbfPNzT+352iToMjiapxBb8OoccNtYeCBnj2O7UTZVFQdYAtCVowK76FCYVxIDlfyzrTE/9S8u3iavPpWhAqs8LeQ2GKCUNiGRcpY8JJSwJE5pH7k/fdIW+6ZRv+cHkbo7UG5QdUOqT2Hmtala3fdyWjpEMPH/C5ZXOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750346632; c=relaxed/simple;
	bh=4hzd3qcAuOmTfwKYbHqqOWkmquvNqhOl7KGqavZ14sg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CnkKC/2ivugdQ0vP55gdVJ7bv5N/W9aviEj5tEIhoT3snBoL7+Zpq5tjx39C4len4/v9f5tFTYRGmsB/4RlKoSoIzIzuZ7cUG6Lp+djtOg+mTWsJv4qAh1tXOCqCKBJuofnUoZxRc6RRJ4bmpLydwYbJsHUr652qyaufpjOuVb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-52b2290e28eso216805e0c.3;
        Thu, 19 Jun 2025 08:23:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750346630; x=1750951430;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RCVAgGYGyaa7OKZ3MWtLfwo9pA/QSxM2A/hXcp5H6SA=;
        b=RsqnBHd8oZKi7W+jXItpSHT0suexmyw4KqnGTGK3Oo2RVnjGcZTCMk1XGXWVxMUbLd
         OPbfuMd4tQck+4+GM8lPCHcTBUOLW7MGUIlfZYrLtJoqAMD9NtlpcAAYx7pzlXAkzMiG
         ll80NOiFc4YX4ZxRgZGmuzmZfL2+YlfsE1Drv8URPlWCgXTYUDmgGAvgBsHaWho4F0bh
         iz4wLcubNaX86L5e3BfAn6BvTHxV3ooeDs/jVKvJhxfNZTNlvqVUzKlO/8GRgF4qTZYc
         VVajHCiKdTdp+PQ0G3YBMroGadqyXT/tfneHwgu13yHOuoEGoaDNmsHSdbHJKYAbAgY/
         GJIA==
X-Forwarded-Encrypted: i=1; AJvYcCU+D00ooeSHqeWYIy6+g04M5c2okAD8O/HCg2Lzg9YL9OnMnkGg3NLSTX6ZZPfXGGvIFXKmkdFD4Rqdxkyl@vger.kernel.org, AJvYcCVv5HHcplfHzdh6a6b6OHhxlbxZ+5vz02dH1H3pcuaUvvNjwr6l//gSRaRsQRf39K1pNurXaYcTEIE/HdrRhsltRLo=@vger.kernel.org, AJvYcCXPfJDGeOyQiJ5SfVgkf83exfTI8So1+tg1NL1DZ7BswABP65U4BhAW8XEwhn2+UFUVfRy5ZRAvDXK7@vger.kernel.org
X-Gm-Message-State: AOJu0YzROE3FSShhbJq+GdlIGCLAd0HU+y3wblwfFr/f/D873hGCFc/A
	JTgPEV959aylmdqe4Ka34HGyB4oCW6RUXPk6E81GhKeRR7YjdB7GQL7OK5aMe+Nr
X-Gm-Gg: ASbGncs3H8Tk0vT4kkvLRy85w7MLMAO+W+KkcYACRA5FDkEOcDgSA5MlzkOcUa2du21
	VWVwRZ3JGVjvO5lmhSlp/YbzH84RvHTAhkMtZWceQb+KT2/7i5wvvw4qFlqb2+juj7GCwNbcKW6
	5sTpSDjpJH2Wols1oG7PmahFliG5BXqeLwtnvritmEgTaIWtoKeH72QWLFeMxhLOF370AEEmyzB
	D2R0Kploecv4J/vX80uM5ky38tA/IW6ghne8uBxgOQ4uTWr1bfVhVFoRUr9SFbKbCbVsobPDVVt
	FUUfy08xOAyd0dCQr4/ag2QjG2jrtwGE6l1PGiviSsJKgfWV+27DVi8lIu16NG4ZAkLUuZ2TDzZ
	bgefpAmnOR9L3q7QCwOiDE6uq
X-Google-Smtp-Source: AGHT+IFpUjxSzr8gzGgnLVO4J/NJHpbncyrJ9huVu5olc+XkRmtzPJsGb8CS74a1kke3V+vA3VVkVA==
X-Received: by 2002:a05:6122:370d:b0:530:7101:68eb with SMTP id 71dfb90a1353d-531495aa863mr16477345e0c.4.1750346629732;
        Thu, 19 Jun 2025 08:23:49 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87f23915d10sm1747943241.7.2025.06.19.08.23.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 08:23:49 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4e8110ac0f5so242258137.0;
        Thu, 19 Jun 2025 08:23:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU0f25awlFvpd9RlYjyP/s72gXSfNM23U5nZZBzpOqGpJkZdm53cevP/vEJ53yn1PNsEtQfEw9ksfzyP7Fe1eW0DgI=@vger.kernel.org, AJvYcCVXZJe9SU2eGM8NednH6ECml85lzHSLsBhpD8VHgptkFQqYiBb7CMnQQzpbF8YVFtNviyFGfrXME5Wr@vger.kernel.org, AJvYcCXKTw80/gsnmX/voLxp7p2pZvYPMve+ao/uCBLeSA9LZTyDgiaLCTV6uUZ0xo8kaKQ9ZeajTSVwelMWYxIz@vger.kernel.org
X-Received: by 2002:a05:6102:38d4:b0:4e2:a29d:ecb6 with SMTP id
 ada2fe7eead31-4e7f60eb70cmr14268555137.1.1750346629165; Thu, 19 Jun 2025
 08:23:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617171957.162145-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250617171957.162145-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Jun 2025 17:23:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVs-b2k39uTC+e31qGuqVmvFRMeMvYX5BH8V+GQ7Lkt-Q@mail.gmail.com>
X-Gm-Features: Ac12FXwHPFsk05TRosr47sYOkoUYyYdnTZteNgXfR-AJ5EOF9bDc_k4NJOe-IrM
Message-ID: <CAMuHMdVs-b2k39uTC+e31qGuqVmvFRMeMvYX5BH8V+GQ7Lkt-Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Add initial support for RZ/N2H SoC and EVK
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Tue, 17 Jun 2025 at 19:20, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> This patch series adds initial support for the Renesas RZ/N2H SoC and
> the RZ/N2H Evaluation Board (EVK). The series includes:
> 1. An initial SoC DTSI for the RZ/N2H SoC, which includes the basic
>    configuration of the SoC blocks such as EXT CLKs, 4X CA55, SCIF,
>    CPG, GIC, and ARMv8 Timer.
> 2. A new DTSI for the R9A09G087M44 variant of the RZ/N2H SoC, which
>    features a 4-core configuration.
> 3. Refactoring of the RZ/T2H EVK device tree to extract common entries
>    into a new file, `rzt2h-n2h-evk-common.dtsi`, to reduce
>    duplication between the RZ/T2H and RZ/N2H EVK device trees.
> 4. An initial device tree for the RZ/N2H EVK, which includes
>    the common entries from the previous step and sets up the board
>    model and compatible strings.
>
> Note,
> - I've split up this patch from original series [1] to make it easier
>   to review and apply.
> - This patch series applied on top of the series [2].
>
> [1] https://lore.kernel.org/all/20250609203656.333138-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> [2] https://lore.kernel.org/all/20250617162810.154332-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
>
> v1->v2:
> - Reordered the `l3_ca55` node and renamed it to `L3_CA55` for consistency
> - Renamed the file to `rzt2h-n2h-evk-common.dtsi` to better reflect its
>   purpose.
> - Updated model string to "Renesas RZ/N2H EVK Board based on r9a09g087m44"
> - Added reviewed-by tag from Geert

Thank you, both [2] and this series are good to go, once the
updated renesas,rsci DT bindings are accepted.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


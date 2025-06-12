Return-Path: <linux-renesas-soc+bounces-18203-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EDDAD74CB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 16:57:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07B4B2C35DC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 14:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32AC926D4C9;
	Thu, 12 Jun 2025 14:56:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8FF42048;
	Thu, 12 Jun 2025 14:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749740176; cv=none; b=fNmujMD/EuJV1WRYElojzOFcZY0u+Y3i4BWDovTu0dsSNQkeUUFls8u2Nsj7eYNaE1yYZIVapxQYSsPAhPbIEzeCQNzxZ5diSeJoBYVdbYIWQiW2HW+Z31wSDkHhskQ3huTJlgGGKj1Ky/8bgpa56hEBhx16d4BRUARjQHFECw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749740176; c=relaxed/simple;
	bh=CGoXjzFDB/1Z8Xv1H3KLOE48Q8QU3Ay6Cv4lf++PDWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=icq7DUZXm2tz/y/SoKYkLVfXNpRhcT8za4jkwdLklHK7AnCx22O31pbgmFoEI48BknmAt70hHoTWEXVVknupYZf+bwbK9c6aCjkWRmiAxNvOM0t38OC0U+NM+BFZzHYJ/y8/tshAwAgXpf64VVrPBdcrQeeclhX1qWWVCc9qnd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-87ea6361feeso251323241.3;
        Thu, 12 Jun 2025 07:56:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749740169; x=1750344969;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PSo2Tj6dX2cIn3UuG4lnJcfqp8Mx2VmVG5iXY1icOHg=;
        b=WkDiZFyP8r2vA5v0O+Jh8HPcg0spXLcXmHbAj9J9aUEhA0fJIh87ru0V3wPLeCKvBo
         RKFDiyXibDgFXY589HfSeGTESODNiEd+3FDqP2vh6SdqaxeJPkD1UDYoVlDKqy2TykEj
         eurOrPvIt51N2oQaJF/QBU3yr5axNSURWAstHDlfysYd/HGpwvQrHGDEcimYMa6zYGZm
         jaHmy7TKTr7lK7E4CxVnPGopdu0EBr+uuhBlAQG1tC0cxueKAu2hkZ7huDzVRdfvrmOz
         qIvmzrIcpco8Go8d38eLx8o7EYz2YqgpMq4WILzxVM/4BKUjeDi45PvGUyQyt2RRC1JO
         91Ww==
X-Forwarded-Encrypted: i=1; AJvYcCUkuu7tVfc5ywI87FGj3K7A/VSv8nOE8/6/Oqf6WTlQJ2EPnIeQUYxA7FhxxgGVtNDhiZSp45IIHhRwUeTg@vger.kernel.org, AJvYcCVJrOKdkjAREP1OHnpUvWRO7FAW86D488vr6wj0zaWwT4xclMLlaGynX4+HYo0YssRTdnUtKGkTd0lfZekx@vger.kernel.org, AJvYcCVw0RrLJp7jjJl5TCtYIhtSVoANrz904fB1vrnZ+bRRu6GooJ7I7FA8Nx9kUAB8Nz2DCCIixUX1n6DB@vger.kernel.org, AJvYcCWHQeaHCfbvDzEOgmsda732QcYLcBlRXEpLatAMYmUKuHWwukKS8NexJRhAMfYcyuirtIK0ApwGbP3zidQO+MQ/zxA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7NDcGuohj8LjRPCqHu0tYh2xPArYBKeLYBYw/mCbdNpFTYQj3
	7NmG5B8FFkcG9BA6gzgwP2cfMwkWuAyBTHTCvTYSClTK4uf5n+J8nRzTQ4aMAndy
X-Gm-Gg: ASbGncuRO5oFZBIYqMhyWRKWPk8ywpr9ejGWVzXEuUxAd0b3EaQZUYAOrPtN3CXD9JC
	nCRHeSKp6wdFPHX6o62wEM3Fny1OlyvPDurbx76ahjIaNTZEeCJtXF37kJJDyGpfIQq2cJYzLmZ
	g4Qr7SQRsIHX+grPG2VBWY3Uwl+h9Hlhp7xBqnwY2NQa4mydcoL131D1RYBb4xsTiHOGxmP9R6+
	Qwxkj3sTJAL+Vrnc9fjttVzWYyKdRML0eGKs/lZDimCM5R3/bVrivHRGJUb9K6w7q9DDa9yld8Z
	34apHOXCOxAZQHdB3eofA0r8eHktSdOin1Uo0PKaJhOXU6b/7PBmUH7ubtQePD3UsgJzTk6daHC
	EzQSBuH7O2Ub6P9ThPC6dzYYisRmHYFwS8rY=
X-Google-Smtp-Source: AGHT+IHf2VZBw3GM0AcPZqT3ESLzyizMVwHSTwXfmm9aD2E3SmxHMlDzN5umDeDygpPTKIou67ih9Q==
X-Received: by 2002:a05:6122:458b:b0:531:2f9f:8026 with SMTP id 71dfb90a1353d-5312f9faa5bmr2260043e0c.1.1749740168731;
        Thu, 12 Jun 2025 07:56:08 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5312f49306asm330085e0c.9.2025.06.12.07.56.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 07:56:07 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4e7b52428bdso292599137.1;
        Thu, 12 Jun 2025 07:56:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUIBhRZIK1kppFI38HqMj5cTHROHb56rn9CKwq4255C1lZ093zkMgKBUsStZis0A2tM4fp7D1O3Cq8ZTAb6@vger.kernel.org, AJvYcCUnoNKbXTBeyYwuCbwoctJovknRpsiFlT8YSJplKSGbu9QJSyw6PrPH5wIYkpLXol24xIAWNeG5ehst@vger.kernel.org, AJvYcCVVO1UVr/UEo+W8ZQofSyH46YO59LlW0O4WuLtfNFbLOMLjQWD7npPBQAixI9fZD54qUGQIIXC/jdS0hwXR@vger.kernel.org, AJvYcCWa97Ko4LdAZ9hyDII5L97OKmltXP6jcf5vGCPCJ56djKo8fU09TdDx02zEDXAxzmtjzOT/9wjImRN1u79W/eem5CI=@vger.kernel.org
X-Received: by 2002:a05:6102:54a9:b0:4e2:bacb:4d63 with SMTP id
 ada2fe7eead31-4e7baf74b96mr7060093137.16.1749740167612; Thu, 12 Jun 2025
 07:56:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609192344.293317-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250609192344.293317-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Jun 2025 16:55:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVMGHKp+hrFb3v+2vitUgQgVMnY=4jKQpk6JUN2f6xi5A@mail.gmail.com>
X-Gm-Features: AX0GCFv4vp1dBWhrtOjH-95KrfTXaZF2D_YNBqiTeMJzt5WP7ZajZsIQqm39q6c
Message-ID: <CAMuHMdVMGHKp+hrFb3v+2vitUgQgVMnY=4jKQpk6JUN2f6xi5A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: serial: renesas,rsci: Document RZ/N2H support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Jun 2025 at 21:23, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add documentation for the serial communication interface (RSCI) found on
> the Renesas RZ/N2H (R9A09G087) SoC. The RSCI IP on this SoC is identical
> to that on the RZ/T2H (R9A09G077) SoC. Therefore, "renesas,r9a09g077-rsci"
> is used as a fallback compatible string for RZ/N2H.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


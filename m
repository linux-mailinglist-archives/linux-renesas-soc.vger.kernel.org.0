Return-Path: <linux-renesas-soc+bounces-16708-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D21EFAAC172
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 12:35:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEBE93B4D80
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 10:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87369277013;
	Tue,  6 May 2025 10:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z4MUQxlM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8F62459D8;
	Tue,  6 May 2025 10:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746527722; cv=none; b=E/TorhneH/B91HgaGGMJMqcGuC6LIv3MaS2ibHCAYmcFIs1SYKU840AGcBmazkXZZG6sNZK3pAc55stut/vb8ZA5K+PJg/nMycap5kEkwwZPaOlh6RrvdSAZt4P42c5ovaIjUrVH6cjhbbjx3m4WhNtbfhZJL5jSwF45qCADabg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746527722; c=relaxed/simple;
	bh=Lg6c/r45ZLc2VzvpWQQ+Vc+TbzAiOt1VtOp/G8ifGj4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cBr7TexVc+P0rdMwoxa/K6uVpEh2l4Tv5KJgLPnBUaPE7B+HQ7fd7bw7P3mhsLBZTdqgy+hg4nYkXoS2/z5VvSm+7ipxl+nY0H02NvuEImoBlVv0xQfkR9qzj3ahZt53pJNY5Yt9s2bDk8NkkkJyyfo51VNrjlQ9ka4vx1oqNTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z4MUQxlM; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so4059326f8f.1;
        Tue, 06 May 2025 03:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746527719; x=1747132519; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/YJnLiNctgpAA7++nNEwu5/3fDIARsXBYAMfwxersuI=;
        b=Z4MUQxlMCeTDocg4KoBk1E6iRlAh82iL5j3fVkVAVHHZIT1gqUI/BBUsYntRHmC2pu
         1TjmURLGDyPeh++HtuPCrIm9FJ2GoE7PobdH0FcbsBQ+8LS4l6NUHEYttJLDRtv5KkPh
         JRo+ctkyBxK/ECDnPAv12Q4QIkt2IdU9n7gaX1EN0o+wenztR4EM95UcjdmIt6/7Ps8c
         qcwtQnYjDWNz2wwwDWLp6F4U4YXrsYFAa5gkD9CsiE+r8p/USYp+Ze5rofiE89U09Rrd
         4vOz0dnHluKBniWs0avMyO8p7fUJ/gu/DoMQsyxNwjjEt0qu/KFQudCc78SH8c2rrf/i
         2URQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746527719; x=1747132519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/YJnLiNctgpAA7++nNEwu5/3fDIARsXBYAMfwxersuI=;
        b=lnc8/YEPzH0P9M4qnV45FVXuFqOAyAqe1CVyeCPqkNVZp4bBsTDGUYntXO/OJyQ3nu
         PxZldZaeEoe7+O5aGgrbhaMkR67WpiMv33LFGjJMdb/Ob0DozGtD5d8thCg/FusE18nt
         4e0jQbswZW8A7sCBxwZeSyI37L4I96nPaczC+tP3kvkSB9ypLdeJ8Tc3gpCXrsa1PjCW
         4dSYjH0k9Vy6wKRLKlwk6Il4StNukOhEp7fjCnJEcJNbFpK0626UlIz7900QLVUXDKX7
         qsHGFZ4ee7DYKahbp8MhB6thBa5CS4VuoqwzzioJhVrL9WOaUciRBfK4ooY7188JjPvv
         AKuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUm1qVqTP1rnHYz7ObXL5TVmBfothWye+HftvlmnF4mX8CXPlGHZ5e9dWggMKuadWCEBZtsKXMtgQZYMXWSlx+H8Pc=@vger.kernel.org, AJvYcCVeFsDwjwVojqOPkwxykXti3IuwDz2XjInAeUUGXPwTKdeYbf6T/P6oNV11ildVnZTcC7ptKOhVurMO@vger.kernel.org, AJvYcCVzN4+nLdmnr6/LvacLegu5D01M1vSt0fiWFGjPg59N9zFrfD65wa5Jo2ocaF3pJMxdEYz3zch5Z9fSmuTG@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+N9z5DsuZr9b9VV+sDNNwNzWCRfPci0sLxfqRXGxFvjmgqpa3
	iz9nM7GPCddaY/8zWs4edY+PIjC+E/7uOm3alJMrCbKn3EZ8HKIJt/G0tTryos3G4+nTUPw/c5B
	MWPT2e7KsBMNo5Px8MxyY5hW5adU=
X-Gm-Gg: ASbGncvLtkb25n8/GJK8/1M2O8UrP4ffiEPaOPCSsQTYFUXtqYcBiwOzm1jpSw7Y2Il
	AjeUehAFVParTuQaP9AbmodouimLKHvjhsXuqdyi1c4IskNLgvenG71pOW/bdCzzvnqeLpx7NvF
	iQtyqZZZXlsaeEiLm47Vuo/V6T
X-Google-Smtp-Source: AGHT+IEmklDqe6niKrQs58T9dd1L2SMtDhN8WLe/huYzAosYUfCNektawABRIwiE9cfmy/oXGEKHewpo0DpzWgDwZeI=
X-Received: by 2002:a05:6000:290c:b0:3a0:806d:205 with SMTP id
 ffacd0b85a97d-3a0ac3eacdcmr1766835f8f.53.1746527718949; Tue, 06 May 2025
 03:35:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414145729.343133-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250414145729.343133-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 6 May 2025 11:34:53 +0100
X-Gm-Features: ATxdqUEeUXSgsKeMnHaPtItMuXxnNdK2TfeDxpE9x5qqwGLHR3r-CErpP8uTdAg
Message-ID: <CA+V-a8vzxB5GWhFvvBdH96CF_xV0VxpJpDPHXMrb6v7d3aqmkA@mail.gmail.com>
Subject: Re: [PATCH 0/4] Add USB2.0 PHY support for RZ/V2H(P) SoC
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-phy@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi All,

On Mon, Apr 14, 2025 at 3:58=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> This patch series introduces support for the USB2.0 PHY on the
> Renesas RZ/V2H(P) SoC. It includes updates to the device tree
> bindings and driver implementation.
>
> Best regards,
> Prabhakar
>
> Lad Prabhakar (4):
>   dt-bindings: phy: renesas,usb2-phy: Add clock constraint for RZ/G2L
>     family
>   dt-bindings: phy: renesas,usb2-phy: Document RZ/V2H(P) SoC
>   phy: renesas: phy-rcar-gen3-usb2: Sort compatible entries by SoC part
>     number
>   phy: renesas: phy-rcar-gen3-usb2: Add USB2.0 PHY support for RZ/V2H(P)
>
>  .../bindings/phy/renesas,usb2-phy.yaml        |  8 +++-
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c      | 38 +++++++++++++++++--
>  2 files changed, 41 insertions(+), 5 deletions(-)
>
Gentle ping for review.

Cheers,
Prabhakar


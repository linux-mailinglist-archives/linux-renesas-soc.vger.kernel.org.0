Return-Path: <linux-renesas-soc+bounces-25161-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B1087C89814
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 12:27:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 74730346E0F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 11:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07D41320CD5;
	Wed, 26 Nov 2025 11:26:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A54B2D8773
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 11:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764156401; cv=none; b=pCdqo33B5H3v+BWDUQNCEOpn99+y5IlXpB3WynmAsved9mH4XS2ti7bR+2Uv5m9j+K9xAeJHMapsVPlm1AV5z09P4W/YeGnbPOEvUaz6xWO2t1VXALwCQRXOVDDwzn+Aha6PkYf/kDdKraIBLIRW+L0Vf9dE+CJRBIenwkn2GPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764156401; c=relaxed/simple;
	bh=A/WTa594oqG70VFSxqpmEoPIo3eFhE3MtTwKAo9KLsw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iMSYn8Qtutm0n+9XA+kSxhD1j+KuR6y+gq6BMLFedKTNplQfydUVhpp+0ockIyieUCB0m4tnuHVugmMXPCoaiVAOiMvhrGbFSobwC2FMPiAX+PeYH9k1RvwAI+v8EAN8t4c36qCIkPrGkK5fgsofrWV6fCn7S+E3f4MNrMRz0HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-9371f6f2813so1822387241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 03:26:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764156399; x=1764761199;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jtesYd0ebHqf3bGA+srPWLjam08hRq4/xzS8ygcZKPY=;
        b=hWVEUv3nGpppylVTm1mYopeGGookC4wT4i9yLscuEj1gEyUNlvz0J5NFWhIu14DD7P
         YqyndzVpmJjie8aF/VYfufgheL5eLmdUQDygAsXCPxbKFBgbEh6Ulj4kMxkZtAEHMost
         Sq4KAuX+9GAe8wCcnurdUlYdRIUnYU00wZDZiJZBNl29nSDin4wW1XGSMGN8VrU+fEFI
         vfyjgDAf5MELhnb2j9p65N1TOwjM0HNlGviIEbheLfgZmbu61167Jp1eqzCawc52izQo
         5u/xF5nhur0tR/rZG26YUmGkFv74NY7AH9y75ijhyiEsDUtqNXdPuZ2nnufI4AZXuCEy
         OFjg==
X-Forwarded-Encrypted: i=1; AJvYcCXOL1/qsZ/gZNAWqCYz6UmgyY7WmzxyQM5AD8pY+FT1Ad+IkJkVmwMOpZGf08+f+ye1xgI7ijh6ATwuGraffMeH2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvpxnANO9vGJul+YRf5CekoXl6sXQjMESH0pwGChMYSrramw4y
	cXujfb95s7B55BVo6gLMT1AbBTlENSx9UUEWmnls8IGx4LSrAeaBvRauM0hfwnE3
X-Gm-Gg: ASbGncs5lwj9GUzH728qRU3XE5+YrCsnqfG29CDlZrbU9r6I+1y28/91xJm3bjTiPk9
	5aw5NZRsQZud4snRn/XjTRa5Sk84PpLR3cIISb2MKJd9e2S0/IrhcfaAPN4K3JP7TIISGGFCHvx
	16YNCQHQAU6oHmektvCt6MGQUiNJqCjmmBLjd6xFrNooxvOLAuoPQ9lNwDU8wjZbGUpwV8dibwc
	foc1ThXu21xFcb9xdQbFHp/1RMq62zTY9Ayv5KUjSN5PDp0HCrqyv19ofASKLtBXijksXK8c6dw
	IC37+/MANhg/PD5zGOHXeCQXL9jyfYq9GqTiLDNCYLAanE1Gh3LlxKalTcFgjqRiH14jZN9RSR8
	HHHkfkfJqQTKCCVjQS72oULbUctu5BfkEo4czQlXpZEDOAkfSbpOOoyw8hkE3Q2HIUR7NxTF66W
	voDq3x54z9CEUzbbWWb7vJPQKQDeC9K98xYu5IXtT9Z6OMeQx5
X-Google-Smtp-Source: AGHT+IF4fzHTDTv/S0/gRUTCpG/iNS2k6u1p2QmutM8yzVEwfXV26xlVZcT1oMNXxCQ5I3DU9gJ+0g==
X-Received: by 2002:a05:6102:5a8d:b0:5db:e851:938e with SMTP id ada2fe7eead31-5e1de1ed4b6mr5212685137.10.1764156399017;
        Wed, 26 Nov 2025 03:26:39 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e1bd8eb2afsm7573162137.1.2025.11.26.03.26.37
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 03:26:37 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5dbddd71c46so2545467137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 03:26:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXlc2bXhQhGfFGYr+z2vgbn1KrPzaV6dDO+mQ5t0oDGNsq3clLSxu4DQ0QNxjqI/1wsMwGDFuOBbYgY+IHRn/+IWQ==@vger.kernel.org
X-Received: by 2002:a05:6102:5805:b0:5db:fb4c:3a89 with SMTP id
 ada2fe7eead31-5e1de25fdc1mr6714449137.19.1764156397436; Wed, 26 Nov 2025
 03:26:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125212621.267397-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251125212621.267397-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Nov 2025 12:26:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXEi+omKdRDx7qPCWmpssg09Yc_5MQjj+SDhhCcjL3Zew@mail.gmail.com>
X-Gm-Features: AWmQ_blz9vjpWn4fvUTyaqQkhCGAbdGKR4rE9qC99IBsh-eudnLwfjzrIWdxkZA
Message-ID: <CAMuHMdXEi+omKdRDx7qPCWmpssg09Yc_5MQjj+SDhhCcjL3Zew@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: dma: rz-dmac: Document RZ/V2N SoC support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Nov 2025 at 22:26, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Document the DMA controller on the Renesas RZ/V2N SoC, which is
> architecturally identical to the DMAC found on the RZ/V2H(P) SoC.
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


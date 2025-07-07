Return-Path: <linux-renesas-soc+bounces-19315-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CAFAFB2AC
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 13:54:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 000D14A1F80
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 11:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76A3029A30F;
	Mon,  7 Jul 2025 11:53:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF5D1373;
	Mon,  7 Jul 2025 11:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751889233; cv=none; b=jswdyCMLUlstKpo0Fq3bOsE6KSYjVWWzC29aOlaF/heOy5UiqXERmufnt1FK97dQi92coRk2UPy5L/q7N++yvI1cv69gu4vQ8ETXMyKvuuDxO6nVuJlh7BaWj6G5BFK3J/SUClrBrMY3KJ/Pwbt4o/n0WrzuDYB3PWOOW/CyvG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751889233; c=relaxed/simple;
	bh=SUdAckIX6JFLKFdBULOhONPC7L7JiMi7kh670CiZ9Bs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=puoiEu2kze9caPN7V0A7QkxNOnu0E/YDO04D/vAURTEHEdI5B2bpOPKDnSPSqbUqaSpPcbbrmYsUda/lllA5ipZ2ogXLT3R8c8J0llyVWTfS5CbdBywDTPXjsydz55BsivHAbqZcOlITj45BNICJ8vhVGTB8f1W81rZ9k3PSaWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5316a5e4c6cso1186127e0c.1;
        Mon, 07 Jul 2025 04:53:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751889230; x=1752494030;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XREl3CAYjrjwh+E3SUo9JtGDQ0vSgJb8QYmpZtApHEw=;
        b=gC+vaLm5vzMdcOOHqzSsDPBVW2YYlWyfiZ7LSvo2FdmUHOR3Nb07mn1JXTckKjAIhK
         /V87Wq1+BgBEk6SsXCkIRvtEhQBbY9wwekCNpsIEpwIHJBIMokPWCp70wtK5C697oxX2
         /xqfu7/WEApWNswzfZnP7A7Sdbfe7JGtiIfT5qdxocVPH6497mT63kh3D0nCBNBIDeFa
         3LeoJF5xLKR3O6VaQYGKQsfM1+A8dNnZC6DFLZOCrmbclbgNl2x292L6Gqp5R3g2sFzr
         NMbOO2RB7NsIpJCp961gw01IH1g3nxiLtg47Q1JSK+lEhv//JmFWjZtJKw2j2sUuxK5/
         B71A==
X-Forwarded-Encrypted: i=1; AJvYcCWhW7uw1WJO1q2fJwJVXwFUwW/hSrIDGL8H25i5S9M4rsErsGw0ED4sO9sqbxCgVUxAUxt0wU9EeVs5kjba@vger.kernel.org, AJvYcCXModG2jHueGH2QHtkQaVNZ8fsGrhkMpHp4hHoBpcbdebKbvtrdh3OxIMNGgxD+FJb/ZyijG++jKauMdUMhN/ik588=@vger.kernel.org, AJvYcCXYbYevO0rejxZ5ZHudHTWIToaUUnJ6KGAURS5uiEo9dPKDkNxx1mm/86+Gs4TD7K9YGPnx+5jI84Wl@vger.kernel.org
X-Gm-Message-State: AOJu0YyN7xH4mj6aKvn77Nw/6qLDOYcstDjP+JwF4Djlh/6Q8EahDue1
	3mkNqHW9hZthDhvh1VN5ZnoVTkUUy2fEdkhIaBoSDlt0qc+zBANcPIaq69w837ov
X-Gm-Gg: ASbGncu4MD0tnrvsHnipKReJnp3c6SpKnzQ2/NCkIqNTK/bo37Jr/tJ9tegBkKAJENS
	GwnTu7OYMtu7Npwj1zCJ59PryKZ7l2rL4NE7LAj7MNzrTVZFOMSDQHJA5NMmQemGcQ/VSQUcK+D
	cRfHnYa32fDOIQKepMV1wGWYyFl5UzQ+JeqN/EvkwSq0TrCYwRJVaY0FdYIFgG5qEzsbJAB5YY5
	O5gQnmzgEp8QeAyHyUc4dM8OfbxQ9n4GWTXL8cf8S2D0FTeltm84Pi6uKgW5oTd2ngjRMfflGJb
	QhFz3ajpSi5ltNmsBnQY8gKbW0dfoWzd+gjiNcjIB0QLFbFg9hLXOz0pdZf5owF0uyRJxMkHVTz
	JEGadnMhm/sYsnsM/gdUeCFLr
X-Google-Smtp-Source: AGHT+IHODLBhgFXAi1FVxJGBAelp7BGYCvMtgxZdlpYt3DMBzje5anIqS3SihIsd02uHgC1S6Vy2Lg==
X-Received: by 2002:a05:6122:2006:b0:530:66e6:e21a with SMTP id 71dfb90a1353d-534f010fa5dmr4333120e0c.3.1751889230122;
        Mon, 07 Jul 2025 04:53:50 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-535bd707b89sm67101e0c.3.2025.07.07.04.53.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 04:53:49 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-87f298f3508so258779241.2;
        Mon, 07 Jul 2025 04:53:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUada/H12v3pDS6C8/sboFPYEQ6My5OXf6FrkrxXMrUPS13pMa9haIRxqy6MOmmEtCuWlSH+/cFBWpa5fXN3yb+M8c=@vger.kernel.org, AJvYcCVSN8l0IKBKzzKdHapPz8cAcOyRW3x1cyGyRHcowhv37Bay8YQ1lvI0uBIRH+iVkk+pc7YUvqXCsaoz@vger.kernel.org, AJvYcCXttpiFcOVPmvuPUSmblXOvoSPSqUcibJgAH4UksnuwIRePRVc9qWPT89+5X/ak+r384KE+lbxcWG/j/vl4@vger.kernel.org
X-Received: by 2002:a05:6102:3c83:b0:4e7:4f6c:b275 with SMTP id
 ada2fe7eead31-4f305b43306mr3917519137.21.1751889229738; Mon, 07 Jul 2025
 04:53:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250703235544.715433-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250703235544.715433-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250703235544.715433-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Jul 2025 13:53:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV08RBHoF8s_-5e2ad2qPWtzJ-tecpfE3FcToETSJfP-A@mail.gmail.com>
X-Gm-Features: Ac12FXwjUY98XmDrRJvchVD7Exswu1TYXPvQnZ3xlKDPvnzrivenTWi01JCxQsw
Message-ID: <CAMuHMdV08RBHoF8s_-5e2ad2qPWtzJ-tecpfE3FcToETSJfP-A@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Fix
 pinctrl node name for GBETH1
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Jul 2025 at 01:55, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Rename the GBETH1 pinctrl node from "eth0" to "eth1" to avoid duplicate
> node names in the DT and correctly reflect the label "eth1_pins".
>
> Fixes: 802292ee27a7 ("arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable GBETH")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


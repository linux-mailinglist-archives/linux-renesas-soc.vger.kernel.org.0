Return-Path: <linux-renesas-soc+bounces-11263-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3235F9EEC3D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2024 16:33:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79650188CA3C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2024 15:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F169C2210DD;
	Thu, 12 Dec 2024 15:30:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C982185A8
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Dec 2024 15:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734017437; cv=none; b=e/vHoHklWgY1RSw4pGTDfFl2pG5dcGMmk7QcvB3u28TLp+C17Q0iouV6iNuMZJ1XENa2L3gU+CRB8OG+F+DdmMvb2mC+YSOT2uFibBUKd1QKVagUPQsYBpgXDZBQ9pvaLOTLMaXHCHPvPB8ca9G+wDKL0rvLPQbI5T5ZJuVnf+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734017437; c=relaxed/simple;
	bh=FVooZFmy2hqtUwQnrEUD9A4X7ogN2fPXKCHrlXvS//U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PVrPTU2emAb+vRdjnu64aswmVyGwrV0lptX9TsTZX6zTGzsg2+EMtYgdwb+48fcYT3BXz5macQ8II383z25DRJqr22Am69inIc9OEJRjG22wlFWGRqv7lQspDa1XB0/Od2ofIHvJqEfgJbc1P2jnDhPfvVPDU/Yutvc+zjUfByg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e0875f1e9edso473424276.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Dec 2024 07:30:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734017435; x=1734622235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bP6eFlijx6bNYNtPPyI3uWrXDHkT7uSRGBm8ACPpkB8=;
        b=gpeZAKJ8FSWtSL0b7ciLjE/CnmYrhwvoBA67/HM39oW56sbT6ZmP2tj5oDXkJdBK9l
         x9AOaOAI7TNX81yI0AJZwzRFJcFaGSYf5Ejxv+XkvSVX+j+17RQQp/VZpb5cqhTIQfHT
         8nD3CXn1oo2G//jKaFHefZHYHDU1tnPCIS7OaQyKQEgw0mFrRJHEqpSWaM6TLfAT5MHs
         NAZNv9rfI2KCsIVGikeRejnolAdWBrVZonXZN3DHehfp0UVIp4AgNJxJhLGD7/58y7Vi
         GfJ7CGWey4xZrLpYBD/mr7vnYiLKueswM4Oq6rdUTRAJB+ueTMpML5yQjlh381Wf18t3
         Gh5w==
X-Forwarded-Encrypted: i=1; AJvYcCVeSeVjFqEtXY6h2zoizSS9rKA74otBCZFoE/cBeIiQt90ULW8rGPayPRf9P2bykBX/XoTBTnZInmnpL58BxdvlWg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+zSL//ZYvjPiJ5ZxvAHK6HDzagi6Ulcp17rjDe1P/KYg7LU+N
	nH3r6Vi6LeamSxC4e9jLsCqnqkYJfrjg9b3K6gfG3RDlXRdqEy0USKDOCrNfRlY=
X-Gm-Gg: ASbGncv4pxmBPLP8ZWnmaubVipqr75VIBRaP1u2zmRmPpjmzLYKK4JEk0MAi3lx51dt
	LRbQQi50af1d78uYKyPXJFsJQjoyT/79xl44Pjdpd3+OCvAAP9Bfvy2scz4ZfnlDnGb9Kc0/U9j
	rC62eYLnm3UjukPd+BJresRyQAhzkbN8vAE2REPRIlRMYNJT397z0iRRHz0orkb4TskG4KUNDJv
	qXi47XaZG3qMLPEIbyFgBnGcLMgelT+iYUq8iFd6HMPK/UGqzHP+10Nx6EsgIlKgfpv4uMACmAp
	hw598NSZ9IWKCIJE2DImpgI=
X-Google-Smtp-Source: AGHT+IFjJ1oN2HkmXIbuGm+Jl3kyYaGqWFPgJ7VnDQsiOjOyveTXYZ63M86nymOIEDUfyQDyVxLpUg==
X-Received: by 2002:a05:6902:2701:b0:e39:826a:c742 with SMTP id 3f1490d57ef6-e41c9083f6fmr871308276.43.1734017434553;
        Thu, 12 Dec 2024 07:30:34 -0800 (PST)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e3c94b7ac6csm816204276.55.2024.12.12.07.30.34
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 07:30:34 -0800 (PST)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6f00da6232bso6708147b3.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Dec 2024 07:30:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXWVw4aMwxIc3Ng4MqExtpXQrtwIlGTqqG+1WeM6zIsQ/peDC1SFh8/EETPG17OHMkutKno82kB1Rn+euD/ABREuw==@vger.kernel.org
X-Received: by 2002:a05:690c:4483:b0:6ef:820c:a752 with SMTP id
 00721157ae682-6f2752b6a6dmr7690197b3.20.1734017434035; Thu, 12 Dec 2024
 07:30:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241203105005.103927-1-biju.das.jz@bp.renesas.com> <20241203105005.103927-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241203105005.103927-6-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Dec 2024 16:30:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUbH7-j3GzkWu9j16Gn4GCxBPnT71ewVMV8uaQ-VyJVyw@mail.gmail.com>
Message-ID: <CAMuHMdUbH7-j3GzkWu9j16Gn4GCxBPnT71ewVMV8uaQ-VyJVyw@mail.gmail.com>
Subject: Re: [PATCH v2 05/13] soc: renesas: Add RZ/G3E (R9A09G047) config option
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 3, 2024 at 11:50=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Add a configuration option for the RZ/G3E SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.14.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds


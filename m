Return-Path: <linux-renesas-soc+bounces-3462-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C2A871BE4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Mar 2024 11:45:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2649284D32
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Mar 2024 10:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C59FC612DC;
	Tue,  5 Mar 2024 10:30:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB1760EC1
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Mar 2024 10:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709634622; cv=none; b=OhqsB3N5ivfPn8E4hWvt6orBbhseqyfIbtFf5ELKBuCfY4b85ZTnTLCANpx23aXHaaZlm8hxKXqOmJI1uD+x8+SwQNKoN+7Qo/z9+SYVL2VDZTixgfJ6GZ8hf6bYyOuQP+n0YnFiVa790jkmrYSe1wyYngmDrVS/WH1/3vWp31k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709634622; c=relaxed/simple;
	bh=fCxF0lGw0QZdmV1LOpZ1E4rEC4fK9u58RqAB6MriyBw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XP7bYi+awouabnxklxnp40DosNtkCzXRu1YOK8IuB6ALPz6EMf60I+KERBP7xNOPCiZo9r810cggqn7I5NOVnUS/nZZzmxad2DaglBZLGMUvOQGOzA8KxIMYUbUEk/GOhdqsubaOjh2jfCoR+pYXnCOVmOt3KrKCdN/tFJWURyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-608c40666e0so49737057b3.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Mar 2024 02:30:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709634619; x=1710239419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zexQvIFFzZkQU4wTluPSZf5w/ZNvXeNMkRgCWjmotlA=;
        b=kd4fbv+5wAfJPra+Iwt31PIsq9jsAzk9WNrc/8r+pr6fgdJcu4K2KCaYukoKvlYy+J
         mr3KM9MoAuDMTohTElTIePBdG8pgqgbCEGzLcZvbxCCjagjcifqZpog32VXKAYlflQGa
         /j2/hGhrC4rkWeXT+CoUvgEDuo8/YOxLvUmj2WrgwM/uLL89punjRAyaIfsZ8yqbGzee
         /NBuhLwvXKtFp9K2vhf1Gr8Qzu6gBHBgpvJvynjLZkg65qPzpQSnGFQyJYqacCanrVZJ
         fblEYHlCp+DW3EPQfvro7OTIva0ye3GbEiH/JB/99BhKbl+jOvXotKFWi9x5kXoMmKbF
         jnIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTE2sTfYVRp378RqManObmTOkyZ93Vu0ktMg38BH8PJInFWUNMTWbv5veOStPxBzbswFPbz0ckuV82uULb7AD909VqSG7JfueEJnZHcJBnO2w=
X-Gm-Message-State: AOJu0YyI5Z6qbGlSiuUeyf65rZ8Emf/ShYgbvUCoKWSBxsxaMLPtPoxl
	1gfmbT1gVnU3XsKGqDqIT36VBadg0mkI9p+lWpJ7ZfZSJtahCgz03jFRAiUhwhs=
X-Google-Smtp-Source: AGHT+IFpqNQ0Lx1HesqYhtMxYVgbwSzkXmeZtdXOJYhiNvPLA1B9t8i7EgEj3T8rkD+6ePrzAhL8uw==
X-Received: by 2002:a25:add4:0:b0:dd0:1276:c2d1 with SMTP id d20-20020a25add4000000b00dd01276c2d1mr4545674ybe.35.1709634619094;
        Tue, 05 Mar 2024 02:30:19 -0800 (PST)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id x3-20020a2584c3000000b00dcb02a7e071sm2549003ybm.35.2024.03.05.02.30.18
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Mar 2024 02:30:18 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-607e60d01b2so29931107b3.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Mar 2024 02:30:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXTW/EHakimmdOll5cYxaT8j9YaPQz5T4QJei1uWiIl+8T8w1qNWEC1VPW6+3Wa/Xqn1jmmM4D0C22faCgOng2oHoVNdDTzbPbZ9jezx3yMM8A=
X-Received: by 2002:a05:6902:1364:b0:dc7:4ba0:9d24 with SMTP id
 bt4-20020a056902136400b00dc74ba09d24mr7728451ybb.59.1709634618478; Tue, 05
 Mar 2024 02:30:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240223123127.221610-1-biju.das.jz@bp.renesas.com> <CAMuHMdVaK+8bxXpmExbkGGvcKwhLmjZ=ivQo1Xfc9VePbkgXcA@mail.gmail.com>
In-Reply-To: <CAMuHMdVaK+8bxXpmExbkGGvcKwhLmjZ=ivQo1Xfc9VePbkgXcA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Mar 2024 11:30:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWdBx2pz-YxcK9iuuthfD9ro9C=Bz=+ctc-mmtSnt7S1g@mail.gmail.com>
Message-ID: <CAMuHMdWdBx2pz-YxcK9iuuthfD9ro9C=Bz=+ctc-mmtSnt7S1g@mail.gmail.com>
Subject: Re: [PATCH] arm64: renesas_defconfig: Enable PANFROST and Renesas
 RZ/G2L display unit DRM driver
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024 at 1:34=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
> On Fri, Feb 23, 2024 at 1:31=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.=
com> wrote:
> > Enable the PANFROST and RZ/G2L display unit DRM driver used in
> > RZ/{G2L,G2LC,V2L} SMARC EVK development boards.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will apply to the topic/renesas-defconfig branch.

As DRM_PANFROST selects IOMMU_IO_PGTABLE_LPAE, I will drop
CONFIG_IOMMU_IO_PGTABLE_LPAE=3Dy.

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


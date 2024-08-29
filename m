Return-Path: <linux-renesas-soc+bounces-8484-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D0C9641D4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2024 12:32:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C758EB2515C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2024 10:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE60618E750;
	Thu, 29 Aug 2024 10:22:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2D918E049;
	Thu, 29 Aug 2024 10:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724926968; cv=none; b=bJSlyHQH2at+yzy4FUBqaPbDyzmAXiG3ajOF0/wQZ+wJUBgfcQnjpJI+bDH0ztKWszV9LoYmDc/xd5a8vtqOdVx8BD0Bc4ptLXlkagoz8yZm2QXAdvfAI+ywRT2EFelC5TF4nF+yxb24TAil/qBuWBmNdZpb/VHeYOU4orp2vmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724926968; c=relaxed/simple;
	bh=0BNuGcgkcU+ehKN3h4FXZQm4KAXR16FRY7wqca7jJhI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jJAuHQ4qpaYD10NkZcBOsBcQ//xtI7yVYsQJV67C005sN7nSWxHGusaiiPT2smghRY6A5V+F9UmLP67T3y3bT8V+NsYigXfYT8tX04cZTZ9ErrSHTAvMrsEMgCMGELxkEMaTLmFV0e+RjrKg2EriCm8XBcUDzHZQ+tuX0V5wZmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6b2e6e7ad28so12963847b3.0;
        Thu, 29 Aug 2024 03:22:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724926965; x=1725531765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c7qy+XTA09rj68mLURp0BZoTEpHCb1uIrMTJ0xj9YGA=;
        b=jT/VrCQyX1EjMAuj0N0H3x3kWpgXN9bJALwY/57ySpf90Zj5y6zIV9EbtuBLTrrLCa
         d9sA97ygVMA4TdsMAyCTnsicwwZwII1OhSVyFZle8Hjsi2nOxWxfhjc9qivY8Emvi0BT
         jtW41eG9rKSgLEbxV6uyLJr+cc7384RciBfZLnofZgFIdP2rpPu+x5sCUNYe6tp8bSUt
         fY5PaHmeZcCEzxg2JfxoIRazWXroc0G7yEk28vD+YPlquuRnyyqXgxxpZC/GgHIM2WLt
         QnOSE4WE055dqbMx5s10OpU1k2alMrb8AC/2muEungAcvln4O0hCbAZuW1bpSsifQuE+
         xaiA==
X-Forwarded-Encrypted: i=1; AJvYcCVKe1/8bpq9+5jqQC+dvx2mTK7rT+8KkagUBqXHEANd+ZkSAmb8p14tJcjt4Jji7YHha86D/CCtU5+pxonVdc49nq4=@vger.kernel.org, AJvYcCVc6FXvA3H6gX4HKiCq0++wexjkBskvHVhnxp34lBNIKmIqfV6cwUan9G0Eo7vEaP1WNiQ8qimm7noheVbv@vger.kernel.org, AJvYcCWHSkmW0ykGfmz3WvzS0J4QDlAlObIju396upL2u4/42WmubJEABYLjUWASxAdFb0M7cbTILlhZ4KMV@vger.kernel.org
X-Gm-Message-State: AOJu0YwRv05fvcttHi9amoX7OgXn4BpYHze6Vb2WxpwlVw+x1jReVbN6
	RSGHQIKwci+V3ljFBycjf3G6U+S88fMNYinK9thSOJqFVyEFF5QAcnpvh7CK
X-Google-Smtp-Source: AGHT+IEHoysKxkQFPofxUuv6XB5Mue/CqXOWf0bVQAuy86ltXgsqmzuXOVh8jF/ZCMhc4VwNmYjhmg==
X-Received: by 2002:a05:690c:fc6:b0:666:f7f:a05b with SMTP id 00721157ae682-6d2ead0166cmr7393687b3.0.1724926965128;
        Thu, 29 Aug 2024 03:22:45 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6d2d39c72ccsm1856727b3.12.2024.08.29.03.22.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 03:22:44 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6cdae28014dso3558697b3.1;
        Thu, 29 Aug 2024 03:22:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVVkUqBDC/IqwLsj8a2lOH8iizTDtpaEbME25rKK+qbBrShnddvb5Ln0i3mUAP43R/u+m+IQhuH8mL0rNLRjSOeBdg=@vger.kernel.org, AJvYcCXJrnmTUUmIILGZSZdvLncZcseGiO4sMlMlP0dMNKhRBe5ulAFkm34TrTCoHzJKJdx2qa5GD6cnuydOkJzd@vger.kernel.org, AJvYcCXoy0sxLVx4ZNAEQTj/zVPfXnKMoSG2kOv/HOwPTHIaXLnzMjxzZbsQ++6mNZXNX7tpXK/hMGxas6vU@vger.kernel.org
X-Received: by 2002:a05:690c:4a01:b0:6be:523:af4e with SMTP id
 00721157ae682-6d286f65602mr16344397b3.19.1724926964653; Thu, 29 Aug 2024
 03:22:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240828124134.188864-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240828124134.188864-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240828124134.188864-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 29 Aug 2024 12:22:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdURztzxOHjn20JTgwzztAxymbt69-Z+=oziC02bRfaOqA@mail.gmail.com>
Message-ID: <CAMuHMdURztzxOHjn20JTgwzztAxymbt69-Z+=oziC02bRfaOqA@mail.gmail.com>
Subject: Re: [PATCH v4 3/9] arm64: dts: renesas: Add initial DTS for RZ/V2H
 EVK board
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024 at 2:41=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add initial DTS for RZ/V2H EVK board (based on R9A09G057H44), adding
> the below support:
> - Memory
> - Clock inputs
> - PINCTRL
> - SCIF
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v3->v4
> - Updated 'renesas,gp-evk' -> 'renesas,rzv2h-evk'
> - Renamed file r9a09g057h44-gp-evk.dts -> r9a09g057h44-rzv2h-evk.dts
> - Updated commit message

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.12.

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


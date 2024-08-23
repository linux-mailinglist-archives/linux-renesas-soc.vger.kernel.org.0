Return-Path: <linux-renesas-soc+bounces-8126-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC7C95C92C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 11:25:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E468F28517C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 09:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C75714A0BD;
	Fri, 23 Aug 2024 09:25:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85ED9149E00;
	Fri, 23 Aug 2024 09:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724405114; cv=none; b=IouGaDP5KIOZvqRPu0ER76FyuFwXQ5UZ89aZ4IhZFkiqe/rukLsl1Fqe1pbSBzL48Dep90PAzyzHK+v7OV00BbmTF9tYQsHQB+X2DvXNc7d/I4PPDye88pu1u4WX6B3YkMe2f+mw/4NURRoLWWL0rfiHHufgy6dojoh1XnirYFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724405114; c=relaxed/simple;
	bh=RitM83yPxFSU4whPG91GbqWu4uNdtHpWqlfcNTdqrSU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Di4rbKu+FSnPW3BXanYzVnLNgx2yeVlxBtxs6xoka9Wz7pGGv81OZ7LUx/09xrFT6SoYy50pxLC5q2rQednL0XpJjtXoGZLrjHAb3tIyeP4z3qgMF6CbT/PMnl5WNIvVGYBiFL1YZbr93WTVJGsd90NqEO4qfIofGWcxiqU9TQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e1651f48c31so1691246276.0;
        Fri, 23 Aug 2024 02:25:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724405111; x=1725009911;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qYvj65PQ6fWUOjpwDbiBcB+rGlbZTxzUC53H5GmiE7g=;
        b=O8nlRUtqUqJodJIwy/DAuKWoDzQzsiRJw5qqIwUPAoxWPQRFUuTYQmWtTBDSFC1Hh7
         +ShUw+ZXXHhuUEmh3j0RaZcp0s3xIRsJYbM8cAjUEsSJzI7kysqosSeEFU6yU0T6axcm
         rvU47mmU5hXYpkODbx/r2SjLwiSSpIyp97r1BWj35Dd2AoRbxDWhdfj/U5jn8seUE24L
         E8lqvdi8/YvHen5biMuOlutIivjaLmpqI3ftoU/y9wweugYTZPo5ER5SutS2fu7+SzMp
         KgEZBxpQmbniF1dbRqjyx7bYyp2hcCI70mXNAd6M11YDrfzEc0V3L1YmmCYoh1As2OTg
         EIfg==
X-Forwarded-Encrypted: i=1; AJvYcCU8/IyGfRmpOm14JkkSNQU5zveCf0LmipcPK/PSowIUurHvSaAvWryuodzFQqluUQbXS+a3Z5Bpntwe@vger.kernel.org, AJvYcCWA+uoo6onxXaAYRbzNqHs1eoGtQwTDgGyBhXTsifnK7h+A+KcJwlDHOAPH0LneF3xVWXUdap02XAOsjgTI+KTkOAg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtu9H3n7A5c9v9k1oRNH8DaCG44ZXKHlvcl5B/Qgz+llVpkNpL
	T/V7LDRiXJl20AvcMzAkOXkwEV0DOOZw13YFRXHI+5KCG6L6c+z0awavPBVc
X-Google-Smtp-Source: AGHT+IEaiA5nZ/qLrbF6IwS9cfewhZ1cEny0kMRQZllwTR4Ug+7qmOo81vjt1gVCyTqfYElDYu5pEw==
X-Received: by 2002:a05:6902:e0b:b0:e13:e85a:fd4d with SMTP id 3f1490d57ef6-e17a86a89b9mr1659620276.55.1724405111110;
        Fri, 23 Aug 2024 02:25:11 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e178e68131fsm608443276.61.2024.08.23.02.25.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Aug 2024 02:25:10 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-690b6cbce11so15873417b3.2;
        Fri, 23 Aug 2024 02:25:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXFFVlRKx4TWSuE8gdsfW3ME+Vt+TIItRN6Wmt2iyoAK3d57u79vKItUFLl7YbYfrfuna49ZDGqXbBj@vger.kernel.org, AJvYcCXq4f2V7/nnb81u1+8pU2QIY896gHKLuqfZCc7pJiqjzCBQYyRSG36nEP3spXFxc4EATS8FRR/wazyDpqHxo0/gT0A=@vger.kernel.org
X-Received: by 2002:a05:690c:2d03:b0:6b7:a7b3:8dcd with SMTP id
 00721157ae682-6c6286b8c9fmr14254387b3.36.1724405110661; Fri, 23 Aug 2024
 02:25:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240805131709.101679-1-biju.das.jz@bp.renesas.com> <20240805131709.101679-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240805131709.101679-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Aug 2024 11:24:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVVxSmJFyuNUxJ7_9XfXmyZRoXGTCiZe2Fs8d3awFyXwg@mail.gmail.com>
Message-ID: <CAMuHMdVVxSmJFyuNUxJ7_9XfXmyZRoXGTCiZe2Fs8d3awFyXwg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: renesas: r9a07g043u: Add vspd node
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 5, 2024 at 3:17=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
> Add vspd node to RZ/G2UL SoC DTSI.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Reordered the patch as vspd needs fcpvd handle, so added fcpvd node
>    first
>  * Added Rb tag from Laurent.

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


Return-Path: <linux-renesas-soc+bounces-18284-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4548FAD8C01
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 14:26:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08E8817F971
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 12:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A09E2E338B;
	Fri, 13 Jun 2025 12:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ma8iNomY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D11B2E3373;
	Fri, 13 Jun 2025 12:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749817569; cv=none; b=sYL61iC+o9kEVwK9r88Wbon3kARPOvCRa9RqmU6dlI4FiTeW3D9n5wpL8KGXh2gqTNaN1y8FA6xaKXp0eRhaFP5/xQUr5fVLJyh37wXfVlaHadwKbXVoJIeCubOebzRc4AdxJiZqd22/pJDm+01pA2jgu5c4dtN9mbVXLGqr3kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749817569; c=relaxed/simple;
	bh=Q1ez6aZ6QHVeEpWsnuhjrMiCMOmmVRfnb72U0octC3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P6gt80XEGlU+nkuPEjtW3ceLya8zH9br2ipqwiUEcDqb+sPOPV2b5R2mwhWxtayQVmeuRFw4vKtBoPIEFX3qBYDY1u35fmk7O0/mah99LOSQhtDuXBSptZwIYqacqDYBMJJfNHcVCGHglKLG6oC5OcMvpS4NozhA1TXPtf/knOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ma8iNomY; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a4ef2c2ef3so1772009f8f.2;
        Fri, 13 Jun 2025 05:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749817565; x=1750422365; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dWCRVyplTq5BWoBqiG9qwM38M5MTSKAdb6x0IXTxFNY=;
        b=Ma8iNomYQXJMk4OE0MKpXD5LoVEdPXoQnhmnAv0J/y/z6B5fj0Gs7VEuxmJJFdmrm2
         IEn51t9ffsgHNe0AKRN6T9ihEpg3oOKVert00vuIIsObv/QPr1Y5kmMEMgWpZ7+64R8B
         pqkd292CnTwadW3Xlk9sDoiA3zY3SdWtAvbYoRptDXfybkHcDbuzcWULEVltDgNduEEX
         wA9uUIHyWrAr8lcCyTfSNFI9Wv7nps+WKO9nTm9mKRM0x0YlGyMkAdqll3h6eyZKZjGG
         XWDw3P6TEWK++9GYh/oMEdJNbRUxJ3SzNgDJmxHn1ERp15ZtxTmUsEOC11ayhxHIZipP
         RDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749817565; x=1750422365;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dWCRVyplTq5BWoBqiG9qwM38M5MTSKAdb6x0IXTxFNY=;
        b=GBu3Hi8odLRMW1CefMfFggzKwNku0ExP1MjladpN6wUhb+ugo6ZmbPBT+6KEIn5ige
         O63BBJeZntRp25ainpLa3dYVp+9RGoDaLWJO0Tf0LOt7sN1Jz52Hy83qyVprYLWMVsrK
         OCH+KF+eokjFSElEuTpEMqJnN2nFlmdqWoUo5GvuGCpwZUG0mi8BYPCisz4XAOp8WIpm
         Mp9oFrliVVAm+CPJ+WiHUoUhRQ2PH+rfaLIuQtcCmAmjAEWaJynSVplXv0jEUlwQz1+G
         xdODIj+SAFVqznKf5B8BZnfRtmiHzsu/tzaQJe0v5fQ/juZRhgHObrplGUApr/X3p1px
         uxyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUv5tmknzOXyEnWFiieo0T+A5kj3JmyYYfZ56fTateaY+tvWSCOY9k9i7JoYZI1nR/ewuXYZn5h4uLs5K1b77yLM4I=@vger.kernel.org, AJvYcCV6/XUeEKitSW0J9Ks6I1EJOPXGrNwRoCYPqfKZo79y3wBAhpTnHf3H9DNk2/VbPiXrFfcTlNI47ody4H3n@vger.kernel.org, AJvYcCVNecpGD5cBr6SjzDXjR/xTJVE1VjGYJzgFU316gqaQNHLKuB+RXzkHKJ5OUeo4vxtYnyvijiG1twbP@vger.kernel.org, AJvYcCVjTKpiKv9R6n1l16NiNQFZJZpOwD3uW3i/5lnIvp2H5tO5E2hojJ2uydebcCWFIAsAE64ZkigmXgd8@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2ovqd6Tn4i27Ip5z7WhTCEyJDZQeHwV/wFEOA52TLG+trq1jv
	9S1FhutDsCQQRzhw8cjFnSvFgXP9OCez4ba+0Npb30DtEOyTxmh+2d0YjxmC3uC8Jt/uPae69AU
	NGU5uuAG1Iatjxz6+0Yuzqhvv2Q5nau0=
X-Gm-Gg: ASbGncsvf/nDSIQAHLHiSqMbgp8nfMMnyEwF9spQkNtrnDQ8XCwxIvH2gF+06/kcu4E
	/8aIJAukNuCiAdWkRAr5NXa40j4jzmg9TR22Fq26ltFaNyVQS1bVrLNv6fNY8+DPjpf92U8oaqa
	zC8NCn1sYuXegDkDUxKYk4tTUlhtrBzUsaeufI3f5qrXLRlg0vL/GYKzDcofFQNYrKuGcsmLiqc
	Tc=
X-Google-Smtp-Source: AGHT+IF3bArABB3UHsWfZ3jPqnDgsxyauMc5FWC+cd4lxiV2/wmzE15K5+WGpgLYsPNvM57PYYNuZw4eOUC+0k9jHhI=
X-Received: by 2002:a05:6000:2204:b0:3a4:e7b7:3851 with SMTP id
 ffacd0b85a97d-3a56877ff2emr3095072f8f.58.1749817565324; Fri, 13 Jun 2025
 05:26:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609203656.333138-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250609203656.333138-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXMiTx3w2kt-jK06HWGhqD0vAnKKTyk7jGkhOhaXyf3Bw@mail.gmail.com>
In-Reply-To: <CAMuHMdXMiTx3w2kt-jK06HWGhqD0vAnKKTyk7jGkhOhaXyf3Bw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 13 Jun 2025 13:25:39 +0100
X-Gm-Features: AX0GCFtxlxaZgUwr-aCpj8BmzmSFit0i-TR6pV3ge2PVAGYUR5zjx0lu_XmV8nw
Message-ID: <CA+V-a8v_gdKBEd4ing5d0xka+S=vVAsU4XA=+KhCBvXSs4aNdw@mail.gmail.com>
Subject: Re: [PATCH 4/8] clk: renesas: Add MSSR support to RZ/N2H SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Thu, Jun 12, 2025 at 3:38=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> Thanks for your patch!
>
> s@MSSR support to@CPG/MSSR support for@
>
Ok, I will update it as above in the next version.

Cheers,
Prabhakar

> On Mon, 9 Jun 2025 at 22:37, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add clock driver support for the Renesas RZ/N2H (R9A09G087) SoC by reus=
ing
> > the existing RZ/T2H (R9A09G077) CPG/MSSR implementation, as both SoCs
> > share the same clock and reset architecture.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The rest LGTM, so
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds


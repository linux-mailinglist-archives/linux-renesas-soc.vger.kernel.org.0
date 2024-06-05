Return-Path: <linux-renesas-soc+bounces-5842-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F858FC493
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2024 09:32:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD3E41F2157F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2024 07:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF4C5F9E9;
	Wed,  5 Jun 2024 07:32:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11CD138C;
	Wed,  5 Jun 2024 07:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717572730; cv=none; b=CodvWOc7NyEf0HxsLGvOrtKvnzq/nBijhq/J1N7alkqMsuDWLMza9QhuUsHhoTdBiTQja5FMJfzoMApwgW2tTf69MEuWJpQLjrT1rwH1x0rcnzk3zBd3NM3pExDZqup1DngD6OAeEncudvS/q2h+7HufgpRsgbfoedjOjcHOr5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717572730; c=relaxed/simple;
	bh=L7felvgTDTE09ggPSnDZ0q3MJbdTQWtdAg9r/F9GJCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l1fh0aFLFM/CRRdi89XXYjFT9OfLZP+n5jFU2rH4o4MmWs7NBhTSAD11KtgFmm/7Z+gji7a8xjtPEutlWRUD0ipgsoaaRNdYThnU/ASKj+EyK0xSJ45Mhxy3j8uAR9hFReHwpQhth+maliCoCMpot9lQBjYUFJEyyQdD3ETYUHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-62a08091c2bso70318417b3.0;
        Wed, 05 Jun 2024 00:32:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717572727; x=1718177527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4PbSG6kROXGWqIVI9Do+T1m9UykpgRSg/ltc8bSc+ps=;
        b=mXQkRZoC/lEBUkiBOB2pdhXFLCUcTuxXNw2n7AE+pWIdJ2GIFKjy3FltZxrrGGJq43
         WpjsQFRYcmOEAHD/TsoFlnlWogk7xpN9ia2QH8wB+rmMfjDXzT+KNvCu+gis7K0dsQJn
         UoFopAptA3vi2DJTuJsmO3uvylGUPMWLXzv/i8vm8a762FCH3K0QC1ZUYj/cTiGIf+8o
         lxih1aasG8TIxVANavs6UfhfrMeSUKzDa/WUomNOpQ7H4HOVpTHv4BKk12Du1BmBoK9n
         QqQHOEKpsmoEWvtVd9nHOA+G0dzvgOvB1dliF7T8fyh809GrkOFCLkRBUAL1k4m8wd1E
         97yg==
X-Forwarded-Encrypted: i=1; AJvYcCXPGACfa4QW+DohVR8bF52BfMTIEaJBTcupTFPT9HMA6yWV4TFDMtWUfr6Gw84SnwRQAbDDvo89qzg55uZ2Jol2yMHfUCAaCDMPNnxv8ac8Rs/8jxG3hEog2HZqDeo49f9K57lNroXkbKTWYPBN70k9hgeTtGKA/xcDx0oy9MfXq6kM3JzLqu1wdV6X+dl6vMiJoR2HlXYXjGOV/iAHa4D6mXGpaPOSiggl
X-Gm-Message-State: AOJu0YzETCh65CipwMqzHR4oSQ8+W0J4xBBnCp2c9i03dYAqQWXNP63K
	fJl8q+6KrrPLsZLSr0ETkIYBvcswDVz/G3KZYXud283ko0Al6O/FCco+Jvr/
X-Google-Smtp-Source: AGHT+IHhb5USEURkf/NEn1JZyFqHRnUBmdMa4dZ51guZsp5nhRbvocVkqJOKh282PLyDPenEJSdgMw==
X-Received: by 2002:a81:f003:0:b0:627:dfbd:89e with SMTP id 00721157ae682-62cbb4a936fmr16219117b3.11.1717572727436;
        Wed, 05 Jun 2024 00:32:07 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62c765e63fasm21483307b3.32.2024.06.05.00.32.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jun 2024 00:32:07 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dfa4ad7f6dfso6048184276.1;
        Wed, 05 Jun 2024 00:32:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW3noEfFBn+eBjfTYNQSXM0jCNDaQ9duPvz+GSwdIWFdQPOrVjvBKmr1Y9luYhcxPgAtJj7BkUy2630LvaXSgEIil8DS8mZ7Oj/JYiuU731WSJ3Izy5RQhoRFeoAktdAXu5Gba6+xByQIYIah63FakyXh1ZyZT8jxspx+uF9OUGJe13vVTxUz2OvHWxYwtv+G3/CEWJx0v27oOTROM2uzKzPZNy57ZbZk8R
X-Received: by 2002:a25:b2a5:0:b0:dfa:57e4:2df8 with SMTP id
 3f1490d57ef6-dfacac33113mr1782340276.23.1717572727091; Wed, 05 Jun 2024
 00:32:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240604170513.522631-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240604170513.522631-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240604170513.522631-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Jun 2024 09:31:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXsGLrgAfe=5VsL1F_sTjG1jxzU36s5iHaSeW3Nb3qwgA@mail.gmail.com>
Message-ID: <CAMuHMdXsGLrgAfe=5VsL1F_sTjG1jxzU36s5iHaSeW3Nb3qwgA@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] serial: sh-sci: Add support for RZ/V2H(P) SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hu Prabhakar,

On Tue, Jun 4, 2024 at 7:05=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.co=
m> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add serial support for RZ/V2H(P) SoC with earlycon.
>
> The SCIF interface in the Renesas RZ/V2H(P) is similar to that available
> in the RZ/G2L (R9A07G044) SoC, with the following differences:
>
> - RZ/V2H(P) SoC has three additional interrupts: one for Tx end/Rx ready
>   and two for Rx and Tx buffer full, all of which are edge-triggered.
> - RZ/V2H(P) supports asynchronous mode, whereas RZ/G2L supports both
>   synchronous and asynchronous modes.
> - There are differences in the configuration of certain registers such
>   as SCSMR, SCFCR, and SCSPTR between the two SoCs.
>
> To handle these differences on RZ/V2H(P) SoC SCIx_RZV2H_SCIF_REGTYPE
> is added.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Hi Geert, Ive restored your RB tag after rebase (as the changes were triv=
al)
> hope that's OK.

Thanks, LGTM!

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


Return-Path: <linux-renesas-soc+bounces-8144-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A6D95CC65
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 14:33:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B7E11F23062
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 12:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCFA4185B65;
	Fri, 23 Aug 2024 12:33:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE285185941;
	Fri, 23 Aug 2024 12:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724416395; cv=none; b=N0ZAw/PrTePnNgJSMPBpomCXj2JriH3iJoEtqPHndNhy5Ioj4AFzsevXSQyFvv3cPAtbdJS2ybD829OFR4qb9JzrvG9i7xVKOydcQxsu33gDCLCGJ6cTExy4HcLQfUOnoCul+5M+XVnGYBPMAfLqMqMrvyMTLrq+g2iq4BcwWZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724416395; c=relaxed/simple;
	bh=03rpMEAPkNqtwnDbfq91Teoq4v7JaWyGu9ZP2Xm8doA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DWR6MjFH8HMom84bzXvIDj/xZswo3236xqIBv/oIgfWW0YN2pKqlKtBpqzHFRllx2MHfqt3fygpnjtxY5cgpxr5lWKNjjyOIRseRK5U8BTgW/IxnUx9sAJA1ObVcFqjAtwE55Dw5B2XgfOGZW5ykPC8uhPqlEFbccuKOWKtawOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e116b591e15so1957610276.3;
        Fri, 23 Aug 2024 05:33:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724416391; x=1725021191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Yvty6X76xoXM74eMaH2RxI9/zAHTVxZi7P/oGKdhlw=;
        b=oFTRZRcKF//pYoal5JM1uD9ZF4pksYcrn5IKxwYRBSAXHkLwChg7DUdIRjRMCGD4N9
         2bmEOV7SJqOwyr94FJd8dJQp0tocQbFVYmsWsqSYwHBBb3XSNsoCVWSn9xXDRbFLab6c
         3TGdOJwU8gwQNrmVRvFC7Zb/9Mjwo4olON/15HEUyupr8v3HW77zptClV5GNGobSoi1d
         9fP1L5VwBeiJ0DdCBaroYc+M++wdStLj3hrmSBaj24OD1TecPY4Hhe35zhnxTOFgNiZt
         IYjpaoBrL6t0wBHvfJt1lxQXYtp+Px3g1rSyfZumUqvsGXAq5PbXcpkkSr+lyK3pVNAB
         cS4w==
X-Forwarded-Encrypted: i=1; AJvYcCXaCwv9a5t96ByY1DJuMBNPK6LxUCh6jvt7HtDau+DAnwmlksS9wZkfKt4mQUZiljaTGc3Ter9UJ30DfrmfmxA33MQ=@vger.kernel.org, AJvYcCXwHmbpCzf9ldcUBteS+2vEoxE/ZV0VwlXVNZOEXr14H3egRbRVM+28NF0WgHaqH2/j6WjVTJQ+PYEk@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf0MioNDWcPdRT2vUerXNRWdEva/YqE3SnixqlpradZDoYMumf
	yVT3UThFAANTzNPrUv7IrraYc7aml355j0sBuMN2lJbubSq50CmEOffBwM3p
X-Google-Smtp-Source: AGHT+IEchlkIO+5gtqC1N+WIqldkAaPNVKD1QUZRtFHv3zqYJPK54ceEEDQRC7a0NvERLlhHWaIeUQ==
X-Received: by 2002:a05:6902:2182:b0:e13:dd6a:1592 with SMTP id 3f1490d57ef6-e17a8c459b2mr1979660276.49.1724416391154;
        Fri, 23 Aug 2024 05:33:11 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e178e4638dbsm635669276.14.2024.08.23.05.33.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Aug 2024 05:33:10 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-690aabe2600so18205567b3.0;
        Fri, 23 Aug 2024 05:33:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVBYd3gg8ZMPgdctzG3Jkp6cMXujBMOotCrUECIA1K+yW7q4smMR/zfF/joVRg7FnKZfYF73vhPBkCh@vger.kernel.org, AJvYcCXsHNOxVH8m4nGR4jwg7kGstG6eIWcVO25+puL042d2r/kzI8U+z7+38+irEiPPgSQg2kcqUn7rCdbY1oqyMtXuBYU=@vger.kernel.org
X-Received: by 2002:a05:690c:95:b0:64b:69f0:f8f2 with SMTP id
 00721157ae682-6c62441920amr20013277b3.3.1724416390350; Fri, 23 Aug 2024
 05:33:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240822162320.5084-1-biju.das.jz@bp.renesas.com> <20240822162320.5084-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240822162320.5084-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Aug 2024 14:32:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU3b29rZaKNiX8ikDfd1OLThnpYVcdeYnaWeVuvyER=6g@mail.gmail.com>
Message-ID: <CAMuHMdU3b29rZaKNiX8ikDfd1OLThnpYVcdeYnaWeVuvyER=6g@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] arm64: dts: renesas: r9a07g043u11-smarc: Enable DU
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Thu, Aug 22, 2024 at 6:23=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Enable DU and link with the HDMI add-on board connected with
> the parallel connector on RZ/G2UL SMARC EVK.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3->v4:
>  * Restored ports property in du node and port@0 for DPI interface.

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts
> @@ -35,4 +35,115 @@
>  / {
>         model =3D "Renesas SMARC EVK based on r9a07g043u11";
>         compatible =3D "renesas,smarc-evk", "renesas,r9a07g043u11", "rene=
sas,r9a07g043";
> +
> +       hdmi-out {
> +               compatible =3D "hdmi-connector";

[...]

> +&i2c1 {
> +       adv7513: adv7513@39 {
> +               compatible =3D "adi,adv7513";

The HDMI connector and ADV7513 bridge are not present on the SMARC
Carrier board, but on a separate board.  Hence I think this should be
moved to a separate DT overlay .dtso, with a suitable Makefile rule
to build a DTS for SMARC Carrier + HDMI add-on board.

The actual DT description LGTM.

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


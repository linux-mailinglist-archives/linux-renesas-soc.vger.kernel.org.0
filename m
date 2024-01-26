Return-Path: <linux-renesas-soc+bounces-1878-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AFC83D902
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jan 2024 12:07:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C2EA28A336
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jan 2024 11:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C1DC134B4;
	Fri, 26 Jan 2024 11:07:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FFD13FE4;
	Fri, 26 Jan 2024 11:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706267252; cv=none; b=cwXZxl8OilBEUAGIbuYw2AzZzXR49Xp7SJXWI7TQH/Fxl4S2XMPK6aL+6Dim8+8K8LACtOHhkdjSrMA2HWHbPWY98lNv/AobqU2TxXzhnKBoukARwJ13WtHhCUGcqdU867K4z6zXmjyGyNypSwUBdAzlXiLoENjTiSR8rgzi/l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706267252; c=relaxed/simple;
	bh=6ppXA2DlA82FOJgaWaudkduaD/ykhHsK08CtpDd1gEg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YPexM6z9m/E/I1a7vQUHEZYkWbuZ/uj06CDTsCvraMIrATTp+Yta1zxlI4O+kC3O6T5J+Wu9Xp6qcPVP9ZU4RxJaxTbNDIyAgB5M4qKlZhjoeXTMbEg1xRq0OM//yh6BxnI0sIhywo3rHSQFI6aW3QMv2QjfYi2753pGvLRwguo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dc21d7a7042so219185276.2;
        Fri, 26 Jan 2024 03:07:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706267249; x=1706872049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jwz6QjxMfzuXSUu3G4OIPlIEOGfHePs382I3fEwHaT8=;
        b=kjBzwIU/U7n/dpbAr3U+7LU0/jXaFCCjf1SYru4WGEWIxaMQoknD8+X/2DHnoGvASc
         IKWm7Xf2LdqaNaBmmMZvkxa0/lnxYja4ksPaBsq1CjQF5zeyDTMzL1CeO26MqO42CuhH
         4+ifjymP8WgfuDTtK8jXkOOUq/5g6n2B9QFgDpNyyUO7nZq3LHbUawBuCa0BK8zPNy23
         u+KCg5LT/r3bP/puRf4djGw+05xdalK+GbXVPxzMIdB8Ie5ip3qCUD4bv96bCu7248gh
         Ero1ojQJSjc4js1/ebo9yUnw1tP06jcYap4fMhjZzlGQWJFpY5lHbDsIvzjowFqgmRGf
         EYxQ==
X-Gm-Message-State: AOJu0YyiFaL62iZAjxPAdJ3DXgXSDkyCjSgSEJNOqzrBFg1VCtvgmcHz
	BIsi/lQbTy+jqmUbiC0R81ciWXGXc9I1ujAW5UG5l6a6/O30d5pUsEDpKaXbyz4=
X-Google-Smtp-Source: AGHT+IH4sMvWmEOpcSKgOCVpbnUuntut88i08GOgtZI/yWdysxB+rNbJDgcu1giISXS+xEnk9Qe5PQ==
X-Received: by 2002:a25:f912:0:b0:dc6:2a46:1543 with SMTP id q18-20020a25f912000000b00dc62a461543mr873470ybe.36.1706267249220;
        Fri, 26 Jan 2024 03:07:29 -0800 (PST)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id p12-20020a056902014c00b00d677aec54ffsm305085ybh.60.2024.01.26.03.07.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jan 2024 03:07:29 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-602cd92a75bso2683987b3.2;
        Fri, 26 Jan 2024 03:07:28 -0800 (PST)
X-Received: by 2002:a0d:dd91:0:b0:600:275b:2acc with SMTP id
 g139-20020a0ddd91000000b00600275b2accmr1101442ywe.53.1706267248487; Fri, 26
 Jan 2024 03:07:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1706192990.git.geert+renesas@glider.be> <f375293d6e21659ee30a86e2b46e4998a75ea3b5.1706192990.git.geert+renesas@glider.be>
 <ZbOR4KI6owaqtXMP@ninjato>
In-Reply-To: <ZbOR4KI6owaqtXMP@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 26 Jan 2024 12:07:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV25EPTge=jEDqe=Q==Na0N5iYJVf5F9yvBC59uu0GbDg@mail.gmail.com>
Message-ID: <CAMuHMdV25EPTge=jEDqe=Q==Na0N5iYJVf5F9yvBC59uu0GbDg@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] arm64: dts: renesas: white-hawk-cpu: Restore sort order
To: Wolfram Sang <wsa@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Fri, Jan 26, 2024 at 12:05=E2=80=AFPM Wolfram Sang <wsa@kernel.org> wrot=
e:
> On Thu, Jan 25, 2024 at 03:48:53PM +0100, Geert Uytterhoeven wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> >
> > Alphabetical by node name.
> >
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> You probably want to use your "+renesas" address here when applying.

Thank you (temporarily changing .git/config considered harmful)

> Other than that:
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks!

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


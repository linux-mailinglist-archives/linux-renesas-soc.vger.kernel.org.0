Return-Path: <linux-renesas-soc+bounces-9427-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA729904F0
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 15:55:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DE741F2259D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 13:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F122F212EF1;
	Fri,  4 Oct 2024 13:55:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55467212EF8;
	Fri,  4 Oct 2024 13:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728050142; cv=none; b=bbkmQ0pPBJ+9/7vWT7Er9JbhQ1m6Tf38Y8sAb4lahV0Iqw/S+QWPc+soErvkEYwagqrfxD17g2T3hjI+wi7C3EVJm2epKdbdW3rLNvcTqg8nJIwHvwMnFe/p/3W6P1Jn05u4TedA2w3ehBpNxW39ZwXqVdRDF7pnn2SxGTExIXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728050142; c=relaxed/simple;
	bh=qK19Tb4slLvZrRwVcJmPBbVvxfRRry3OzJxQb60YnKo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pd4EPAW5AFAqSeA/eNDrVS2TKf5aBOM5hpK21bwaeLWtl+82hKQoIeNsDY8W2ELm7iOLtRD+rFNopBMK1e7JrjJo2vyQy1AMATVyvsKKPEQ8OshGr3dKPqFdwbJvnoGReliQbZIeal6TNtVXZO18nBFzkryiMZpN93/JRqwSkzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e03caab48a2so1694568276.1;
        Fri, 04 Oct 2024 06:55:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728050140; x=1728654940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ej7WUSE2P6Ee3k4IlTWH9mcujKPIZcgSPx5++Xro5Y=;
        b=aalMqYUTkTJL5RI4Pdie/eE0WMnBQKl6MoSdGR/ET//BtjWaI46Ae38mJBZB+RYIo1
         GxNvxBRjh6HucL7MwrfmS9qjLARjdqCPFsv+y8hk4l0glPVCLe9T+lMGvurFQjwdeELg
         8A9uw7RjaCjucc+n2XPT7dW3zk4jC+6hy5kp5fKHY7qsXTGKX6v//tFvygjO7Wdi8FSV
         n6diYUIeyfsBlIDDBsCwDyEV9L0AKnjfrddj7H9lemMB1yL72s1/VvJEZFGuKRji9v7i
         Nn0RI9AidHr0x0+nGUWW0UoytEA95jQLL4qB5KNrYdFleGOAupVUPnoP2qIbEV7t/5Ex
         ECPg==
X-Forwarded-Encrypted: i=1; AJvYcCVvC5kO5bFPVUJAlvGvc5+kjizC2bRFe4NaPKHLub+AuIPfgGoC9BFtiYMhg8h9+Wewe2Z3PwYobTcy@vger.kernel.org
X-Gm-Message-State: AOJu0YyML9PAljsUQ1p+D/g/eShGuinIBhEpZzTTS9JXh+9iI2ZyXHVG
	NIWL9uvrVl3rPADCNG4h7L4wb8s9S2rkfoAd1FHFmXl+eY1CYnlwF3I4tKZ9zpw=
X-Google-Smtp-Source: AGHT+IHqLCBtVwg+NpQpMRGAd+lJczP73PFb5r8tBU9IsJyOEcctVWKWTiEwblV6jEW3cAPWB0Bn+Q==
X-Received: by 2002:a05:6902:2304:b0:e26:677:656d with SMTP id 3f1490d57ef6-e2892ff2e27mr1962187276.10.1728050139716;
        Fri, 04 Oct 2024 06:55:39 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e2885d6b5bcsm597837276.36.2024.10.04.06.55.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2024 06:55:39 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6dbc5db8a31so17145937b3.1;
        Fri, 04 Oct 2024 06:55:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV3K1tOWTF3eDVeZzZlsmWAIEPQPT1ISzDGfCH/ShRgitS+PffbLbD4YptsXMX9Z78do76bIRjnpUy1@vger.kernel.org
X-Received: by 2002:a05:690c:3081:b0:6e2:1c94:41f8 with SMTP id
 00721157ae682-6e2c7c31210mr14890377b3.10.1728050138447; Fri, 04 Oct 2024
 06:55:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240926103340.16909-4-wsa+renesas@sang-engineering.com> <20240926103340.16909-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240926103340.16909-5-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Oct 2024 15:55:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWQ0uiPCZ=OUdUacc2HWHJf+y3XDAJHh+hAzoRHNu9zMQ@mail.gmail.com>
Message-ID: <CAMuHMdWQ0uiPCZ=OUdUacc2HWHJf+y3XDAJHh+hAzoRHNu9zMQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ARM: dts: renesas: add proper node names to (L)BSC devices
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 12:33=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> (L)BSC must have a "bus" node name [1] and no unit-address because
> there is no reg-property. Fix these entries.
>
> [1] lbsc: $nodename:0: 'lbsc' does not match '^([a-z][a-z0-9\\-]+-bus|bus=
|localbus|soc|axi|ahb|apb)(@.+)?$'
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.13.

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


Return-Path: <linux-renesas-soc+bounces-15827-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C72A8577A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Apr 2025 11:09:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 440BB9A770F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Apr 2025 09:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 417222980DB;
	Fri, 11 Apr 2025 09:03:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E97915D5B6;
	Fri, 11 Apr 2025 09:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744362189; cv=none; b=G6wCeat97QPVcWWfEbtqjkO3r71icGAFg+K8R8QVJw0ae+X+m7gKh9VPKAx2C7U8Z7YKTHgSeE99u7lDe1nmw85spFVSb8J/uCOvY5ONw77LIqhVk+V9hQAetJ6gOq95z/9sMEFN8BCxAY1FwW1jPHgpS1l7T9dakQl3OdRlVFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744362189; c=relaxed/simple;
	bh=68M4vLUf1EXzLGOKy6eBfxbrYb+DPS4oo6liMb2K+Jg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=exjxL9T04wLXCyja/3ZIxpWfIodNjtofDFdSKuc/Ec9JClNGrtqKcWcdwrlGn9RTlZ1OBbHRNuo9cm7u9592zpKJ5IjrpP+1stJu/Plcm0PkBBGBy0cBQA8nZO7B94vQEkMB3WGDnqfEGbHkRzDlFqQ5dYEohOOcT+OZ2MoHZa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-52617ceae0dso661361e0c.0;
        Fri, 11 Apr 2025 02:03:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744362186; x=1744966986;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lj3Rag+ql9DT29cG6jR46t6nOCjAl2CEWRqZsAjd4zs=;
        b=CTxjwEKP27iw+YlVoVXrcNU6R97ko0dtMzXRTDEBtlMufVlXHHPCRReD0oxjeNbtH7
         paN/n0ZH5apIdtuKNxsZld7bOnGuVvFrDhdBSnBsB+Gik0/L/CKyJFaIagz/Ny8TkuoL
         jNa3JwOg6QGrB9hKtO++0cIY9rs7W2whL2xop8pI3AMhCSTq5xSu0boGaUpeXv3AxyR5
         R/XuzIgNWoX/6T923aBHd9gSpTkdeYaS+91IUS9K8YvaXy2LRGsku9DWzY7bLP3x6qb+
         TzeQ2qpVQ88qUA1/z4aLccIlSkeJJODRBYis3mM8YuhCSQUCG6qJELwF6595v2byl3c+
         VK5g==
X-Forwarded-Encrypted: i=1; AJvYcCUUhJ+SEO6x5Ns4Agy5b1yRoX62/vesPSTf7HUKjhpU/dgxtcdkY8PTReFR4PqfKTo9Xdog8psi4SkI@vger.kernel.org
X-Gm-Message-State: AOJu0YzV1Ic9lS/BCPgVXVkOkRtzobsAsZmzhfj5IfuR98r++tTVlcu0
	MYEXNrpNUYgLiUMEd6BZs6FL08ElAtexs3YtkWYILZJ0Cazb1QIJwebVF3HPqRg=
X-Gm-Gg: ASbGncu/uL1Wi81faaNeZneUopYyGFw23ooHsylJzdgPgw+9pHWaqX/lSfjEMtDHuMT
	CqoVWgXD7pHrzr89xqpyFam8L82C4DiIoe02BVeGJ5ymUByINRKwNJsJpqmOTo5HEsaCdmki8GQ
	ZE2B2Yb0AXgfvTNTQh+RAD8KNAJG1U9viBamPIFb2sfGxAv87/b6tU17hp0pnWqV0HCxJzjf4iX
	bi4RhqoGHwPIPwHc3bDxlz3an13zBQeVhQUeE8sY9s6z0bX09a1u59i2/ruN/ryqzYm68JrKRIG
	vly8rnch/gpxMwsV0hx4fpa9kg5f4RmzpQu4JcUjfJoE7xjVSkDptgYTyNqrpcRpXpXFxl7OMNk
	VLSc=
X-Google-Smtp-Source: AGHT+IEI6fC0yvMXKPhB0cSVCVMgNN9IMvvgK6k8jy5dNixQc67oVWhElBpfiPQpgCKIrZ6uTztWfg==
X-Received: by 2002:a05:6122:8299:b0:526:1ddd:8953 with SMTP id 71dfb90a1353d-527c32cc238mr1066996e0c.0.1744362185801;
        Fri, 11 Apr 2025 02:03:05 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-527abd77f82sm1014285e0c.17.2025.04.11.02.03.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 02:03:05 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-86d5a786c7cso767403241.2;
        Fri, 11 Apr 2025 02:03:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWREDkWBl6u5ZGanEvw8yAKQ50NuN+pV+lAX2CTQho7yuPQ36mnrE9cLerT3H+mL+UqdaGvypmWCsrN@vger.kernel.org
X-Received: by 2002:a05:6102:50a9:b0:4bb:c8e5:aa8b with SMTP id
 ada2fe7eead31-4c9e5044f30mr816576137.22.1744362185273; Fri, 11 Apr 2025
 02:03:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250328153134.2881-7-wsa+renesas@sang-engineering.com> <20250328153134.2881-12-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250328153134.2881-12-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 11 Apr 2025 11:02:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUUvRF7ChvNS8YSnYq=KApCqc0cqQvtr5JC2H0+msikVA@mail.gmail.com>
X-Gm-Features: ATxdqUGwW0G3xw0Q1QuMDrKPrc2rZLZShue1FT-xgF1rHKHgM81f9VJga3guxzs
Message-ID: <CAMuHMdUUvRF7ChvNS8YSnYq=KApCqc0cqQvtr5JC2H0+msikVA@mail.gmail.com>
Subject: Re: [PATCH 5/5] ARM: dts: renesas: r9a06g032-rzn1d400-db: describe keys
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 28 Mar 2025 at 16:33, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The keys are connected to the I2C GPIO extender which has the interrupt
> pin not connected. So, we need to poll.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


Return-Path: <linux-renesas-soc+bounces-21755-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C93E3B529CC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Sep 2025 09:25:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82D9EA0263A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Sep 2025 07:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3BDD26B2DC;
	Thu, 11 Sep 2025 07:24:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428AA329F2D
	for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Sep 2025 07:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757575498; cv=none; b=Ss5Gi19fBIXXKuhE/SS2atV1L0MduErfWl2Hm4JKHAsyLVcZ/dXdFaXFQ+ujvpTaufuFQnBlfCvSWxY2Q0ef4ESPDFyh+JaxjxTS0adhHYL85twRZQyeYZ/Nrh8DI+grfEn5pbjVUi/+n+yFNREcM3HxYFQ7TDwlXb19qyecr00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757575498; c=relaxed/simple;
	bh=eSOfox1KQuppsPr7L+jj1UyzRlNphPeTKcqMNNeUsUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O8+RY0Z1ytlhE1OywKDKKIWI9d726iEIgWv2ccVazjQKWMi3Wduna89wIEaNo9QPNZupeJYpKGFx84tjlzuZWuYefworkJzOIbx5Czv34M1aRDyPfnS5m0DR4BkNlGktru913wzfjROv/aAe0htocOaIbHxx2K2RkBhN/W5eUHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-8c1e1b6ecd5so278919241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Sep 2025 00:24:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757575496; x=1758180296;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9nZA/l5Q3xCHBcBP78le63J0ZUX22UfxL9a5mk+UrWw=;
        b=sAHsTnh08tVVUNh/GyKOTXFxn01MTeSs7iDQc9xBQO2SZntsMA5K8McrRBCxV0aroZ
         4zdipRxtgxSNWv81nrIeTrH2v8/yOqdo/+y6oInYzp+0mrCE2iujGcmYr0zISAyAGvGQ
         fQFXDDcq01kUKJQGaa3DG9/oGPv6iAmMMZLemsKTaFJuiOsYykR7DRrfcdWfl02kmVkC
         Y9ahOWjfuGhFg+2VXAEVu1ceql+HZlGQAKGpSWLCLCtIvkph9vLoHvt39D7MXCrdh2jE
         3jrEAVyNy0QBI1XSIV51VkTBHfnAiHkNnMYWaKedjGO0TsmiiYsIo4qj8jlTyyWiK0n1
         6JAA==
X-Forwarded-Encrypted: i=1; AJvYcCUsAGQZCYbH/tfMocE/QDLDF4zKY0t8oxI8tWxzM5c7cea2Jhd8iJeZVpOQa7OHyhv6MmUdYUW8Oh1mXVQ9UHsrZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTVKAV81KWVhXKHY9h18zO/1WqxsFc0QqrQZCYdJBhNxchzlHl
	+v964yAeCiH/H19KAUY7eiB7xpr5m15VHRZLNPyjlwfPI5c+qRdmjc40mmvWQR7N
X-Gm-Gg: ASbGncuFTx8Or0n0zZfaksCQL8uCZJHMVRO6MPd+Ll98uUsRPSCwSvoBY9UosiGamhB
	XrrYXa2l0aklBm0BMPs+8lggGoFUlP68SbGQoXOKIyyh2vZ24ShK+dMQYAoDn0o2vyP/W1HmzTH
	Zhbhss9CCbzu72h4eGjK1j/jZ1h2zySOw491jO+yRagOQXxArjfW2M0wyoZ2z7Nr0+AHkhFDQrd
	e/PnBfn7Ar/VbR2TDhmGWliefu8UFZt30jn6pDqnedAKjELFUSLapDhFWmjDO0uvB+i8AT16Yle
	LwSJ6kGF9jnCoj0/Ad87eYEkRzFeN5sttzfCcvoIKsn8mhQzBMKeehl+smStS+EUMx+SsyBdDcz
	FlFfaKvscvN/DnDt0LxwXJBgcN/3NhErIwfwymGs11ePNTZGwUjA9fq6bp4J2p/NdABZ6njdAk+
	ta9hyPUg==
X-Google-Smtp-Source: AGHT+IF9TFp7kKuAwp14Gaca1b+ANKWYsRyXVniANz28dDeH+SLfm4JQ/j9yLqmpla6kuzHm4s8iIQ==
X-Received: by 2002:a67:e7cc:0:b0:51c:77b:2999 with SMTP id ada2fe7eead31-53d1aead9a3mr6302762137.2.1757575495238;
        Thu, 11 Sep 2025 00:24:55 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8ccd3bd595csm132261241.10.2025.09.11.00.24.54
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 00:24:54 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-529f4770585so314164137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Sep 2025 00:24:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXjte9GgI/l/rXmkHLgBlsU1EhrRDJpWm13gqvrfe8Ymg30IIYpll1AtDzviSvQqRmofH1QKMCqtkdyGRyaT+SI6g==@vger.kernel.org
X-Received: by 2002:a67:e7cc:0:b0:51c:77b:2999 with SMTP id
 ada2fe7eead31-53d1aead9a3mr6302748137.2.1757575494024; Thu, 11 Sep 2025
 00:24:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87tt1c9z7h.wl-kuninori.morimoto.gx@renesas.com>
 <87o6rk9z6c.wl-kuninori.morimoto.gx@renesas.com> <20250909-witty-successful-toucan-beca41@kuoka>
 <87segvw5yr.wl-kuninori.morimoto.gx@renesas.com> <983be392-e76f-40b3-ac57-5321f5d88abc@kernel.org>
 <CAMuHMdUFOGNNuogp19WoCy4c-4a6KjBfyutp=UWfvBD2oHtOAw@mail.gmail.com> <bf4a92d4-0472-4d0f-95d5-83fca816ae03@kernel.org>
In-Reply-To: <bf4a92d4-0472-4d0f-95d5-83fca816ae03@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Sep 2025 09:24:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVvhso0E=w3Y8tk_GnBWsV8GrjGPwYkSq19aDr+VDSymg@mail.gmail.com>
X-Gm-Features: AS18NWDfHsUnNDTnYC23I-0l_-nwegNPIqhIwsoKV6lC3uv_Pt7GXLVKQdvLYWs
Message-ID: <CAMuHMdVvhso0E=w3Y8tk_GnBWsV8GrjGPwYkSq19aDr+VDSymg@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: renesas: Add R8A78000 Ironhide board code
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Thu, 11 Sept 2025 at 09:16, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> What's more, it breaks my imaginary system root, because I am running it
> from readonly NFS root.

Real mean run NFS root over SLIP on the serial console
(which is so far the only I/O device described in the DTB ;-).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


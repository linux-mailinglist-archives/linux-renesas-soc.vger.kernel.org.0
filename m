Return-Path: <linux-renesas-soc+bounces-21260-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43686B41D90
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 13:52:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DED551883380
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 11:52:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8D93302740;
	Wed,  3 Sep 2025 11:48:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6B33019B0;
	Wed,  3 Sep 2025 11:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756900112; cv=none; b=XjtaFFyO9deN4syqyVE5WOW29ojb5krH6eGn2dKPTLJoNZ2KpZoUrdKvqhmCpNlmq+Z1EAAP2ifjumDmb4ShdXGY4KRrKdCfQTcEy6563zt67NagWm2JXo6/vWGY5FJLrrM4dhn6mRoc1JH4HLv9TgVYlWlJxU+JhEXQC9JbQXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756900112; c=relaxed/simple;
	bh=lxvs/e+TC+QjNceUTc/w6D+hqCUgbz+LfsOIbO0aHu0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fspCVAD/mO8aqyyQ0hmbIR0oKQ+ZIV47Hbhx54XFEcgS8C2EtJ4DNZqJiDe/eCx567DXeRn/49HODrcArSQPpmdW9Qi83JnD9ECU9Jnfap/83cic/wtnFlAJpQxi8bmHHVrnfPFgiCu3LFb5EA2Ep71L7vPdCrEyEsuPoD7f+7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-544a59e1e87so990600e0c.1;
        Wed, 03 Sep 2025 04:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756900109; x=1757504909;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iL83SRPkG/cRzodxBsDjzP22qE52E2/O2tCOd7z0agg=;
        b=IUYhK9Wg64/xbW9maDPFUAvi50RMyZSACuIFNAv4IQlQXr/ttBcQ5V4cGBvGkzozFx
         rQvusCp9Ff8A5D1WOHBOf+KJdzUxYA/hbyBxlcAsr6CKnrbnsmDclWYbG88Hihxu4P18
         7uVCQzMkYCiuk8thhZ+oOKdiiOe87ImL8+h6+JN1wBpdmY2garb447cNdDBIRPtvOBdK
         6IIfGX5RayABEzy2slxt5kbC/LYO91zFp4mKUKjSyaNGtRgvnghycZ/b5AkODfPVejLT
         NGgyXvabPa3tH0sc5ADaF/89XlHM8xfWAztkNGO3MnqTTg02C15FR+kRQyPAh8ArN+Eu
         aRHA==
X-Forwarded-Encrypted: i=1; AJvYcCU+rMtfAFT5IXdFCGihW4IyGZBYGlh84XEOep0aSR5EkNYnDtNNi4nHhC6+egHrN4g2cwZmNhBxfpm/@vger.kernel.org, AJvYcCWg6kt6SP3RM3b5AN2me3Ee0G+eeHtqi2aYbsjv0EFEzlTAEmM87juMvMAK9i9yQkpk04yuAOTlgNkiTVMI@vger.kernel.org, AJvYcCXI1/XBHA9JVuUldIAV8kUqWarTvINHCiNOpoYmTO/I3dWhd9aiPmFZAQOv0iPkT8GVISOGh5WbHpGw4HTL/gGVU0o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNesZuxl1m00AfDI7RPl2BfUuQbZSPufLJm8dE08FWVpJ+wvE+
	nS4S+U2yiGN3JdTlZa9joHqlHlqQvTpDgBDjuz1lBInTadI3IYr5tN6EK6Oz2sRC
X-Gm-Gg: ASbGncv/EYUIFUH7SfgAXR4DrB7fbRmE7cPBMt5P3pZKOLaWpppFhkNg3u+6/3pcEk5
	8unPmROYShViO36WcpG0NNa69l0wJn4bbDVmHc+1UXpDa4qCuCu1W3Ispr4ED+RGwaoaaLqNdDa
	sPFec1b1bYogmi0hx8hn9aM02aHFI/kmR17QLYXcSVdrcFW4sMSEEvtxirkXMfTHYgiaMIRMg7L
	2zu4kEtS5xcM8QX+Plrufd+5L4puKPbxL2ZvUNInQCbeRPKtkJgQt4+OJKZRlgohjETLQx/Rrcg
	NmCLuGeuKmrt5UlBFQwIpEhBGP+VRhJhjS+qgzL+1pPaAGhixKUQ56P25DoGSahRmOYcfECjceR
	u1dUZpXebF7iauNFxVEala/FMpuVYzAsM9lcWxcdl/KcbLpdWN6ZvKgfQ23Te
X-Google-Smtp-Source: AGHT+IGV10qMzXKO84wwLIk8+yIXhpQpFv/NFacnKVxv0OtImwqFqouCxGVBP8b3Sve5dTUj2XA3dw==
X-Received: by 2002:a05:6122:2048:b0:545:df94:e613 with SMTP id 71dfb90a1353d-545df94e9d5mr106965e0c.6.1756900109196;
        Wed, 03 Sep 2025 04:48:29 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-545dbcf4930sm438326e0c.27.2025.09.03.04.48.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 04:48:29 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-52eb6872bd2so1304721137.3;
        Wed, 03 Sep 2025 04:48:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU6hxwNRd/uJAX7V4b2RW4jZXcleh/IfWg1rZvysrEDbFuHiwF+WEqQ/q6n4lLg3HeNBI97bXdr5DYAQDNa@vger.kernel.org, AJvYcCUAmSM0cox2TS1l+cjPQVkI9g8xMi01i4LQmiMb2c3mOzHU7jCpPZu0yG+qC+N4kCCrp/TeS5bLTVem@vger.kernel.org, AJvYcCXmvbEXsqhnao6V0vBbk5BFfhtySlpZU6tJlMEfCL58QreR9vg2PpNG5hGCxJ3PjqbhfP/kb4PLmXe4F65c6J21cT8=@vger.kernel.org
X-Received: by 2002:a05:6102:3713:b0:529:1815:ae9b with SMTP id
 ada2fe7eead31-52b1c33cc1bmr4864889137.32.1756900108361; Wed, 03 Sep 2025
 04:48:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820200659.2048755-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250820200659.2048755-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250820200659.2048755-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Sep 2025 13:48:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV0=gYuV_Jp_9_9STbCndJo=aib0_O=Av2t6cLC-cjxEA@mail.gmail.com>
X-Gm-Features: Ac12FXz70nuKqkoDSqXpD4Q8iNxVp49TfpOLKgmkBMYKlmd0XiLQnWmXtigDICc
Message-ID: <CAMuHMdV0=gYuV_Jp_9_9STbCndJo=aib0_O=Av2t6cLC-cjxEA@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] arm64: dts: renesas: r9a09g077m44-rzt2h-evk: Add
 user LEDs
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Aug 2025 at 22:07, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add USER LED0-LED8, which are available on RZ/T2H EVK.
>
> In addition, the header file inclusion has been moved into the common
> rzt2h-n2h-evk-common.dtsi so that both RZ/T2H and RZ/N2H EVK DTS/I files
> share the same set of bindings. This avoids duplication and keeps the
> board files consistent.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Changed led node names
> - Added color/function/function-enumerator properties
> - Replaced GPIO_ACTIVE_LOW with GPIO_ACTIVE_HIGH
> - Moved header file inclusions to common dtsi

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


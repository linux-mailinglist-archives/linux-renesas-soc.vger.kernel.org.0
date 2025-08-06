Return-Path: <linux-renesas-soc+bounces-20052-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C7BB1C86E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Aug 2025 17:12:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7939D1686F0
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Aug 2025 15:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F191528FA84;
	Wed,  6 Aug 2025 15:12:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3613AC1C;
	Wed,  6 Aug 2025 15:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754493163; cv=none; b=OMRsRas6uDGYxU5P+5hAgtxbrJiiv3DRdw9ilFZ8EAtbTBqaxTEQVV6lqNCf+e+Xb0fzvUz+nrbch9pOREni24kFgzvIXtT/1O4M//tszvlTEpRenu2/4SCa0ikFM/06VI+j9qMmAJqHnDIxhMUORjLZLjfUNMi81jQUa+ZUnbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754493163; c=relaxed/simple;
	bh=84ZjDEvpUnPWXscyd+askxffizzYTapWmVAhSR6l6Qw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U/2wXGvck2rbacAuNCXgvc+BjMkVkogZXGZZEElZYfDEJjqFjUBCaEmq2rHNm7ONyZwqQ7HA/EF4RRd0QuN8n6r/56DC3wcWVk6TXm43W+jy96/Ucsf80xxDastUpR4L6FzWvvLt6nj1uZyfSfmExjElc8mJ7Ka0lhPfSWNdPU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-539360cc274so3508103e0c.3;
        Wed, 06 Aug 2025 08:12:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754493160; x=1755097960;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8idSeLj0k9V+7xL+wl7mu5nbsyyJQs8y+AkCxOVjYl8=;
        b=Z150O4QuP+G8q2YBtsFyiueTmzbo3bEmOXVvd4BDUcxB2PMEPVwr2sqQJlXKmmGwNM
         4Yb2lKDVGxXI16zsgAEWcJN7wubyUpgCao0vnyn+HMJ1bgIHm5MCkWiU6USP4nleGi27
         a4RLe6meVmeoesmhWlIyqJvQQyY3Tbcsn+6fcY+vCe6qTtSCC6v6CQwkePbjTAA+Lnyu
         ewQl3wfmlb4M3S1XEH8OQ4ul7UJPdMMK4VmecmkIicqWyJ3fpUuBzJaWE8EDw61xqe22
         2UInBDfLz6F71uxt/13onj+0KPGichqlpqmCJXvllIBPrnpM48kdYGtIsPy6g2aUKyVc
         mixw==
X-Forwarded-Encrypted: i=1; AJvYcCU/M9KuF9NA8SLBdFjKb32lTYARPt/2cv3Ftlk4frZ+uox/mU9z21p6uJencQToKlCPn5OF0YdF1R9LgsWOiuntc8o=@vger.kernel.org, AJvYcCVt4hjpTFCm8NYuAeRC6P8uYGaPxnGpa57iG4SvD7o2DRyNKYA8t1SA3xxVHoEftHu/6tAire8eN9AT@vger.kernel.org, AJvYcCXyXZcv102Xv3V/P4xuHBcCr6cekLdnyOVQHhZdEQ4llzhJURAJLj/FmN9WDvnajJ/mg8YJTvtJpPB7Gh7F@vger.kernel.org
X-Gm-Message-State: AOJu0YxHiDe7W0RuNjX7hAStguSq+jFyLK+yMq1iBoM8SIAFXsFfp8Zd
	14eN6OpmhSgC12vN/Y45zi7pUEqsnD/MVKloSJ8Q349Bm/ppkuuBjs7mpUtNbOLM96g=
X-Gm-Gg: ASbGncvWnog//gu4rUZTJmPD7sMIu7OuPmSl4cuhGUknG9DDWAZExRQzJH3Ee4u4+7S
	qC+a0REXseyB/rz/HcC35J66t/OMI6LLZpCysiclBftacyBsAdWpK8NeUsiniM8XbgPLXyUx1GW
	MGkSDAjoggJ8Re7Y5TMa8sSnhUep/Ir0eX6k9OUK8P8jFdykSpEURzefmtzHu11hzyB8A/qsOCU
	/qvTuCqRZ/0K/5Y9jpAiPGL8FjYl2K6Bw/k6Fz7u1w9f/WfCN8A5l++cUhH7Yt+a86nuzh2pmvl
	vZNqpX45Ux2RkCpNou80r/C0ahH71pLOA6DmBV+eVVc0hFb9d3YxC7NijtH8z2BMMHik7d/0AJ8
	IzFMk2Il3+OzhjiEhDf7k3z9fdlzHZ/U2tBeThWAZTo4oXflQc948fAyEJ5rT
X-Google-Smtp-Source: AGHT+IHDj7n7dchNp/V15uqZkW0nb+WRcaGCQYAbhePs3WC4xG8W6mCpKWts00ilpFGzzZSk5hyS7A==
X-Received: by 2002:a05:6122:65a3:b0:539:38a4:3bc2 with SMTP id 71dfb90a1353d-539a03a61c3mr1762071e0c.3.1754493160087;
        Wed, 06 Aug 2025 08:12:40 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53936b718e2sm4294855e0c.10.2025.08.06.08.12.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 08:12:39 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-88dc40608c1so1808942241.2;
        Wed, 06 Aug 2025 08:12:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV7djSt2GcFJ6YLvnXicj51LH1CvLP2HY5EF4zHzUQxShQ50j6e5Uec+mBXIIpNj0WW/7/RlWoVj2XuCFY/AbR7ZNc=@vger.kernel.org, AJvYcCVkcwMVON5iJLLzZMYrisCeidM0Ayp6miwgzPdVaGXo2xKYTDv6cfALFJ1nspFesTujSp0KZZTRyXYA@vger.kernel.org, AJvYcCW6w6K9Xu4R+dNhcKgHIXwvSp17STSU4HwLmJ8SMQxF+7hJpm2fdugPAgrNHg8NOdVw5oFtYpJ9WZ0aGuM5@vger.kernel.org
X-Received: by 2002:a05:6102:1620:b0:4e5:9c40:824d with SMTP id
 ada2fe7eead31-50373e1e391mr1744378137.16.1754493159652; Wed, 06 Aug 2025
 08:12:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250629220502.935717-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdVUscsQEOiVUdwszM8LsiSx4FScHC+MY8hH7B_xtQHcUA@mail.gmail.com> <99ffa8fd-d2b5-402f-8a59-59d60ab49afd@mailbox.org>
In-Reply-To: <99ffa8fd-d2b5-402f-8a59-59d60ab49afd@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Aug 2025 17:12:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWJDBVJHGruL_kCssVC9n44pbYGDiZK3ks2D00NCp87Vw@mail.gmail.com>
X-Gm-Features: Ac12FXxwMUfhcnL6gXfoRu0Fr2bYb2TG-DcGkDV_8GtDXgKEbO9nbJMpzliWA74
Message-ID: <CAMuHMdWJDBVJHGruL_kCssVC9n44pbYGDiZK3ks2D00NCp87Vw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: renesas: Add boot phase tags marking to Renesas RZ/A1
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Wed, 6 Aug 2025 at 17:06, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 8/6/25 11:11 AM, Geert Uytterhoeven wrote:
> >> @@ -639,6 +643,7 @@ ostm0: timer@fcfec000 {
> >>                          interrupts = <GIC_SPI 102 IRQ_TYPE_EDGE_RISING>;
> >>                          clocks = <&mstp5_clks R7S72100_CLK_OSTM0>;
> >>                          power-domains = <&cpg_clocks>;
> >> +                       bootph-all;
> >
> > Please move this to the board-specific .dts files, where this node
> > is enabled.
> Shouldn't we rather enable OSTM0 by default , it is enabled in all RZA1
> upstream board DTs it seems.

Perhaps.  We used to have issues with enabling all timers by default,
as some may be used by (secure) firmware or another OS.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


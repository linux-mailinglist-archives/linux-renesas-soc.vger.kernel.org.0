Return-Path: <linux-renesas-soc+bounces-21785-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDB7B53847
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Sep 2025 17:53:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0042D1CC32F5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Sep 2025 15:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB2A5352FEC;
	Thu, 11 Sep 2025 15:51:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DF932A821;
	Thu, 11 Sep 2025 15:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757605895; cv=none; b=drm2snAT/VZAI8W+FfTBA9AENNpuTxLKb8yHhDQhH8YQVoOmacQv1FR9LmNSoTTah6xz1L5jrNjXj4z9D8aFGbxUlPmgeizbKOkkDKhDiGS9+gUk91FArUPs6BQvXx7ev26jVLGBVNt+/Z1BUl5e0u3WMQi6m5x/dBXpN728Iq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757605895; c=relaxed/simple;
	bh=hOTM2YqsaaQZ0s4xX5Jh9E9LY69GPHvMm7oS3CiEjig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h6Jd/K03XJkqBHGOywK6dX2jS1+JdX4f4ZKOoAuQ5I8ZT5Sx3p3L4NQHeBcToGkTWfSkQDMHnQqx1qu6pBE64Sr70i0tXFCrskdv+jlCkAuuXJIJWrLuGyMF+dTnYPvsP2ML9sMZLoSM18LW0ewHxPV9d6G91tw4MI5CrWgt1iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5449432a854so414344e0c.3;
        Thu, 11 Sep 2025 08:51:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757605892; x=1758210692;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q6SXCiZ7DVZ5Pu8qLc9Tk6fbK09WaCvmseyy2i8FgAY=;
        b=j5QPzMKZe9cVs+svFhJdqeX75lkbBmwqq33A0ZLu8JO2I5B/AS6APJL8r/uVmkDxrC
         mD18NNNhdTOWAxcvUfO7J/YmwaaPPs4S2SgqQGhLrTTzTkJcoOcv+fQekog3/gGjAIuu
         xFYjPCyDGOC0kPHlaMdjp5JrWP/BLzYIojm3QANILAcy0ocGM0T/XMZ2HZcCeBhgki1w
         HpbJFJNtJqWkC3+Mdezhc8jXW07NmyV6DW8dMra2fTm3FmFSOuF9dko3rsA24ReDpMQF
         OLOPjaUIQmcHQBvebRSE0ClqcvE9y9PF5Xakv9huMzjD3+lx/3Zhw6zUGTwtPYLo3LoS
         HD3g==
X-Forwarded-Encrypted: i=1; AJvYcCUCQM7RKePL43ztKwYxKCBdkMnz35j6G54WbNPC6bnY8DqbIROaAHE6WPpO86Blf8eFEjkZmxeKs6JzDf72@vger.kernel.org, AJvYcCVs22fBc1glsSYUi6CiolthGCer3e2qJFYb/uYcrk+qBBRp5IvYiUWlaZ8oTXCUd4TFvpy6bwm2m88V@vger.kernel.org, AJvYcCXom95jbax5zN9F0vB63EaGnV9KzMHeraEG25/cYV7OQRLRrW1JUmF/cySqjFu1ax7Hk8tJXyaeBmqzurfXWXcXmO0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsUSvDdgeAunB4RygPnh3AGCo0sxK5ZUKJ02GKv5h5TlziWk/O
	IR+1kjQgqrK/nbx9eMumMNIjWrYqeL3g0DSoAtg1D8dddDlJkdJ1MOqNcFQOPbBd
X-Gm-Gg: ASbGnctsj/mi0BsqWfLOXq0MBu9zDtItgCtt387iS0du0nPv6GvabED/rcNxStnjMlD
	cpvED2zXVbF9IromNQShpn0xS3/GQW5ce8AV8HdWfdnI6B/t8Q/UjYtpr1ifGe17xMUXM5IpVoa
	S2hkETBpeE8z0JrqGuw+8xAYddaHx9A8tf2MWkRoS/wSYxOLhDW5rmIL1TpwUKBsPDEOYRY7O/M
	nKG3xvIBykbdsj/MYrtowV+uiSG4XLpO8QyiDqyoG+OSnq2ZokY+lFaqNjj2F1f3dBrOAVUP4PJ
	A4lyymLWwrjcYiC5tC7JJGO4QviDSP9gUnKAtB0yrxEzcJNYwGFwSbYfBDM5vzm8xl7cG6fOZmR
	eztF7J5rU7AzKE4XLUwsDJfMOEhfx5TTGEM4SPJJkPURjIVIHug84z8KVMLRS
X-Google-Smtp-Source: AGHT+IFAkXJF0LvzuCH7iocUk9B8Sa39PwOmxr6zHAePc4uA/AK/Kxtw2oWkhPAG/3WTxT7xH8vL9A==
X-Received: by 2002:a05:6122:2022:b0:544:9414:105d with SMTP id 71dfb90a1353d-5471d8435e8mr7131988e0c.0.1757605892514;
        Thu, 11 Sep 2025 08:51:32 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54a0d424de5sm319632e0c.26.2025.09.11.08.51.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 08:51:32 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5357f3e2520so710695137.1;
        Thu, 11 Sep 2025 08:51:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUqaEr5lySgJ8+U9g0yWXwiriVCKJHQEtT/iayHANt3FJNxDFKCODGR4YBBTE1Anr0std27WBsES/e6@vger.kernel.org, AJvYcCW9PWBLvOHiYO8mLszgne1+Q+Q21NOSN95VUlcjU0tm6wfKfb3BmIYah3HPlS3aU+FcrS4sEWdhY6HX4yA57NGdaQ4=@vger.kernel.org, AJvYcCXoQkm+DuqprJLELsRSlfI3euvFY+dDi25aGqyd9OQH/pk0YLkC8T8p9vY4drPDOlLRSQghYZUpt1ZvS4nJ@vger.kernel.org
X-Received: by 2002:a05:6102:3053:b0:533:ff66:696d with SMTP id
 ada2fe7eead31-5560fd2d1c1mr15152137.23.1757605892095; Thu, 11 Sep 2025
 08:51:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250904165909.281131-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250904165909.281131-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250904165909.281131-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Sep 2025 17:51:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVYtoq8ib7yzJG5tJWDvObVB4CGn9kyM-1vDqW3HaraHw@mail.gmail.com>
X-Gm-Features: AS18NWCmVR8fO1uCxVPbnC5g85Xsc3bZdmW1WeHulaSUijhLjemDonm3PsQ-eNU
Message-ID: <CAMuHMdVYtoq8ib7yzJG5tJWDvObVB4CGn9kyM-1vDqW3HaraHw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g057: Add I3C node
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 4 Sept 2025 at 18:59, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add I3C node to RZ/V2H(P) ("R9A09G057") SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.18.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


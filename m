Return-Path: <linux-renesas-soc+bounces-26360-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 317AFCFF168
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 07 Jan 2026 18:28:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A540230275C5
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Jan 2026 16:11:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D686536C5BC;
	Wed,  7 Jan 2026 16:03:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com [209.85.222.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C450A378D9F
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 Jan 2026 16:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767801788; cv=none; b=P9zHrtqzSehwyhdPZwSkT7DlN4DkOP5GGHE9ewviTaPzk35YOhpqGFw6HMFjDIh0PrYVOyl4gOKtX9CbkdyzY/3BctdHas29QY85vuq/D7W9XpVj6o4JyAGWzHlGB+DO2i5jrfTbXw3r9UoANZeXaTG68TvOsbwn/yn0YARh56w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767801788; c=relaxed/simple;
	bh=9lIABe66qX5B3ULWKN7dRGrBhHh5eVyA9SZWghC2qpw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GhhZCU13mKiCzsYCTX3DJXYuFnxCAu/h6HxHRmwRDFI/RzjZbiMP92THA6H6yYpmTj7ddOVG4lLd/ZhgPVLNj0EAxquUiV9adTcUvgDQVDLjM+l69QPpuKjCJtzdWnNLPM4eCfZIwrmROmVszGiJrLOxn0kMvlWNixGrlYBVoeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f66.google.com with SMTP id a1e0cc1a2514c-93f5910b06cso646200241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Jan 2026 08:02:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767801768; x=1768406568;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8hrZyBiZ9cPjNxWra6rK3FeRhusMqxhmxYkDFplK87w=;
        b=N4fyuArMk9yb2eOCaeyiXnB78wzmmw0POnQTGfs6d3O+4GvGrx2rG1PHNyyHz/ik4L
         GN43OQPL54X/r9gjtW7dx2A7FNcEH/zu1TpmgsaFw+BKq7XhBIdIl9+2+mRPoseb1uPR
         5fCGGJROEzDQBjQqo5Hu2u8ss8+kNqHfBkArX6e5PseJli/XdAUbITCCokiUuRJBBXjB
         05QzWvRHL+IobMtlfrarQemOOcXAAGB+8zcB7pQZx73h6MQ0aQhmWta3/t3u0422YRSj
         KCWUuDJObd3OzYVVLQEJ03GXsj2dy3mIiCm8DjAtTiORXTvgYSZioy4AQWDpaCaqfDcK
         CF8w==
X-Forwarded-Encrypted: i=1; AJvYcCWg6qSbQrk0rpRZqWEhQ8GC6DwKyCQo6zcSvz4uZJf7XT82ncYfJm9DPN+XgmGYn40eJM1QQLK5KEnhpvuzb656nQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEhU9tHbWZasCoz9m4axqWUspEGa/3zr7w+C6M343OcaKUZd1D
	Ma439a4meflWsfl9yn9JG3VGFkKswIQuhKsgOsAoRFeS56Qcfs9+NnLU967ywLv4bXI=
X-Gm-Gg: AY/fxX6QPi3aCukcl124+l96xToupvTI3TQyjS/DaSV6qLlNO81GswSHck+SmyLge5p
	f7DZAf0bvTuI1o3zb6MGxVNXI9Ih8QVG4Li0tG+46yJbTb+OAIu7VbJtN1syrkVKnnZsF3Tkxfv
	YkE+aLN5fh152ysac25tJ/iS+l1hWXQK0sNGCgRRThFcC1FUjnPjePBkV7QtV4z9JbxRWpVXSIu
	cIj0RlUytjqkPMdIEHlty7GDDKs7oGGHDXFPRoeh4KKUagu/sPbFy7RFG0LOVh/C7lyzAQGHdzE
	R5r6PaO1BczOdLy98GYiMWZJTPjZt0PqAd/aiGXriTw1Xm4GpL/oeMN389t/1vUl+yb0Erbwmh2
	sjoSPZ+139t8B6pMYVpJeti5mlkUWz5nr2ESkibSLZ9IrEUVR6beIomUy7tqbkO9p6X+BRlGEP9
	lqJ0fupRzK29OWnaPhLquAwWeMQoexm01TTfIBl/8Gayqb3fKVYVEiFzIcALd2Juk=
X-Google-Smtp-Source: AGHT+IEBxjKSdbbHHww2rGEOcGBeT2x7WliDTIZ0ioj56R7BDARnVv7ILpu1e6DsD9bXcYtZwHX0Bg==
X-Received: by 2002:a05:6102:3e18:b0:5df:ab05:d84d with SMTP id ada2fe7eead31-5ec8ccdfdc7mr1236940137.20.1767801766412;
        Wed, 07 Jan 2026 08:02:46 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ed078a66easm1779133137.6.2026.01.07.08.02.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 08:02:46 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-55b219b2242so552558e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Jan 2026 08:02:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUskxeEEj6MuWdiS8QK7b5TnEzaYzQUr14x/+Noj/LKL1RAszXOe48VappQP9KE3RVxTVUwYQDHOTfCj7dvOrs7Bw==@vger.kernel.org
X-Received: by 2002:a05:6122:3383:b0:55e:82c3:e1fb with SMTP id
 71dfb90a1353d-563466b1471mr1147392e0c.10.1767801764769; Wed, 07 Jan 2026
 08:02:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251230115814.53536-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251230115814.53536-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251230115814.53536-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 7 Jan 2026 17:02:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVQeO6NmrCESnKZkpHWLN6CzrWR-q3VNW7gYMePUP37ig@mail.gmail.com>
X-Gm-Features: AQt7F2q12M6ufG9O3zwEr8RO6qBXtKdp_ZqxDQ3r9v7omAoAEJN2ATl2yMiroJE
Message-ID: <CAMuHMdVQeO6NmrCESnKZkpHWLN6CzrWR-q3VNW7gYMePUP37ig@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: can: renesas,rcar-canfd: Document
 RZ/V2H(P) and RZ/V2N SoCs
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 30 Dec 2025 at 12:58, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Document CANFD IP found on the Renesas RZ/V2H(P) (R9A09G057) and RZ/V2N
> (R9A09G056) SoCs. The CANFD IP on these SoCs are identical to that found
> on the RZ/G3E (R9A09G047) SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

After downloading RZ/V2H Hardware User Manual Rev.1.30, and noticing
CFDCnNCFG.NSJW = 0 is no longer prohibited:

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


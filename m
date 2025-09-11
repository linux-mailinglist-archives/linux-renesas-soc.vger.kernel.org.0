Return-Path: <linux-renesas-soc+bounces-21786-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAAAB53844
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Sep 2025 17:53:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5EBED3B5A26
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Sep 2025 15:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C245338F49;
	Thu, 11 Sep 2025 15:52:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25575238166;
	Thu, 11 Sep 2025 15:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757605919; cv=none; b=GucsN0YvVmeyzmkwM9cGqKqN5CbMvcjkXjQlPBK9COCTXcJamWV5+zWi187zVqaNoqekH4aNq417mlACDYNeAZq+CWBY9cBnbE1nJnXgO83ncbBEid/XbCkSqBVu0R0teqQ2tAj4vKVy4pU3wvXkpRhF0aR8MVzYEXTNlYEqKhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757605919; c=relaxed/simple;
	bh=8yGGs9PcX1G2CwsqTIrEZDc76oLA76D2bXONsh7z4O4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a8N60Ry2u5cc1HJN/Sb+uOYOwSFTedtHIO0Yri/9uY3Qr4du8/asRrYNVktL+flHhf9hgsKPqHpsIz+490d5bLg/Gkv0/GXl4tPvxtZ83tk+vn7h6pEJV5qWrjU2/f2MtvIYHUi3A+6xwiaHY5Pd52Wy3XAX9BrzeGgUnTNhXFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5449cfbc489so570807e0c.1;
        Thu, 11 Sep 2025 08:51:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757605917; x=1758210717;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7WmDTtoX4Nu+x93mK7k7FtNeJY+MFNl3VRMgKJ2eEv4=;
        b=VIWnRME6wXGjpSNBaa/nX68S8NskMgfhB91CtFEESr3soLm7SydjEBGIp/wy+ZwtG4
         4qertg06tURsb41flZfRcLvuKSYwHYAWz2jHkt5XRQ7eOS+MidBfH2z06Xxx2vFghiyT
         Vbks47o73t36u0PYMCVI8uJyTD/yp9SNwDrTNY2IBxOxLATHUa2G++EH4IyXHq/hNYfS
         XvLtAEAOIKgoQrft3wEyZUOCoCmKOhok7NzV568tzGnzNPXxpJ2qbPcMB2Und8UVrVcD
         pfGIPCoiMjU/xlE3rNcVEfMF+1I8SApM9rHNqCIHW0nNx6sHqDq9J3IIdAZaZOQxjuG0
         43Xg==
X-Forwarded-Encrypted: i=1; AJvYcCV5TyokCBIal8JxYgzelrcM/fihAibcGZimiRVkFpfyXpK9e2IDwcOPU0y8D46gmICKSkCJpVB4JxRo@vger.kernel.org, AJvYcCWCrfpPztMyE5kRg+WYvanAkHaILMLDscAb/pC37X3VM2kePARbVpY+O03eQpWHzQeTCT8bAJXHXyFakYWW@vger.kernel.org, AJvYcCWw8H/gnyZ4be16ycI+nxVIMHsRDQ1lVqrQP9XRRXOMPSkVvMmkHD/SIKYmnCqCbwVUi9mxkMAG9ma/Go+JCW6PL8A=@vger.kernel.org
X-Gm-Message-State: AOJu0YykxbJcpzCp5weKcXJCKdCboYaJ1WSV7m9N1GBllq9t3hq7eiv0
	0nMpt2bMQE4PniXn2kOOjb/tRHICNmalE1Fn/LoWjdjDHjjiL59TRycjyTBzGSSz
X-Gm-Gg: ASbGncvi1dZ9FIkT89Rj6LUEAEC33Flg6Ub1MLxagWV/U8qZwZDZko5uT/GxiZ/JB93
	u4fb+wIzC8NNJi3t/i2iNBC90kJ94o+U7s78nWSwMD+vbD2Gd04eL5gy4AJ8/UopkYrotph+A7e
	KllaSvZumC59dddWqg+Sb8sO9UIPFu1VYxvoQ/+AWP9/eylPSComdPgzKGaDsF3blCxZg08V4vd
	FIdgj7DVLhPYnkXG+nyNi3TB+H47QWGN35lY7mvtuAJ5WTHfrpBNVWX2O3LS7Zy3QfNfIQDgJxS
	vLJqad9mJHlGOmvy3pK41GRI4ulYaBr4B/NaIusvlDurMhvq0OIedkRUFPupQJSBkwGr2hvFTuu
	nLQgeyo+Vuyti2Gl92fC8N1D8TN+6H+Tp8acXtGhXTdim7Q52epa54yMTdJvGPTY/
X-Google-Smtp-Source: AGHT+IHggu40QDEMt7NU6jeixcvznNHqKgTmxNSBn/MaV3BEwB1o0KoC5bvaIwb0D87lmalCt8yrXQ==
X-Received: by 2002:a05:6122:251f:b0:53c:6d68:1d39 with SMTP id 71dfb90a1353d-54a098941dbmr1576737e0c.8.1757605915563;
        Thu, 11 Sep 2025 08:51:55 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54a0d1bd550sm328690e0c.5.2025.09.11.08.51.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 08:51:55 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-549f51cb12bso1220971e0c.1;
        Thu, 11 Sep 2025 08:51:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUrwfVdpP9s27mprvfF+YH1autmDUOZx9rs3rXRrYZzgSMGMDgcflfaGyhqWAb+fFvOd7LUdb3PeufE@vger.kernel.org, AJvYcCUzS2T4XvZr/Fb/hAu1/APtsF5O8ABgQ74cFrl8wKLjvlN33hi434oBLDPyEOXAmdDd2azunuSiCGsfMVeC@vger.kernel.org, AJvYcCXXEkx2GfRAXTzTJCDFhOilmKITxePfNLCAMfR+fMKSDiW3OxDyatkQKSS7oz5e5pvuLkbcIgKKCo/fm+MV+h30GSs=@vger.kernel.org
X-Received: by 2002:a05:6122:8288:b0:545:f7df:4769 with SMTP id
 71dfb90a1353d-54a095f398fmr2008582e0c.0.1757605914992; Thu, 11 Sep 2025
 08:51:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250904165909.281131-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250904165909.281131-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250904165909.281131-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Sep 2025 17:51:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW2LQg-UW9C5DJ-KwA2=RByNpbp+hW+oessFUvBf4q1vg@mail.gmail.com>
X-Gm-Features: AS18NWB6RK2PjMzC4cFWm6yb3i47myg6SKk63Fy4i09p9QY3VWn0N8LzYVflx50
Message-ID: <CAMuHMdW2LQg-UW9C5DJ-KwA2=RByNpbp+hW+oessFUvBf4q1vg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r9a09g056: Add I3C node
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
> Add I3C node to RZ/V2N ("R9A09G056") SoC DTSI.
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


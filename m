Return-Path: <linux-renesas-soc+bounces-17433-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F6DAC221E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 13:39:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE4D23A1834
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 11:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AD02231839;
	Fri, 23 May 2025 11:39:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16663227EB9;
	Fri, 23 May 2025 11:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748000396; cv=none; b=kX0lK31r72RSctQ8DhXGrhKZ3VRQqVzjmP3gf7NwAKPXD7psqXTFpCbR9T9/xCHMnidO2FqUsAKduDW8IDatoBevnsts4F7g0pyd7vJpU6FG1ewcQY7C2K5Yr7f+80V99jZ/M4x8OfNxUdA+/kmMThz12tyeEZ6ajaamYZamHWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748000396; c=relaxed/simple;
	bh=Q+hmHzLP8Exdr6YUhkdq4gsISOtsIsD3QuTiIugE03o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AeV15PyMg6oxqi8oCw1CjIZ7VPUigLkNq69C7mm1nziYgD3o6H+DZ8NVGkVNvC4kGfFP4iSc3lZ8tYwT+FlO4G+m3BXH3dl+iYBfU3pep8wZElr94G9q5V3h1drnsyYJUOMjnZtPdFqEsf48sZ3FabcGBCWdD7XRGhMbT2zBluM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5240a432462so581804e0c.1;
        Fri, 23 May 2025 04:39:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748000392; x=1748605192;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X1Qz5wMN6ML0KeGlx/ug7p3qlLH+pob/79G9MOgw/Eo=;
        b=mEo2XeD6CrT0ebkmbtohsPg3pb1KHK2Wfozwe7JAZ4VTwhNAP1I1a9K9dv01mvnMFd
         aIhkh8gvbc4VTf2DrYdnqCu1OpE/DRR6psdbpxCUC0FeL+Kkyj6+hIHUuIIW+7C51G4l
         yGHVKVMMaMfKmZoV6XSv5p6y3LrG40QRNzBdKAOCNNx+XfWx3bhbjjaTjrfZ05usfQEh
         8wbOaA5GKAeIpepgoftAhbdHAvTutwH59CjBDwL7/nnymKVDKZro98xN7noyX3AX+x9m
         whWdlpb8OMUZfWMJvdgkBUFiDxma5amTj6HW/aZX8Lus7GToQGpdAfQRsgRCDPZ2L7jz
         Mn7A==
X-Forwarded-Encrypted: i=1; AJvYcCUwo62lMhK0Hlv8PSoOYYzFE97J431A7b+BQf4kbiUtA5IyxfS/GkrdsfVnKC8Y/IuSKmMMAMa0kiAzYr8=@vger.kernel.org, AJvYcCVgOAXisljcEEcgn2wwp92xLFtH26KV1M/nPnIOUWyUya2ieCoNqRoLy/K7qInWoPtl3xxOpt0C/SbOzSDcZyXGdLA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmNFnGLPejhQ2WMu/vCO7Ck6UTzMm4hD3J1CibKJwxAJFRTi5T
	tNoaOy51QqhVZAkErg1KDdfC9Ne2sJioTFs/nhb4S+i1jK1Ei7aWi7m0YP3L+U7n
X-Gm-Gg: ASbGnct7SwXV7bPe+1qXHP4RCfiPGBLevVVbZUINP/YjfE9YG+hhleGSFgA2epuo6Wo
	HZtIe7x1iysgDQWLNEqoqlr+5iWAm1ybbvivWCateiImHNxMgNccruWhNKDwkeHOmUwIZ0E7JHB
	kMkt1oOsBu8WU2lo7aDgJttFVVliFYZAuqo6yTeI0++3X0C/UwS2DAZ6bKNanw3h76wYuGS6XbM
	p16++zIXWkSW0h1q7vn3J5gP6pMfXKFg/Fx+PFEqCesiU5EsW2sUfJyZfyUG82DcQETszEr5Caj
	Cpyi5Psu+PIeGOZAx83PyFVS116rnO+PJcWms7I3Zor/7jpZzcR9ZL1RbpFcX1ZRw7et4i0A8r2
	ehSmkEyyHKKkxYQ==
X-Google-Smtp-Source: AGHT+IEyLuXPZoabW3GFdpK86nHI3gqI4HyjxXfOy8oVHpVro+EKfBzqNEgwWysteI/72K2mE1cFMA==
X-Received: by 2002:a05:6122:3546:b0:527:67d9:100d with SMTP id 71dfb90a1353d-52f1ee02b11mr2528083e0c.4.1748000381467;
        Fri, 23 May 2025 04:39:41 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dba965604sm13263449e0c.21.2025.05.23.04.39.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 04:39:41 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-86dc3482b3dso596678241.0;
        Fri, 23 May 2025 04:39:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUkrP7sd9st95Aw6S+4vCuydz8WiewrkyKn1++EGWdVPGwUlntXWe3PzfRVxfGIRCQhbxVRgMqOO0T5pqY=@vger.kernel.org, AJvYcCVhW2WMFcF7awyxW2I0RsIyzTgsENgFiLQfAIBFOdEbUpv365i3gfodPPipAtop01rb1gc0JT5BvJpd6zGwFmFQqsk=@vger.kernel.org
X-Received: by 2002:a05:6122:45:b0:52d:d14a:1f0a with SMTP id
 71dfb90a1353d-52f1ef31af0mr1807197e0c.7.1748000381090; Fri, 23 May 2025
 04:39:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506104731.111876-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250506104731.111876-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 May 2025 13:39:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWhwJTbJOBhKmC9YUaSebBg-9m7euqmxqJLCXdr6++siA@mail.gmail.com>
X-Gm-Features: AX0GCFtlvvYJEHVpBBWRFwPN2rDyTbPs4B63tENo6-GpVBADvIAJpc987Xu3taU
Message-ID: <CAMuHMdWhwJTbJOBhKmC9YUaSebBg-9m7euqmxqJLCXdr6++siA@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Build STMMAC Ethernet driver into the
 kernel for NFS boot
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 May 2025 at 12:47, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable `CONFIG_STMMAC_ETH` as built-in (`y`) instead of a module (`m`) to
> ensure the Ethernet driver is available early in the boot process. This
> is necessary for platforms mounting the root filesystem via NFS, as the
> driver must be available before the root filesystem is accessed.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> With this change, the Renesas RZ/V2H EVK board can boot from NFS
> which has the DWMAC IP.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


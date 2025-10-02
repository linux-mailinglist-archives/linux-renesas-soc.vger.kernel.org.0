Return-Path: <linux-renesas-soc+bounces-22584-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF43FBB3EBD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Oct 2025 14:43:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 348FF3A513C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Oct 2025 12:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBCB530CD86;
	Thu,  2 Oct 2025 12:43:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E18301007
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Oct 2025 12:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759408981; cv=none; b=TlaqJhRre7aDWcYmTz/iViSei/z2+QNx/xApXH9E05igKvUWwqaZnPXuwGcJLw60dGm5XURUDRlC6Ct/m/N9BlJ79MW7KoWWCDJfuVLOpdzNrleKnHp+v5Yg1ki1/uUXE0J/4H5eTeJ4dl7CCtTa26mBN0udSzS3KycZ+xu1Be0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759408981; c=relaxed/simple;
	bh=ldafbVk/EsdGQUuPpGATOo8R9kqzDGSfZbSrwCiLidM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a8FyN1dDbUC3XuCi+8sUQd8rCosg0qIvqh99IB3oA/vQOJ4FVe/UQW72yyjjaiOh8KT76dithD8Jc9yd5Id9tzZfWnNah8TC62D9vBjM771305WAq+spUhp3Y6ZBAsFmDnnyF7PmMxUCWa3JY1SSe0HkUMd1FOJ6OIRR5bohpzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-59dff155dc6so641571137.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Oct 2025 05:42:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759408979; x=1760013779;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bGY2VuXcVd4t9vRCqA3KNBgIjrj7zClngJ+L6UFqlI8=;
        b=YEqX4JoZAwP/lMRG9DehjqX2B7XzAZkw+ZCC84oappw7BDn8TZm6R5W8q8zqGeg7c+
         d1EoqXIzql88zazhisL6CDrcsP255HYPV4uuj1faCZytI2U14CYjgXIBFD8yvdJh3YRv
         t+SPnemNPldTkHvv2HiXRCWlIftMRCRLhWbNCI+hBLRc1138KeVXqzlNwtdqkPYNACCc
         t62C2NMV7/Vn9+PeRt60nR5gGBYi4SDab4WFdK1OpgTx92AfytUd3X0CYJ4lr33HPICb
         xnhPqICqcVj/Fr6aXQtSC3jYsP09nkPlTQrK/w/gO7lMW+ms/8lV6Fj4BQuMPCwBTj+o
         lNrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUog9u/Kc+2gWQCFaKV5fP8nqrIUT250N3YT1gqjqvgtz4B/ETJRAuE/nZVwPAeBzTfp0xeypnbH7kLNuY5DV84tQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh9dQ2S25zbOmjXDIw2QtuJOopKR6Gm9nyk6/bfpeAf+dP/AYE
	/VJEDkR3TjxLuqgsUWOngk2z0vtNAVBGhNOjDP+eBcGAh6b2zif01dQhJ/I7RGmWaKA=
X-Gm-Gg: ASbGncuflm/B0G5imu41nksH0FWvascYrun02jg2onAHB4GVTo8gVmQtNvOq9hIyNxs
	KNz1vf9sICb/0lkQTxf6EhoXP+dCJ6PfZ2ILj0e2ZojOiLB146KAwxiursho0t2wcZxMT4MJaRs
	eAafDn91AeqzAeR9JynPFtCc7Xn8WL8ic8I93NH43IUNraLBwxwsUaMrMYOhqGszRV/sqlCARrl
	pk3Y+3xo3zYXMTmA1sYNPFfkTTeNsjlnW8IX/5KYCYYQ7w5w8V7l/Q6gR4NlSdKIlcy+bkCRT56
	7I9Ufsp21/DRYt9RkC+cn7gVHBYOyYgSPoIM5rj/qLGxluxNZIksiuot2UfhhSeHJT4U66Is2VG
	MnsKZ/D6edxma1YifRaBEGLYpP5weRtztzbHk/BcdPjQlhGvmCzmoXyTvcBvcBlQb4w0GmvEKMl
	ndebDgteZ0E2oxWWcTAZA=
X-Google-Smtp-Source: AGHT+IFaYTlq5pbzdcpsbjst1T6YIk998GGM7qwH/rbhz7x7vNGlFk/ROGG7tGfaJd0YMFuZyZ9uMQ==
X-Received: by 2002:a05:6102:c0a:b0:521:b9f2:a5ca with SMTP id ada2fe7eead31-5d3fe50e4d7mr2696460137.13.1759408978802;
        Thu, 02 Oct 2025 05:42:58 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-92eb4f2d6dasm465198241.19.2025.10.02.05.42.58
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 05:42:58 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-8c0e2d1efd5so362883241.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Oct 2025 05:42:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVOo8ueUx4jz9e6IlvlKjpPU9vNK0lMc11usi4JjOvNlAKbjwSnuWKoySWfLWss8cx8t5apN1Bqy9pqZ3WeyrnClA==@vger.kernel.org
X-Received: by 2002:a05:6102:418b:b0:555:ef1e:49d1 with SMTP id
 ada2fe7eead31-5d3fe6ba0dcmr2875038137.20.1759408978222; Thu, 02 Oct 2025
 05:42:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251002123452.146610-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251002123452.146610-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Oct 2025 14:42:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXYwaqmmnz946EM_v6pQtYFVtRG5raqAvw2HXWp=wcQSw@mail.gmail.com>
X-Gm-Features: AS18NWCgQZQ0eMLLNpMbDyB3hL-2VfZ9TK7OVaQtlKFCCNmGinudcosDhtA0r-Y
Message-ID: <CAMuHMdXYwaqmmnz946EM_v6pQtYFVtRG5raqAvw2HXWp=wcQSw@mail.gmail.com>
Subject: Re: [PATCH] drm: renesas: rz-du: Drop ARCH_RZG2L dependency
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 2 Oct 2025 at 14:35, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The RZ/G2L DU driver is now also used on other Renesas SoCs such as
> RZ/V2H(P) and RZ/V2N. Restricting it to ARCH_RZG2L prevents enabling it
> on these newer platforms.
>
> Replace the ARCH_RZG2L dependency with ARCH_RENESAS to allow the driver
> to be built on all relevant Renesas SoCs.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


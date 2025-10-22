Return-Path: <linux-renesas-soc+bounces-23414-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F38BBFB2E9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 11:36:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0D4834F85AA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 09:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A715E28DB56;
	Wed, 22 Oct 2025 09:36:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BA828488D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Oct 2025 09:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761125798; cv=none; b=slRrpkuQGURb7Qvp9j5/ddZ7ft0GUT0CTu5n0Rs3yZnBgqtLs9UmBENwuRdvq/wUBlxFuXG4GKskhR4fI9sHdCfyk1XJoj0oWlPgOC/OvhmrDbOpzwa3GROtddj7ttTezqgS7xze4RhbItnnCEBl/4npVFhSxFKPDcd+6Psm26c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761125798; c=relaxed/simple;
	bh=/U97FWIz/LyKdJ/+ZFKjfhGLMW9FhpjIIYGZMTsBXJk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eQqXkPYKnkgMe/9LjIeLqUTFVoAC3HYZWqzybRopYHJQ0FuttwsZZzXvG4dzyxNf64jIoVngiG4fg4emaXjgu6yV0UZFevKp/D3W4zm39rKmedsqo9/VgsXmUvvvE/bGci/6AdfN5R04DRRJCPm7Ol10kpHJT7cTDIre/Ia2ooQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5ce093debf6so5683104137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Oct 2025 02:36:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761125795; x=1761730595;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iC35CdUT3A8sztuK5L0Sfjwp3dV7/QYG5xsuOQkj92Q=;
        b=qiXl2Lr+7VvKxNrdwlsG+BHCQ9tktdQnBFfLk+854QBfJdrfBr+I9h8++I37t1Bjgm
         DDl0dP+/5rBFOks4cc3HCp3LudC2ilnVNYv92FP/H1Jm1DMpmPW6AAQlS8lcaupdekfW
         sApRKP0+XhSdvkPyhpg8ixtNF2t1L7deS3v5/K4UD/ATpvdsvmXFVUPSNRT4/CXEc00F
         rF6zHJ5Y6rtSlEFzJ/yMZlGWocQOHO5EShV/aSIvDaP+ylYlY0IagADNFYW3rTMEtaLu
         72fdV5MLUce4qca13T9FjOdX5nJoY7cv4HnZ37MqrlK0X+I4jt5nr0t3QS35eWvoAYSy
         xv0g==
X-Forwarded-Encrypted: i=1; AJvYcCW3BsUZHZwuD4IENGQT7roMAkDRx3dIJRYNjDh0Z1ppa3utBWQmb/pifNQBbABd89K+kAj0M1uqT3dARcPxJjqiMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpck1IKGhx5jHfYpai9sZ0IjkPS99ckbmt7JEzdqhHubBOxo9F
	0QQQLsWbZfBCb+g/3iLczJLVxbx6wGwxsazduAzpEjq9We96ZVeVQaKLeXI06ncR
X-Gm-Gg: ASbGncv8mVS/oQJG4aRTa34+IdmidArT/UI49aBa+v/1A8EYrR801MECAy2FNuXfkMK
	i/DV0NVBqUrnazVS+S15S2LoIkGK9USh2Fnu4vCQlU2koHoI4/c5CWOlZvEEc++H4xItuelkFzK
	jF51LurD5x7nYQ0pLZ0ZkpgHUz+jKPs7deZfrAG9trdMXg7xnOLTzO53fd3FgclLLwx8xEehmUx
	x2Axd3zb2OPRowlU25cSJ5q7VviiDqdN9vcY/ESR8A9NUkPCGdHrXL3yRW9JAQ0lcqWlUBP9xrV
	pY9jXXiExPWV/mHhQ/WrT3HgeQqtI79nMTeTcbecIdL35p1xIKZB60CJmtFZCOj+JMPbl6eZJJL
	+oL4d3B2YTh1tfhpDFl9FCrBNZHI3RkfZCZk9AsLtI1eMIoVIcK6bpHBpDQnZUsFIVjmwEbQNVu
	3EdjdJKLQFw74lX3BoRxE8E+BPNZsHtqamzJnsU029G2ff+tjB
X-Google-Smtp-Source: AGHT+IEFJ7hEt6B0zV60KHP3AxVJ4NskDlLdF/CUW9ZCy0NLvhIdb5pvL5j4rQYCZ46YaNvCqeT1mw==
X-Received: by 2002:a05:6102:b02:b0:528:92b8:6c3e with SMTP id ada2fe7eead31-5d7dd501a23mr6636552137.1.1761125795527;
        Wed, 22 Oct 2025 02:36:35 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d96c2794e4sm4426842137.13.2025.10.22.02.36.34
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 02:36:34 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5d28f9b4c8cso5732589137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Oct 2025 02:36:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUTwBkTzm6M4+1tF8oe7YlkuEZpt3S4gKoYHequyS2adPPRriTnkw6q/uHbe89THoHQ+vynl+nstQ5418R/jxmang==@vger.kernel.org
X-Received: by 2002:a05:6102:d91:b0:5d6:101a:9f31 with SMTP id
 ada2fe7eead31-5d7dd6a12f8mr6743560137.31.1761125793941; Wed, 22 Oct 2025
 02:36:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022033847.471106-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251022033847.471106-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Oct 2025 11:36:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVW3j6BKdRQyNPYoZ8Y6zHgWKocncvOCFRnE+TzPDhpJg@mail.gmail.com>
X-Gm-Features: AS18NWA7snoGhRQxOaxa6kVLMYHHHQNhnIPgqBT0Sy_KqfLK2Lq6CACxKqN_A0M
Message-ID: <CAMuHMdVW3j6BKdRQyNPYoZ8Y6zHgWKocncvOCFRnE+TzPDhpJg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: gpu: img,powervr-rogue: Document
 GX6250 GPU in Renesas R-Car M3-W/M3-W+
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>, Adam Ford <aford173@gmail.com>, 
	Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
	Frank Binns <frank.binns@imgtec.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Matt Coster <matt.coster@imgtec.com>, Maxime Ripard <mripard@kernel.org>, 
	Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Oct 2025 at 05:39, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Document Imagination Technologies PowerVR Rogue GX6250 BNVC 4.45.2.58
> present in Renesas R-Car R8A77960 M3-W and R8A77961 M3-W+ SoC.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> See https://gitlab.freedesktop.org/imagination/linux-firmware/-/issues/13
> for related userspace bits.
> ---
> V2: - Add RB from Conor
>     - Fill in allOf section for Renesas GPU, set fixed clock/clock-names
>       maxItems count to 3 and power-domains/power-domain-names count to 2.
>     - Use renesas,r8a7796-gpu for R8A77960 compatible string
> V3: Split up the allOf section addition

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


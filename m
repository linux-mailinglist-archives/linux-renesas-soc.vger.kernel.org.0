Return-Path: <linux-renesas-soc+bounces-26066-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A16CD981D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 14:53:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 09B3530060FE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 13:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BF5D29B204;
	Tue, 23 Dec 2025 13:53:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B0127702E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 13:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766498032; cv=none; b=OZSWI5MDliTpukdF1R1tYkyXM/p0ESqouKOS8yl4X3tdlI9hlQd6+GZml9W5x6Iwnb7VmEhc1oVVPwa8BcxrRlo1MC1BYA+UUyiHQQtADbQJyoXQ/AASVq+CUntxx9NgbazsWv+SUxJvoJiAu9JrfC2v4YmL7i4kI6CpkKq5e7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766498032; c=relaxed/simple;
	bh=a8FMrqVjKhSh+xBRWMkzRxeow3Vn9zz3nJEF4GxFrcU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K99fLBnte5tgp/r1xvsPDaN2kbJkc9ItML2ahXzVxdHxAqcR4+i1u2mJaamldLerRQ/uXqzxnxzCe4WYRLC6ZoxFGtf9mHrvZS5q105EYocQlPmOpCtdB/rc76YTaMjmxQcqq0inmvLBvXp8ovnrweZAbxp4ApBl8xxrEaQcpCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-640e9f5951aso9188630a12.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 05:53:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766498029; x=1767102829;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H+ixeMsLCpQech4lVzSsQCsVyCManj4ccnQ8O83w1ys=;
        b=nCbLCO0f+v3Mi1nMDfI95GMYBocVp0uZEOPTIEI6G9Ja02CPCJ0tdYjcPoYLmapI5+
         D7FoJ0GRdWSDHU8hUDMtdL8Ub5oGiDBJPqPIkSZlAylzr0RCUlMCmR+PlBaRy4MT23br
         ZumLRsZnOJdUvCqg/Rb2bQ4pw64LeyTioaYCBb/DqSoBQ258e+dGsJAgtxgW0fG6I7hW
         fIFTGt1SkiUmk8+4NVjNjGZUxovmjttfyR2x50IdqABoB6TTLtOpB5BD9Pnnj4YDuCy1
         XcY4CYLK3P+nAaidQWEjVmJygi5TqhxaHJmHNc58nc8N4LeCVmUjGRvt9nX/nh3DjVpB
         2nNw==
X-Forwarded-Encrypted: i=1; AJvYcCVpfdt7CbKv2UiJPpWyvW3/YTVMmEi95LUTtZ68N8QmtoszmTvVwqh8NiyzJ3I+h4R1pQMpmyKzLzvrn9gtPGARdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YydTg7Qf6QL+VkZxj82ypVGJ/Fd3e8Mmz0IX97SoxAqUBvj70/8
	5JycEUIh58/Bs8pA9pK8nkd/LligsmvP0pYjVT8YNLIKvz8dwl+2haouB8sYyYWWwPrGfw==
X-Gm-Gg: AY/fxX5+Ddjhd/dvM8DVBfEUsTBBcf1M6zy6mfjgyplLM1CEKfpsWzPfsfniXRUB1t6
	KeKVgA8kBlbA0jLhmmrM+ddhh0oebW5ygX0lFoU1rKkKjHyRtBDX/8QeviatOEck4ck+qzSqDrf
	JTSdV6T84PFTsmVO74Uq+mrStVM11/5nH/iWq7c36o8r9+o54qbo9cOKx0KwnR6PWXg9thX4Wp1
	Za7YzxgpMVhA9RCQfRhNJq0bARmRGkE6HlhCW+WL02k/qkmgcxi6grEQ6U+Qvo3VrTwYxESDCxX
	6m0/W6C9GLYOcJagCNAQcfWhRt2sxTNUhndhkqJImSzN/KGS8cvpBPc/9dPFFNBcPNX0XvolTfB
	3Wdkdglzr0M92X3Qhs/aC+tp4tdQhk1yoi9TEkiE1Roj9WmERScorEhbosWS/NeXsp2CiBGSp2V
	pv90tb/4OgGz0p5OgdFbVhOa+GBvJbBEu/c5SCsrOkGCv7Pb9V6ka9mM67QCs=
X-Google-Smtp-Source: AGHT+IGbLB5TY4fYaRMhtRv7dZRY53BcO2ldYx3zU2vjbU+x3m0c/X0ya8N1MsnT9y9FM2lmIHUQRQ==
X-Received: by 2002:a05:6402:50d1:b0:64b:4617:7717 with SMTP id 4fb4d7f45d1cf-64b8d24ebb3mr15038956a12.9.1766498028990;
        Tue, 23 Dec 2025 05:53:48 -0800 (PST)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64cfebea196sm11432337a12.7.2025.12.23.05.53.46
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 05:53:47 -0800 (PST)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-64d80a47491so3603584a12.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 05:53:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW21f6suFnSqVriamNT0xcotXO7dlFqvIYZVAUJneJ/HKgyL0QgAiJzv3qcxoLZdSpAzv4f4SrM78G4MyDVE2S0rQ==@vger.kernel.org
X-Received: by 2002:a05:6402:2711:b0:64b:a3ea:5086 with SMTP id
 4fb4d7f45d1cf-64ba3ea565dmr12657162a12.12.1766498026801; Tue, 23 Dec 2025
 05:53:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251201124911.572395-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251201124911.572395-4-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251201124911.572395-4-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Dec 2025 14:53:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXoeZRztr5vw=ApkUMcBFejTPdqTp1B7H_b4BCrp=CTxA@mail.gmail.com>
X-Gm-Features: AQt7F2pPAdRHTEKtZTIpjA8opdNaxGZqUaIcqPY8S0hZ4lPuFl8ZXn8vjc6i4OQ
Message-ID: <CAMuHMdXoeZRztr5vw=ApkUMcBFejTPdqTp1B7H_b4BCrp=CTxA@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] dt-bindings: dma: renesas,rz-dmac: document RZ/{T2H,N2H}
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Johan Hovold <johan@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 1 Dec 2025 at 13:50, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs have three
> DMAC instances. Compared to the previously supported RZ/V2H, these SoCs
> are missing the error interrupt line and the reset lines, and they use
> a different ICU IP.
>
> Document them, and use RZ/T2H as a fallback for RZ/N2H as the DMACs are
> entirely compatible.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


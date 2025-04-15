Return-Path: <linux-renesas-soc+bounces-15996-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50234A89E23
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 14:31:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB70A3A3CF2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 12:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EBA727456;
	Tue, 15 Apr 2025 12:31:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D9E1E502;
	Tue, 15 Apr 2025 12:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744720307; cv=none; b=FY+f2qdnJ69MNArK6P2H34sqAKrkZUdcNoSz9agKJkztlWYsY4fh1xk6+g0JE9/3rUOkXHqdbJJZoT/8LMrwA9ScNZRym0uXbobAI8a/GErZcoVnCu1qP/sRTE5bShLyjeA/n0f+gRdWhll2CeOC7tnYZb4NewswLPt6Uhhhkr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744720307; c=relaxed/simple;
	bh=Lw74pAzVLKPoaqF11ZOaG9DHhoeS3AYYjjVB/kBrcIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d/Ex38K+Qi7JjWF/RuNw+Swh4hFyz3gREceIBzzvPmzRu9Cbww8biHzqrfHkwz9cw7ACh8uNzuaSMftd98caARSECbX3N/E3w+6vjT4ZRAwoCPtr239LmF0TfDYOsJAKZtmzwPcff1of4/VjDiK/MBumEMl/gQrbz1VO0wWZMzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-72c0987bc4fso1781691a34.0;
        Tue, 15 Apr 2025 05:31:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744720304; x=1745325104;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zW83EkYg3eMPJbNtKuATnCvWzFnvh6LQpuQabw0Tmlo=;
        b=mrQlam1pGS6RTKAkpBdzykSSXyEbGyD6wpbpT7fg5b/ZHEw54vOP9fnO2vEEnFv3Xn
         wqGJg61A+QnLzvRB3tuGdfqe1TH+dbt0TLPkUwb8TXiWzHOyR7rRxU46GBLBorfJBF9h
         g++k+RKsN1iOVGpl9FHPEfBWumtMfmqtTdETXjYokZMS1ZgnqaClG2mEekOy9DkgK0aL
         LLaFYLU4agJz2yt3PGyhyRFOM6PFvClrt2auOiu/Qo3MfHmrFCN342C4N1csa7JQOk3q
         IskpX/M6gZFKpe/TG+D33B1E1i00ygio0+5yBhjfFG3jCU7hOufoWK9TOJnM9EmaoFZl
         g0AQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6zR1M/5j+qyHg3KQgewv4cqBmUarAKMPxHy12APkE7/MSBd5jAIGTFQGlSBj27Kj5ADZvZrL1ZDJRsJK2ZE5JDvQ=@vger.kernel.org, AJvYcCXN5lB/IEK/XJod5ePc/8DwuRoDQOXS+J828/SgtDJQ/yRGbJWu/NrlCfDCZNdPAQ1wcroCPNQFPZf6mTw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHv8aj6Y6oyfVsixfTvfBM0wyue//zRMDeld+lUukfji1e1G22
	2CIm0i6WeIM+GvkYiRaituqJnTRrXkQF21AfW3kVyVXuybWeU1JIVkvf1wns
X-Gm-Gg: ASbGncvO0cXGDRBHrUvv2AnJjEBq5okCu/3lMFlpDpnHz9KuCRjaBTLQeO47ukXOez2
	h3DcGz0wPOiYkpBIM+StNpzA7sFFWfURGmw4X656jz1WhWIBQjsNwMjaWluruf4vCH/1PkcbMrR
	RKNp5o0io7tSELOHjShVcTU1QnxWOADKoiWtb23gNDDfcoKRHjHThXCBoHYKORKbt3663Qk7gYW
	kooxWtl1SXp6nPiPg6chMPT8CTaejtICVOugjSvlr4oRa6N3NHMuX7frhu7MzP0vR79mAWOe6NT
	bMlwpR4JjFyInX9bguH4i8K6ucVeq+z+irP8SkC8A+KEihsAO9ra+jibTLmdBgQpBpKq0o77bfb
	94b0=
X-Google-Smtp-Source: AGHT+IE3SesyPzNt0VCXBtgPuZUh+i7Wx7j+xzOqFkpNmhQv0P8/wDFR+sHnrnmUt/rKHCN9HBYzQA==
X-Received: by 2002:a05:6830:61c7:b0:72a:1d2a:4acf with SMTP id 46e09a7af769-72e863c285emr10068239a34.17.1744720303961;
        Tue, 15 Apr 2025 05:31:43 -0700 (PDT)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com. [209.85.210.54])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72e73d901f6sm2389165a34.40.2025.04.15.05.31.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 05:31:43 -0700 (PDT)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-72c3b863b8eso3365371a34.2;
        Tue, 15 Apr 2025 05:31:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXbylY2hDB/0dlcpbRF5aNydrmNI+vkS2Y/kgIah4z0ey2Hsb6UytgRfuqwHjx3mg4aZKW2y0kRRK/r62JFe0avH9I=@vger.kernel.org, AJvYcCXgoRs5CIbdfHFeVROHoG39KcbJqvbT906QOOIrSgXgiJGsd89DeXvGBD94HXp5pyIYuSpumW/ns/6YQ9E=@vger.kernel.org
X-Received: by 2002:a05:6102:f12:b0:4c4:e414:b4e4 with SMTP id
 ada2fe7eead31-4c9e4f1a4c3mr12641595137.11.1744720291873; Tue, 15 Apr 2025
 05:31:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305002112.5289-1-fabrizio.castro.jz@renesas.com> <20250305002112.5289-4-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20250305002112.5289-4-fabrizio.castro.jz@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 15 Apr 2025 14:31:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWViRDDv3Uz_0oSndj-4J+OPiX2e+5e_68mH177gpE-pw@mail.gmail.com>
X-Gm-Features: ATxdqUGJq0o2Dq3kG_8ISuI8Ui_RfZ2Afp86wCTTskaUkUp6pyqCo8UjpCfcQR8
Message-ID: <CAMuHMdWViRDDv3Uz_0oSndj-4J+OPiX2e+5e_68mH177gpE-pw@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] irqchip/renesas-rzv2h: Add rzv2h_icu_register_dma_req()
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Mar 2025 at 01:21, Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
> On the Renesas RZ/V2H(P) family of SoCs, DMAC IPs are connected
> to the Interrupt Control Unit (ICU).
> For DMA transfers, a request number must be registered with the
> ICU, which means that the DMAC driver has to be able to instruct
> the ICU driver with the registration of such id.
>
> Export rzv2h_icu_register_dma_req() so that the DMAC driver can
> register the DMAC request number.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> ---
> v4->v5:
> * Dropped the registration of ACK No.
> * Removed some #define in the driver and in the header file.
> * Renamed the exported function to rzv2h_icu_register_dma_req.
> * Rebased on top of the latest ICU related changes from Biju.
> * Reworked changelog and title.
> * Dropped Thomas' Reviewed-by tag as too much has changed since v4.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


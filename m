Return-Path: <linux-renesas-soc+bounces-23876-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C9FC1B880
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 16:04:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58C381886A17
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 14:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 243492E0938;
	Wed, 29 Oct 2025 14:58:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E237B2E091B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 14:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761749909; cv=none; b=tIR9SxVJIXLsiZj4X+fuTLcPme463/lWhfPqvLoC+R7xwx7ux/adQ7Sqz3ZCgHBiVzoeQCTzPCysZ7avDYYXBOBDaMS43OxQZZeutiQ383ljtsntXFUOqWyGWriut8rhu9zPgDutVb5KZM0OWp2eGguX3dsulXqzdiF+7yLUcRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761749909; c=relaxed/simple;
	bh=hSYrwqd1mkixtFP54xQA+PcDnrci1mz4DAuMcvpZcs0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r1J8+gfJ6kgbdcXRBBg57OPISSxNONMjJnbdGqEiG/IPD5HSfanwjmOjoNEVM5wG4t8cP5SXuKR4CdyEDhXtpxhO+N8Uzw/7YDIaOJPax1PrroF3BFHCbaa1f5wyUe7Kr7coMbc78BY9GU/VpH3CXppghqCnqYw8LwqBM5D0tF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5d6266f1a33so4638956137.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 07:58:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761749905; x=1762354705;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fd/ArEYxAAEUYhnoA0Oh/vNlB/6p6wwqYSN+YEbBwcA=;
        b=dqSZ/au/NDciyAKXqbLCl50rCqALK6lAL464Sc8PAxYSASrAq5ZGkY55ZcMMIrpCQJ
         T59VLqvEtXaFLUHVM/MgCLv1bLDS6xFLZR1lmsLznR8bPnHi75H5JHTdwqNrBlm2L/L0
         5UWhOj2WqkWuybWBTTINlYFatV+4N8MHyYaiU+efC6W/I9Ke6xD4V3OHaKFJk+R1BKYt
         QcF/WQXr4whMDD9R3Mj/z/cv2coVAuAlPF9bCpp005GwFX9HdzaxpPyOhj9pXCudHZYc
         oQzi+n1VbdXrnu1XKjI1fJJObfjePQ92uGJZcww5SQQFWUfuEBB+ew33R/oKHoQ0kjmB
         5ulA==
X-Forwarded-Encrypted: i=1; AJvYcCWtonli4/qJl5eBe/RNU8T5ldObPiwFZAeUxHdylMD74jneX/8hWV5I65Kt1ecT4yYCpgI+qhLR7J22xkKY7G6QQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVvr2+FcP1YoQyY60idtGUx42z5pbAiUqHsn87jmfX+hoJbd92
	vQidjYHYWIXMU9Ngl3h0OQt2MJvPIQx1ZLxyAngAGn6mgdKc8YX0s4/MLC7rItfX
X-Gm-Gg: ASbGncvUu6oPBfpAbY97lGasL5LzRcCbZwFm68cM8m0tHbXPpVRRTrUGVJ73la7oaeC
	71mUmzswqTunhiRaF7/8m66cT7aplJnV8sdP+oMUJtJAnnNKytXirmM9NFRsJy2TwNg7r9LRmGU
	JezB27i6cDKsWEG1XJBw93zdZ6GZYU54tHlqdQMFA9jzymb/kpKAZ5RwRRM0YZGMtgPWyvuxHt0
	2DAU36Dr4NQ/0hVayO+ZXR1BSm6AjO/2m49BbVnc7niz3VMxuYNOfURQ/VrayFj8/FK9hItxRAq
	XsKpYTSxMeobXvs9Ydd0bwndli2+lNBqgc/WMFgjl9nHhXrMB8PnEPR4UkxdG4sxJ3j2bB+eQjg
	SPcb2w/bBaTyB8nBSQYPTOXSvMN9/kA2n/mIj6JIWfsIbTRnE4MtLzrRfK2qihyoG7jVKyJMaxR
	SZrErVGKEyLPMU8ktuW4qFvY/nUmATssWX0sKBisKSH57xEDjxVm+u
X-Google-Smtp-Source: AGHT+IHyuVdnZrsoVZ0/+vEnS4v47QI1cByXlKwV0RKdFhxNUYnC3mn+TPKTOVZMzUQND2ATXXgKaA==
X-Received: by 2002:a05:6102:3f05:b0:5db:38a1:1f1d with SMTP id ada2fe7eead31-5db906becf0mr823031137.35.1761749905273;
        Wed, 29 Oct 2025 07:58:25 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-934c3ecfbb3sm5235817241.1.2025.10.29.07.58.24
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 07:58:24 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5d758dba570so5532003137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 07:58:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVt04iKdtyQqPg4nPmLJj58R9oLiiOgvw0HCNrAbwJZ59SXg+rbeWS0hHuerBntWWjw8hIwrUzdzLy9eqOFYrwZmw==@vger.kernel.org
X-Received: by 2002:a05:6102:290d:b0:4f7:d553:3cfa with SMTP id
 ada2fe7eead31-5db90606601mr813077137.12.1761749904411; Wed, 29 Oct 2025
 07:58:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027211249.95826-1-marek.vasut+renesas@mailbox.org>
 <20251027211249.95826-2-marek.vasut+renesas@mailbox.org> <CAMuHMdV2Kr4WcYRERHCYR1zGAh0n2N3D=LYbRSYLJnRTYDB4+w@mail.gmail.com>
In-Reply-To: <CAMuHMdV2Kr4WcYRERHCYR1zGAh0n2N3D=LYbRSYLJnRTYDB4+w@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Oct 2025 15:58:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWyKeQq31GEK+-y4BoaZFcCxJNac63S7NoocMj1cYKniw@mail.gmail.com>
X-Gm-Features: AWmQ_bkK_riw2DJ8GdGhH8UFTwbp-0GBHO60gLWdbse1YNVgueoQrpv6rrq65Pk
Message-ID: <CAMuHMdWyKeQq31GEK+-y4BoaZFcCxJNac63S7NoocMj1cYKniw@mail.gmail.com>
Subject: Re: [PATCH 2/5] arm64: dts: renesas: r8a77960-salvator-x: Enable GPU support
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Wed, 29 Oct 2025 at 15:52, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, 27 Oct 2025 at 22:13, Marek Vasut
> <marek.vasut+renesas@mailbox.org> wrote:
> > Enable GPU on Salvator-X with R-Car M3-W.
> >
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

(no cover letter, so just replying here)

I am a bit reluctant to queue this, as apparently there is a bug/race
condition in the PowerVR driver: if the firmware is not available,
the kernel may crash during boot due to a NULL pointer dereference.
I could trigger this on Salvator-X with R-Car M3-W after applying your
series to renesas-drivers-2025-10-28, and adding two debug prints:

--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -256,12 +256,14 @@ struct device *dev_to_genpd_dev(struct device *dev)
 static int genpd_stop_dev(const struct generic_pm_domain *genpd,
                          struct device *dev)
 {
+pr_info("==== %s/%s: stop\n", genpd->name, dev_name(dev));
        return GENPD_DEV_CALLBACK(genpd, int, stop, dev);
 }

 static int genpd_start_dev(const struct generic_pm_domain *genpd,
                           struct device *dev)
 {
+pr_info("==== %s/%s: start\n", genpd->name, dev_name(dev));
        return GENPD_DEV_CALLBACK(genpd, int, start, dev);
 }

See also my original report "drm/imagination: genpd_runtime_suspend()
crash"[1] on Gray Hawk Single.

[1] https://lore.kernel.org/all/CAMuHMdWapT40hV3c+CSBqFOW05aWcV1a6v_NiJYgoYi0i9_PDQ@mail.gmail.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


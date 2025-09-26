Return-Path: <linux-renesas-soc+bounces-22400-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4DABA2E21
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Sep 2025 10:07:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 779094A68A7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Sep 2025 08:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3881D149E17;
	Fri, 26 Sep 2025 08:07:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7C28834
	for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Sep 2025 08:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758874033; cv=none; b=j1HLu7119T36+4aPtBKB4n80nqQwHtyE02KQM8Z02l7AkkoffhGOv/XLFhsGrOnqN7hRb+M1wPxCF61ugK1OLeDYGOjeB9uPT9ejZHWKUr5odvTtTXR9f/f6brPN7eu47J1ieqGS9gPUM2X2MvX7/Yr+Af0t8ibXYTqHSnQyx8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758874033; c=relaxed/simple;
	bh=PXS+LDgSo39dTWP1prk5CoK9YIAVAja9GXRvOoAozXM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kvKH88I6qbMiRF+fSAVO04XQ75Ls+Lzgl4jcQBHsUELWlEUVhtnsDR0fUtFNn9AGIjvz1bbUsQ5yZP0ifF+hr71/awoVgVNfRYMWzdlZ1KkRQco/ItzP5+8A50DJof8/gfRGpNJjP31HMAzeatTYtEkF7PGTarwUZz8+O6cpzhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-54bbf3329c1so1566927e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Sep 2025 01:07:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758874029; x=1759478829;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Y6mmsY7MXr31Xv2Qe0va5N8gIEzgHjRMpmqLSakzNQ=;
        b=mjeC/AYI5aMF3+RO50Q6ZxCnYr13N8RkhtjqomWaDMv5SWRFxESysOSH1ceKxGQHri
         yGw2W2pjW1PXX0UmXlYaxK+Uui78qh5sdPMd2zkvXYVNy0GsJ/R4UPJi7b8vlwlbeFpW
         A7Tw95oQFnwFdv8c3g/LreEHUpJhk+FABzlIKz+6VEJtxH8KvmYNmtRaZ+6jqvl1wt+x
         K4YZwKWbvNIfGp9ubmDx6EVd1ICh5pWTvlKXbO9eLT9RNjxmQ4EI2J6+z/L7dnSttOje
         a9JG3WWCzBJXsaEQnMeERW4lsKwk+aK4vEo5ReLz/n83stHqsyCRSQq2GqEckN0czLLE
         3/mw==
X-Forwarded-Encrypted: i=1; AJvYcCVDkmoC/9DZBJ3eWw8XIMIkrSWcKcJrj/3hphRJnNgM7K2w9L9PIyyKIUG5WpoPI83HME5xyvv/ZLjDNrN/F1dLew==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhcP9ZsWt+Ub6RH6ahRqyWRnZdWlmw1BFZijfT1izQxv78Xztu
	DqwRt0W25YM1elu0rHrYkx/Pk908qDkNqbtGZVkE78V9FsE9Xa+JpkntJL2AMfj0
X-Gm-Gg: ASbGnctfVoTmA6QpvSFQgMag3gApoWuNjuBEk87zv2QCPKRcRNyq77Nc56zU+3ljwIT
	5g0iqTPDzSeMMxG3G2RUD2Yh2BjSIUryrcoDY65LbE0F0QTtVck2aQNU1JazsOv4mtAp//GXVKw
	hrZodjGnu9awEWPvqs6LOcLG4duItT0lZB/T6nQyQmBQlbq24t20J4JGCxcPjCEuOdMy9GrHXp4
	elOxcCfRQCdB5uh5dgOhvdV6XOEU2CWVQlpxEvCes2qnkBzy5NPomh2IJAqFYFKZVKkkXafeMSU
	YxminuZ07aR4P0S1qeG1iDcc1ilrjRZMs5ZOrimUT+b596NOs1pUaCqF/KV2A8RqOSCm3G7gGlM
	TP47vTdWWEMyG74uEBWysxbodjwfwHukGGiPgacfY9eTBry/34DEacW99bt1WmvAzGMedpQgFLx
	4=
X-Google-Smtp-Source: AGHT+IHkWrPvfJ3a4YCvGuLvfcYTRLJldTSvt4ETX67DtV3R50/8xJoz2T5CHEAQyEKeQbt7vvUQMg==
X-Received: by 2002:a05:6122:3c8d:b0:54a:87d3:2f2d with SMTP id 71dfb90a1353d-54bed44b31cmr2448854e0c.2.1758874029427;
        Fri, 26 Sep 2025 01:07:09 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54bed9be13bsm787415e0c.13.2025.09.26.01.07.07
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 01:07:08 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-54aa6a0babeso2023461e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Sep 2025 01:07:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVNN7z6hE+EDpWlJMgivnxodLlJkgGNhVITCvqWvd12thaHRYw0mIXJl+rqctmpa949ISG+qcApEMYR0n9zGmYD3g==@vger.kernel.org
X-Received: by 2002:a05:6122:631a:10b0:54a:8ad3:7b5 with SMTP id
 71dfb90a1353d-54bed435b3bmr1938139e0c.1.1758874027425; Fri, 26 Sep 2025
 01:07:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924003003.91039-1-marek.vasut+renesas@mailbox.org> <3006bc88689b2e04785cef6bd9cf4142ed123ee4@intel.com>
In-Reply-To: <3006bc88689b2e04785cef6bd9cf4142ed123ee4@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 26 Sep 2025 10:06:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVMx65Y9vTUzCs2QpTSiehoK3x575YtSoX-D8jWAbVWoA@mail.gmail.com>
X-Gm-Features: AS18NWCsdFmtJXpOQtfe78deHc6xL2Pl8YRfLn_hl8Z6ulTifGGwIO6-C7uoGoo
Message-ID: <CAMuHMdVMx65Y9vTUzCs2QpTSiehoK3x575YtSoX-D8jWAbVWoA@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] drm/rcar-du: dsi: Convert register bits to
 BIT()/GENMASK() macros
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, dri-devel@lists.freedesktop.org, 
	David Airlie <airlied@gmail.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jani,

On Fri, 26 Sept 2025 at 09:58, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Wed, 24 Sep 2025, Marek Vasut <marek.vasut+renesas@mailbox.org> wrote:
> > Convert register bits to BIT() macro and bitfields to GENMASK()/FIELD_PREP() macros.
> > Most of this patchset is boring mechanical conversion.
>
> I suggest using the relatively new sized BIT_U32() and GENMASK_U32(), or
> other sizes if your register sizes are different. You'll get better
> compile time protection against mistakes, and sometimes the unsigned
> long type of plain BIT() and GENMASK() can be annoying.

Thank you, I wasn't aware of these new macros!

As the commits introducing them do not have Link:-tags, here is a
link to the full patches series that introduced them:
"[PATCH v8 0/6] bits: Fixed-type GENMASK_U*() and BIT_U*()"
https://lore.kernel.org/20250326-fixed-type-genmasks-v8-0-24afed16ca00@wanadoo.fr/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


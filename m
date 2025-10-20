Return-Path: <linux-renesas-soc+bounces-23321-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4A2BF17E5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Oct 2025 15:16:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C55A18949B3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Oct 2025 13:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D34A7185955;
	Mon, 20 Oct 2025 13:16:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EE72CCC5
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Oct 2025 13:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760966169; cv=none; b=ScjFBbbd1wfsKeE9W10VtfVBwsZWB21qvOSdhiXfoM+KtUbaBIDbXJoeSApWJuRQKNv/Kyj0E1HIxfqe7xuLIpawX05+/kwaB8twcaWo+LUAmnjMU/NbnN2Kzdnv/+Z9Ov7HbYBShjbhfjYrm0TiAEFd4JC1ecn24raUfKs8FyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760966169; c=relaxed/simple;
	bh=trWesbB/AiApXzZwy3WURtJjXdK+VVmxey4E5WVFClQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uIkh74bhklgu1nyOKKwjA8uwkspFCOn2yeXX4IZRfIPmveVM8ERUZLjeEM3hV2V/r8HUtr/PaoJ1M5BlamVeNdVpjRxkjdgL1fBxcMwPMteDOMj+vMv3iqwuMD9/Z3TN7iDdKMrZPzsfcEP13YGfMCNmurvPCw43wmv9xoqs0vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-556694876eeso1734321e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Oct 2025 06:16:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760966166; x=1761570966;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lWVHrjISIDwpSzyPfW1T5WIPIs7x9hIf+oa5wUSesiI=;
        b=GMwAJUwGRCkpDetKFoUjFL+5kDaxPfVDGNV6T0Z7PYEAPifEkr7/FM8YNe+FUwg0Of
         odrSR+7Y/YPZkraR/sXNyFc6eMGl8ld0orHEpvHHjhBce+2nwIklyyj5425LVnrC1UUH
         XpaO/pxTqzwTNYeNcdDxwYtrRTUm3VA/p/wiv268iRL+7w63/RRMUZpHt9CP5J7UAXLC
         8pg85/wuC2UJPob+xYGF46A3lBg/b7nCgHFO92o6TsyX2cXTQEWDpD+TbzQdpXFn1mHL
         o8a2YbyTMEPDYIoUqbtFsfUOdaHhCXebuEsDE4NoIkIcgQOGe99X6ZH2mF44TX529mjA
         uO3A==
X-Gm-Message-State: AOJu0YwEquiHDmnCQRclRfCUv8/wxpcWC/UHy4XWB9EXdu9qFLGzwnM7
	FmZdGnBJyfZnipqm9VjkOT1gGUPjJyiJaGHbx3Csn2gL8S+Fd69DGDFFfZ0WVAJ3
X-Gm-Gg: ASbGnctUpgeFokNiwIsRcwBU4sqdcm5+i1AW8rBREleSKqYjJU0C4FRD+7wg/LhLy++
	0pjTFvvNtiaUF0EFUH0J6z1ktdOl10KI+bDSqE9HH8jyGJusZ/UwR3dXQ8jL8xFx3KDjF7WlQ1E
	5bQe8jj6VmX7YHsniFl4meY/DwA7LC0fSGD3/ZTOcnjWRDMzjRcd5+40JXHuCXzGPan0eRgpbgV
	MwcKsLyPzGN+sCIM/MSuNwd+mUTe6ZSC4HQlP6uOwLcseb8o0PtjyqSTsGLcC7Z5iRC2/3MtJPp
	LAOUhl4kit6myJmpoEUsutDO8C0Jyo/Hh0AVq2POhYqDsIXFIjzqJv5PgtUTpGl4x0zby+PSl5H
	eksPEEl2lSqzAsC0RWSKpSVtSjEkzkLXkzzTRQyM9/M9LM208KgQ0xFIjFmuJDfWUUHmVw52Yyf
	s4wrn+I7GoFD/VGZCyhUGhJGermr9VDir3pkGcN5Hdn0iQI34U
X-Google-Smtp-Source: AGHT+IHn/laA7/nRN4dzWasdCAIm0x5PTZPr1iGxxqhv18u/isKTRvexyVeu2qWVibcif5GVeRESBA==
X-Received: by 2002:a05:6122:319a:b0:539:44bc:78f1 with SMTP id 71dfb90a1353d-5564ee22d18mr3825391e0c.5.1760966166035;
        Mon, 20 Oct 2025 06:16:06 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55661f9b0b8sm2257738e0c.8.2025.10.20.06.16.05
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 06:16:05 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-932e885467cso1164241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Oct 2025 06:16:05 -0700 (PDT)
X-Received: by 2002:a05:6102:510e:b0:5d7:bd64:cc72 with SMTP id
 ada2fe7eead31-5d7dd5550d7mr3790948137.15.1760966165697; Mon, 20 Oct 2025
 06:16:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251017114234.2968-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20251017114234.2968-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 Oct 2025 15:15:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUFFprx2HPT9oyF_Yer_zG3yoajzFUcTyDephCOA2yz_g@mail.gmail.com>
X-Gm-Features: AS18NWCePkM8jUH8uoz9-zlHo8mKv8P3ot_0ScS7jTPli2im6e6o598ywLEmEl8
Message-ID: <CAMuHMdUFFprx2HPT9oyF_Yer_zG3yoajzFUcTyDephCOA2yz_g@mail.gmail.com>
Subject: Re: [PATCH] soc: renesas: rcar-rst: keep RESBAR2S in default state
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Fri, 17 Oct 2025 at 13:42, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Unlike Gen2, Gen4 has bit 15 of WDTRSTCR register also used. Keep it in
> the default state for the V3U firmware workaround.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

BTW, did you experience any ill effects from accidentally clearing
this bit? IIRC Falcon (and Spider) still rebooted fine before.
Perhaps you need it to make subsequent reboots work?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


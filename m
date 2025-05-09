Return-Path: <linux-renesas-soc+bounces-16829-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E90AAB0B1B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 09:01:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F17283B1F79
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 07:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DD56237717;
	Fri,  9 May 2025 07:01:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A5A1C2324
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 May 2025 07:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746774114; cv=none; b=FpTG+RQviWe07+5r7XIPCNUOrso1SB+dk9ZpAbdELHNglzxh9MzRXVY6joAdHqCzWnS1IzOnHnrJ1ghfQInzP8hdsJsQURN4lA80gM3LCvCKt/DYvLbwKFb2Ysn/F5NDrZ0p6kPT07yJyBDnDDJCg48oP5I4RhHznT4bL3z2nos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746774114; c=relaxed/simple;
	bh=qtQu184wz3/9fLPvhVaEFLaKtXeVown2JK91HbZDyUo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NuhHquEKNgaPnBsigfLaaudK8oNw1cXxOV2eSvGv7RjMEEPWIroib0rm6+nAfEt50ygLipoLpYLnnyLLg2em4F+gQObSSxeo6guJ3rEjnhG82b8yFO8vrTaXD1V7B929kR62knpNFab2qWwUabKwOyW+fW9Uo7Po3xY2T/+q7ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2da3b3bb560so1482233fac.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 May 2025 00:01:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746774110; x=1747378910;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D2sgmYvzaquzPRQ5vsvrs1yLp1VFbx+IXMhXlw1x93g=;
        b=Rw4gUFSl5PjZyX5Z7I09PY9jyx9wIBGG4dZZ1fLDQDfuacgvi/67SbbX0plyR7kkG4
         n0M+xILv47tVMoIge1AG0rdZqlQeSgSLbKPLL4RNscPkldliEUtepWDwLA6i20gZWKjB
         /OlZrCBmpf5FlUHwqXwHCJsX9qfD80LfjzyjtmZz1ALjYWlvtM7jF4Jv0leJTbCGH0J+
         Ij3NjB3+ZRBSQSkCHNwYbDRxgPBXO71skYQrOsVIzchTEkdkZ4wfrBhMY5bgt9r47BWH
         QHGX02RL1TKuAnWyB9AIPEH/XAuVkIN6PWEYJ4YyCn60XltgXcJHgQpsok1LcANe825w
         4k+A==
X-Gm-Message-State: AOJu0YwBdMqJIIFbd+8fYQTCO56mQwD+eqt3/t5VGXx9F/z3LYqc0HNa
	9/w+36Ab0vDWdn5DkUQNtWZJiHsQ7C0m6luY5+kfithAVNjc3ltlewrqYehI
X-Gm-Gg: ASbGncvSpBkJwREVUfoPBjxzKjBAMk37TGzwiU6A6g++S4iIAOu1EvclX2XCNDdfYIT
	zJibu0aCwfQwldTzzGz1l/T/Un/1WoSOPuIeekKQKHYYpvU99AYru3mZgztHrOKJ93tU2oMhlME
	X4nhQ+ySS1raAdZfs1bYrZh4g00BFZAjUcPZlqCt/aASBmncxaluYc6SPBHf7AVYmwTdyB699RX
	3RK/oX2ny5Q6vLyKD84P43tS3I1wGdFdZDtlwwcvnrK2gZN2we5Qa50Z1ae3SU2a0ZQchNpanZQ
	DdoSrncWzqGCah55REHruhFyRCrtqepaQPXfFgezPL8NJ6nHnio3nZxy2Lp7aenLBHpN96n2trf
	xMto=
X-Google-Smtp-Source: AGHT+IFVAD8TbwVpxNC183lYBwnbEiwoYCsijJOxN8KKYkGEtTfl7EpMjli1thKb2nWwye1LHkWhHA==
X-Received: by 2002:a05:6870:d14d:b0:2bc:9787:affe with SMTP id 586e51a60fabf-2dba42a3b74mr1387784fac.10.1746774110208;
        Fri, 09 May 2025 00:01:50 -0700 (PDT)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com. [209.85.160.51])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2dba0af8639sm499289fac.32.2025.05.09.00.01.49
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 00:01:49 -0700 (PDT)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-2da3b3bb560so1482212fac.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 May 2025 00:01:49 -0700 (PDT)
X-Received: by 2002:a67:e7cc:0:b0:4c1:83c4:8562 with SMTP id
 ada2fe7eead31-4deed36db85mr2042531137.13.1746774098753; Fri, 09 May 2025
 00:01:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87frhepkrm.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87frhepkrm.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 May 2025 09:01:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVwdB1GP4Ta-rMAEwbSVXjViSx_Ss77wU115xZ9vWyi9w@mail.gmail.com>
X-Gm-Features: AX0GCFsGZ8kQOSFQG-1qXtFBfto6R0mDRIuJh5EfVKjRF6sbODc59GGWKYfxCjU
Message-ID: <CAMuHMdVwdB1GP4Ta-rMAEwbSVXjViSx_Ss77wU115xZ9vWyi9w@mail.gmail.com>
Subject: Re: [PATCH] arm64: renesas: defconfig: Enable MSIOF sound support
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 May 2025 at 04:42, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> Sparrow Hawk is using MSIOF sound.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will apply to my topic/renesas-defconfig branch, which is not
intended for upstream merge.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


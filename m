Return-Path: <linux-renesas-soc+bounces-8419-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE389621D1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 09:53:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E044B1C2306E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 07:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AAAF15853A;
	Wed, 28 Aug 2024 07:53:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7A71487FE
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Aug 2024 07:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724831609; cv=none; b=r8HZYbkC8d6ftqE7Rvd4NWeUUG9EtdFrsIQKslTJwgtM5DtTcJeJqcSRds9v3qobQHNkHNO6lkRWYAYKzve+aVvuMftwPRtT/WLQGR1RlTipbEYC+Ld9JH+J47VmFpdjOJUaCgAhLuPh4ZAWApMm4DMB7gfyb1GcAIzIr6dmwKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724831609; c=relaxed/simple;
	bh=sacNVm82bWOF/Ef8y1U7ZZadsOkc1MMzRuItnB/Meu8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=B+TtjV32R9gRqNFIAjuQgnICMyJ7qTGedF49obtpT6gGFnwxPzxmM1lPNRGFunmG8FYL4cOeDWlu9KfcIj5eD4NjQHsR4t0deLJsWjWfWus6PXFZnwXt6MjUXcNkm00Hb86fnNV3sMSKf25JIt4IQEWL1L81UMEZPC/NmUJqGRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e13c23dbabdso6133467276.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Aug 2024 00:53:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724831605; x=1725436405;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KZY9HSfijPyWN6Ysem1spey0q3Idjk5R+HTIZy41vZU=;
        b=otrbid6s+aOG9VpRCETiJmZBk8cb7Ib8zVctNklidDniDIKMDFm4dl9LqV58qv5uGc
         Dpxv0X88ddOQKWPMq88iIXU74Nkluv1Qd/t6rxMP5IX1GSFTJDVLCUc2F7IX/YCnZeE+
         RGyajswtmhweOQlbzCPtcgPaVsW93TuJnsjhYGn6kfxu0FMa1UHETqX1TJwwuH88bhrL
         ZtfDNzk7pi+JpyDj01gfGbck0uxnwQuvkdJkT5fcpnNpkT1O4dz6D/BSK2+m6/boXWkA
         Va9sB+z0B9qy86G7ZJzbVHEdyk9Glyb1pdzpHUgEAyRigh6b8jiO74Rdmc9VEVHccyTU
         ycqw==
X-Forwarded-Encrypted: i=1; AJvYcCWi3xgaTABeDP7lnfwkPvnxWZ4WGUoChCfIG3jnKrKxtuBWtWZh1J0GyYDw1Oia2517LbcbvDbznGdoSRfHRMOa/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTFNtSH88C3rzESHH+RBCmNdM9maOrZXqu7SceTVtuvqf9uoK9
	DvD0t617larx6DjeGSqBZI6cgV8l1KoHMDnIuqjIWhQBIuXibObxCMPPUToI
X-Google-Smtp-Source: AGHT+IGJC6RiZOPxoOiTIgYZvHRkZQ0fDxNIiNoqkLJCBo8SbMGlBMmCTOMgD+vtake9diEeNWBZQA==
X-Received: by 2002:a05:6902:18cf:b0:e13:d4d0:e25 with SMTP id 3f1490d57ef6-e17a8af4005mr21022063276.15.1724831605243;
        Wed, 28 Aug 2024 00:53:25 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e178e4b71bbsm2929493276.37.2024.08.28.00.53.24
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 00:53:24 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-68518bc1407so70459357b3.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Aug 2024 00:53:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVDist5SFcON2Rtsxdmx5sPiCFcl5XPOPWDyZ87FV1p/m+5MoacYrD4fomtQKgxuUWxkbmG4p3FOlrq24XhZwFAxg==@vger.kernel.org
X-Received: by 2002:a05:690c:f0b:b0:6ad:75f6:678d with SMTP id
 00721157ae682-6c624fb6b47mr181248467b3.4.1724831603833; Wed, 28 Aug 2024
 00:53:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 Aug 2024 09:53:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXs=T7Spiu8N_xgx=ai3b1Bcx3qcncwUMwSoN2T2oRFpA@mail.gmail.com>
Message-ID: <CAMuHMdXs=T7Spiu8N_xgx=ai3b1Bcx3qcncwUMwSoN2T2oRFpA@mail.gmail.com>
Subject: ravb interrupt storm
To: Sergey Shtylyov <s.shtylyov@omp.ru>, Paul Barker <paul.barker.ct@bp.renesas.com>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi all,

Yesterday, I saw an interrupt storm on Gray Hawk Single after s2idle
with Wake-on-LAN.  The serial console log was flooded with:

        ravb e6800000.ethernet eth0: ignoring interrupt, rx status
0x00000001, rx mask 0x00000001,
        ravb e6800000.ethernet eth0:                     tx status
0x00000000, tx mask 0x00000001.
        ravb e6800000.ethernet eth0: ignoring interrupt, rx status
0x00000001, rx mask 0x00000001,
        ravb e6800000.ethernet eth0:                     tx status
0x00000000, tx mask 0x00000001.
        [...]

and the system became unresponsive.

Do you have a clue?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


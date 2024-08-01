Return-Path: <linux-renesas-soc+bounces-7691-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2E5944FB0
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Aug 2024 17:53:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5823BB26298
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Aug 2024 15:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E16361B0111;
	Thu,  1 Aug 2024 15:53:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4432C13D607
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Aug 2024 15:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722527583; cv=none; b=R3Rd0Ad82BeXEdgCH9l4BHVK4V5xQTe6D2DTV641KW/SDBnEIGqIs3M68Lzf2Ywmp8sm3b+cCkTRSLnJLZwDGhDPoWFu3mk2IM9nPO9xspkNxA9z6xoOc1P1VBh0a6six6hkh6/pJuIerje9BfAXUlK0dxKx5vbut71HkJX2LvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722527583; c=relaxed/simple;
	bh=NLcvSX1LMTB37CYQ/e3D1/6DUzdWKyYEwxTXXTs6TXU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OWMnBue38hzuQ0+WJVBr5Kn8+eOISFob6FWGUMMFMBvzOenTjEiuNXsjsctMsJhI9g5fM9MmHaMsOeJiVl8qXWRczAmTw8//OSLdEy8j0iWwiNR2yl0YKAF1F6MctustwZIdPs3QiXChzYqQydsCsRw2xe4CnaNwxyBrr6XpA+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-65f9e25fffaso59542707b3.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Aug 2024 08:53:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722527580; x=1723132380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=732jH/jXQ0MBfHefgeYm74T3TnTdxgDWDFvO/w8A0cI=;
        b=ckMlSA9nXbWs7zLrVvgzvy2E0vdwwxzLYCUCcwMmrPrN7O/n50vAcho+V6R0kvkfPw
         Wvv1XDNXTUuovaR1mEQ6BfLOhTrY88TVUXoB2IapOQeTzArp/gwxw+0voFIwKCVB6NrF
         FcDmVt+EYkE7nklva/2G0UzlyUkd5YmW1tUhmunRjjYG8FXhukX+H4j+8FBHBu0npWst
         Z/5k0Hkuvh2kMwrOqrzlNeuCKG7/URICCpKEpwugcysjScDgW5lmjGpwqRM5yhjOQauG
         8qQYz1aApa8xJxtJxd8+G/dBEZwQtjt73u1bFhxYaJjhN0qbSUc+9ns78Pm2+dmlaaLx
         QaJw==
X-Forwarded-Encrypted: i=1; AJvYcCVipf9zZYJkU/CRh6hYdfqBE97JF81FWvnvHX8itPgFlpecsFFTVKb4LMFnfnurpboxBggX6+Y+UX3uXqulT2g/lw/OSGaovrOpBBsOdPPfvyM=
X-Gm-Message-State: AOJu0YxsSJpQ+jsUUufZNgGA4nlq1Q+Te0avjltvSH0aBFAryDmOp32C
	l/hcEy6V/GOzqpyKNFwF5ARQjZ7qFtMJTVfusklTwneJIj3wLqzpV0txYepn
X-Google-Smtp-Source: AGHT+IGePCeTcSTluIAN0jySrvFQPvCBfaaytXd3upLoRpAElOZRqIVolV3t7NTtnj0goiUEEQvwyg==
X-Received: by 2002:a0d:e544:0:b0:650:9c5e:f6e2 with SMTP id 00721157ae682-68963048d93mr4977857b3.34.1722527580126;
        Thu, 01 Aug 2024 08:53:00 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6756bab50b7sm33572887b3.127.2024.08.01.08.52.59
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Aug 2024 08:53:00 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6678a45eaa3so60466247b3.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Aug 2024 08:52:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWcNomOsyH00LPUbd6R/pADQBZ2A5D2Q1dYuTX1giZfkNZClf6Kmn7eDM76kVrl+oyPCgheXl0rURLRZw4XHXZbDQ2hsrTd9mHHM1b0ZEti018=
X-Received: by 2002:a0d:cdc2:0:b0:65f:77c3:63a0 with SMTP id
 00721157ae682-6895f609ef8mr5648077b3.7.1722527579213; Thu, 01 Aug 2024
 08:52:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240731105321.3196788-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240731105321.3196788-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 1 Aug 2024 17:52:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVmwkVGyOhaaEfbf5oZq_CypfMMpMRTo=t66658bi1iCQ@mail.gmail.com>
Message-ID: <CAMuHMdVmwkVGyOhaaEfbf5oZq_CypfMMpMRTo=t66658bi1iCQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Enable R-Car Ethernet-TSN support
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2024 at 12:54=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Enable support for R-Car Ethernet-TSN, as found on the White-Hawk
> development board.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.12.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds


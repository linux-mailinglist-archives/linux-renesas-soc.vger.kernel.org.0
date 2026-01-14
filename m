Return-Path: <linux-renesas-soc+bounces-26726-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 365C2D1E3E7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 11:55:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D1984301A202
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 10:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D48D239446D;
	Wed, 14 Jan 2026 10:55:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com [209.85.221.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088733904E0
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 10:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768388113; cv=none; b=iiDF/jz9Qp0MuxoDMYtyUQDr5zZE35+EGLcfR60AST1IbYetiDLtsmJAj65ifdVNNjhcDxZs+Sgn/J/qI7vfM8eEwYErUhq4xhDEYHQ8s8ELICHLsJFjiz8oYERLBn1gXBMN4GytgiWsvPbud9luJYdEaJf4K63zMSAh1heqzbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768388113; c=relaxed/simple;
	bh=jAAPKPIjU8sa2L+2kYmydJMC21hDbeIeKEo1zijFhUc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t/Pc66x4OFgVsvbbMuVo21B8G+3iOKdpTtntzN4/rvFhp54LfE+NBzzGNOQo1y1xtG1IxzG5OoXl0FF/B3jk+fkBNT93l5FQzbiLa3GAVW0lXT8LlD+W1pcyLkUxs+Mjn5sBBuGoTgGuKu8gAoJm9Dkazt1PqA4/amIFNd506+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f196.google.com with SMTP id 71dfb90a1353d-5636dce976eso501824e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 02:53:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768388008; x=1768992808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7nBfD023nU+/m9RS1/PqlUjs/Tm6bQqk3JW3sWTwihE=;
        b=C6YsNMJZ4qDAv1Z7jNEpe1xiiNNIXtuwvSUPWDQcMOESF9faK1J0JonRcfNb829CcW
         VFfdEA6dRgRvGVk/cux3tqM3kya/5eTjQbE9RDYpeG1P2vhsymh4EafCEOcy4uYF51hE
         BqbAuPQ7+XL9aqhIpmyOjdiF8VMZc/EWIetqzwNnL8wst8JYC0GFy6LnQBpQFM2BK9nw
         yuOAgOSwp/hcf5KvbDgqdB4WLBypITFQfSJXtVtZlsO0sw18OPPdX30RvOoAp/6rheJL
         LyLyLlxapSH2AGNH9fhX+Dj20bqRTBxfeW6mjNYnQlb/fOq4aWVnrMIFe1fUujyK6Txb
         Yb9A==
X-Forwarded-Encrypted: i=1; AJvYcCXV3pAiRW0w7TVzFkdhdRaKnmFY0AN2Lz+wuC3PankHvnAKqpf/18Aha60BhYRMQmt0cBQLCqbxn1u7hKyv4pgSsg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0AoY7XLKjESIPzH4d1Q57wd2r0+jsjjFaYevYDuytEMC6zVLL
	/+M9Ht5gytHfv3UOnGOp32kLV7ItEf935MpGmNQGag1ohRnVNK3CMI224hT4QnxYcdU=
X-Gm-Gg: AY/fxX7L33ma+Ch23lyE1CAg8Yhhbb2a6yoSRwlocSq21OhrcvocLS7Eblv6Y6JOP/J
	+XXVb6fn95NlpHg2G8W4+EyY0LZ/bRz0Mtu99Pj6dVXUpZcceOa1+jmPaO6g6ymcQ1NJjXp3Gm+
	YHH1PxhuIZZ6U7oDvdd7gSx7RfZEnvQtGLliI3ovt7V8gxg+yLPwM7kg4aWBncWuHNK1cotMp4B
	T3a5V5b2PiKmQ3iE/JBrM28JYhl6AGZ2qSktauDYJYNF1Acm2rf6/U5ALcqiwFh2i4AXb3hMZa3
	X3lzHB4ObmHdgWO09qF9JAVC+7lXn2Yms9wKfBOMf0YYtPIw7zcEjr7WHnFWSw4YsltEkKiFbub
	JA/ORVXCHD5yqa2FXQaiF0HjPXByE0C4t0p3AqQYyUPU3vz+ep4RfqqGxjyeqEz3d7YFE4C7ZpN
	PmwYRYUgzFV6WP2x56XRytboLnZdzzvi1mb0YQj8VnjVAnpC28rUMEvTZsd8I=
X-Received: by 2002:a05:6102:370c:b0:5db:de8f:3278 with SMTP id ada2fe7eead31-5f16caf0924mr2372277137.10.1768388007883;
        Wed, 14 Jan 2026 02:53:27 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94412404678sm21709678241.8.2026.01.14.02.53.27
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 02:53:27 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5ef31a77afbso546817137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 02:53:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU5jtFOYPJSEoJuxbev4/dtjKiEOijIYTo8+BkDcHofd3eMWukKGmfq1otbIzcqDSBA0nFthseqM7gkoUSzLWqNWQ==@vger.kernel.org
X-Received: by 2002:a05:6102:5792:b0:5ef:a416:be63 with SMTP id
 ada2fe7eead31-5f16cba55cdmr3059465137.22.1768388007165; Wed, 14 Jan 2026
 02:53:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260104222653.1659382-1-niklas.soderlund+renesas@ragnatech.se> <20260104222653.1659382-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20260104222653.1659382-2-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 11:53:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX+djJyRsAZW9e38=oP5G1UBZ2ng0Kw6C-7r+4JMVzyug@mail.gmail.com>
X-Gm-Features: AZwV_Qjxm-3tOn4PgFSCctakzFrk_Fo1JWYSMTv7eBgch034dmEmYfCJ9BCweb4
Message-ID: <CAMuHMdX+djJyRsAZW9e38=oP5G1UBZ2ng0Kw6C-7r+4JMVzyug@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: img,powervr-rogue: Document GE8300
 GPU in Renesas R-Car D3
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Matt Coster <matt.coster@imgtec.com>, 
	Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 4 Jan 2026 at 23:28, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Document Imagination Technologies PowerVR Rogue GE8300 BNVC 22.67.54.30
> present in Renesas R-Car R8A77995 D3 SoCs.
>
> Compared to other R-Car Gen3 SoCs the D3 only have one power domain and
> it is always on. Extend the list of special cases for R8A77995 to
> capture this.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

For the contents:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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


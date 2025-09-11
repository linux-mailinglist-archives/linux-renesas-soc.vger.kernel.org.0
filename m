Return-Path: <linux-renesas-soc+bounces-21782-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFADDB5379C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Sep 2025 17:24:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EAD31C815D3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Sep 2025 15:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE9AF31354D;
	Thu, 11 Sep 2025 15:21:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32360320A1D
	for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Sep 2025 15:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757604104; cv=none; b=Y8LypDaDudU6unezVs+gp9k4AvE5XzFBkgk2cau4s9TmW1Mfhs/0V1r/UqDK7/NhhKsRc57TKlw5DE6GVhHLrQezjM3/XcJA/EN1oTlcXy98UeLOyG9N3IqQ6hnCSIH4OsIzrkSBORUp8WYUqdeUYeXQv9pkc6jlEZ/Bufq9k94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757604104; c=relaxed/simple;
	bh=oC4vmluiwrX18cIeVqBz0JWNRurMmcePlH97Y2tSYjM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HZyezxLH2MlNGFFEnCu432BKF6HICA3CP9C/HSlpuqc2JHg+PIRVe11EDO938IJkIeigDkcq796snuzEvBi5Ms5EDEae19p8ip4sMwwYNSP+4wWL3rr+h1C+i4pxdlPg6MeXyfa8kVH0seVde8P595u4GtkBggfqIR3+UFEaARU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-544af5b745cso552108e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Sep 2025 08:21:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757604102; x=1758208902;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5zw8eBQvDUCVhODh2n6UuXo9fuHt2pQGWUMRk5klLYM=;
        b=Ad18EgppgvDKN1PVSZA3+pnbCNCKT/Y1NENKU2BEwRxXXc5ik/Xz7JwoQRRKvL2HzE
         OAEugTHgLFgnXeN4JJycW2ko0TefopixcJRxw8SncWjPanW+YGQHaZg7qLMor8GlENRV
         iHq58IH+6+PKK+dUTxLC/9QcYnff/gIgmBCQdul6dDZrOcE5yK/EfdkMUiGIF0Sh/wDB
         0PcS8v21lVmH/yV8qQEGfvgLOiZ01V1vggC+OXyo1ELnk9rgOGfJ7QFg6QJsvqwvNWot
         Hj74Pby0ouMlT2z8ExiFiU0IrpM2X6fkkRWYroQIrGMuszwosqINxejWFtcR7p9baaZd
         ZHuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCpq//C4PXTwUf7gpzLMCXcM12LLKXP6++48+ZNlX2ru/SJSNSJPeIhhvzjkjZWYWtlLn0fxvUGtSRDiEddDPt1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzyrYxuj6B5iL29U8NN5FXcFQyJjkO/rRgLqH8ZI+25PjHpNTj
	UQv6w/yU5w6mdDKlQ2YBLnQyb7679n73bfM/V/+mjHmwLp10DwulzZgQEcsGHApD
X-Gm-Gg: ASbGncsS9NqJRrKt0tQdkkWQVLryAcFWG+YW2hQQw/bwXPl/xf0wmkd9W1FllalkTWx
	REqu73uIqOmk2mQZwh2Sg7E+oUesTsioNDsXzZ5mOvB+bFWivHkaa/Rjgm+LHTxr+BBoNsVKLua
	6CAAkW01hnfgLrSlVS2VoYWAZchI3yQaF9tPj9yigiMPa6QvMR7Eehq7WEJJ0JujI3x7Tu02Ohd
	XcJYWSIVipodHhvCJfZDY53xHapRhRrskWpQRA+bnNjkhcPbUVAMeC/3jxBC/uUqmVxFf3vRQ+w
	BaclDim7YN/RIq57degE2yXvRt68U3xv2VP8bqjsu/wLP7ucUPMf9nK8J2v+LCa4ZJD9j3lOsD4
	Xo1Usbhh1I9Ck8UnDb1/qNd8wd6FqOnTd+HSr485b4HekeEmxo8ALikDg87Op
X-Google-Smtp-Source: AGHT+IHF4iZzt2mRMyKMrMPDa1Mczwk+hy5y094r/Q+CLT49oE4L2DWMb08WlwWuAEfL4nSUOVQC6Q==
X-Received: by 2002:a05:6102:dc9:b0:523:46b7:efa0 with SMTP id ada2fe7eead31-53d2490d269mr6226906137.31.1757604101721;
        Thu, 11 Sep 2025 08:21:41 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8ccd38f8e5bsm292373241.13.2025.09.11.08.21.41
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 08:21:41 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-8943501ba3dso589044241.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Sep 2025 08:21:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXnb+pqv3KmnLQo21xswzppJrYzmnwQMcIhDJCE3gnBmkaZveJcLp9FIjNyvWcKeTJCA+HOcfPuKuBbQ8s6bktPLg==@vger.kernel.org
X-Received: by 2002:a05:6102:14a8:b0:529:bfd2:382a with SMTP id
 ada2fe7eead31-53d2490d25emr7502207137.32.1757604100881; Thu, 11 Sep 2025
 08:21:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250904100435.4033858-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250904100435.4033858-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Sep 2025 17:21:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW+YXwMCbQy8g88s8hQ+zzV8Vqr2iaX98J5d+RR_q4QiA@mail.gmail.com>
X-Gm-Features: AS18NWDe3BfDNkISbgAn9TPJsLdnq75CKg4tLUlECWyOdSKnu33jwgTzPbJMnms
Message-ID: <CAMuHMdW+YXwMCbQy8g88s8hQ+zzV8Vqr2iaX98J5d+RR_q4QiA@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: rzt2h-n2h-evk: Enable USB2.0 support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 4 Sept 2025 at 12:04, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable USB2.0 support on RZ/T2H and RZ/N2H EVKs.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Reflowed comments to adhere to 80 char width.
> - Updated comment about simultaneously using USB host and function interfaces.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


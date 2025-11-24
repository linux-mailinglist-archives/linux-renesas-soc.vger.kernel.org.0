Return-Path: <linux-renesas-soc+bounces-25076-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBE8C80DE0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 14:55:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B67CB343FAD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 13:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3A5630BBBC;
	Mon, 24 Nov 2025 13:55:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B1830BB82
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 13:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763992538; cv=none; b=EVVFrxJWiWaoy+Ys7B+NGNMFlqt1rs5z3p3iIC2Bw/0owwj/qH8TWJqIaACFfIr+RsdnW1fykFj3+snPpvRrMHYvST2sWAV+yJWCBGgjFswbXlCFPb5azKnqTqNbbwRawAfsJhRaZrbZZ0HD8nj1Te5ViHOXligZlp1qwutZAdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763992538; c=relaxed/simple;
	bh=UStbm3HgHfGEo+bNWBz85MQishezH8QlRkqUfexN0RE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MWPYFYeykGHsx5baC9Zc46kyZzY5M0/OsdpqSu+l8qPGtd0kihcvNurnKu75PVRZZq7ixPeDyWA8iCYnM2v+y1FZnjGGk8vUGqolpTNxofMuCorechsZlMc7PddKUCRjtdqvD4Xxf/jvq1JJpzFnx8Aop9B0eW9QQo70mUn8ig8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-937262a397eso1215667241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 05:55:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763992536; x=1764597336;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HM11Xlk4Z5iSXO4OvQf65Y5sqEe2guzTTzWRD/5vobU=;
        b=D0+/cy0B4EhhBP6pMYRqXeTe0ZHOth2QONGL8xbr9MSBUMdoCfI9G6XFsKNDNsUzEn
         K30+2Ieo5GpBCgulBJgFFBuaUd8zv/amSvyBeSGQ/9PafWqOao7Il5SPye6rl+Z4fqAX
         Ef49FctP6qbvEv9FsKEhIUIqBaOpjBcDxjs0wNO+XVvadLTmjkcz07T91QBXbxGMDrLc
         CvVS+O+r6M3HuiaepLPOwIV8Nfj0b74ffBZRNG+dOnbqwWWSxCWHzOsinlmx/LFdWHbm
         apPX6rPAhIiii9GXJZuYc4egatl9ClAxFwKcNRUblyzSNpD979IdvFzDkyrPtdIcuDOZ
         bJYA==
X-Forwarded-Encrypted: i=1; AJvYcCVzO0rxwJc2POoQujvVf9k3+MKUru6mFnKA6Lh2f1Y5jmKdpJ7DtWPEYdOTmZIJGtO9bs0jsuF5Tz5UuXvd/gtgsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHdzczR7DEElffP3bIqCvfgFjf5lPu33s8V36lXH+ZZ0UzvuBI
	uDM0jIITcypNomzP9xZqH/NbAOr4L9oJs4Kll2iX5Xew6C3v8SnJFZteY5DeXwUw
X-Gm-Gg: ASbGncsRoo5n8FmWR4nsf8H3CtwGQZIBYcJjeVT5Gv+LD3AfoYDet455H14AHAKT4Oy
	Rlz+J10IJGZfbfdRBGwaCoxy6EJfdyFoTaRG/ImL0vds6GVYRykOZgLwZfi4Ybv6v+ummSwaPop
	gMoQfRFYWbMAJnfJuVAI3LfKFTCM/ajiOW+w1BqbL/M7DOT6NX3fL2MXzfCgmYv+YduTNicxOFQ
	l4kMwxXsnPW9XEy/IiQU65Mq1087XmLbvffIvPU3hPit3fo41HMEEMjtyK9qGuNj6J2+Xu6+eOl
	xAS7IOzm9aZlRBw981+iRFgMH2fNC6w9T505V6NRXHXtAv4VGu5LFZc/5Ei+YRTFK3HgsQyOaZB
	MOOiUiBJD9qkhW4crQUD/YX14yhNU6i7ebAGVkuDuCChBrNtGKzG5FIYmp3vBYQIk5BNokUCtHX
	J8LgNVRTux2yDB9UyDLVNsbChQPTXQ8ogD0o+sLYvLh5wGqtHWRbyc
X-Google-Smtp-Source: AGHT+IFKXTOC5OiTpnVN+FacyFh0kk1pPcwdyvK/buPwLeJZ1L2HkID8UkKb8ejoTCCH2NlN9Fl1qg==
X-Received: by 2002:a05:6102:5805:b0:5db:fb4c:3a89 with SMTP id ada2fe7eead31-5e1de25fdc1mr3746363137.19.1763992536199;
        Mon, 24 Nov 2025 05:55:36 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e1bdd27f74sm5473765137.10.2025.11.24.05.55.32
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 05:55:32 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-55b26461e78so1082914e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 05:55:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXhtkzN8nZ4WQpt50lb9ZR/j9rDsgDfY2Jj3YTIyUx7JNBIhE/A07GiqW8Dm9O0CKBGArl1ZjQloDVNm1oRKZSRCg==@vger.kernel.org
X-Received: by 2002:a05:6122:1d51:b0:55b:305b:4e3f with SMTP id
 71dfb90a1353d-55b8f01e2ccmr3399105e0c.21.1763992531823; Mon, 24 Nov 2025
 05:55:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119110505.100253-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251119110505.100253-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251119110505.100253-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Nov 2025 14:55:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWEgDtvrSx+VBjLEUOw6hdM4Gdn3s35xYzxFdHagh9jhg@mail.gmail.com>
X-Gm-Features: AWmQ_bmiizvJ_N1SdR_SB7mEOyqHWDCaYII4sQV_aHjJP3yLUXdP9XtykER4-h8
Message-ID: <CAMuHMdWEgDtvrSx+VBjLEUOw6hdM4Gdn3s35xYzxFdHagh9jhg@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable
 USB3.0 PHYs and xHCI controllers
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Nov 2025 at 12:05, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable the USB3.0 (CH0) and USB3.1 (CH1) host controllers on the RZ/V2H
> Evaluation Kit. The CN4 stacked connector on the EVK provides access to
> both channels, with CH0 corresponding to USB3.0 and CH1 to USB3.1.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


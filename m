Return-Path: <linux-renesas-soc+bounces-21265-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE9BB41DAB
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 13:54:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE4D35486F1
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 11:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 630E92FC86D;
	Wed,  3 Sep 2025 11:50:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06072FC86A;
	Wed,  3 Sep 2025 11:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756900242; cv=none; b=KSr6I2GMtJfigrlNknoyw6K/kxu+vpCc5fV9jUUUNOHnfdFhmPPB5fcU8nJ/vHWaqLg5R0HaBSmtdG1gVKrkm3x8iHkolMx1JAXYe3LCeW3OIjUk1/IuDR4VBM271+IqDDkWR+L26wKKGdzn+unA48P91xqUFzW+YYdMqYwI6iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756900242; c=relaxed/simple;
	bh=6KN5sha932sfjcUOtN+v8xxepOlyuTCu49l0C8WA6Do=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QrQ90wky+Svni5abcVNdZ2a/TBdcF/a3m38ijn3HHYAlANnZOz7/9RaXMEPDZuHCBk/L7NZVi/2q2+o7nGcKm/74ZqEW+p6ZM6zE5Fso87N39K+LV0BMzKRkaHPRnm+5eV+Ko1ku/Y6xSGoOQQPBKgK9ixSLu63UE2eQcBM7XtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5290c67854eso4031385137.3;
        Wed, 03 Sep 2025 04:50:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756900239; x=1757505039;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xgnMetZFp2VurWA5u7B1Po5e2ivZavsucnxNPBMCGTU=;
        b=hUdyhg1yvVg0uuRKOmqrEx8bekUIGMCs4RzgBz6aUGd3YzzsRshrPR7nBt/WecafKF
         Fiuhrq8s7ve/Yb6WsbZ5oKnLI1Rrwr7INxiAqV8FMqNKusNyIO2AUEdv/5PBH7uULfvs
         PkdL+HFpTa8g8DBAxyb5ubO95fy7DvwpqQpQCrNyrV1i7kTXnlapu82SF4oKKuSaxJ47
         cu9WoZrnvDpJnL0QaoD3cTONOZTQ84zDgFR7upM41FsQ4DU9sEJdAEpvynNYsiRk1e9D
         ZbgX7g0rSgGUOh81VQ5PD+zlSCnXlViMvJu1u2z4kHH66sNw3+cEPif9fi5VeB4qlgoa
         s8jg==
X-Forwarded-Encrypted: i=1; AJvYcCWBhZhGQ5/y8XZrgBdOiUPttVZdyqlhi2Dm9okbCfSuRCErvbVBjYDjGk6Hlz+kODROX8Eh66q1tx8T@vger.kernel.org, AJvYcCXBdEveASQIPmT9aWf+btNwxFRcWCIhcUHHELE+R6ZOXMxqs2cXG2HZBxzbsS+ymENFNaL4OijVkAbLJ4dbAXyLQfM=@vger.kernel.org, AJvYcCXRPdm/LhFS5i2imD5HpLxFB011RsTk7zwyG6+84hviHwyc2Jqok4ebuEBN3s0o2R4ndhAT/GtVUEvTVV1g@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ6niTHaIUeaHPvAcnv76jvn/CGBcEEg9rKa54RXvDBzLkAiJz
	80c4bHRpSawhAK17dAz/SL2wpm+dLYVSgmUzKB5XIUV+j6LE9a3fD4kfh7sRlGs3
X-Gm-Gg: ASbGnctSJQvgNROP9YIARYsusyth9ZJaFUCFRgX1BINdxMUggG4qUub3OIGjxW9ls8D
	sieoxTBkzQWhc2Ru9qr5xKfXcV0J1GVWYJa/35CztgAt0qxwBP4gWMNsqygHTaNV3ho6l9rq6qh
	LsHOTjLHeBX1Bi49P4GWDjaueSsw+HDRqUvjNKeQ+odeVRl44S8seS5IhW1UeHfNwgcGu2ToG8m
	5CfXHOChGYKlJZINAoWwXaxvvebtLAmPk9asjSv2C7eWRfNxw4oThrvgl9VpVZ5UPgNfPF/QSfH
	MoMd949S4HE65uRWkulAeEuLQe+wqJ93qNssuo7k3bvzEo8v4jh1DCRLpZXq/LNiZCK9JML71qT
	3wk5VFv0mdcbx99YPqRcjTbbJzuETTh3pJ1DMascIp3XLBMNNaelkP1AxfFIn
X-Google-Smtp-Source: AGHT+IEJyrqPNVOh88VIdqUrCWnetwPl6l1ZTZOAOJIkASvO7GgrFEhMATW05LzBZ99QFxecqTJkqA==
X-Received: by 2002:a05:6102:6447:b0:4e9:cd8e:c28f with SMTP id ada2fe7eead31-52b1974dbdcmr5008871137.1.1756900239450;
        Wed, 03 Sep 2025 04:50:39 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-52af19156ecsm5505614137.12.2025.09.03.04.50.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 04:50:39 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-89948e581d5so934684241.3;
        Wed, 03 Sep 2025 04:50:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUueaSGC6JkAlbmTT9OS5KhpVLXsxbMlG7HxnV6oGGlEzOigPFaP+eFx1rBqFHcvbvIjWkXz0SYVtZE@vger.kernel.org, AJvYcCWpJomPI7NSaOGAIBOh+2ZrdF3Z8cY/17YtaTz+HSmLNS1kvfIoU4QOQ162jya2k5BqeNyTXPPvgV00E2BD8LxQy3Q=@vger.kernel.org, AJvYcCXTDew+1LYaAe9xHrg1uPhgp1Xr6isdUvWyLLnJiFB/VoZod+C4Y6gOUb4HHMp9qmQz84tovmNcEatzv/R8@vger.kernel.org
X-Received: by 2002:a05:6102:38cb:b0:529:3e0d:8769 with SMTP id
 ada2fe7eead31-52b1974ef4cmr5420011137.7.1756900238565; Wed, 03 Sep 2025
 04:50:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820200659.2048755-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250820200659.2048755-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250820200659.2048755-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Sep 2025 13:50:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX8FnYo-S=sTxU0gPyLny8cu_ojGaY4ssZW5R8LFjtX1w@mail.gmail.com>
X-Gm-Features: Ac12FXwI7gwlfZ7ytl9giGJRNCDz4ErYRsbsAeVsBd0L71vHpRP_K1dtGfiTLMc
Message-ID: <CAMuHMdX8FnYo-S=sTxU0gPyLny8cu_ojGaY4ssZW5R8LFjtX1w@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] arm64: dts: renesas: rzt2h/rzn2h: Enable eMMC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Aug 2025 at 22:07, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable eMMC on RZ/T2H and RZ/N2H EVKs. As SDHI0 can be connected to
> either eMMC0/SD0 `SD0_EMMC` macro is added.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Added comment regarding DSW17 settings
> - Dropped sd0-emmc-prefixes

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


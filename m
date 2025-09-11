Return-Path: <linux-renesas-soc+bounces-21778-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 902F8B536DC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Sep 2025 17:04:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A7923A440D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Sep 2025 15:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E08CC14A0BC;
	Thu, 11 Sep 2025 15:03:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED992D130A
	for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Sep 2025 15:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757603030; cv=none; b=CXJDxPL5nO92pCM8LdHHkzfJ0+CPgNO0D9NqMzt9swHZWOWqRMXlDqA1A16s6m+JgfyqjdAi0b89SqQyX/xX7mLtrxchVj+2ch12OkU6DB6wCZvsLkJgWB1wc4jQBwoRjT2ftrUaAatcM+9KtP/tGW0nvLYGDKTLLyCt7up2Kag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757603030; c=relaxed/simple;
	bh=VK+yX4yUN5G9R/8D2B0MkkDOAv8caId0UMDP1bmocVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jbuRd1qmZbVcIjgDX5IqHF/lCl+mrKFugOjwEzNcGUmuAKGiYRpPFLsxzPxTGOazu+2zt7v2XhRzWAiDThXbcE3HpS6nGim95MvNDm0xL8Y4x0RQ63rr1d3LAmrlWsEGVcaf3vs0O9s5u6nW1pX/RIz0WhlKRlnAXHpfGaWksZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e98a18faa25so516692276.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Sep 2025 08:03:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757603028; x=1758207828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hTNgjelsWWBoJtttLAeKmJNO9c1orKalw5k8xm7NVNI=;
        b=Wrr2U4EfX81m04ide8doj3f95g5o3l6MwR46zVCUrN8PXOZDirz3x2iWCYoCt+Rdl4
         zlKBmdOh4YuLZoDuvKBAVG55PifbHJiIFGAfPYhWZJBhaDS9JApHHsRPbX40luH69sKA
         sx3TFvUpRQE/aznrYCO0oBxDu1ULwsbMDJmrMwuqUVIWACq3Lk32KLPjzS30u3WVNp4z
         CxiFH/yljehPgF8bPL0L+lwu3pavh9OiF+ye3YeLQ5tTBGdCYlmMxI0qkSD1//2TCudz
         qPnRFvXZ9umyLgqmSGecDWsHiT2pQ0Mjb4IZAqd3YFzBRvrPsyM7c4yuH7/3QCVR6unz
         Er2w==
X-Forwarded-Encrypted: i=1; AJvYcCURmsdZsQErdOGTBBWvg+x+1xa7nn7gRf/5VsA0+UsuMFZhDmJgvZpdQElqobeY4tpn6GlDhYDTPEIrS2MMPwRbBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDb4H2+oxK0d93JcsgzdXXI1WJ//MZwKFgyKMuKg03WZqEuoOp
	Ge4RYJbeC+MODQjx0gnhSsEQlOeC62AIdHTiMCOE3sWcK4+94ptvZPZmZ0f4AevTDTo=
X-Gm-Gg: ASbGncvq3Mg6XbE/3Y49bX2Zy27fHYM6rBhhNEoch67wGZ3vu+yGPcSAj04CPgZibAi
	ccK9jZjgSdPWhkl1JQKyUIc7gYTVSR6IzSx3SiPsJ6pWnxfkRQ6oy/kuFOEMkX+OAx0Q3/a6BsT
	KxSzdfrUltNhyjRhjlOx3Pd8jPVxofXZwlZZbObZwheT4i3/aV8snXJ2UyJr97yKHm+PbHd4aNz
	oqaf6U/a+cUUxzPQiBIGkiUZzboZi+5QB9cgKq4ubA0OFfvxTgRWga6EaoZ5yTnFUkYmn5WsS5p
	Qkkqmg4vH0K0KoCr+R5k1oUzT+vxJsXx6f/Antl4IRQVyqYYo3x2cwKYpPerQqZL67DcYA+rVV5
	7sXWCB+lVojwcNV07u7EcVh7Gdi5DCzSx3YFrhkeyjQjB1KfzKi4jZTtJCThM
X-Google-Smtp-Source: AGHT+IGPrzqKkGUBrouGYSpKZI1ubmzA7HjSEat0xbberhmjMBu8YA5GcG2YRrqZ52foa0DtsCeskQ==
X-Received: by 2002:a05:6902:f89:b0:e96:d936:252b with SMTP id 3f1490d57ef6-e9f6926fa31mr19258726276.41.1757603027253;
        Thu, 11 Sep 2025 08:03:47 -0700 (PDT)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com. [74.125.224.54])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-ea3d849ff17sm28780276.10.2025.09.11.08.03.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 08:03:46 -0700 (PDT)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-60f4702e399so551063d50.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Sep 2025 08:03:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXkuyOY7H959GW9MKv3ggwQhd5hzfjqFX0sDowMZUE8VjAOIseZ3qy5qQFXe4t/LOYFRh7BNkDfuz37T5uHAqaFdg==@vger.kernel.org
X-Received: by 2002:a05:690e:1555:10b0:605:fbc5:b898 with SMTP id
 956f58d0204a3-61021bfc79bmr13662319d50.8.1757603024792; Thu, 11 Sep 2025
 08:03:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250905084050.310651-1-niklas.soderlund+renesas@ragnatech.se> <20250905084050.310651-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20250905084050.310651-2-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Sep 2025 17:03:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWLVNOPb7=fySL-Bq9VT=mC6Gk4+8mtpTVigm_EOpbu9w@mail.gmail.com>
X-Gm-Features: AS18NWCeiScPKVZBDvlUgXS9lgGLH_qD3xH1xsE3ioS_GcU8mUut7ilUHLk7n4k
Message-ID: <CAMuHMdWLVNOPb7=fySL-Bq9VT=mC6Gk4+8mtpTVigm_EOpbu9w@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] arm64: dts: renesas: sparrow-hawk: Add overlay for
 IMX219 on J1
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 5 Sept 2025 at 10:45, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add an overlay to connect an IMX219 camera sensor to the J1 connector.
> The IMX219 utilizes 2 CSI-2 D-PHY lanes. This enables the video capture
> pipeline behind the CSI40 Rx to be enabled to process images from the
> sensor.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.18.

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


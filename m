Return-Path: <linux-renesas-soc+bounces-2856-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 943BA8569AD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Feb 2024 17:38:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5137928AFF2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Feb 2024 16:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DDFA134CE3;
	Thu, 15 Feb 2024 16:38:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384FB1754B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Feb 2024 16:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708015089; cv=none; b=AI0XQirSueQu+yNh++aEY0qEi4TsaaQiRcx1wEFDYSPdO+cL5feJqCti9VfFzZUOB6neCEDg6sMpzrdZoZuwGxE0FfPoq9MCb3uhyem04EElw6azZ9BsTS9DVgWiuSzsy9t1dJFP4UHqAe5+QqdPUz4lCIPTpbvb5WbI2fV1smE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708015089; c=relaxed/simple;
	bh=zAoSJ0t4j25xONdzoe8AhZuaNul+8fTb9VLQ1Yn1fFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o14cam0U0NBuXbcAYYsvzqHmKUxp2dWxALw1F4Zt8LOXNyO/UDnYzTZteuQXTVrs2H9HKlJpG5GT1Rcv22ZASeog9QjeydJFsuCYvLdLySAjfFYLRQOIHQzLNcZNJB5zEIdxLZjKoHw4eeshH7ySmWYGVHwyIICiswV3ZEXnE+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dbed179f0faso1585157276.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Feb 2024 08:38:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708015085; x=1708619885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oDVcVwMkilKxYAAQpyRmgM2CIBGfQ49FWqKAOeSfaos=;
        b=OVWV70vAl8n7IHqfMeGu82ZoeSL+5SdXIFla/Teg92bGHHO8FdM5DWD6bGkJi/FDq3
         wLyusJVvvGhJCaqDvhNn5Grxe9zVhZqI0QYnSBzAQHT6yVibgm5jKINYEvnuhKKXKbNR
         6S8I5qgHhEZXu7OUqtSnsuaC8MiWsOFZzHvUwLjNvwK91rndh0wh1VU4zqvBAKBLbNaf
         +Az9ctMXVNjNQkzflhSVFI+bRkgbsfUbigBSgSefB3gL6jLfNU7kzc1nzmr/ETJe+IYc
         0OUrUSRf/wZpwri2uFC8RnzbazLVynoDLobgRTOUgDM/snC25ATn8SU+YYSSC2Pnvkrq
         reYA==
X-Gm-Message-State: AOJu0YwTmVWbsfzoYbvGCm/Ke0mBr/KjyHtA7qARd9g7dKfLsoLwEucj
	9dDCvQwOXPkU6zJt7ARcQ37O35eYEZr5Ykm7Kc1AUSccaOoedrOWO1+/9ThZwNoeoA==
X-Google-Smtp-Source: AGHT+IFlCmxCv1IL/4YomzeMXhYQLfG1p4TRorBQ06u9aFw5MWPeABYI0rKfc0H7c7RgD8uiqOwpMQ==
X-Received: by 2002:a0d:d7c3:0:b0:604:a478:a621 with SMTP id z186-20020a0dd7c3000000b00604a478a621mr1565491ywd.23.1708015085515;
        Thu, 15 Feb 2024 08:38:05 -0800 (PST)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id o15-20020a0dcc0f000000b005ff846d1f1dsm304330ywd.134.2024.02.15.08.38.05
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Feb 2024 08:38:05 -0800 (PST)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-603fd31f5c2so18463097b3.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Feb 2024 08:38:05 -0800 (PST)
X-Received: by 2002:a0d:cac7:0:b0:607:c65b:755f with SMTP id
 m190-20020a0dcac7000000b00607c65b755fmr2370226ywd.9.1708015085104; Thu, 15
 Feb 2024 08:38:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240122160441.759620-1-niklas.soderlund+renesas@ragnatech.se> <20240122160441.759620-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240122160441.759620-3-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Feb 2024 17:37:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW42DSTbW-N941wbUCWvaj-GGKAUj-5=hBB0j6vZgK=TA@mail.gmail.com>
Message-ID: <CAMuHMdW42DSTbW-N941wbUCWvaj-GGKAUj-5=hBB0j6vZgK=TA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: white-hawk: Add Ethernet TSN overlay
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Mon, Jan 22, 2024 at 5:06=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> On the white-hawk development board the Ethernet TSN IP can be connected
> to one of two different external PHYs. One PHY is located on the
> breakout board, and the other on the Ethernet sub-board. Which PHY is
> connected depends on what resistors are mounted on the board.

Actually there are three options:
  1. Breakout board,
  2. Ethernet sub-board,
  3. Ether module board.

> The default white-hawk configuration connect the TSN with the PHY on the
> breakout board. Unfortunately the standard breakout board do not
> populate the external PHY.

According to the schematics, this seems to depend on board revision:
  - rev. 0.909: TSN is wired to 3,
  - rev. 1.00: TSN is wired to 2.

> Add an overlay that can be applied to enable Ethernet TSN support for
> those boards that do populate the breakout board, or mount the
> appropriate resistors to connect TSN with the Ethernet sub-board.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
> @@ -84,7 +84,9 @@ dtb-$(CONFIG_ARCH_R8A779F0) +=3D r8a779f4-s4sk.dtb
>  dtb-$(CONFIG_ARCH_R8A779G0) +=3D r8a779g0-white-hawk.dtb
>  dtb-$(CONFIG_ARCH_R8A779G0) +=3D r8a779g0-white-hawk-ard-audio-da7212.dt=
bo
>  r8a779g0-white-hawk-ard-audio-da7212-dtbs :=3D r8a779g0-white-hawk.dtb r=
8a779g0-white-hawk-ard-audio-da7212.dtbo

Please add

    dtb-$(CONFIG_ARCH_R8A779G0) +=3D r8a779g0-white-hawk-tsn.dtbo

so that the .dtbo is considered for installation, too.

> +r8a779g0-white-hawk-tsn-dtbs :=3D r8a779g0-white-hawk.dtb r8a779g0-white=
-hawk-tsn.dtbo
>  dtb-$(CONFIG_ARCH_R8A779G0) +=3D r8a779g0-white-hawk-ard-audio-da7212.dt=
b
> +dtb-$(CONFIG_ARCH_R8A779G0) +=3D r8a779g0-white-hawk-tsn.dtb

The rest LGTM.

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


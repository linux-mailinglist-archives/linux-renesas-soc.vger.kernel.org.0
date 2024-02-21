Return-Path: <linux-renesas-soc+bounces-3043-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A6885D9D6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Feb 2024 14:23:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1DFF2B25CC3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Feb 2024 13:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E165D7866C;
	Wed, 21 Feb 2024 13:22:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3480763FF;
	Wed, 21 Feb 2024 13:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708521771; cv=none; b=dzeTaMUoZ7FP/4XyThbN5x6yhmdiNIZ3jF9DpBGmoW16QnYCFOYgJ83D/KDg5Y1NxwfVtzBBMpLDxSqJhi5AnybWNNG75UbQyXrZZzezeu4c1xClhERA7vF1JfeMCgl9bbKumytaDd3+IzVk2MYsD14Eazz39V/7HQzsdcashgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708521771; c=relaxed/simple;
	bh=1WBlNT8odHQkxsLlRlt3vxx/AqRWnzohRYDkm2BhJRA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jT8+VPWqAMZYqiPLihEtToxwv+rjCTy8zD3aTbBZv//FEPT3ArvnsZ1YAhdUfdxGnBmLFNdGT92Ba5PAL8OKL+YFGDysH+XonGM6YFi94/jrlr/pS1SJV2QtlxiX3vauQqUTioUnouWUXvMyxRqmPAMIKpntchPGigc5RlBkqLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-60879e3e3ccso5940307b3.3;
        Wed, 21 Feb 2024 05:22:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708521767; x=1709126567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pAM78tj5uOxRuTUGFyc9jO9UNKyv8uwyxAyo2kow3xQ=;
        b=JfzI5+B8VCqyj8PEEGYUEON8fu5abPGC5kv9Oud671VcAMkGAkZ/2ud7QKH3EV5ylU
         U9A2CkngA1hcOWWkMysKKnELGxY95k+KbHMcig/JSVdVeR3/12/ek0IuWdu18TWXiZBP
         8UtyrgA6HHq8Z/dlmxGqdVnxO55axMRrghyuBfafXzvrggsIf40pxzeJ8O3p6xBbPDPI
         3KUds+FXuFQXshH5vbs1bq41AbBurUT+mwlyiyQ0q2kfSeePUlJGXgj9DmYb4K/0asx+
         9Jtt34PIC9PntXqgwW8aDw60LzfbztrN4cY85pRTbhmcYzFuNhaaqAfh4QNEzcEHkz1G
         PVHw==
X-Forwarded-Encrypted: i=1; AJvYcCUOCW3UnSrcXI+e2+b0tq2t+WpP6tsZP+0Vxg/w41BsIZchGkRlZbg+I43L0ry4pGI2uU34v5ssYBLzDqcadIaDW1MS2G/cZdCeuUtoMbMq2qGSTit/LPTUPv3QHw1R+jHQH6qyOYCvS9+ghEdi
X-Gm-Message-State: AOJu0YwrdstrqNHsViXJFfsc5I7+K1kOJssMTO7XD/Cx4eoI5oq9bURw
	VDa4DY/SFtvmVFXYd2aRndmRV4nlm8WJhbvt9KboIgJQ2UbNDhHKdEzd8FYgEy8=
X-Google-Smtp-Source: AGHT+IGvU+Pr3MOlkCRRM0OcYxutuQFgxi7X5z96UjB9561PAZn+ZGeS0GbedM9u4hj9Xs+i4m717A==
X-Received: by 2002:a81:99d5:0:b0:607:be5e:fa27 with SMTP id q204-20020a8199d5000000b00607be5efa27mr19186288ywg.13.1708521767468;
        Wed, 21 Feb 2024 05:22:47 -0800 (PST)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id t62-20020a815f41000000b00604a5103629sm2597355ywb.76.2024.02.21.05.22.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 05:22:47 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6088276045fso5754167b3.2;
        Wed, 21 Feb 2024 05:22:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWcVrclC0bXRRB7EirE6OdQUuT9/hSYGph5ikej+xSe4sLAnWUFxCxzFljLEPLr7Ptd5w37VGg4TYWki/hMSmAsY2GOVOM+AIb9VE5sS0xfUChCbprPOg27mhHWLRatJYxrmUC25KA13egPfLl8
X-Received: by 2002:a81:6dc4:0:b0:608:8f2a:fc35 with SMTP id
 i187-20020a816dc4000000b006088f2afc35mr495032ywc.40.1708521766783; Wed, 21
 Feb 2024 05:22:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240213141300.159847-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240213141300.159847-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 21 Feb 2024 14:22:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUoYBP4mjvJnLD5XBNEW_pjkSzp1M-QHBb6dx3RYhckUg@mail.gmail.com>
Message-ID: <CAMuHMdUoYBP4mjvJnLD5XBNEW_pjkSzp1M-QHBb6dx3RYhckUg@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: renesas: rzg2ul-smarc: Enable CRU, CSI support
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 13, 2024 at 3:13=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Enable CRU, CSI on RZ/G2UL SMARC EVK and tie the CSI to the OV5645 sensor
> using Device Tree overlay.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> Note:
>  * This patch has a functional dependecy [1]
>    [1] https://lore.kernel.org/all/20240213140240.159057-1-biju.das.jz@bp=
.renesas.com/
> v2->v3:
>  * Added missing r9a07g043u11-smarc-cru-csi-ov5645.dtbo entry in Makefile=
.
>  * Made this as separate patch as SoC dtsi is accepted and dropping the
>    i2c workaround patch for ov5645.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.9.

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


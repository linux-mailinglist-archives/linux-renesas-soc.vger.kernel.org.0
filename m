Return-Path: <linux-renesas-soc+bounces-4894-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6648B0DE9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Apr 2024 17:19:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3ADC1B2A151
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Apr 2024 15:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDD2C15F3F8;
	Wed, 24 Apr 2024 15:19:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C7F1422AF;
	Wed, 24 Apr 2024 15:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713971962; cv=none; b=aa2RS73haIixOAQFFi8LjyAmlU0ajcc+Mw/I1z8VB08HNHN/HkfN9gJiPRk1Dyik/X90b27xI3Vz1Zs7reEKsnbfEJv/8mZmKDkCHGf34m94V5WUD8v3WmcVdDrC/Bys9TH/oN+OV3+SM9QOj+Fm965g4Qc1NOPqdaJ+tflqc90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713971962; c=relaxed/simple;
	bh=2oZpNai29bx+8QMO4yPKW1gMex7Fhk0AdKCBLjoF1e0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HeO43eewj2tlY7h6TCXcvrhaJEoLBQWfztvaUGcNOrnlYS21bRjd//WslsrOitHc4pz79K8VzYhnx87u5lB0dyEoJcpbLuAYVoxFvEgYDMpg1wWVuAc0YqQhe/qHhJ0dkg9K+nQ32w6bul/YfWJCg5TedTu+h7PgThLATGhgpzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-61b3be24dd9so320327b3.0;
        Wed, 24 Apr 2024 08:19:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713971958; x=1714576758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wyh1Hyvn/TLoCfInGqJPghsQQIhHw5jYpI5zNaU/bd8=;
        b=oAXIHs+9L6rBIfm04TP35/c0UMd/vGwT4W74/Z6ucNinQjd0Smzog/XHWkY2lbQg6S
         1TlySQOp8Z7iYBKQ0jfmPQwIzAuOnKJlgVBJqxqa4KGtdq6ddeved6AZHShvyofQF9z2
         bsblG/I/z/56K+gCwXwpmUQ3D37+sb96VnDGZS5HlVoEt64ZUtuFPBoEoWF/uo6yablk
         DMfvPtMd4EoKm705stVlQB5G1Jyx+s6SIPyzcnuRLgkOEa/fdoBPdmrfXh5JIXvulMrb
         fSG/fBi0dnDnDukuR71umurIsDPSFVJHa+fvumjSmE39Sc5Xpz6uIFmICxCWr5JayuJa
         kyfw==
X-Forwarded-Encrypted: i=1; AJvYcCUOW4aoyIvV9u4dX5H0z/k2dad0oQelZLOFCPNQKsClhYLitG9PhecwyYHLNE+p23WCw9+PL6ImcObAXCUabquu0svcbo1xyPiytSAg3+5INEyjV/bELk4yzJElI+uZkl/VTFud1D7OBrEH+t+Q
X-Gm-Message-State: AOJu0Yx5AzwH+ug+MdRckHX3+foeS4KxbmT2ltjHbo3MCH9ZnkJP+zOo
	8Hp5zQj3E+m4ahHf3237vUqXiCrbjKbjAwqBrCmpvENtQjNe+GU3FLMpp/qwv2k=
X-Google-Smtp-Source: AGHT+IGGTaGZ7dRMC2igad0HxOcOjm/lepZpHacHMN5S7oHfIh8c9zAlGDsJpymM7PyeBRf833/38A==
X-Received: by 2002:a0d:d0c2:0:b0:618:498f:9dbe with SMTP id s185-20020a0dd0c2000000b00618498f9dbemr5259462ywd.10.1713971958269;
        Wed, 24 Apr 2024 08:19:18 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id g125-20020a0ddd83000000b0061b06ae1d09sm3045155ywe.29.2024.04.24.08.19.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Apr 2024 08:19:18 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dc25e12cc63so985815276.0;
        Wed, 24 Apr 2024 08:19:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWTnUFnrHfEX38mSLRrYiilveyQHqO8VqQI+5TTh0+Es9bblAerQ/V6cgt47+QJ3CEgk2nj0VRe5FP1ebER+9vV9cYG7BwyIjmDnAU09lMshGH39lJmlH4Xwots0P1Ttkr9aVZ+yNBwycJ4PgwF
X-Received: by 2002:a25:8485:0:b0:dc6:16b7:7d6f with SMTP id
 v5-20020a258485000000b00dc616b77d6fmr2278810ybk.10.1713971957755; Wed, 24 Apr
 2024 08:19:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240413141806.300989-1-niklas.soderlund+renesas@ragnatech.se> <20240413141806.300989-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240413141806.300989-3-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Apr 2024 17:19:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUm=V14y_hbKh6jwGtPHxH3ANc2tdFvzV3CsaQgUuLVNw@mail.gmail.com>
Message-ID: <CAMuHMdUm=V14y_hbKh6jwGtPHxH3ANc2tdFvzV3CsaQgUuLVNw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: renesas: white-hawk: ethernet:
 Describe AVB1 and AVB2
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 13, 2024 at 4:19=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Describe the two Marvell 88Q2110/QFN40 PHYs available on the R-Car V4H
> White Hawk RAVB/Ethernet(1000Base-T1) sub-board. The two PHYs are wired
> up on the board by default, there is no need to move any resistors which
> are needed to access other PHYs available on this sub-board.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
> * Changes since v2
> - Fix spelling in commit message.
> - Add pinconf for link pin for both AVBs.
> - Rename the phy node to make it clear which AVB it relates too.
> - Add aliases for ethernet1 and ethernet2 so U-Boot can set MAC
>   addresses.
> - Rebase to reflect updated of filename for white-hawk-ethernet.dtsi.

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


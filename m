Return-Path: <linux-renesas-soc+bounces-5092-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B338BAD79
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 May 2024 15:19:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B477E1C21E05
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 May 2024 13:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69DFF154C14;
	Fri,  3 May 2024 13:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bx6WWJ8q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF76154BEB
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 May 2024 13:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714742133; cv=none; b=MLtlkxJ/6ODSUfmWEe5wh7inkUGwZA120FMSrQfSN5dZ69EQ3BUsZH+DXGbnIoJ+jhonuNaQWcFSVzlfkYWeJ1LZDCVHTvA66Ct0UsmSnaC3cHAQ69//fH+tZoqWPczMeEZZCM0DRa/ZJ3kd/xf1Yi8cosKOGZjk64j9goHWNf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714742133; c=relaxed/simple;
	bh=nJ+FiEP00RrtPRa8uswJfiMy2zzb9NIscqnw+JbmrlE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u/DzG2vj8vRNa2DsL2jWSk57TmjpJ4ym/qplLH7dk4XUADQo9lageTUuAfu9WC24R4d9pAYAKXOkjBV7Pwbhel9PuN/RBhKOXbfHRc4sw9wwJPUdqjgH+yMwvMhoMGjq2pAOxigDZctBnjutjcIhp7MsIiWFhCaaS1FTxdmP3cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bx6WWJ8q; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-de54b28c3b7so9780120276.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 May 2024 06:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714742131; x=1715346931; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Bz627HBjMOmmynWa0zBG+92oc4pA2ou1WBH5AOlZFK8=;
        b=Bx6WWJ8qiPazUlp8r1gkkyCLZa9f5OkTzjOIqttSst6zQZrPv50T1KhDTmnL8MNTQr
         cgPm/gkLVU5/KH3DqDXag8VGgXHWxjYPRyIEYvXv7t045Uv0zHnmVSNHclJHIe9PP7Kn
         kmblALCI+aFYUXuGROLqsNJ1qk5jSjGS91V/FXY6Ab1JqQ5YAPgHKR842sgZmI7paRxx
         IqrGolnbzOeLUF9hXvCLG0Mz4FXLe3BfePUWziJSq2KPgizc5MpEilaiX1eRot1jdBom
         XNQJTWFVOxNSMM5e8dLStGvi80mntT2tDUCsq1I51h//Y0v0hzdA2yW2jpe+P6ZHwKeU
         5QKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714742131; x=1715346931;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bz627HBjMOmmynWa0zBG+92oc4pA2ou1WBH5AOlZFK8=;
        b=f0bycHQcUazcUZNy7nr/0SsGyM3zfK9Kyr5XR0EQo73+uO2yZIiKLqmmPmdKlX4TWB
         tI2POBCwc2dkGhnTX+/cXGE34ovDKL6wl8KL4+VetBIY31ZFunLQ+0qZO14n7WYJ4s80
         2GeK67Jy2SDanb8nmLcWZtCCn5KL2SGYn16LiId1X9fcnKldlnsIyARJ4Qspb17n88bi
         Sv4kAR1cHhNpsuNFh/uI2brQq6/YhiBFZ6Up7m9sp97nmSIzdYLkuqUKFVFT7DvHAQzg
         gwTH8tg19cfQticFnoEE1V/fK4zhIjF8EBIFa2RMjMiLiGa6yN7X8Vypoe/afvTA85Dz
         XCsA==
X-Forwarded-Encrypted: i=1; AJvYcCUhlJNE2EIS+hJka0ecioMNDSZXzijc/R4ai7X4+TmYHeL6BuBJN+FuKQB7pwZkKlNig9Y0KSYlb+8eHNab3TcnOflDHA/QrbF3vRq6sFHcSkg=
X-Gm-Message-State: AOJu0YylZUojWGIC+zywdrWc6r0a2tGKXNeqX54mKkU8PiauVg1irwMz
	5d6ip4xhLWpLgFDqM3e4KaqW5/CEN+FKHdJ1uoeXP9hEibwSj1ETdXnNLCdnkd0mMdOi6/WyhTS
	TJ7FPPI48/epC/auOE7ymNN8WlJUKoMFWfvOwEg==
X-Google-Smtp-Source: AGHT+IGffsIdpZF6BPv9Of+hyi7vyRpyRz79bbW9RmMLTofCsWiZmPRZRs0kpQ7Tcy7txTp5OlV1qfabQJWeVMOx5Es=
X-Received: by 2002:a25:abc3:0:b0:dcf:3ef5:4d30 with SMTP id
 v61-20020a25abc3000000b00dcf3ef54d30mr2869989ybi.17.1714742130823; Fri, 03
 May 2024 06:15:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240430145937.133643-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240430145937.133643-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 3 May 2024 15:14:55 +0200
Message-ID: <CAPDyKFpRjoVdyXh275YR3f4oOFR7MY49_JNzZ2nvrmSMYokRkA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Update compat strings for SD/MMC nodes on RZ/{G2L
 (family), G3S, V2M} SoCs
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 30 Apr 2024 at 17:00, Prabhakar <prabhakar.csengg@gmail.com> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Hi All,
>
> - RZ/G2UL and RZ/Five ("r9a07g043")
> - RZ/G2L(C) ("r9a07g044")
> - RZ/V2L ("r9a07g054")
> - RZ/G3S ("r9a08g045")
> - RZ/V2M ("r9a09g011")
>
> The SD/MMC Interface in the above listed SoCs is not identical to that of
> R-Car Gen3. These SoCs have HS400 disabled and use fixed address mode.
> Therefore, we need to apply fixed_addr_mode and hs400_disabled quirks.
> 'renesas,rzg2l-sdhi' is introduced as a generic compatible string for the
> above SoCs where fixed_addr_mode and hs400_disabled quirks will be applied.
>
> v2->v3
> - Dropped items keyword
> - Sorted strings alphabetically
> - Collected Ack and RB tags
>
> v1->v2
> - Updated commit messages for patch #1 and #2
> - Dropped SoC DTSI changes as its a hard dependency
> - Grouped single const value items into an enum list.
> - For backward compatibility retained RZ/V2M compat string
>
> v1: https://patchwork.kernel.org/project/linux-renesas-soc/cover/20240422213006.505576-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
>
> Cheers,
> Prabhakar
>
> Lad Prabhakar (3):
>   dt-bindings: mmc: renesas,sdhi: Group single const value items into an
>     enum list
>   dt-bindings: mmc: renesas,sdhi: Document RZ/G2L family compatibility
>   mmc: renesas_sdhi: Add compatible string for RZ/G2L family, RZ/G3S,
>     and RZ/V2M SoCs
>
>  .../devicetree/bindings/mmc/renesas,sdhi.yaml | 39 ++++++++-----------
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c |  9 +++--
>  2 files changed, 21 insertions(+), 27 deletions(-)
>
> --
> 2.34.1
>

The series applied for next, thanks!

Kind regards
Uffe


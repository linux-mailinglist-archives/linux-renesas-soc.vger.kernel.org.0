Return-Path: <linux-renesas-soc+bounces-12226-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B25AAA154A2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jan 2025 17:46:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 215203A87E7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jan 2025 16:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E8A7166F29;
	Fri, 17 Jan 2025 16:46:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5467E335BA;
	Fri, 17 Jan 2025 16:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737132365; cv=none; b=EwDepHMCmA/rJlC855CdN59KKW4kr2cnMFZrq5wMZpNWfSBChHpuC5cYIcj5D2+u+9zaj4GQH+Uq0rJj8aOV+OXgLKV0yz6jQXT1iXuXuWV/TCSG935YhkpYMFPNGUBEKMuZI/UdN+usZxwiBMXbUQ5WMpbUf7gT8hiaSPQpqMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737132365; c=relaxed/simple;
	bh=Su5m/l7i6gaUihyhQhMeAuQAX7y6CUy99DcHUrILF5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aRh9VOV1Zo5/RErvqeI4Dw3AfU2aoqkFJfUBPG46Cluu6EOGvKjoafLa72qSLcS4SM7KLeYYyVdbl+gc9SlZA4P8rwNmiFu/NtzjBzdvvOHDm17NIFNOYCxv2Mls/2u8lRBy2wajuWj4iyC+wa5FPNX3EokYfuWOARSuFSJlu/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5160f80e652so563148e0c.2;
        Fri, 17 Jan 2025 08:46:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737132361; x=1737737161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4BHGMqkE9ZogSLayFXi3wvjG9oasVwfvpk14pioLqEs=;
        b=KHZL/m+PkUQwTiarjst2cxtgRG5E0pPvrZQsi5atG7xXNub5QP50xllceIUwqRG85D
         8uCyZyFAcaOuy6AYccirduIRo9GMeBXxSm9nW3JPYE9rPzAWVPB1EDOhwm+w20WsWvde
         9e4Pnkwkc9wZcfBbJf73p2FskTMW7ebdiSneHJHot+uOHf5eHZ3C4lR/gGsxkD+m8B5w
         AtZCVksMskPfr0w7KRSmODkEL66KjanzCGkyf/LdEVAAbic9sf7yhn/BNd/L2r1FcBRp
         fNtYLydEOOAa6XZkrz8jCd8p8qChCHH2izkK4md+Owi+hcfAFCSmpdxotvRJrOiCZ8u+
         rTRA==
X-Forwarded-Encrypted: i=1; AJvYcCUBzyJzcF0UeyBk3EZbNCaqIBKuOwYu+JWzBv6la7KFop/TKWnUxoDEMSAMZIvZRrYQzShPVxJ7eyER@vger.kernel.org
X-Gm-Message-State: AOJu0YzPGTUc70HyeN7u8L+z2o9TzSYldUg8YEhtH1gh+kIEY8VcD2zD
	gLTcHP3nAzq49NOv+ck7crBBH2k4KVtj3f3kF4RT+lLoKOjnlQwB2qjan9wY
X-Gm-Gg: ASbGnctnZMu8Te1pMUqeDqDS7mqwG04FA7d+z9y/RGpMKFFQ+eLcKk1gAdxvUWwZAH2
	WH1yrKMyQgWNp4Ea6f9Gaz+P5MtpdE5UtoOE62V62Sb2bV832Raf5USNCKytwrLSpl9+Tpj09c9
	HDU9hQZQU/HB8VUxfxToL4lP0TKclXUxOGiZTV+DVpXJL3860JqxwNE5VQPjOSMSqgQwzbmCoQ3
	XMNF24cbcxeC/B5IpWej3h+QdN0fYg9y2PkG1kdDrd/MxowbU8siKXGzrsslfeqmX6mvv2UP8Hq
	LYss3Rxct4gP7M60IQU=
X-Google-Smtp-Source: AGHT+IEk5cWteJVfqUGd7Lgq8MVpWZepRCQ/zy4BbaJ/4tJU9DbUkWbrEzAWBqbHLv/bRpEDdGsYlw==
X-Received: by 2002:a05:6122:338b:b0:516:230b:eec with SMTP id 71dfb90a1353d-51d5b265b25mr3345434e0c.5.1737132361390;
        Fri, 17 Jan 2025 08:46:01 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51cf559edc4sm412880e0c.15.2025.01.17.08.46.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2025 08:46:01 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4aff5b3845eso709436137.2;
        Fri, 17 Jan 2025 08:46:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVMKdlaz8EW2bi73kPmMpwNSIkxVUKhpuxw0L/7TpG6eP1WJK8r/8rilSsnrwfYPr9hR7MECx4OqX3P@vger.kernel.org
X-Received: by 2002:a05:6102:3a11:b0:4b1:2894:1048 with SMTP id
 ada2fe7eead31-4b690be9187mr3111882137.10.1737132361027; Fri, 17 Jan 2025
 08:46:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250115181050.3728275-1-niklas.soderlund+renesas@ragnatech.se> <20250115181050.3728275-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20250115181050.3728275-2-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Jan 2025 17:45:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXUTSr=TSWSgFpiJcR_KqVDTgJ2vKCqrT_emDF8FjXCaQ@mail.gmail.com>
X-Gm-Features: AbW1kvZKBUCl1pdI1ZIQmzzqtPrWDDCgRAS9_99FFCj82WtKPRcOc6iBJazon-s
Message-ID: <CAMuHMdXUTSr=TSWSgFpiJcR_KqVDTgJ2vKCqrT_emDF8FjXCaQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a779h0: Add FCPVX instance
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 7:11=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add device node for the FCPVX instance on R-Car V4M.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.15.

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


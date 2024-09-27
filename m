Return-Path: <linux-renesas-soc+bounces-9113-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCE4988298
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Sep 2024 12:35:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0CC331C20B49
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Sep 2024 10:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00B9E185956;
	Fri, 27 Sep 2024 10:35:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C9713698F;
	Fri, 27 Sep 2024 10:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727433316; cv=none; b=SkD7by1wccLSboG2w7E+NPBeGUlqEZxXF6RijFu28Au/aSfY+C6u3duyPpywUy+gvJPcVDD42f81qlm9gFtfosCBtg0aPPuQ4BDYPWUasiEe8jUjJjDAvnsANIvJ45YPo8fJK7Db7rJnC419woJj73m5Nv1VSSAZHLRWEXBNnj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727433316; c=relaxed/simple;
	bh=z5AHZOn/5ez2244Y/JjvjSFGv5bDEYQ1fyP7wK7y9J0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LudFqLRVbf8/jOc2Bdi2Ug7TL5DlIZhUM8GHCyRgyybvrJw6ZNeLQ8lCR2kqe/LvcoEqkiuQObXYudsYxVSHHQFCWjgSlw0AxYsm1SHHYq8nC3Y+jEYkU/aDMyrcSwYEI8uv5exE/3scspe7XZocQVg4nqYodpNTxKjNYTWiA/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6ddceaaa9ddso18102287b3.1;
        Fri, 27 Sep 2024 03:35:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727433313; x=1728038113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zLa2DWSlv9BlCBlVX+SqNSJZx3AQFG0PJfJgWZIv3SE=;
        b=o8UGEjJLX0Vl7vsIE/XgRZ1wdkVd69TjurxcLukvzn8QwvmNKOwtdLh1U4a13vxDVj
         quStYuJhUPNYZOnOGSqZk54iY4Gz0GlVjNt1AkHeLuDg1ibsRG+Oj58z1QyfqEsckWhj
         20JTt+hNZO7Rc0J3tncRZaMHLFpp8d+gzHMRDK9s08acrnZjTnpJ1KstRjK3ZmMS4rmf
         C9J3JV469sVblV5FOyXdtoEWF9DE0YL3BOg5ycLnCUqjPtRr19lWViEd2mzOxYBgQNRd
         cck4mPjQplrQ+mm+VjBsZpPYSh1t8+XgjEISKjI9mdGdB67iFDtmebnV0LDF4DuHZ8jT
         E88g==
X-Forwarded-Encrypted: i=1; AJvYcCU9m8xtApdulhGoS7dEgNAvIaI54SBSR/MLh9mwpZPzvXggH9yjE7pidRubEv9Xe/WCIVxpi5rq75RkrqUF@vger.kernel.org, AJvYcCVcEejWygoMXm0Jc6zgyC8mvAccgdbWT+6fcaCxEOX6nph4b1wpyuJMCfUTauAzIaMQ0V8jQiIEWbpK4m9fcaVmpys=@vger.kernel.org, AJvYcCWCwlH/AOyd2pSKdqG2IbwQLqEFH/CCfFtAHKVY0qPT2tjvfmgPGqbpAxNmx2BCiJeSh0wj6enBfJpJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyT6NACXI0oxGko5nJWjI6cnrCp3krgLg1ha73NvU8qR4VuRSgl
	eIExKSmTL12SHKSP74dMZKoluhXd+ueZ78OpMzsVZ+hPSXmKDY4WGteEGQBL
X-Google-Smtp-Source: AGHT+IF08ZFt1ujmcm/iFwufBdDEYmFCyJcAtdrA34ScVZsqqLmsJyz+ftPwDZKpf47Sr/MkVfb0DQ==
X-Received: by 2002:a05:690c:6612:b0:6de:351:3e with SMTP id 00721157ae682-6e2474e8325mr21847537b3.8.1727433313376;
        Fri, 27 Sep 2024 03:35:13 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e245316dd1sm2651157b3.59.2024.09.27.03.35.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Sep 2024 03:35:12 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e02c4983bfaso1952288276.2;
        Fri, 27 Sep 2024 03:35:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVUlX5z7C+guRgWiqvy17yLMHK/5727yA8P9hP9va/z/AMYtUvdpeb+2FeZchj9rLb/tgCL6/Hhlr5g@vger.kernel.org, AJvYcCWk/nlmGVqRU57BGAbrL3hhOgOkFHAk9zzB0huxVNyn2vw2NCKuicAokypBOt2YxIT1pUYewi+pf5SJA3PBIUavIWw=@vger.kernel.org, AJvYcCXBnQuGhhR7z4joPWFx//WenCXJjnCRHg0zWZpiU7z9G0zxxIbVxN5GWj9BoPs+nWohoShzy3xGNIBfFIle@vger.kernel.org
X-Received: by 2002:a05:690c:3385:b0:6d0:f91e:2ff0 with SMTP id
 00721157ae682-6e24751f3ecmr21726067b3.11.1727433311811; Fri, 27 Sep 2024
 03:35:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240926180903.479895-1-sean.anderson@linux.dev> <20240926180903.479895-3-sean.anderson@linux.dev>
In-Reply-To: <20240926180903.479895-3-sean.anderson@linux.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Sep 2024 12:34:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVB74QEko-bNbLvdWF05eAYQhpRS1u2PV9b8MrSxQyPjg@mail.gmail.com>
Message-ID: <CAMuHMdVB74QEko-bNbLvdWF05eAYQhpRS1u2PV9b8MrSxQyPjg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: ulcb: Add SD/OE pin properties
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sean,

On Thu, Sep 26, 2024 at 8:09=E2=80=AFPM Sean Anderson <sean.anderson@linux.=
dev> wrote:
> Add SD/OE pin properties to the devicetree so that Linux can configure
> the pin without relying on the OTP. This configuration is based on
> inspection of the schematic (which shows the SD/OE pin permanently tied
> high).
>
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

There is no change in the output of

    grep 10: /sys/kernel/debug/regmap/*-006a/registers

before/after this patch, so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

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


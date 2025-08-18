Return-Path: <linux-renesas-soc+bounces-20626-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D0EB2A6CA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 15:47:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9CFE8B61B2B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 13:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98C6A321F59;
	Mon, 18 Aug 2025 13:40:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A733321F3B;
	Mon, 18 Aug 2025 13:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755524418; cv=none; b=eIRg5sVik4OEIONJr09yAN+bGEiZ73WeTV/KJoDy9y2RY4yW+4Qu8ywOAFhffWYM8589/UItQx/81/7/TT4xDgahuJlIjTzHuINp2sFS2OLdjkmVLAwprhnxsr32jf0+jQuTNRuuuAQ4jVSCPak2Ss2XkZ9dgTeS1K3q5cv8pVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755524418; c=relaxed/simple;
	bh=iAHOkKymrp/ehnPNVfK42jRxqmQyaLiHb46476+MdJQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lfmKA7dz0NMVEQVM3kl8rfB6i7FCVTOEq78qEd3VOohXH6FkGdFTgCy7FlRuMpgUY5WbnllM1AtRm7PDi9Ye9HshRMlPHMsJdLhN05pLwZxz0Nzgi4PxNLdgOfaiGzjHSzlEo5hsCF2r/422HDh7juZAIX4ISGMKIGs5fDu/SHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-53b1757a920so1186473e0c.3;
        Mon, 18 Aug 2025 06:40:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755524416; x=1756129216;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=je6ftAr4T+JCHmRp6HProSINYJREHcCMdtga7G1D2zk=;
        b=O46yTRMdenMrfwFfN8TXDLlTazeUNagXExa3SSCRSUFbnJWpWPGLa0RobcZioPIhu+
         VJoLg5/8lOU7za7CNVv33jTblfLtX2XmhRtcsgEivVaFZhmpCVbzBYvSYeGKEGBPXFTM
         xQHsLUmnFb8iyGHzIGhh6FcWWFmDxln031Zf1YUzkQnYAq5zpVSuu7p8gYdQLgokrUjJ
         PzjIWRk5x4ZJgtXdWaVFPAH0LH7BUt+3rqx6KN24WiH91geWyo64tXzmZlqT8G/2487g
         Ni3Zme99BP355mR+ZmSfVOT34hI5zPPhCUuSds8bESUnQnhkzUFlZUG8Bmk5/9s2zjFt
         nr1A==
X-Forwarded-Encrypted: i=1; AJvYcCUd18tRfOBBTmBhxo446Spk07i/tedg8ErIRIkLhMvRyLvUz7Sxy5aVoJjktdO2oLGlbiGpXzd/6skPmcbs4nM49/A=@vger.kernel.org, AJvYcCVlRgu6Qjflpn7JQfruH06uAa2yv/pGuwvM4xHCusC9hRgP4zaq7j1l5/RyDL1RmuXDYB4V3o/SxfUO0UPo@vger.kernel.org, AJvYcCW92r7Y2174tWnW8CPNUbtOqaG16/tR+TTKh30/nAxCbJLuTal7Yot7sFzJb4PyxJyRDzpMZYrOy1a3@vger.kernel.org
X-Gm-Message-State: AOJu0YwMqejlQCcSevsAYbiMOlPsMEuhGI+xNmmh13SWF6BAlzGwY+W+
	ep6BQBiynM/FyqJdNtHYOq5q5SRSUVciIHLtprT74yvPMXFaZIU+3JJq+l34Knt0
X-Gm-Gg: ASbGncstft/Ultdca22VhzBha9EAGnlNWgxfVmpH9hEhBUDUkyRLWWSVL73s0Gn7qQQ
	+MUICePUB95njnild2WKdxOFHK9JWz+Vgnr/tBbAjk1fZxYPbvpQ8LIte/2ELBpca9U5T7Os6et
	uAQQC5IVBdIrssGpCMLbfMD1PkUnv2i43W/bnS+Nz2tsVRFpgBDWtR+s3ogmQKYh7PhBDQcLLJW
	XZWez0GaPjN437YMkkeWf2THP5vWhV9T9ubSTtLn4DRlpzIAOLcXYb9zXd5J2yOCQysTrUI/uKs
	QI8wGE/k2iHDS8OCSl2sAXW+SqF3IM+0WyA8g4KAP1SSK201tteVm06KoOejUI2ut2JIC9JQ95C
	SnY2SKLIonvmN3Sd+O9+70GSVptsiVizLC3xwQIWM9WMyAP7bjmhMdwwV7zWFp9/mWlNQ88s=
X-Google-Smtp-Source: AGHT+IFE9B/1glrRoLFwI+WNFkx1vFNmdmu9OOI4MzOtUJidllenhd8Loxp1SUZF6rv1mOeJ9Led9Q==
X-Received: by 2002:a67:e718:0:b0:4c3:3eb:e84d with SMTP id ada2fe7eead31-5126d30f12amr4059965137.21.1755524415768;
        Mon, 18 Aug 2025 06:40:15 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5127f2269e4sm1993323137.10.2025.08.18.06.40.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 06:40:15 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-50f8bd52e8bso1412266137.3;
        Mon, 18 Aug 2025 06:40:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUhDglpRsKWvN1QVOpg9dPKUfXdIh54ZynQGHsa4pS6NqvnT8ONY4+jOdN4YFjgA1eE2sDK6zMQB4WFug9g@vger.kernel.org, AJvYcCWviIMSvg8iLMdFi1hbjIebUkLyNP8MEIey5OU/ucZskm8JDZouGgtQQG/KljvRDR3oqVa488/OX6af2RdhQIZRAOY=@vger.kernel.org, AJvYcCX313dhGk53BWCY0K9j4bNEyHPdj+zosZHYq9llBGPVQ5HRvaS0EHibnCFm7hCg26HJhLnFWoUMaKsc@vger.kernel.org
X-Received: by 2002:a05:6102:3713:b0:4e9:92d3:d20 with SMTP id
 ada2fe7eead31-5126ab29791mr3508863137.4.1755524415310; Mon, 18 Aug 2025
 06:40:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812200344.3253781-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250812200344.3253781-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250812200344.3253781-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Aug 2025 15:40:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWehCkbj92g0TQKjq9eX4UkCd+QnP68Dz=kx7rq9yWM2Q@mail.gmail.com>
X-Gm-Features: Ac12FXzarAXSgzanvSebTpzvDiiiNV7Fzfxx4K8pbsvYWauvEoB5TuqLcU1LoOQ
Message-ID: <CAMuHMdWehCkbj92g0TQKjq9eX4UkCd+QnP68Dz=kx7rq9yWM2Q@mail.gmail.com>
Subject: Re: [PATCH 08/13] arm64: dts: renesas: r9a09g077m44-rzt2h-evk: Enable
 I2C0 and I2C1 support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Aug 2025 at 22:03, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable I2C0 and I2C1 on the RZ/T2H evaluation board.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


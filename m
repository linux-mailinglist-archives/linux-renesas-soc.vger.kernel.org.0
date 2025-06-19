Return-Path: <linux-renesas-soc+bounces-18535-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C71A3AE05D4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 14:31:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48B454A4E2C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 12:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E209623E33D;
	Thu, 19 Jun 2025 12:28:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D190623B627;
	Thu, 19 Jun 2025 12:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750336130; cv=none; b=cLtleqlLGaau3aKhAIqA96vrSAnHAcPPJ9AC5BRW6z2l+1noLb7aK18t0CDKlhtCVFqjiFlRKcYnAGSp3c4u8VCamsh8pXsIHL+ul2SsNxRmo73D+GQEYU6K9RaJ3qTs3+lRMx0lvgTBUeJADXY5kPnZL60x775VUU7srTVVlLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750336130; c=relaxed/simple;
	bh=4bW674pfC7bs8dldvM0Hic3wFQnfBcgS3yLOQJJbm+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E4HKnCDCW33POfuufZcR27QEBvht2pLldWSCahzTUynN0UFPRyQvGJpwWDzbTCgOt3Kl7HScVLybgV9pE49Tlmi6QaaIQyiL+Y/P8v5EWgM65fMM/UgRzIrwI86jyGem1TYEQJl3JP8hVnAZfDMgWRtsWRtfTpWNqsbHk4Dta0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5315ebfda19so256250e0c.1;
        Thu, 19 Jun 2025 05:28:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750336127; x=1750940927;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z9KqxynSkhQNk5Ajxj7HbKnlzRSGeB7hI86xplRL1UM=;
        b=xSb2tUj/Lw5Abza4W0pxxUhUL4spauPDCPlyEG3obz/lHuFxi2kIh3dn1dlCfZ+mPp
         6A8tH5Qr6xa6jOBPoe2Mn5qQIV+Ltc4bOCeyoNRBfS25wJtJq2Row7HFXizE4yTWnqrJ
         YdvBMNGHe/0ospPYVpNFLJWz7ILvVkHWVt2YiE0CpPJIoTfYVFS/WCghgbUR2snXZbiE
         2hfwc0pOY6hqfYsHNuaIVPgnO5vK1cAuw1LOaiyEaxX8I/LEoj2Er6ln5jhM5OS117ci
         EkFFs5K3A4JHgNEmi5+2QP1cxx/J4uQ2Keb02y5ThpOfQn5S5P/NlDd/RJbF3Rj4/7wm
         Td/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWb8EhTnlvzJYY8KpPn5zy3cE+pg7v5VpQLGp1uqL7SLTa4BN3r0/S+b67j5fh63z73OYfc8+qI4bEkBjUbJG566LI=@vger.kernel.org, AJvYcCXEMSE/q93t9h/vzJsoAx9oGe6lwdqgis0nTxSI/KhcrHNeR20JEiq9rLgy0XpB9vDFfr4+ViIBfGhK@vger.kernel.org, AJvYcCXdYCHYda80CDinBCiWRbHBpiYjln5MVCMCbP23/g9xvjp65/uHAmu/tIxJdMCFfOWhP6wEHqpmzjqTqekg@vger.kernel.org
X-Gm-Message-State: AOJu0YwmWIG6iTKgun62fNH2jCR5uWVI923u0ARsNrkVRFxDaPjNuzOq
	jxwvCKdXu86XEg8cBtMo89WVlfFMtyw0pFfcsGH6wMDHhS+5vMu4ipehonB2Nf8M
X-Gm-Gg: ASbGncvX0pZCGqoKIT0stD1qMZ/I93gBwCX12EM8vNO0NcjCQz3ikyWbwCeHoc77Gw/
	5p+l+tz4tIJWWw3kvHdzOXd9QnPAb+cbjMKcwE8cNldbtlMIdOTgSG0kxXeK6+QXomsPz4SUk4I
	J7OUiChh8IHmiRHTWbh56iuWove03GKN3S1oWrK0HyBcs+ldiNZGjoNLQvaeC6iFwfPriIGOR3l
	j69a456bF9MFitQr+BNDxgMChpF88nZnkQJfZObqoW84TLlSHsxQJLihAamBccKEc2ko9eI/Zvl
	XhzmrpmNdfrVmEcGkaN+F/eGfVbiKFiWJuckRsklPACeKylvhG+5zaVsdpumhPAQjhleOFO8yLE
	OXQeUwXN+bE0vunIakWucaoo98H71QTnPbzMYEiE=
X-Google-Smtp-Source: AGHT+IGx8k3nfavDsoWNmKZRXluJCsYYc+fdwa0aziH8qtN0kmE/8rylSR+/WN9xX9gEfqPKDqglzw==
X-Received: by 2002:a05:6122:91e:b0:531:2d3a:32aa with SMTP id 71dfb90a1353d-531493eb7d5mr13489184e0c.0.1750336127238;
        Thu, 19 Jun 2025 05:28:47 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5313dd849fdsm2398314e0c.3.2025.06.19.05.28.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 05:28:47 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-531a1fad7faso184456e0c.2;
        Thu, 19 Jun 2025 05:28:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWVFAoF8S6brFDP3YB3ZrP7ZvmJexWdGrWhvqDtg8yVlTBFETwYqdXY9YXqCVzGKlfpNwE+3ZUxAnVki9rE@vger.kernel.org, AJvYcCXha2fwUF332A0og6oKyLZaSBO/X0egJmHWoTQ2JWAQh+Xzrlue78y0InYhbkXvXIJ538eDzr0JqqagasszEjaTk+c=@vger.kernel.org, AJvYcCXzvaZX4BtkD9ac3VlfJY43S1aFYYlf8OowAV3HV/6EO8ujA/92p1PzOz1R/bFpM6ZY2rchJ04QJd5N@vger.kernel.org
X-Received: by 2002:a05:6122:3208:b0:531:394a:23f3 with SMTP id
 71dfb90a1353d-53149d80aadmr14846344e0c.10.1750336126701; Thu, 19 Jun 2025
 05:28:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613135614.154100-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250613135614.154100-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250613135614.154100-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Jun 2025 14:28:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWGjH9vBy7A9OzCMSsAvQ0PCr30BE8rwOoeOcwWokfjGA@mail.gmail.com>
X-Gm-Features: Ac12FXz6gOogY53aCzPg30ihF40YYPIdOFf3WNQ66idS_HlyDDWQlgy2eefQecY
Message-ID: <CAMuHMdWGjH9vBy7A9OzCMSsAvQ0PCr30BE8rwOoeOcwWokfjGA@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r9a09g077: Add missing
 hypervisor virtual timer IRQ
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Jun 2025 at 17:15, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add the missing fifth interrupt to the device node that represents the
> ARM architected timer.  While at it, add an interrupt-names property for
> clarity.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

JFTR
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


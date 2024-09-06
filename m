Return-Path: <linux-renesas-soc+bounces-8794-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C5796EC09
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 09:34:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE7411F23828
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 07:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33C1D14A4F9;
	Fri,  6 Sep 2024 07:34:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E4217C9B;
	Fri,  6 Sep 2024 07:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725608077; cv=none; b=eokZ38nXVntZVzQzGPqTxQCB4ZhILzBNFB1eIulIfag/Yl68qFs5s+9a5Di5UkENdVAMqj+2ebhqrBwMefRzDHbXNKC1ZbGGsyv4y+EyaMTOZ8E0EXmE3Ry6uMOIufnkCARozu0cyJ6VPH2v1l67QyDE6no1uhTUciTr9BQ24c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725608077; c=relaxed/simple;
	bh=eeVzETaP9T5RwN0n/X9P3/bS1TMJXFOsU2KTkWDq7eg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RwdGJJKWsfkJoky0nAA6OstuEMig2SSFSC+QWfRrVUBSLxcxA+z9BM9fnWWLvnqBY0t0pvXazyVgIrkjD5gt4WzsVtLdy2DN2c3Qx1xxw3tS3515/+hWRpWFkyVZahOMNbDyWnzFUUIq3V+n/gNivalIFqWOtkhg8Zjmpr+T/8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6b5b65b1b9fso13780247b3.2;
        Fri, 06 Sep 2024 00:34:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725608073; x=1726212873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OzWwlgD21vw3dYHmaJkpCeyi7AwIVfGBZ5Yt8JsuZL0=;
        b=UYhiKJE7etT+6pEaT5W0S3cYxSt/An3TImwSsTFItrZLXsdbWI0YZatBStnUpjcviL
         dn3jCwgNJdPC+VDpMfx3aay8vg55wsF58XJ6D5va9HfSQegHLv8zmkhkijfrrCgtKTjv
         LpUJBO1AVFcllXTiElJCYpWVzt5MOqrdl77oCvApyOxa9+Cn6uuhAEa9TZjybv3lixGW
         2iPbnA9PD0RePDCTw5aXdSzTNaIznGXOF6cd/egQ06UaFe363gN3hN8XjDaZUE8EtLqZ
         zfjFZb9cirNplP3ZFPctwhieH5s9pCM/PoL+WqWbL2ocrYDWtulrcihNVbHf+t83U7WH
         nJRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTZcoBKTG/Ey3afrerRziJ5JIpJ91/BHw5zDLJhLG3Knst4Af2GXEeRKAfoXFv4nAuVNzfX1byTJFbCxYw@vger.kernel.org, AJvYcCUfY8JUA/FftfYm9yXUCXrSEUqbXTtSSSazApOxCA4iQ6GYc/bLTcpMV/tIv+028+D0fCDrv2g4cfZQ5xY2LZrJRRs=@vger.kernel.org, AJvYcCXE+1EYq6xkBmFDz9elzRS3X/9HVVNJ46nv3n20uwS3tkn72TiG1RPt2Dt9IbYUC6BBWMwC9pB8kAuD@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/AiRHsy88oVoyU2IJDMMw++j3a1gkRwZ0FAcyBRe+diJniVFR
	aCwhA7Z0NtalIXRV4TN+QuB2ZBQdLaCI5Su9QGrYKyKHxAvKbyNDtQ+FbPdO
X-Google-Smtp-Source: AGHT+IEOuyidtSxUCV5oKopj2oA3H3Umq7j6zjGPhxw5/6gjtm9gJh1IHixdTZyJlmoqTaJAlW9Gqg==
X-Received: by 2002:a05:690c:61c6:b0:6db:3b2f:a1eb with SMTP id 00721157ae682-6db45134ccamr24090997b3.26.1725608073031;
        Fri, 06 Sep 2024 00:34:33 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6d697a15d23sm20991977b3.135.2024.09.06.00.34.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Sep 2024 00:34:31 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6d4f1d9951fso16013587b3.1;
        Fri, 06 Sep 2024 00:34:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUxtuM6blAydizM0aY9BIFM3yHptm981wEBrr2a2ZPoJMGj254wifGk2tlPgFGBe005tRJ2HlVvZpz/@vger.kernel.org, AJvYcCV22oSWukBKU5WZtPU1HkHENUb3+iRwVcAJGIEDmKtaUAOmhOCFl5yJoNSxnhft27FGXJX+Q/8F9Kx/6X+C8CqDusQ=@vger.kernel.org, AJvYcCVRreWkgTksBHHxH0eqaXz/p1oDpipGODQt+3D3Cq0xtm1JauEBTyvsUzjtaVto6C3WqhGQjf23Kyd9DDov@vger.kernel.org
X-Received: by 2002:a05:690c:61c6:b0:6db:3b2f:a1eb with SMTP id
 00721157ae682-6db45134ccamr24089527b3.26.1725608071358; Fri, 06 Sep 2024
 00:34:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240906062701.37088-1-Delphine_CC_Chiu@wiwynn.com> <20240906062701.37088-9-Delphine_CC_Chiu@wiwynn.com>
In-Reply-To: <20240906062701.37088-9-Delphine_CC_Chiu@wiwynn.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Sep 2024 09:34:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVTkLDz=5+GH+kKhfKC89nh0+bKh=X4A7bdeiMoBgPwWg@mail.gmail.com>
Message-ID: <CAMuHMdVTkLDz=5+GH+kKhfKC89nh0+bKh=X4A7bdeiMoBgPwWg@mail.gmail.com>
Subject: Re: [PATCH v15 08/32] ARM: dts: aspeed: yosemite4: Remove space for
 adm1272 compatible
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Cc: patrick@stwcx.xyz, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2024 at 8:27=E2=80=AFAM Delphine CC Chiu
<Delphine_CC_Chiu@wiwynn.com> wrote:
> Remove space for adm1272 compatible
>
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>

Fixes: 2b8d94f4b4a4765d ("ARM: dts: aspeed: yosemite4: add Facebook
Yosemite 4 BMC")

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


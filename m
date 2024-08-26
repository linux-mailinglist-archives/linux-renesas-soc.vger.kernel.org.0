Return-Path: <linux-renesas-soc+bounces-8285-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB2C95F234
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 14:56:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C17351C230F5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 12:56:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4646D187FEA;
	Mon, 26 Aug 2024 12:54:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D46B172798;
	Mon, 26 Aug 2024 12:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724676891; cv=none; b=BBZp9wFnjIVeKZz9zrY6soP5RHCRKi7iJgV/whwMK/8Bi+dPD9pu5tyxtWjN/47xrudPQLB9H0zswBkvo8BCoQnYtQ3a3ne1lBCHIQvFBQEXXenvdql7ud9hQRzgrPqpdAzKzCEDXDfYP0O8Cc5SRXQ3KUfUEChDJqCXhDgsoec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724676891; c=relaxed/simple;
	bh=ayuY5urcv7wzBc3ca2oQZlLr66hjtTMhY5ZihSO9GZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uDsHuF5zVYNbgAroj//hz4x4p6nIy4CEvhX58/fom4TzgvNnSTX8Kh469aSCUvTZUulafiXlWDge2cYYjX3FlQNmjy1ab9h0nlRVT1pad3admrh/XR+Tz6Ta7vQ8FpUH/481cujT+JAOdXtqNHjyOVxOVcZRCO8m0GsyRWiXC1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e1205de17aaso4406993276.2;
        Mon, 26 Aug 2024 05:54:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724676887; x=1725281687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=86KUoIdgluS3sIu2DePra4NVbpXZdUVLHz5nB5lMqtw=;
        b=dHde668Zj7GZkGn4/Ga3EUVferxZlzEqy7fIUB8nnVDCOcGpQGv4b0fobaNRfumS/a
         zReNJTZX+9HntGvHmoBpj49D9IT6jAuGn7QIHI63cDJP2RPy7Yagr4GcXt+PjIJzdaHM
         ARh52uPHASjvuXewxU7e9+f/iVhxP/Hbqx7jXG+9ZkKb6ppTuITyXa0XosHm7129hzLk
         y/WJSmfHMNZ8j05lfnJKSrSkE1Gh0pF4raJsdijQltLrK7tgjjm6mgVqqOc/r1EzLZvP
         k+rHyqVq2Notl6Aqme0z7D4j/OU5bwqG6kLFrryVVLUo8Z4qvtY1HiLu119J6m974EC1
         aoPg==
X-Forwarded-Encrypted: i=1; AJvYcCVByxelGyBIu7JgBP8DQjjT217wo1J6ED0obGmTa/VzIc4dIVNL3h0F2jUn1T/S7m56fFZgeGjwNmgiz8CregP3+9M=@vger.kernel.org, AJvYcCVYuRCEsQxAoetaVEiOQav224QMo2Vw3Yea2Kf7ez9uHz4m9xhzyuqML24ZoSbMlH7Ua604OOAUnmMw@vger.kernel.org, AJvYcCW4ttGZL5ENU9oH0xKrutABY+splhbrYm1thegVO6zPONhYVHeghjZ9fHUTeBb6HOf9zbXxZwrk05mvf3eT@vger.kernel.org
X-Gm-Message-State: AOJu0YzdwnCOjWkF+n+7afsIWGeMC8I5nnJmUfXVA2u+E+6w1AIHTaX9
	TokIHHjsvRLbX6LT9R5VsLe5LhlspCkNLVBu2vvk10j9L77ykTJhYQwuBYGM
X-Google-Smtp-Source: AGHT+IGOjcFvGFz4OB76F5XENpI49TEQfPeA5TKWUYKaY+3XI1rTx43+OTx1Eoxf+JYa4sG7JGPwSw==
X-Received: by 2002:a05:6902:230f:b0:e11:698f:8843 with SMTP id 3f1490d57ef6-e17a866641emr11261450276.44.1724676887545;
        Mon, 26 Aug 2024 05:54:47 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e178e4bd277sm2029128276.38.2024.08.26.05.54.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 05:54:47 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6b4432b541aso37707017b3.1;
        Mon, 26 Aug 2024 05:54:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV+yKYUUWG149AKjyY23JWXdfwyIA+CwCvY0rNtfAFactPV9UFlBKouOqOWtL8worwQ9T6kwB8ThRkp@vger.kernel.org, AJvYcCVb8XTN03ybvz1EBZuIa0pBBYGMUF1bbiCu67x4xMPx7jP7JNIlt/0uGH4KktPB602EZPz8sEnR2pHDk/0u4LKBfME=@vger.kernel.org, AJvYcCWd/nH1JeuapF1NXzrMzQKUSViYPykeTAN7Dy5QRDwu2feM6+Pp4Kc8+8XYrottiIkZKX5mkWSnImqZoIk+@vger.kernel.org
X-Received: by 2002:a05:690c:3302:b0:65f:80bb:e6b2 with SMTP id
 00721157ae682-6c6251a3eebmr90811867b3.14.1724676887056; Mon, 26 Aug 2024
 05:54:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240821085644.240009-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240821085644.240009-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240821085644.240009-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Aug 2024 14:54:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUt2_2OBeR9eRyfPAAn1z7VU3t1HkwdA-nLi1uO8pp1Pg@mail.gmail.com>
Message-ID: <CAMuHMdUt2_2OBeR9eRyfPAAn1z7VU3t1HkwdA-nLi1uO8pp1Pg@mail.gmail.com>
Subject: Re: [PATCH v3 8/8] arm64: dts: renesas: r9a09g057h44-gp-evk: Enable watchdog
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 21, 2024 at 10:56=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable WDT1 watchdog on RZ/V2H GP-EVK platform.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

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


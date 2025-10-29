Return-Path: <linux-renesas-soc+bounces-23835-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 86869C1977E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 10:48:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6455401BA7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 09:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E26F5329C5A;
	Wed, 29 Oct 2025 09:45:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156D7328618
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 09:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761731116; cv=none; b=bcJGoD0bsoCY0IroqBVvWWy0BKyBj/U7mMCNnGl33GQhaF09nMlPfGg2JsIZR0uLtK/XkKyssqRid+8Eazg8xQom+o1SUkm2lyQhfBQBcmvZIjiQB9V3yl1+3VbtWeaDSYr/lTYYTPxZifg6dXLgFgFNmzibXFo5cjZHUr+5BnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761731116; c=relaxed/simple;
	bh=ul7h+XS6GRSBMYFmPhQ6YeIMEuayPqL/cWHKXtbASjE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k8P5lWyh3bCOk9mbvlsoRqhe7d2dAcilzTPiRcl0Hw/CNwVaLTPukobHu6eZdfbmC6qGK3LRybgeNMdSKf/pHil9yfYq1Gr9tisccahXepQ6b4YRH5s0HEBnSeFWAirdZhtOKmlY7WHri94/Y6u4DDJYJTvjlB87YlC6KL+dyQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-932bc48197bso3136794241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 02:45:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761731112; x=1762335912;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FUXGCcljy1WS6CKdaLlHjT9lGZyhiLJv69Z5NYW430U=;
        b=VDYoY5uVTn7ElGAOoWc7L+iphi90ZjLHnODEJtbSQMxBWXf8x7Xtjp8/yxD+bKMHqb
         VM9TazOPtCOExcLKyR7gWHNvEhPiP/Mg+KTGZNOKoSaDnhlGjqlNXmhiLzcI08ARUU8i
         GEM1xzaH6z2ucfW4vSo2DovjNznkcXldbLwQ9GUTNVGzuMXh+TLfmPKVqBLuh8HHW8DW
         Q1LWHjtmJnMcoRvwJ6ejjSdsUKe5irqKCvpbVFWsEfelMxxKCgMAShtmvCFrDwRh4Rrg
         OlXo8gu2vR70dRFbO8MlHigSD9j2YEzKrKGbISVPvh6Z9nmvgkpcPfuGPgT1WGLkPR8z
         oIVw==
X-Forwarded-Encrypted: i=1; AJvYcCVqJnsvWzHsbNKFitkRdW26VnvcfoH/vQxSjhsQ+UopJU+zMYDvvnaKOl1719j/JodvasXcgbOLs8NgQne+L1D8tg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/SsLGkmrCjasFQrvwmIMGEZdIeWJoFUgZjeSRx9x9sSh72gEE
	cYWSNCbFK5UdBc+QsFycJDMN34zhHNN7QkdHPZp8tNJHNnJHWDSqNIPZWZTGKw25
X-Gm-Gg: ASbGncs/lsT/h98jZ8XDMcGHVu1FFz6VR7wsGR46LFnqr7EJ5ki7spa5UahRH8gujiL
	v+oyMKHNw1S8LBMv3Ql4USsWkc34UYEFwdcd3XzP+BNoBR561JQvT7C2JM8naFkGF2jVu1yNp+J
	xeyi2xvYdHefnoF865yp9vmUp4x6niikKD9p8oa1ody/7x7zuC4XGACtF3ptav6Hi0igdLUVohG
	gbEyEMe7zlngMwr6g9CCmH2t63ocWuxPd3+280b4K0hgR3FjzyKprhaiRPhZEP9ZpUnKcGhtXBV
	wKZfNwqOQH7V+t6cQEQm6mVtlmO1njQG0+4VV3lQ/TzV27lY4d2xLkR193mL1AYhr5g3aQwhA6G
	YyuQ4xWG4siSCD4J68gzZuOZC1qsUruqIQFjE9IkkpaiRbcHjkW0V3OfZ0Kf85crCwkQTjA+7g4
	/QqSIxxhzXNwsVcDjoPej8u1wsSjVB/pDXxt1dN93IpIZf+CjY+uGClL9rpHk=
X-Google-Smtp-Source: AGHT+IHGj256iaaAzkDwyZF3yFssP3lY2BvHxS3+68zTHELmqhuO4+3RH2GLjpTani7lDkvdX1EvLA==
X-Received: by 2002:a05:6122:250a:b0:54a:a5ac:5107 with SMTP id 71dfb90a1353d-558141eb953mr647763e0c.15.1761731111461;
        Wed, 29 Oct 2025 02:45:11 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-557ddb9fc7esm5168314e0c.23.2025.10.29.02.45.09
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 02:45:10 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-932c3aa32f3so3528871241.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 02:45:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWqOx8gS1RzC/e/pQmco/H+eni3fb1PzS7iVRzWB5eeAcPKRUtXi/cQlIXMU7FE12OHfR546DeoBaNXYecS/YMfTQ==@vger.kernel.org
X-Received: by 2002:a05:6102:2910:b0:5db:3111:9330 with SMTP id
 ada2fe7eead31-5db9066385fmr535126137.27.1761731109576; Wed, 29 Oct 2025
 02:45:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029082101.92156-1-biju.das.jz@bp.renesas.com> <20251029082101.92156-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20251029082101.92156-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Oct 2025 10:44:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXaxk5mEDFJ3uWwdZYqkhd_jCRjVB55MJmHRZxyWGE=Pw@mail.gmail.com>
X-Gm-Features: AWmQ_bkf4dSdvLrN2gk-FVgCqZ8SF2_j8HOolSnL2gtCu3wVMEe_dcdoAdns_ts
Message-ID: <CAMuHMdXaxk5mEDFJ3uWwdZYqkhd_jCRjVB55MJmHRZxyWGE=Pw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: serial: rsci: Drop "uart-has-rtscts: false"
To: Biju <biju.das.au@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, stable@kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 Oct 2025 at 09:21, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Drop "uart-has-rtscts: false" from binding as the IP supports hardware
> flow control on all SoCs.
>
> Cc: stable@kernel.org
> Fixes: 25422e8f46c1 ("dt-bindings: serial: Add compatible for Renesas RZ/T2H SoC in sci")
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Updated commit message to make it clear that hardware flow control
>    supported on all SoC
>  * Added Ack from Conor
>  * Added fixes tag

Yeah, this was introduced when renesas,rsci.yaml was split off
incorrectly from renesas,sci.yaml in v7.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


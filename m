Return-Path: <linux-renesas-soc+bounces-7564-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FE893D651
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jul 2024 17:40:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C222B23A98
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jul 2024 15:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECE4317C232;
	Fri, 26 Jul 2024 15:40:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8B517C211;
	Fri, 26 Jul 2024 15:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722008439; cv=none; b=CKiMzcGDlO7VDStPrG/yWQO73pnRkjcn/5Ugufb3P5xqkco4iCzlFafckKuBDf/RbyLsBproXnINky+MMq5KIH4iz8wLyA9G/jsRwpXIZT+mr4FBwhZRoxWvRCsNulkioRNyp4y60POy4YdnbkWXQ3HcxtIScX5ovMrp3cuwIpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722008439; c=relaxed/simple;
	bh=vxRdGIkfgEZ04ApIbIHN/L0+nY+i/qZ5Ql/iZ0wYUs0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XtE0FedXIrDZM/CrdGypTT824uwIMyNuRDZfJYcdukMoteVpke1xTJcfFcCccWbxFABQd42zLScsIgFbvgRxE0OV5rr2NpK9HHsqbTqBVvq+oOnzASmUUFR+OnZCsPOSy/oOnINVE0e5dvmepFQqX2Mg1iTa9lFHmAi3fBERI74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-66526e430e0so24030087b3.2;
        Fri, 26 Jul 2024 08:40:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722008436; x=1722613236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LQGrKvBmEuUvxegvJzBt910BFCTjXsTtk2JJYfaSArE=;
        b=ZJUG4L5lmN1VBB5YpYLYvtmlLxmSlkKDJztIMyi/D4kZPdVIKlCKeViSw9lZRCOUER
         ndZNTIpqH18UcNv15oqYcplZcjvDwQ6+6UcrxxRwbrHOs4Zhb2OfkyDXdHt2k2Auu+fL
         SSlGm1GYZEqQFWdvS1ArSxY/qVX7D9+Mw99ny/hAUpaVm6XSKpKERZCSWREhTNs3zfVL
         oL+u6FKRntj8KEdbFxD+r2KFcfN5JOKnNf18pK726aMvt53Vo6y7iWtG6O1ENJrQZS0f
         I17L4L/vhWg0vRuMumKWsXDviKjd8L3q3VRWcJgIhwe6qP51vMVsEuOQ8dK8viNQoFlU
         s8Rw==
X-Forwarded-Encrypted: i=1; AJvYcCXaQo/cJx/SyNOJfWLnkbC2xVl/fE2yRaEbFk9f6NeVPHO2QhrRYbwbs3XpQmYTr5sPAQ+2+1kHhujPbPs7ErtfnwSmycGYtoMJytIKtKWXTU9ncgCaOfj8cNJv+xeKVHhbddhy6HiN8cQxiQxMZZ2d08lSSBJTCA1N8mYDg01MRCgqLARzXRNpbSCI
X-Gm-Message-State: AOJu0YygHHd/RFB9OxpUh0jTn8jZKIUqzI1l5JTBvNYXhza2vUKG8K7H
	SAdBuAgU6jgjqypgHCo2KuXoxlEIiIW33l09Op/DHahvE1FIqmugnOm23UGS68g=
X-Google-Smtp-Source: AGHT+IE9wpgXPmekLN2tKx5jeOR7eC8uUBdxG9k9dv3tCmq2aqjpVk8qxBOuIA5CezADqv5N+1pk4Q==
X-Received: by 2002:a0d:c8c6:0:b0:61b:1e81:4eb8 with SMTP id 00721157ae682-67a051e830dmr2000757b3.9.1722008436111;
        Fri, 26 Jul 2024 08:40:36 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-67568113ceesm9122967b3.61.2024.07.26.08.40.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jul 2024 08:40:35 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-66acac24443so24827037b3.1;
        Fri, 26 Jul 2024 08:40:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWepr+qmXBSaJpxzHL4t0LK4KWtUxQQPfOs+3JccD1A4kSD8XNCCTZsTMEYumg1Ff1D88p7ehUO6n/XxFL/iVYxg4qecvYjcIPXLYKHj9Lx2OEYKI+Se0hKTYcFFFJx2Ei4IR6kEnqoffB2JX6gfTRZV0vmaEcRrKAAVcCIvwvZfeQJcnWvoE6aPvIj
X-Received: by 2002:a05:690c:4a01:b0:64a:7040:2d8a with SMTP id
 00721157ae682-67a074af3dbmr2628547b3.23.1722008433663; Fri, 26 Jul 2024
 08:40:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240725100534.5374-1-oliver.rhodes.aj@renesas.com> <20240725100534.5374-6-oliver.rhodes.aj@renesas.com>
In-Reply-To: <20240725100534.5374-6-oliver.rhodes.aj@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 26 Jul 2024 17:40:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUXt0KyNLwPQhu=YLZ0cVHc5SWu7poD6ZORnh-BE3NaSA@mail.gmail.com>
Message-ID: <CAMuHMdUXt0KyNLwPQhu=YLZ0cVHc5SWu7poD6ZORnh-BE3NaSA@mail.gmail.com>
Subject: Re: [PATCH V2 5/6] dt-bindings: serial: renesas: Document RZ/G2M v3.0
 (r8a774a3) scif
To: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2024 at 12:06=E2=80=AFPM Oliver Rhodes
<oliver.rhodes.aj@renesas.com> wrote:
> Document scif bindings for the Renesas RZ/G2M v3.0 (a.k.a r8a774a3) SoC.
>
> Signed-off-by: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
> ---
> v2->v2 resend:
> * No change.

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


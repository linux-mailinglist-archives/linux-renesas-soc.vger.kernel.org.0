Return-Path: <linux-renesas-soc+bounces-2909-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 576E2857FC2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Feb 2024 15:51:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 898AD1C21CCF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Feb 2024 14:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59BF512EBF0;
	Fri, 16 Feb 2024 14:51:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CECF219E5;
	Fri, 16 Feb 2024 14:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708095107; cv=none; b=LcboQtbwr7A/PdmcKOYuDMYWwSznPiY3yK+lAxmS7nEbi5kroea8z/owJZvHpQGieSNuyGAvoLUtSL4K0p4/Cy6+WP/ocBmffTfXENIAsfBs3Ss1bw3VII4agweoofzOutvNklrHp/LUEpdKCcMAp8G2HdKJykYyA5ZxSk9LgBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708095107; c=relaxed/simple;
	bh=8czbk8iwy6vP4LxBR8OEn7cNfRxBxJrhabrbxBZdNTQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JKrKWapIAKmmcdusF/GpG0cDU9Qmy66mI11QjVtDpmqXfiU5wuNIwXpgt35JTI8h1Ivn9FpycARTpTH4qdj4fxBnUL1wEN6R/fBmqbZpAbtW8JkqFWzgmDc7JfkryK8AInZdOPVeoPrWSUvzmgwFRRWm42JVSGcjmvthHCrf9K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6077444cb51so23233127b3.1;
        Fri, 16 Feb 2024 06:51:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708095104; x=1708699904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bi1rMJVKHc2i7qb67X3wzwJlW4alJIl8nCAU0KeiSSM=;
        b=TAdPf4N2706cr19SjMhvMxzEI1X++z06jIjpKDcVNdBP6BzJKmn2Pja1dUZqAEvjG4
         SSDko+/6Pv7skWt6gbcB/+eNspvAtmtZQiwOcLk+/4r3e3Dw+v6HilWaNm1o0d7Kbt4p
         VEyQFzrXqweaSx23r23pJivIxDNdc4/1pzG7TBc0HbG4J+mn1JKPx4GLVBgdALrKSaW7
         Gt5ZI6UzHPhhnbRSPPp/ZiELRTuUJC+7EqV0r5YmV6Jd3DkIMBxbxacd0TlO0tO8OxsT
         vkv5+XVZlzCXOEFWg0yjFzPUUdx6RUHRADLGBHre4eDyzhZLSD43mDkOMF9HNRiF1bCh
         QTcg==
X-Forwarded-Encrypted: i=1; AJvYcCVy+xzL54MpFcbS2SLq2OUL/cqTr6unPpoh0Ahr3ACry8nPcV0/xPs9UjXvCqwwbUWL1LGOoA0oACitgF2/MuHgvMcHTtRKQmCQje42MhizYKDwSwu/1N3qTir/Ej5uE1txG6bez4Px5Y5Xjd9w
X-Gm-Message-State: AOJu0YyUJB9x9PRXQSDWFStb5+mQj5cHm1Ugy/dRw+hIG3zSHD67tRvt
	LDDdcTrDcuG+FHI7IPKCezG1nxd9bmwQCErpFFSfxZsKCxb2bFT8vslODL+WT2A=
X-Google-Smtp-Source: AGHT+IFIpJMYaUarb9OQ3CugfbiRxAkxdV8vjj4PEsPAwUxV3HYuhTBY5fwjGb9kcFeAq3df++aw0A==
X-Received: by 2002:a05:690c:4506:b0:607:b0d5:97c5 with SMTP id gt6-20020a05690c450600b00607b0d597c5mr4779229ywb.21.1708095103708;
        Fri, 16 Feb 2024 06:51:43 -0800 (PST)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id i77-20020a819150000000b00607ffb7d340sm185824ywg.28.2024.02.16.06.51.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 06:51:43 -0800 (PST)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dbed179f0faso2304595276.1;
        Fri, 16 Feb 2024 06:51:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUgvMGlI5YPW2O25GU1e6NbL+fhjOMmsdh9aGSCHXoFoxvD99FDsoQY2ToQPd5fmOEoARy6tNw8zAxC6Od5SaIlbCYqo7Au4TPSSSTIUtL2pGaPL+4CV6+6a7Is83jgq4HgxOxACRSYRxn1+ydf
X-Received: by 2002:a25:e047:0:b0:dc6:ab85:ba89 with SMTP id
 x68-20020a25e047000000b00dc6ab85ba89mr3774029ybg.25.1708095103336; Fri, 16
 Feb 2024 06:51:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240213192340.2786430-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240213192340.2786430-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Feb 2024 15:51:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVtRZAGq+yq2EoUPTRw6F=SDdG_3jwc9JdaPiux-M9o+Q@mail.gmail.com>
Message-ID: <CAMuHMdVtRZAGq+yq2EoUPTRw6F=SDdG_3jwc9JdaPiux-M9o+Q@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: renesas: Document preferred compatible naming
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Tue, Feb 13, 2024 at 8:23=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Compatibles can come in two formats. Either "vendor,ip-soc" or
> "vendor,soc-ip". Add a DT schema file documenting Renesas preferred
> policy and enforcing it for all new compatibles, except few existing
> patterns.
>
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
> * Changes since v2
> - Improve the select so it matches on any compatible containing a
>   component specific Renesas value.
> - Make the regexps more compact.
> - Define MaxItems to allow the increased selection to work.
> - Add rmobile and shmobile prefixes.
> - I did not take Rob's ack from v2 as the schema changed a lot after
>   Geerts review.

Thanks, works better now: "make dtbs_check" flags the addition of
my bogus test properties to DTS.
It doesn't flag my bogus test properties in actual DT bindings, but I guess
that is expected behavior.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.9.

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


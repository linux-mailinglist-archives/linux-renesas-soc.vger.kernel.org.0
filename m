Return-Path: <linux-renesas-soc+bounces-5489-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1138CFD46
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 May 2024 11:41:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 14E2AB227CF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 May 2024 09:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C35F13A87E;
	Mon, 27 May 2024 09:39:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6E213A89E;
	Mon, 27 May 2024 09:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716802781; cv=none; b=ohAQ1gAjftwt653gAQmOtXCWOGt5zaRUlgtnKFQNxQ69pr13Wx7+foJcoWatWetvAWqkRSP9DYvYTPg7DcAKafdKFxzQ15x10PsGpRY/gsMqXjUc94dNFmXPHU9hnP3zBuUQ3ysPHyMg0OHCaN57rrv9JQgxXYC0gldTNLCF5pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716802781; c=relaxed/simple;
	bh=dx+hN+wmsJTwtBfOQ42M7kIfPQOsGL7NwwOe8NY7hNI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iDRKCb9+i15z+TRrHwZtqGBVWOuJs+0Rh5YpPOll+p9VkjYGn9d4rmeq41fma4svg6G/BVi4kLVVkBhLUah51jGRDufTgTL/ijuEk9V3PHA2b3vuooPg/xwso6ri7SwMUNCfxkFyjSp5aJp+JxGGUx7XnUZpM50e7kwS4q3bpkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-62a14a73627so25474737b3.2;
        Mon, 27 May 2024 02:39:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716802778; x=1717407578;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cs7oGWkvAyFJE8iOCwgBBHVZVN7XGrEi9s1+j6aNNq8=;
        b=I3grRimC+HXDHAsrT+VzWm0xbn+fAktWNr6PbBS9dqbY7iCWSx9WdS1RzzfmRW9Alr
         05qBhrCPO9ozbFA3NaLpp1LZJE/N8GNqmiu8R/x4oYY3g7VycALPlGg/kBLThEAzRa9z
         FWNtO2OibMZfy3Bezib4BXJeYCjljaYeMc4c6PnYi9GUAWWKeMW5Nxe4lrg40+dPXt5h
         0yD+3tPI18FhcjENN8cfkRaOaxZf4wffMmnggIWR5FXc/GSfLbS04blceH8k9+W5cKDk
         6tE1c8TQKcdmvRNnf8oO0w0TSxkbvNlHRhSRiIz0c7Bf8HJQ3L3H+EsRQ6HWYKHk3kjs
         CCCw==
X-Forwarded-Encrypted: i=1; AJvYcCVSHIuqF7sxXQaW/jAe+e1jJre3uv4GI0WUag/41aQf6CnxqBEuZtlPr5b1CxJMam4KQnc1ZZfhafekmOhYSl8Vob9iC3XXlDfsPHHnlRHMQzeYWj3vaTq/VgSc8J9YC7JQBzl0yigXI5omf4SubRp3II8v3vIMh3m+5aK+7bks1lAjfmcosfD6Y4bCOU64CaV7OA/E5sNxfMrnZSShSIt00i8E
X-Gm-Message-State: AOJu0Ywldlu6JZxJTkxFZMvXnVKbNVob9/jdafVFmNTswXo5cOGEIbgj
	ghP93d4ZpgGEggNTvNnu+RBk3N3Zs3+te1XI4zIFLuCopwshBDIO3WLHT336
X-Google-Smtp-Source: AGHT+IG2/TpKChXsuvqybcRJVUPrmpak18nT0ShQi4aDZXyUx2IzP20WJt+hzESLxcLXMOY6rszPRA==
X-Received: by 2002:a81:9182:0:b0:617:cb98:f9b2 with SMTP id 00721157ae682-62a08f2cae4mr85149047b3.43.1716802777784;
        Mon, 27 May 2024 02:39:37 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62a0a551098sm15952597b3.128.2024.05.27.02.39.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 02:39:37 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-62a14a73627so25474357b3.2;
        Mon, 27 May 2024 02:39:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXMH8HYVdlJ2qq7g0HMCxAiwvFXro6fSFmjZugnvkKPJL7oVhj0EpaB+yf3Jo5g3kiwP//Y+lpt/vhG1VjeAlIxolaIovcrrITsVLZpb+wzVmj5b/cgEIbBJkNE9HnRsPJxJnvk6v8MwoRbD5WghMdrxRbJHuMeFnb+XR4GDldMWIIFRpewtjUl7+XgZEmDax/VS3GZO6tpybxmAWuUt31xRsPw
X-Received: by 2002:a25:9348:0:b0:df4:d5d2:b524 with SMTP id
 3f1490d57ef6-df772184a6cmr8464467276.14.1716802777293; Mon, 27 May 2024
 02:39:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240513-rzn1-gmac1-v7-0-6acf58b5440d@bootlin.com> <20240513-rzn1-gmac1-v7-7-6acf58b5440d@bootlin.com>
In-Reply-To: <20240513-rzn1-gmac1-v7-7-6acf58b5440d@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 May 2024 11:39:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWC=mF0xVwALAT6OsZMn821V-vz6G94HLVsEDvXWRpngQ@mail.gmail.com>
Message-ID: <CAMuHMdWC=mF0xVwALAT6OsZMn821V-vz6G94HLVsEDvXWRpngQ@mail.gmail.com>
Subject: Re: [PATCH net-next v7 7/7] ARM: dts: r9a06g032: describe GMAC1
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Serge Semin <fancer.lancer@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 13, 2024 at 9:24=E2=80=AFAM Romain Gantois
<romain.gantois@bootlin.com> wrote:
> From: Cl=C3=A9ment L=C3=A9ger <clement.leger@bootlin.com>
>
> The r9a06g032 SoC of the RZ/N1 family features two GMAC devices named
> GMAC1/2, that are based on Synopsys cores. GMAC1 is connected to a
> RGMII/RMII converter that is already described in this device tree.
>
> Signed-off-by: Cl=C3=A9ment L=C3=A9ger <clement.leger@bootlin.com>
> [rgantois: commit log]
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>

Thanks, will queue in renesas-devel for v6.11.

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


Return-Path: <linux-renesas-soc+bounces-13938-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 21952A4CCD4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Mar 2025 21:40:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F7581893BC3
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Mar 2025 20:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AC7923536E;
	Mon,  3 Mar 2025 20:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OnmQrY06"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816501F3B97;
	Mon,  3 Mar 2025 20:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741034445; cv=none; b=hIjHqt45UZ44pPdxOt2fVnKEwNlXjqEb3hsR5yT57dl+3f+ZWUW1Yo51DynnlvPtdayraiwEUtcVANLyTXe89gnmxFKrDJkpSNJ2qQM0HPNHj0X7AxYMBHlROsAej7pHgJWOwJ9DMAsHw7BWrUsyJGTztTGaYodfm9QzHvIQS5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741034445; c=relaxed/simple;
	bh=wa9ej7yn+qpGJQ9907Zd/kdun68EwCn3ZvNWCf8TNx4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EQj+8rojn/TIflnW0RV5QBP6JfuNTkEl99ZBdOY+VlP0NjiHGn3J9dfT20a3ttuD0ETXMKwfZJRnoCeMYtSUaZGrx8PUxB44WlUJj6QGcl+Cp5EOyZWde6Te9N/UQ57ycqA872gVNhlFSj1hJpufvuJspKFqXzUVheCuxyo/tpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OnmQrY06; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-523a5dbe070so276153e0c.1;
        Mon, 03 Mar 2025 12:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741034443; x=1741639243; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wa9ej7yn+qpGJQ9907Zd/kdun68EwCn3ZvNWCf8TNx4=;
        b=OnmQrY06qgGamnxHDkAvqnN28+SzrSH0m9OabhgHMqtvCtDNMt9dFg4qMzjFS9e6gT
         RSxkqLZd3PnH4MaIiUX2SRapyV0rnQow8N+122WJdvNIUdQYazytbX5iPk6dmegtHi+B
         5XunthHSIAxuRhVGLI51nKY2+7vVUMKzAAJyde8E5j2TRYuJznmtJ2rxQJFuYSXZ9mM4
         VvxIs3/j2qyysrpsr9ZcFH0l++5a40JEgn4BxnkcYbCZlkKRQRTawux5/MU3GH/yW1Ye
         FAQQrR4lHHB2H6Wy8R2aic7/KsBA6TvPQ1OBv3fzXWWetGCFdmQa2kldtd/pMxYv66NK
         WKLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741034443; x=1741639243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wa9ej7yn+qpGJQ9907Zd/kdun68EwCn3ZvNWCf8TNx4=;
        b=d+D/syhs5tby45rcZHicrSdMPJwjOBgE/M5qqhsKZ8V5/1tvVwlL9sk+2IqQ0t66oh
         Tux30ZjjIH/OoX0CiwtAad/IvcVfL63PgSpLVU0Eo9iPhBTUccHG2iMEgiQe42LiA1E2
         oiGIVF4Bf9TdjZqWB8Yj9AmzdliYuOgPEJc8BqqJXJcN7m9hLI75jjwAoJaTeqmYB1yj
         4W6ykouZgK/v68opnljiqUz47d2guLM5aryGDcYcxnZdZkcD0gkjzp7iK76seAHZ5TWS
         ABVPDvAJHV4R8bli1xR5x0oDAp/1AVa6ZtYHbb//kksMZKfa0KmO/AiNU6ud9NrEbzTF
         NgMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUT3ZmXwkFvO6NdMl7bEUcjTQ/sM27fJGavxqtWE528VTTr7ZXvcm2E4sPNbAfUMDYkVLGLovnJiU5Lgwcg@vger.kernel.org, AJvYcCVAm92RnPQDMwBpsD4LWu2zLAZMuCc1CXhvpt2/qT5CtVkPro2WbB9Bax0GjE8zWf5CrjDDPqRtIa2Q@vger.kernel.org, AJvYcCX7JqCo1NZko5oqzHW6+DoPDhoDcuPYRabxYZ8MpIl4rtxnvP6y9oBhDWsHLEQWZEfHHC8KAnHu@vger.kernel.org, AJvYcCXKyTkZCpu6zLYbEfAwggNuiwNgBusOr6dAmaE2ETMLeD8xrbCksMMLyb9vVws9p0Mq0EqnVLe4PBXKY2PEHdCWS6o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2KhMLw7iBMElpJUygk3DloDHzLttiOUaGhM9Q2N//CBrhnarr
	9kXxtHpgkhdcCk9HNa00glp6QG5DJ2JqaIOvNlyDWj8W4pZZJPIBL3HzUtLZEIdfV+gr7CErp0z
	ucFVdad4k9ZWu5n0NVObQq30Kym4=
X-Gm-Gg: ASbGncsXzwbpRhbnQma7PCbTdBVxfheuCAYus017L3MFAxQ39/aoosjuSw2zmysXgIZ
	WWSbEQKjoXTd4iSvzENkpk2pF/ggB94VgS3jjt7DDI1QsNoJWB+A5hXl4ff4iB2uOSCDVpYrOlj
	StUa7qvU4CkMn/oVljB75I4wYslwZS5VjQoN/mADUFeGBHqhmLZZ1EuL0hVw==
X-Google-Smtp-Source: AGHT+IHhoht4zS//1Xj4uEatYoqPJ+r1DJU9gyAqTa1T3qeGX1c+1YGi1lM0qMiVvc7K8OO85fWDuLRXvTg+PP1LrVo=
X-Received: by 2002:a05:6122:1d0e:b0:520:42d3:91d2 with SMTP id
 71dfb90a1353d-5235b522d91mr6787945e0c.1.1741034443459; Mon, 03 Mar 2025
 12:40:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250302181808.728734-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250302181808.728734-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250303152628.GA1873145-robh@kernel.org> <CA+V-a8ukVgx7OqDTP6EharPJxUnVw5wAohveJw+VCABvz7FSRA@mail.gmail.com>
 <41eb620e-7cb7-4763-9fed-1f9fd2800795@lunn.ch>
In-Reply-To: <41eb620e-7cb7-4763-9fed-1f9fd2800795@lunn.ch>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 3 Mar 2025 20:40:17 +0000
X-Gm-Features: AQ5f1JqSq4k4vKd1-8EhBnd-An94LWSAO_BdCzDkcMjiR13ADbXn6kbbmmfXssM
Message-ID: <CA+V-a8sAKi9Yaap7f6hf2VfPRBtCvTN0mYZn1tXb2REwF6rV+Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: net: dwmac: Increase 'maxItems' for
 'interrupts' and 'interrupt-names'
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Mon, Mar 3, 2025 at 4:34=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > How do you want me to handle this case:
> > 1] Update vendors binding
> > 2] Duplicate snps,dwmac.yaml in vendors binding.
>
> Not the second. The stmmac driver is a mess because vendors do their
> own thing rather than try to be the same as all other
> vendors. Duplicating it will just make it worse.
>
Thanks, I will update the vendor's binding to add the constraints.

Cheers,
Prabhakar


Return-Path: <linux-renesas-soc+bounces-26842-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 37394D23D8E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 11:11:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8ED80301275E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 10:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81B5E357705;
	Thu, 15 Jan 2026 10:10:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5B335C18C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Jan 2026 10:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768471807; cv=none; b=HZZEVD53G6oiHxUu/lLMDAV2ePuGWy/udceZz57J4i6r8CMI6CamnHjb3RuiIfDJFhif65v5/keLLsaohPG04x8154JhwyFnnu9UqAlvWhCKt/Kgkz4MsxndRPQW8Y57VJyLI/PCxEPeqamZiDB9UhJZpECaIWxKuniggYaUy40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768471807; c=relaxed/simple;
	bh=RE+BJgoRw2g5IS+v92/qs5tkLXWM/g8t4jE9iLZlX58=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sOPfjDtclK91URsgdV+U2zGU8hEIn3O15S4XO1C0tJJeTxD879WlrNXQZeGQAsplKNDtwXxq+H3brC4wk6zIHf5tVgs6QIwS00EoqFDFRDBTdy1etMIPKKEaWG9Cf8+eFbhRCwJ2VtNmsRVKvkRjKmZNe0rOjVwbt6arQTDrzTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a0d67f1877so4901925ad.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Jan 2026 02:10:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768471805; x=1769076605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CgC0QjrYtZFKzuf+BESjeNcO1FE23KHL3L5ezRaJhpA=;
        b=kkX8f9ITvgVL8s7JHALj6mWtJzis0UxqtfskLp1DT9b6EbfRftiAFOitrMNhJN/VFA
         7cxEFMWwRZWx9cVlkYzKflASONBjAkbKvlIXfyf7QQRD+REvtlYykWdkY3s475xVSEOy
         AxKzheURDwDtvCJ4DLNrDDQug/7l4WfshX4JX7oOh8jEYaJuosvu77/Mgi072q+i0M+U
         nRmlvR9qZFCwhmz/RIMNukWduQj3J9amIJx8d31DqcsaFn5z0T1XnUlndeto3oXNPPOx
         /kePjsbiIkq76sW6YzAMVorKcgofIGwiiC+lTkXku2QWxNvvcnPCWAP4tURgvnlBhXdB
         sFjA==
X-Forwarded-Encrypted: i=1; AJvYcCW7TDdSG1e/INJNzeLjZQx0nzLj2IaKa6/tSSkykTRWtiSYrS8u4HSLjCm4wNyAKnPKFxaNC7OK8okvPwcjMb32zw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFDzBcD3zrif5ySGUcrtE7thYn9d3j7IqrUCiXLUTdZdavvkze
	5V6dHbcHQtTKWEiFDNi1x31rTeSgC0L1zi/vBe/prUpQcUtcb4fEFOyG7RLkXrax
X-Gm-Gg: AY/fxX7H+hm5K7ofvBw7rpF3RsfK+K5HzpJ5jIMCn/egiaIug8vcR3PYOYw7apPTJdq
	hsXyB4J/RwAaG/o6t7rZGKCYOBlTnG2EypiDu5b/gjtO8eZdyVR2GAN4i8/CLnljWxM6SOhWUFH
	oYSfMZC2Tp6ieim0IOm0OJ0FKhlBK8TsUqy5aWXN7tAVz9OXVxUuwZfs6kmsq7gZKXQDrbZtLzP
	Iu/jYnhov5pV3V18XAaf87Lfe44/BhH6jrJqqOlry4cSO20n9W7y1mavr+IoAVh3k5ZFSrSPKRL
	orfZHLSIF8M+FLlWOYuwdqebMhGWOWYB6zeTez/X5kxrp6VMDn8F2VKlPgZOHeS30NRJ+z683pz
	3KT+jqPzvhKHrsy3h12vmSx3y0coGvx6IxuYqI8taxhgO40jtRIG5ralOFN98Vb9pqKL1LLU2ZW
	01dkYlVmwzIZcPOxyVblZf31rRDxIqpUB79A9yBa+tNTwtAgr8OYM=
X-Received: by 2002:a17:903:2f05:b0:2a0:f469:1f56 with SMTP id d9443c01a7336-2a599e241bemr56320275ad.31.1768471805049;
        Thu, 15 Jan 2026 02:10:05 -0800 (PST)
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com. [74.125.82.175])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd4be5sm251866495ad.99.2026.01.15.02.10.04
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 02:10:04 -0800 (PST)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2b0ea1edf11so1967485eec.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Jan 2026 02:10:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV/PugfLqjmnnClVmfSSin/2TiQY+J3y8nNpNyfhvgwWyXMCuMyavl7MKeGxpvgvCoMTvY+kj5Mvol8okT8HzhX4w==@vger.kernel.org
X-Received: by 2002:a05:6102:3913:b0:5db:e6bf:c4d7 with SMTP id
 ada2fe7eead31-5f17f5c0ffbmr2421625137.21.1768471418298; Thu, 15 Jan 2026
 02:03:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260114154525.3169992-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260114154525.3169992-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260114154525.3169992-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Jan 2026 11:03:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVjYLQJDdqi_hShbOzeCQ6vcC0KCox4GqYTuGpDpF_FWw@mail.gmail.com>
X-Gm-Features: AZwV_QitLLKMPfpHq9dKw_djeiwJFqwAAQTIpORIKL7aOAuxz5cFYxB71KZhGwc
Message-ID: <CAMuHMdVjYLQJDdqi_hShbOzeCQ6vcC0KCox4GqYTuGpDpF_FWw@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: can: renesas,rcar-canfd: Specify reset-names
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-can@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Jan 2026 at 16:45, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Specify the expected reset-names for the Renesas CAN-FD controller on
> RZ/G2L and RZ/G3E SoCs.
>
> The reset names rstp_n and rstc_n are defined in the SoC hardware manual
> and are already used by the driver since commit 76e9353a80e9 ("can:
> rcar_canfd: Add support for RZ/G2L family"). The reset-names property
> existed previously but was dropped by commit 466c8ef7b66b ("dt-bindings:
> can: renesas,rcar-canfd: Simplify the conditional schema").
>
> Restore and constrain reset-names in the binding so DT schema checks
> match the actual hardware requirements and driver expectations.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


Return-Path: <linux-renesas-soc+bounces-30681-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLu+NObjzGmjXQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30681-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 11:22:46 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C2B3777F0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 11:22:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B0A52308D85D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Apr 2026 09:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7FF2317162;
	Wed,  1 Apr 2026 09:16:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D8838C41A
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Apr 2026 09:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775034987; cv=none; b=hEfMGmdImFxrwrht6rvkTtmKlpzskJvaIxy4oH9xb+FB+SotvmZC7cDNJA9wC78cyMaU+pLka4m5O+vM3A2lGnpbF/AIkzSHa7mccS2gH2DdR1RF/c6oNOZmrqVITkeVhfz8IOQCAYagmQlfpv5Xaeb7aWJB6OnRCwk8LdDnH04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775034987; c=relaxed/simple;
	bh=zmApEzRgDbRC0yPGVE2Vvk3ZWH0AOrNjBzIx0MNgz7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MtfzPxqgJgifN+VcI0KUawqellQZ38/5rSWMjrjYZf1kj62lD4G0v7Y32+enoem7tyDo0eggi0Ennki/lWMfkWbzO2GbLd10bD+i2qhZ42p+aKpij81HUdp40YynXCy68BZx7/H8QH11mWQNBgUEfgEoTr+sUt6ClR7YcBteNm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-953ac1602f8so511477241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Apr 2026 02:16:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775034985; x=1775639785;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qtBLhEnTITp4HWIgB0mlcJ0rdkLWYuJsWQsFBn8ERbc=;
        b=QjQTRuupbeQty9PmnTPQ/X0v42Oq3jCpKgN1RiABkFYzF0DPgsGLQ5cUq0459Qk/D8
         RpfJunKtSryfKKeHYnOCUWfnXjiZqCQgD5xcg0jQ7cRD9uMVZoqg49bUEJ+dIkWtUlp2
         iCqwUeFvUwIQdrwRgqck4uI3I+MHWhopoWk2WF/UF5sY3R4iH3gljBVLE/S9GonQpcyk
         fXMJwEmwcL5YPVaFFb5guvdCDDoM+kc51UcitrUDHKlQbBoq7lsAEviaFwhUwmJS2M35
         g6T/jwRxwTWIPKi4KN6RYQEo1kcIgZ+5GUtarOJMofilJJjvRly8XOWXhIbXodXhvPNW
         LdbQ==
X-Gm-Message-State: AOJu0Yw8NBoVDuSQVNogXjlj2y2J2mZQwzJLn7m5vEeAzl3J57cIJ6Jv
	vOcQ7kSrURqA0bZfyxUJ9RxRzpJHpxjmPCtGmbYPrGzn68IaJVz2qACYPLZBzRh5
X-Gm-Gg: ATEYQzzqDbk5H9i8XsZ8iklByynZ9JByL4FZBBZxzGNGqetaeb5gOEWF+49lzHNNhhr
	4CucG+1X3VberHPChMXQ5ylgDbn8iSZsnE71qOvb+pN/tuJTFQ/ziiWro+NG+yQms69nfD1OCAW
	bfiSlA5+zyZko0yIzzZQOlXM6MFX0SbrilQq/ctTeaekKmznk9axNXlDk51JcZwqqNW668+aaoq
	OH6SGPATaWxKK15CW+YOjIqp0KFkCL3rVrn8NgnqgNMoI9VIVP+sadtu4MmGwz2StnDSxIUeLd2
	K3Yv95OUowS/cJiQkXQKiPvnEu+aJh7HaiOxHcztcroDyV/7uXNAGyIzBGOtF6pN/PzGSlJ2MRP
	KYRJzOwCpYd4x+whQ9xW/s5O02DCFzfMVaf7TCDsEkL2d1DRnYprbJAJSN0jpK9dbbeFeDkCJeI
	1r/mjhyQZThfTJ4OqND4uLcSdJ4KqJONrNaHWk7t7OwRVUvDWW9vz5nxgx103x
X-Received: by 2002:a05:6102:1612:b0:5ff:c40b:27eb with SMTP id ada2fe7eead31-6054fad1639mr2875825137.3.1775034985573;
        Wed, 01 Apr 2026 02:16:25 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60512a4eb23sm15123272137.5.2026.04.01.02.16.24
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 02:16:25 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-6054aa7f6cdso598080137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Apr 2026 02:16:24 -0700 (PDT)
X-Received: by 2002:a05:6102:1612:b0:5ff:c40b:27eb with SMTP id
 ada2fe7eead31-6054fad1639mr2875794137.3.1775034984459; Wed, 01 Apr 2026
 02:16:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331104527.29170-1-wsa+renesas@sang-engineering.com> <20260331104527.29170-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260331104527.29170-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 1 Apr 2026 11:16:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVeecbOGg=BmE77TOPiZJMUYVMVZe5CarAevG==2PY+sA@mail.gmail.com>
X-Gm-Features: AQROBzCACAAYhX0LlldUsis3TA40fwjqLLc01f-21kK_rvF1kKhk_-En1E2jytw
Message-ID: <CAMuHMdVeecbOGg=BmE77TOPiZJMUYVMVZe5CarAevG==2PY+sA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: soc: renesas: Document MFIS IP core
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Marek Vasut <marek.vasut@mailbox.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,mailbox.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-30681-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.972];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,glider.be:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux-m68k.org:email]
X-Rspamd-Queue-Id: 70C2B3777F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Wolfram.

On Tue, 31 Mar 2026 at 12:45, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Document the Renesas Multifunctional Interface (MFIS) as found on the
> Renesas R-Car X5H (r8a78000) SoC. MFIS includes features like Mailbox/HW
> Spinlock/Product Register/Error Injection/Error Detection and the likes.
> Family-compatible values are not introduced here because MFIS is usually
> very different per SoC.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> Changes since v2:
> * added interrupt constraints
> * fixed whitespaces in example (Thanks, Krzysztof, for both!)

Thanks for the update!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas,r8a78000-mfis.yaml

> +  interrupts:
> +    minItems: 32
> +    maxItems: 128
> +    description:
> +      The interrupts raised by the remote doorbells.
> +
> +  interrupt-names:
> +    minItems: 32
> +    maxItems: 128

[...]

> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r8a78000-mfis
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 128
> +          maxItems: 128

You can drop the maxItems constraints here...

> +        interrupt-names:
> +          minItems: 128
> +          maxItems: 128

... and here.

> +          items:
> +            pattern: "^ch[0-9]+[ie]$"
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r8a78000-mfis-scp
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 32

You can drop the minItems constraints here...

> +          maxItems: 32
> +        interrupt-names:
> +          minItems: 32

... and here.

> +          maxItems: 32
> +          items:
> +            pattern: "^ch[0-9]+i$"
> +

As these don't impact correctness:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


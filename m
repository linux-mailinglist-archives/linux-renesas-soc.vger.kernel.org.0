Return-Path: <linux-renesas-soc+bounces-29862-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SH8zBdu6u2mtmwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29862-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 09:59:07 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4AF2C836F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 09:59:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 582E6301DF7B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 08:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D8FC2C0F69;
	Thu, 19 Mar 2026 08:59:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5373A36C59E
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 08:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773910743; cv=none; b=mZdQ0mcn4ofoXDIkpi07kQ6fOiO6YoJCKaysMso+P6sQ1TXyWHSpq6J0CStPC2+cRDIb8Ie6zeIAdWS70V8e1FgXf9NliB4Zg6vWHUfI5QI+Hs63/k9O04PAiJi8/BqI2t3SCTfOhx4bu64MopuLEBos9zzQTEzAEA3xCh3mnLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773910743; c=relaxed/simple;
	bh=YGTwpQzIvHWGjdoEaD+D2VJMh4Ez8jRGQelEK9kjHlA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pu/E4/tORCobMsEfLDft0xLvMU7O33OLQrZW8pq/tWDp0AMGsRQv1pmmvhNGU4ssnvZMrbZPXPFWtbGxtPOv8F+uVCp4JSMqNFsTsVd3GYcEEJZjGsRIzk0M1UVjecBX4mOP6i6J+ICHO7WoayWJAcMQvYXWg9mLMJiG9Zu2oFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56b91ead558so618920e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 01:59:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773910741; x=1774515541;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eQiOGNjrlF0W7IpjRFbX2kJ5/maB+OtkUbfGmKFJXKY=;
        b=RA97SQe815MiTbKvjDjKLigQtsteJsTGRxnSNmLd0mhMZLBe2hJmi82uCsNDV3sJ3K
         KBz38hVqk2mk7ifGPMjl109pRIY/DMWesFEnh4Q95OpiApAJeN87wLae1t2DtgOB9vGL
         tJDeeHtaBV9aAyVqUyLyTyMkvwuybd7D/Zhsau0jV8GISQuzZWh9KPuecMuUuUK0Sc2g
         JalQ8zJMW9I6+RiPGl/2LUdAIy+5iU2VUmIYyU718ycFRORjUFl1KYjW1R+QYazcCET9
         OVcMGqmM7ql1ILNi9KxH0PC71uaKZHPzE/n0HmRgxOY3hKAhEv7mLii4J0do0TJNKLD3
         Ffsw==
X-Gm-Message-State: AOJu0YyBN0Qy04rwFjtXjp3uWHiD+IAcR7TEdyGFRc3FbY6Loe++vyRw
	1k0KSdik3i01lnqFQ3xTAZguYPMNODWbl3N5tT1YIqJtXHQrMyL1E3G7hfDzzf0p
X-Gm-Gg: ATEYQzzcvdNjnh+ScC2ebiGO6twwOLOlkiF90/z5cHetp6gJCNv5l9dKbssQ/ZfT65x
	TOMoIGDck/Ks6zvdMtuliUmQJbHYjm4Br3ThfVSUNL1NONFWwjINlfkM6JWDFjNGE+Ve0AzoEfQ
	kkGZHG19YthJHSxFwMCrM+lK8RDtExiV8KNUqDuL2rraFwnJ/+8ilHwLNCf7JiMy1xi3hinBTks
	EqM97lE3AqoRchbYEiRTpJF+5Wblr7eDIvP4UP8H2KVvmMkmItUVRlwn8TYr4ktbFtHlBK7mE4P
	9IYw/UQSVoGjrQDZIPS5UR6I7IZhc/k3JiP3azU2AvE2bzWIGovGQ1ynjjZ3cGh+jPsnWhvn2AG
	BEoTw620KQarH7yvMlYhdL2SVhlkBFSN0NxHKAAuPsTCJNZLNqk8vXOMBhTbmvpJqS3xFKvefQg
	6vkFeeSn22ElfP0ss++viXv6JDP6lXq8CJDiyOx4hdpxv3MvL1dwq6NS7rl7QXsfGyAWVZQrc=
X-Received: by 2002:a05:6122:893:b0:56b:7f53:9ab2 with SMTP id 71dfb90a1353d-56ba71426e0mr3841114e0c.10.1773910741156;
        Thu, 19 Mar 2026 01:59:01 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56ba7068a66sm3017012e0c.15.2026.03.19.01.58.59
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 01:59:00 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-94de68feaf4so362666241.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 01:58:59 -0700 (PDT)
X-Received: by 2002:a05:6102:419f:b0:5db:e77e:7828 with SMTP id
 ada2fe7eead31-6027d1342d5mr3477535137.16.1773910739503; Thu, 19 Mar 2026
 01:58:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317130638.2804-1-wsa+renesas@sang-engineering.com> <20260317130638.2804-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260317130638.2804-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Mar 2026 09:58:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWwNiaJuYYeZSuYpFQsOwofrTQGRnjav+7Bm2kvWL5y6g@mail.gmail.com>
X-Gm-Features: AaiRm53gTgwWAQvV9Ga2Rt1r_UP1RbSSHQoHo8-A_OqjQ42_pPVPDTUUq-5eAeU
Message-ID: <CAMuHMdWwNiaJuYYeZSuYpFQsOwofrTQGRnjav+7Bm2kvWL5y6g@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: soc: renesas: add MFIS binding documentation
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jassi Brar <jassisinghbrar@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
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
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-29862-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.134];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:email,linux-m68k.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,devicetree.org:url]
X-Rspamd-Queue-Id: AC4AF2C836F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Wolfram,

On Tue, 17 Mar 2026 at 14:06, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Add device tree bindings for the Renesas Multifunctional Interface
> (MFIS) as found on the Renesas R-Car X5H (r8a78000) SoC. MFIS includes
> features like Mailbox/HW Spinlock/Product Register.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas,r8a78000-mfis.yaml
> @@ -0,0 +1,160 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/renesas/renesas,r8a78000-mfis.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas MFIS (Multifunctional Interface) controller
> +
> +maintainers:
> +  - Wolfram Sang <wsa+renesas@sang-engineering.com>
> +
> +description:
> +  Renesas Multifunctional Interface (MFIS) provides functionality for

The Renesas Multifunctional Interface ...

> +  communication between different CPU cores. Those cores can be in various
> +  domains like AP, RT, or SCP. Functionality includes features like
> +  mailboxes, hardware spinlocks and such.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - renesas,r8a78000-mfis       # R-Car X5H (AP<->AP, with PRR)
> +      - renesas,r8a78000-mfis-scp   # R-Car X5H (AP<->SCP, without PRR)

[...]

> +  interrupts:
> +    minItems: 32
> +    maxItems: 128
> +    description:
> +      The interrupts raised by the remote doorbells.
> +
> +  interrupt-names:
> +    minItems: 32
> +    maxItems: 128
> +    items:
> +      pattern: "^ch[0-9]+[ie]$"
> +    description:
> +      An interrupt name is constructed with the prefix 'ch'. Then, the
> +      channel number as specified in the documentation of the SoC. Finally,
> +      the letter 'i' if the interrupt is raised by the IICR register. Or 'e'
> +      if it is raised by the EICR register.

maxItems could be moved to a conditional schema, based on the compatible
value.
The same is true for the pattern rule, as MFIS has both "i" and "e"
interrupts, while MFIS-SCP has only the "i" variants.

> --- /dev/null
> +++ b/include/dt-bindings/mailbox/renesas,r8a78000-mfis.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Constants for the mailbox part of the Renesas MFIS IP core.
> + */
> +
> +#ifndef _DT_BINDINGS_MAILBOX_RENESAS_MFIS_H
> +#define _DT_BINDINGS_MAILBOX_RENESAS_MFIS_H

The include protection does not match the filename.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


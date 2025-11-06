Return-Path: <linux-renesas-soc+bounces-24249-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 04401C3B6BE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 06 Nov 2025 14:49:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF4FB188ED00
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Nov 2025 13:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 120BB3328FB;
	Thu,  6 Nov 2025 13:41:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0640D1E0DD9
	for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Nov 2025 13:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762436502; cv=none; b=Nj1ncVLOolnue1MRWzPlFiRJcqVXRIBN2R2iJJhU9Vejnzd8MsDeNqblBsDvE/HWtrfXqQ10Di0ebATZ6gDZs6DeUBG9XPzqOtYExWoIqKLVgrbohg5InI9cAb9oPOzC8TeXOddhUNs6pSuL3rox/w4K5FQoJipQUd66OuRK9PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762436502; c=relaxed/simple;
	bh=I3VUE6vhtWsWrhjiq89donvlpgI2hn86BAEVlUadz4E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J43L+eXQ1XNFF5/t6p97qK+JqrM1fqY4fiEaPCrDWAwdgdrOUY4KS4c4c7MxFLk459CEFUZZhG6IIrtxxPJd99yBWn4AphYWZDi56qLMuKjrEr8DrbIBnlpkuK9YkVRuZouWR07l8r/ud/7Q9Ko3jdrdvPWaU5cPrB1V96IhIvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-935356590ddso279780241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Nov 2025 05:41:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762436499; x=1763041299;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1zvXQzHMZF+ClpmnJuOqJcZtH05R/CK4p6fsF3c0XaE=;
        b=tzWgAz8scurSo4P+4F4eVVF03eZYcxs9PksjgXqTDwCsFVa3JZaJxwuG055HDNeEZe
         JRJLmZaI9wjji+TOOpv2NTz3Qm8VJJCnQHUc+HRKbpojSUnJnXyM57hkVil8BTxXhkbr
         Jo6Acga3fgucfWTvfCLpdlpGn0h+H4zrEz5qlHwaMirngmD4kf6vks/CfT/FEe36Sq2y
         qbkQfFFEftf6Y+K1fqvFxnz+ZxzBdgHf1WVY6jR7oVIh8UXzDESQK+ZxNIGJIm7v1Bfs
         p4nr7INiQEmH8F41l7mi8A3LFp4C6Xaiv9TVGxKh2EEpYjVtgLO2Asf06OA7ZipHGRHN
         5g/w==
X-Forwarded-Encrypted: i=1; AJvYcCXQJgBcF0fO06Iy8QvdYN69o0MEUhOXrWsrhio1pHvlV4i9JZFOmyhxmT8UwC24rplqYeysjxtMPpO0hpqRkIAgZg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6QE52EixaHQfDaK1vzE3Ry90MXpf/7BievFQob/Q/jf7E2Qix
	sYT+LHkdt7aSMryN18KRJBgIrEQ4fTDJz58bb9gnIVAZHGqOp2VSVVgT4ZAREgAJ
X-Gm-Gg: ASbGncsWyn25GaxTS+hTKbKiLRsN0pEbN3hP7rtDN7EQa6//dlVoIJUjtbReCL1kpZm
	Q8sx6cwEQwcw4RdX1c3XVhZNuzJYtfcV+si6mGNmcXgJhdoqbgrUwVQjlg0ctVdtABevrV6rpzQ
	IfGKGxXIHdDDH04dO6C1Rks0NJKsKzBKU0scW6IWwPAcU5zneUlJIr+wPv7rMbUZ547f2tw9I1M
	1iIUwYVD3RE08igm3iau0lLTg1HrGyXAGJv2Ym0MFZC6rK8ubtbaZ1dnGSinkOWWx1yxj5ln5xo
	6RN6gfQMK53G10Q5wygBW/OsuP65OHJEcnwkvI1LpCD/bS6Nkza4xPIEh6o7aTsby/d0IY7SqJU
	XDynfywnZbZni6UeaC3XNKIfrNY0UhdPoWgmGcqtuxFpmGw1v5AiBAVsxZLKqPmnpljVGRKB6ei
	9PczvPfbj7+uPdRo6AgQ++wde2P8mPKlebTheLgzLJAA==
X-Google-Smtp-Source: AGHT+IH2XHm8UdFwqcWU4tolIlCzThYBDfLDnEkMjIRpnuFPDhEqNd8y1OxEKvST1tABPXZEFPBo8g==
X-Received: by 2002:a05:6102:e08:b0:5db:417d:923d with SMTP id ada2fe7eead31-5dd891f95d7mr2234858137.22.1762436498584;
        Thu, 06 Nov 2025 05:41:38 -0800 (PST)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93708aa2ef2sm1027628241.14.2025.11.06.05.41.34
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 05:41:37 -0800 (PST)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-559966a86caso214819e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Nov 2025 05:41:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVzCpIZfo0bK1NmoMKVlg5BhGWo+bgD20m4TTESgtitglByCKAIqFxDc8GFOoX4iIP/ZYf7oPnJTnrXK7Z2hYIaHw==@vger.kernel.org
X-Received: by 2002:a05:6102:1620:b0:537:f1db:7695 with SMTP id
 ada2fe7eead31-5dd891f5d34mr2214888137.26.1762436493734; Thu, 06 Nov 2025
 05:41:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251106-add_l3_routing-v1-0-dcbb8368ca54@renesas.com> <20251106-add_l3_routing-v1-3-dcbb8368ca54@renesas.com>
In-Reply-To: <20251106-add_l3_routing-v1-3-dcbb8368ca54@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Nov 2025 14:41:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVYzpJ8iqyPqbR7Bd=qpqDyV=GJ+Vw5fZ2G2S27gYO4+w@mail.gmail.com>
X-Gm-Features: AWmQ_bk8o_RbFEO18v2EcWGSAt2mahWgELrgaPK-1AkGfKDcrGdbiBTIxT5Zu7E
Message-ID: <CAMuHMdVYzpJ8iqyPqbR7Bd=qpqDyV=GJ+Vw5fZ2G2S27gYO4+w@mail.gmail.com>
Subject: Re: [PATCH net-next 03/10] dt-bindings: net: renesas,r8a779f0-ether-switch.yaml:
 add optional property link-pin
To: Michael Dege <michael.dege@renesas.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Richard Cochran <richardcochran@gmail.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Paul Barker <paul@pbarker.dev>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"

Hi Michael,

On Thu, 6 Nov 2025 at 13:56, Michael Dege <michael.dege@renesas.com> wrote:
> Add optional ether-port property link-pin <empty>
>
> Signed-off-by: Michael Dege <michael.dege@renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/net/renesas,r8a779f0-ether-switch.yaml
> +++ b/Documentation/devicetree/bindings/net/renesas,r8a779f0-ether-switch.yaml
> @@ -126,6 +126,9 @@ properties:
>            - phys
>            - mdio
>
> +       optional:

Doesn't look like valid syntax to me...

$ make dt_binding_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/net/renesas,r8a779f0-ether-switch.yaml
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json
/scratch/geert/linux/linux-renesas/Documentation/devicetree/bindings/net/renesas,r8a779f0-ether-switch.yaml:
ignoring, error parsing file
  CHKDT   /scratch/geert/linux/linux-renesas/Documentation/devicetree/bindings
/scratch/geert/linux/linux-renesas/Documentation/devicetree/bindings/net/renesas,r8a779f0-ether-switch.yaml:129:1:
found a tab character that violates indentation
  LINT    /scratch/geert/linux/linux-renesas/Documentation/devicetree/bindings
/scratch/geert/linux/linux-renesas/Documentation/devicetree/bindings/net/renesas,r8a779f0-ether-switch.yaml:129:1:
[error] syntax error: found character '\t' that cannot start any token
(syntax)
  DTEX    Documentation/devicetree/bindings/net/renesas,r8a779f0-ether-switch.example.dts
/scratch/geert/linux/linux-renesas/Documentation/devicetree/bindings/net/renesas,r8a779f0-ether-switch.yaml:129:1:
found a tab character that violates indentation

> +         - link-pin

What does this mean?
Description?

> +
>  required:
>    - compatible
>    - reg
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


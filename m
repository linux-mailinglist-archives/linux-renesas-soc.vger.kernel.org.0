Return-Path: <linux-renesas-soc+bounces-30212-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aSfGDeuzw2mAtgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30212-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 11:07:39 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3605322A92
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 11:07:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7569E3011D6D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 10:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02B403A6F1C;
	Wed, 25 Mar 2026 10:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="fWKRmQCZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEC63A6B86
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 10:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774433232; cv=none; b=Oy4ONsD0DQh7eCmy8v1rZFRsNzsiRxkxbY+aJb0d5pSsp6UBSs7oZNLYBOdc7djUmEilbmW2HsU2PhFNqNF2beQ06kq6q1FOo0Yft2P2QxXIIAeQbVtIOWMzx1UUoxuZNJl2I13spI0R/aOcDJ5YrczV48bdgaj854BDaqycieU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774433232; c=relaxed/simple;
	bh=apamlTRhsBViFoeuvdnfL5b+zzJNBiDoYI4efu08/KU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IT+iMzXYUQ0I0TIKT+QEcZQ2wZzcqwGh6Fy5hILX5rZ0E+UFzJ12HWyE7xdhZkCRLHaok5rVtKR+uRdGbO79FsSQpPKFUr+aLvvGKGwsP16Mc/HhFI+shKHTaX72dBrIZ6FqwQQBeZ56DLHpCdy3flld33Xh7vHmVcQhUB31fck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=fWKRmQCZ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-486fe2024a9so37265005e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 03:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1774433229; x=1775038029; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=spPSeOBKCjDbgacjZSL9Rf9EOaB+Mz7lDWKQPHUIwrI=;
        b=fWKRmQCZZKxerEQ+WvLKH1nEKuw8Ebx+17+zsRwFxWCYMdNbFlCKwoCTV5oo75PGNB
         z7RHlK9t/aWlUOgcSghYvqjWFrAbquBW7a9yA7RHoAM09sVB1IeS512TE63U3aB0UFFJ
         yoRSgT+Y/4zOMP9oaL5pIzyRz5JgTNllbjqrgT7pN0GAfNE19Iwi9PDmwtDRP2Qo8zJ9
         pGLyDxDRVl32rqkFodMMJ/cSc586Ad57EisJsWStWcMlXf5eXnJd8DeSVRCpJUlrDpy5
         g/Ohx6Mldxi1LG7HymiMZmYen3y93EDUYhGK30HFY0XY6oAqutpLTwQxT8hyN7QBFc/o
         R1+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774433229; x=1775038029;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=spPSeOBKCjDbgacjZSL9Rf9EOaB+Mz7lDWKQPHUIwrI=;
        b=C0pq65Oxh+X6PUJSVoIDaDYzdoVzM2lJrdP/K/BJHH+CQcKK5QwF6RzZ53N3tiTvLI
         i/DwXu2koAd1BrQJ1WrPGgTb3hkFkM03U4bcHpQhbhFG7rrqn/k4BaUGyCCYdbvLaV/1
         YDvbgyVFYoqPKt4U9hFwt0dO/WHp/g+LmcoVsiOqYAFc05jBZhZwSBnhzJOdFRcG1QJf
         jJr/GBzqXgXQkdi6CquLfXSxY9pIiF0gemP2LmAEShaVdGCIlGB6hRy4SmHbjBFzvj7E
         ACdCWAVb982LJyVKasj6+6j4dO0oTk4epF1U4cnARMiDZ/5AVMVzX1G0d1BMZKcRN9FK
         2QJA==
X-Forwarded-Encrypted: i=1; AJvYcCUG5lQPM8+Tbr8VPi0GHuz4zs0jkz3tTiJoxTbfkpE977ElPvEaEfkoqCb6A3nT8T5l3qFWqn4coxmNZ4Y3CJmc5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YybIpMzmlHHCG5SVvS8Vs1Ls1yRUq4WsD6PbKom/7SRexvko9BC
	kAjWChYqofNs3mn0x1QQvoZze1yVeeg1L7jFsJ88IALKys9F1Ivk/sizdCQUZeMfj48=
X-Gm-Gg: ATEYQzzlZGT7X1ehvxYd689UWX0lIdxY2S6qDap1PyZmr/X91LYc6JrKb60OusyuV6/
	fVD1p+68Whxzo0xHbxbmBysaEdzAnOx2k0Jp7+Z3uZg6RHtqP98uMJ4wMO+gek6H0EP7TJcZXq+
	Cdkeay5uMs179ph4p0K7pn3NlboZjLhhgWcs0+dX7MGvAUCsWcmlGszkTV7yIfZGDHwdqER2fHB
	xHbuaakSJ5fZvfpTpqdB5zTkqdwV92UR6tm+fCCbA90noei0THbMYy85WqM2iGaGvJK/Si+zKJW
	0SfU1HPb20E5L0DhEfaZmHhd7pgUz+y0fU50U8Bma8efA2T+lyS9Lc7tABMSL77uzFA+bFXrC4F
	Cwq/vJiEnWWNUVeu5zE62cYhtlnws/deiTHAtNmBXquJ449Pjo7xsogHBfxMbu8arnZgn9E+RG2
	LKMG1Z7A6XY7uHer/WpKRr3l6F/noEwIM=
X-Received: by 2002:a05:600c:5020:b0:486:fc61:541f with SMTP id 5b1f17b1804b1-4871606c94bmr44650615e9.29.1774433228747;
        Wed, 25 Mar 2026 03:07:08 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64711f58sm47028348f8f.29.2026.03.25.03.07.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 03:07:08 -0700 (PDT)
Message-ID: <e0e4085f-4a9d-4ae8-80b8-d798c8408d84@tuxon.dev>
Date: Wed, 25 Mar 2026 12:07:06 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: pci: renesas,r9a08g045-pcie: Add
 RZ/V2H(P) support
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: John Madieu <john.madieu.xa@bp.renesas.com>, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260318124450.163471-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260318124450.163471-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260318124450.163471-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30212-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,bp.renesas.com,google.com,kernel.org,pengutronix.de,glider.be,sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[tuxon.dev];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email,tuxon.dev:dkim,tuxon.dev:mid]
X-Rspamd-Queue-Id: F3605322A92
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi, Prabhakar,

On 3/18/26 14:44, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add support for the PCIe controller found on the RZ/V2H(P) SoC. The
> RZ/V2H(P) controller is similar to the RZ/G3E variant but includes
> additional registers and configuration bits for PCIe lane control, and
> supports multilink operation selectable between a single x4 port or two
> independent x2 ports.
> 
> The RZ/V2H(P) SoC supports multilink operation, in which it provides
> two independent PCIe channels (channel 0 and channel 1). To correctly
> configure the multilink mode and per-channel PCIe settings in the SYS
> registers, make the "linux,pci-domain" and "num-lanes" properties
> mandatory for this SoC and restrict their values as per the SoC
> requirements.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>   .../bindings/pci/renesas,r9a08g045-pcie.yaml  | 22 +++++++++++++++++--
>   1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
> index 858ec02e6d62..57807d0abd9a 100644
> --- a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
> @@ -14,7 +14,7 @@ description: |
>     with PCIe Base Specification 4.0 and supports different link speeds
>     depending on the SoC variant:
>       - Gen2 (5 GT/s): RZ/G3S
> -    - Gen3 (8 GT/s): RZ/G3E, RZ/V2N
> +    - Gen3 (8 GT/s): RZ/G3E, RZ/V2H(P), RZ/V2N
>   
>   properties:
>     compatible:
> @@ -22,6 +22,7 @@ properties:
>         - enum:
>             - renesas,r9a08g045-pcie # RZ/G3S
>             - renesas,r9a09g047-pcie # RZ/G3E
> +          - renesas,r9a09g057-pcie # RZ/V2H(P)
>         - items:
>             - const: renesas,r9a09g056-pcie # RZ/V2N
>             - const: renesas,r9a09g047-pcie
> @@ -220,7 +221,9 @@ allOf:
>         properties:
>           compatible:
>             contains:
> -            const: renesas,r9a09g047-pcie
> +            enum:
> +              - renesas,r9a09g047-pcie
> +              - renesas,r9a09g057-pcie
>       then:
>         properties:
>           interrupts:
> @@ -236,6 +239,21 @@ allOf:
>           reset-names:
>             maxItems: 1
>   

There are empty lines b/w the above if-then conditionals. To cope with that 
maybe drop this one here as well.

Thank you,
Claudiu

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a09g057-pcie
> +    then:
> +      properties:
> +        linux,pci-domain:
> +          enum: [0, 1]
> +        num-lanes:
> +          enum: [2, 4]
> +      required:
> +        - linux,pci-domain
> +        - num-lanes
> +
>   unevaluatedProperties: false
>   
>   examples:



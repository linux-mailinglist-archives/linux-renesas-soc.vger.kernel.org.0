Return-Path: <linux-renesas-soc+bounces-27752-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8K0CGV+cf2nquQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27752-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 01 Feb 2026 19:33:03 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5694C6E8D
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 01 Feb 2026 19:33:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9D6D13005ADE
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  1 Feb 2026 18:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF5B3285CA2;
	Sun,  1 Feb 2026 18:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gRe+PL7N"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1068126ED3F
	for <linux-renesas-soc@vger.kernel.org>; Sun,  1 Feb 2026 18:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769970778; cv=pass; b=enJefoz9wIBU09bW7ITaLhehXmA3HJNeFfO438a3CI9JmhRbSMsNKd7b5Ta/CV9pGsWIBHcLs8Vz0Nz/9gH86wiL+VWbA6dV/8fLOCNCq1H8Yi+mSShVIJGnRhrTZSYepfjSmMl4Z/2+9HGbtGkoVJMBsrfApsbfnCCkB+QUz/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769970778; c=relaxed/simple;
	bh=pP1EcKUp0Obc91QoIn3dRXRglJZi9xV/l61ZM8bGAFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ethcdqUqcUoFfb8+lW+zLqmPxPnWusOUTJeYi4yCPvmdJEIc0oTMJmL/Qiyi6o3i5rkuXAST077nUXlhzUBrrrcW1W7Q6NXl/cLCFuufeo6cr+nDgmJLrJ5SuzmG+vIu3CSuhsRGH7SgKerN0n+taNhCrEA1LGA09POtSqFirXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gRe+PL7N; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4359108fd24so2270500f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 01 Feb 2026 10:32:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769970775; cv=none;
        d=google.com; s=arc-20240605;
        b=ULrwWQIv2T11OEVkdAS62g637SPpBCZTB1ghkCVRx39pBTDyTWud61/wAr4ETJVUE+
         IqCnYE6s2htiYWlzmIx6Xeaury1PWWD5iuXL7QAYrrhL1zhigJFnnmPyJEsfNrSWZj3X
         DJcyi759PF6uqowT5zQajubz4A47veq3gVF8lOeQ+EQ3yZ8dyVtknqckjio8X/FMhvpx
         7Dg0XQvcPzOHhhYGTmWzrZgmwUp0X/nFLpgZvv0uVd2efacu07rQ409TgqvgLXe8rz4f
         scOCEIyYSJr55xHtIoYSNtAcPOddxRh01/B/0d9v3v+khCO6K00q2ki2br3Q0jmyKDk5
         t7mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dgSvF2RRELEBOWZ0YB1TII3YvY1Cgd+o1QMdp/8NR7s=;
        fh=eOnfMzQNQOlU0NmFw4iP8OvujiKJEEHKfi6V7Sb2VVc=;
        b=MC8LrzsmFrMerdK1nJucIC2/KAYh/PStQd0ZJjSKYsBT2g0rfzTxvc0Pqjtv5/89IN
         nVFntHLTRpATiowQPMhBiKWraFnX2MmBwnPpLO6ymW9XRK8kFhEwvMIVJCBevL8SfLDx
         ow2b5ZmU5FVNFSGJFI+j0YTTZHYoLBhH4sXsU7FL7lbb6BY4JAEeJn/tUGIYcfnC4wWe
         xnoImhkwSo6wQjgkWExlokmOesRdAQRToIrIZtSeV7j3hWsQZkrIWjenJVyCtwOy7N5v
         eclfm09hLu5Ts0QyCUtMg1XKLpCLx6/waawos9SG2QMyfoIr8hbirIH3t2dVPnw+l5Kz
         xmAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769970775; x=1770575575; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dgSvF2RRELEBOWZ0YB1TII3YvY1Cgd+o1QMdp/8NR7s=;
        b=gRe+PL7NJGrLMKHId73a3sbBpWXU1pzAMRLgauaPC/Lk8TTM1PoTii5XZyf1u4KmTl
         PX2VuqvsF5fABi4lc8EzHmvyXGUYIMHyz7LUFC4+t5InFuM4TpewGNLjz0WTN+wkija/
         LUEug1hlhjx9bmDPD+mhZPzLTQFqSESChjWV+8TavvLAsORR22TRDXMtPVU5VRbD9yCR
         YQnSLOSw2qr4FyuSCz+qNZ8C/CwxFlJ/RDZioBVL2MOn1p3ClNRsS46+cUYpbqkCwqWn
         2JIhfNmzLP5+zfNqEJYHTC9T+pdJmhTvd40who8RYho6p80JTqfPXck9+2EAg8r+zTQq
         HkHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769970775; x=1770575575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dgSvF2RRELEBOWZ0YB1TII3YvY1Cgd+o1QMdp/8NR7s=;
        b=eK8EbP+m021MY8oXYp0xQMLtEQCpQFaw213wxMN0KeHlJcNtdA8zKQ7ODa7w3kRP7Y
         /A9BDGhy5xl/AsT/Ag33FRUW110/Snez/W8OqgqAIbMvE8K0yxc1/XIpWdnQys864lKn
         6TDC9OEZWeAPO85ZN+vavGlbbiBBXo7n+bmg/uQi0ynz23hGvUYJbSAXms18t+2jAimT
         wDZaVw5KaV++Raly5XJuJu8uLSm5ANK6YJKr/GXZ4CdaPZ9uVYu5Ukm63Y4TGWpl+7So
         7Z7ycl2j+r5k2vkFDotTtj4ECJ3YuVv0LbtLllEYezVZI0yCMa4qb+eCsbpoCBxncRFi
         Qy3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXrLjyJCMU0PmppHomXGinbvmPXHEXNX6fu9HiOHmqpjcQTH+KJWST3LzaWwBRziV8yigOuPy9P6anBbtXxYuTqEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqM8UliU/VOzxznCdqptP2WHlsE5IsVttYMbm6qPnGy5r9xZSm
	dch+T1TX4iOSDejlwBa64n8W2/XRpXrU6ItepAO5TRPB2HUSRQ12D8E0KmQxaLG1vDZKXnN9eZ0
	KUhfcrkk5I+zS0S1ctdg01jhZTR+u3jc=
X-Gm-Gg: AZuq6aLD6HcHpF9SoksB8dDFeA7PStx0uQG8zzZnH5B4+Ovw86g4gDSdtwFsr02I+kP
	nHaEAqRNCBbhKskNQJIXUfssGWPQozeM87sKiHy1BhQXUKU8lvd/TzOYirnIz9Bkr/pDweKXyh1
	WZdNwe0h0zctofy0YEc5FyZEacU6YN+k/bMFjQLdaafvvfAN9TrrOuQGnpow3424l0Sh9FX8Z0p
	g1ByO//geqzJ2lICO/Z1ZDQ9hIygBRsuiHFISvtErjgKDqixSTEAEyJRa4Xp8rZaEjs/nMsnE1m
	kpFOmuZkheBasyNlHU6iMTDVcm4qdnvt/WdymbPmV8OgexQhZ03586Rngg==
X-Received: by 2002:a05:6000:2012:b0:435:e3bd:5838 with SMTP id
 ffacd0b85a97d-435f3a8cc99mr13774929f8f.25.1769970775127; Sun, 01 Feb 2026
 10:32:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260131161250.5047-1-biju.das.jz@bp.renesas.com> <20260131161250.5047-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260131161250.5047-2-biju.das.jz@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 1 Feb 2026 18:32:28 +0000
X-Gm-Features: AZwV_Qj-lnrOjSZwtlnDvG1kb23vqI02UlVdBWiJHPKhU5KkZmmN8wie9JHFLtc
Message-ID: <CA+V-a8vL-Ze5J0sUcpuD_fDX0xixF6MQWuxXzz5dRW4VYydWiw@mail.gmail.com>
Subject: Re: [PATCH net-next v3 1/2] dt-bindings: net: renesas,rzv2h-gbeth:
 Document Renesas RZ/G3L SoC
To: Biju <biju.das.au@gmail.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27752-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[bp.renesas.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,glider.be,foss.st.com,st.com,synopsys.com,vger.kernel.org,microchip.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,renesas.com:email,microchip.com:email]
X-Rspamd-Queue-Id: D5694C6E8D
X-Rspamd-Action: no action

On Sat, Jan 31, 2026 at 4:13=E2=80=AFPM Biju <biju.das.au@gmail.com> wrote:
>
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add device tree binding support for the Gigabit Ethernet (GBETH) IP on
> Renesas RZ/G3L SoC. This SoC uses different Synopsys DesignWare MAC
> version 5.30 compared to RZ/G3E.
>
> RZ/G3L requires an extra clock compared to RZ/G3E and has pps interrupts.
>
> Add a new compatible string "renesas,r9a08g046-gbeth" for RZ/G3L SoC and
> update the schema to handle hardware differences between SoC variants.
>
> Extend the base snps,dwmac.yaml schema to accommodate the PPS interrupts.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Fixed the typo ppt->ptp as pointed by netdev-ai[1].
>  * Keep the tag as the change is trivial
> [1]https://netdev-ai.bots.linux.dev/ai-review.html?id=3D495cbea4-c154-402=
7-9ecf-0167906492fe
> v1->v2:
>  * Collected tag
> ---
>  .../bindings/net/renesas,rzv2h-gbeth.yaml     | 77 ++++++++++++++++---
>  .../devicetree/bindings/net/snps,dwmac.yaml   |  3 +
>  2 files changed, 69 insertions(+), 11 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.ya=
ml b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
> index bd53ab300f50..fb60f745a1ff 100644
> --- a/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
> +++ b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
> @@ -26,6 +26,9 @@ select:
>  properties:
>    compatible:
>      oneOf:
> +      - items:
> +          - const: renesas,r9a08g046-gbeth # RZ/G3L
> +          - const: snps,dwmac-5.30a
>        - items:
>            - enum:
>                - renesas,r9a09g047-gbeth # RZ/G3E
> @@ -47,13 +50,17 @@ properties:
>    clocks:
>      oneOf:
>        - items:
> -          - description: CSR clock
> -          - description: AXI system clock
> +          - description: CSR/Register access clock
> +          - description: AXI system/Main clock
>            - description: PTP clock
>            - description: TX clock
>            - description: RX clock
>            - description: TX clock phase-shifted by 180 degrees
>            - description: RX clock phase-shifted by 180 degrees
> +          - description: RMII clock
> +
> +        minItems: 7
> +
>        - items:
>            - description: CSR clock
>            - description: AXI system clock
> @@ -69,6 +76,10 @@ properties:
>            - const: rx
>            - const: tx-180
>            - const: rx-180
> +          - const: rmii
> +
> +        minItems: 7
> +
>        - items:
>            - const: stmmaceth
>            - const: pclk
> @@ -88,6 +99,22 @@ properties:
>            - const: tx-queue-1
>            - const: tx-queue-2
>            - const: tx-queue-3
> +      - items:
> +          - const: macirq
> +          - const: eth_wake_irq
> +          - const: eth_lpi
> +          - const: rx-queue-0
> +          - const: rx-queue-1
> +          - const: rx-queue-2
> +          - const: rx-queue-3
> +          - const: tx-queue-0
> +          - const: tx-queue-1
> +          - const: tx-queue-2
> +          - const: tx-queue-3
> +          - const: ptp-pps-0
> +          - const: ptp-pps-1
> +          - const: ptp-pps-2
> +          - const: ptp-pps-3
>        - items:
>            - const: macirq
>            - const: eth_wake_irq
> @@ -135,6 +162,27 @@ required:
>  allOf:
>    - $ref: snps,dwmac.yaml#
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a08g046-gbeth
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 8
> +
> +        clock-names:
> +          minItems: 8
> +
> +        interrupts:
> +          minItems: 15
> +          maxItems: 15
> +
> +        interrupt-names:
> +          minItems: 15
> +          maxItems: 15
> +
>    - if:
>        properties:
>          compatible:
> @@ -163,12 +211,26 @@ allOf:
>        required:
>          - reset-names
>      else:
> +      properties:
> +        resets:
> +          maxItems: 1
> +
> +        pcs-handle: false
> +
> +        reset-names: false
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,rzv2h-gbeth
> +    then:
>        properties:
>          clocks:
> -          minItems: 7
> +          maxItems: 7
>
>          clock-names:
> -          minItems: 7
> +          maxItems: 7
>
>          interrupts:
>            minItems: 11
> @@ -178,13 +240,6 @@ allOf:
>            minItems: 11
>            maxItems: 11
>
> -        resets:
> -          maxItems: 1
> -
> -        pcs-handle: false
> -
> -        reset-names: false
> -
>  unevaluatedProperties: false
>
>  examples:
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Docu=
mentation/devicetree/bindings/net/snps,dwmac.yaml
> index dd3c72e8363e..38bc34dc4f09 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -75,6 +75,7 @@ properties:
>          - qcom,sc8280xp-ethqos
>          - qcom,sm8150-ethqos
>          - renesas,r9a06g032-gmac
> +        - renesas,r9a08g046-gbeth
>          - renesas,r9a09g077-gbeth
>          - renesas,rzn1-gmac
>          - renesas,rzv2h-gbeth
> @@ -142,6 +143,8 @@ properties:
>            pattern: '^rx-queue-[0-7]$'
>          - description: Per channel transmit completion interrupt
>            pattern: '^tx-queue-[0-7]$'
> +        - description: PPS interrupt
> +          pattern: '^ptp-pps-[0-3]$'
>
>    clocks:
>      minItems: 1
> --
> 2.43.0
>
>


Return-Path: <linux-renesas-soc+bounces-32677-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLTtBD0PB2qbrAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32677-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 14:19:09 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AC054F546
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 14:19:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 17E183149085
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 11:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34A88480941;
	Fri, 15 May 2026 11:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a6MT1tsx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BA5480977
	for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2026 11:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845734; cv=pass; b=CBacUmTiHeOGq6xQVpKiRpBQLk5D+v7luncYXYRErugvVxvym/WN2cSLzGO5E76p2piWnbCkh2+mC8T4a6uJUtNr0Dzx6JtUuXOxzabEhWoRgbVEcpGtbchq71KVqEDe7O7xNtX/HlBvX5ciDZlB+TOMnawLU0DLyWLpBJ6XLIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845734; c=relaxed/simple;
	bh=R2kaSodmffz6gXvU8DXS7cO2GFYMl1LTFjBKMYeFf5I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aKq3WJn7QzVJcIH23XMoNZ/s5XcS1YBl3607H2/HvGMrmwtXxlDufR8sOaFdv3ysG6Thg3AEGj2duLE/9ODxle2vPGqJo+O2Gy9WRZVPkUvQgCGncqbzS2WTr+vs3Czp5ZpowUkcMcCKf3mh5neSqsLL5YzM499+OOZlk0i2OdA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a6MT1tsx; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45297094718so7258038f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2026 04:48:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778845731; cv=none;
        d=google.com; s=arc-20240605;
        b=HYb18g5RyUvy0ZZPrm52RzFZvG1QtBHxqaiLK8gOQToxbs2KiNouJrgHIV5VWpznzK
         plFSIMrYoMfFbkGW+29ZkVnreN+jqFB7UlfnEipKZyElDMGMFSQtvtMYGj0PYpdKXLE/
         ZBC5ef2Mzzpf9WPQq6tCUkQkiOMM0Ss9SgfbwX5/Ouli5w8i59sTWNN2aW6flTC7Fhgc
         Dzie9qvpyMxEXa4StH7xsntlATMT0LKOEcD9Em/dE1q4SELC6ju08PvKnJiJ6Rz32x1E
         az84TPgYmVPuRoreJ/vm1g9W/NmD2AmNTvnwH4HjlzzmbHyTNcRPS2YdKASEBAgavQZj
         Se+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NjuSMtjvullePnYi7YI98+UWSJ0HXUTIXKG54JOD/HI=;
        fh=aF6gGpXWCcXMc5YwMS+2pE5T5xDXNh/PWMdo2CW1eiY=;
        b=C2g0tuWWyNcJFwqPBOLtecMXwqkvc8w16jXvzztayLny8OgzdabNs2/wUrqp/QKlgE
         6Ai29FVIVpnTb2isrbb8LsZ/aBABfi/8ah1n7fXL1e6qcsdEtZr91IkvrlU7YyLym4os
         B0X3RZRnGHYsHJlUQpuax2dnBebuNc4WRybAx9LhEwtIq+wyfgcyNGdr+gnWoPuvONUE
         H0AcORo8mn+jLnUzmayiT7PNOY+aTwR1PD0ed+UoJauQU2UoWIa5sTA783yZ+5ykfHkY
         VANPaqzUV3KBmwIjl6k/f+YWVRkxHfBJyysA0Sfqy7ZuCYLZ1rsMjqrkedaM08n0u5Ki
         NFfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778845731; x=1779450531; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NjuSMtjvullePnYi7YI98+UWSJ0HXUTIXKG54JOD/HI=;
        b=a6MT1tsx1dBhtYs7sy2vQ7GG5KzG8LNM9q5CjY4vgu2ROQ7ZNdzG/IKjRQ7pPQTCE+
         sTwB65Up78OCoBSvuP5t0xGlbEfbLX6FQTWS890XXGt+QouT4U9+/M3suE6tQjtue+tf
         iTCXtwquLTeeVdDJu53GplGNy6h1HvQhExeblwwJY/LHRz0YctvbgjmHPumLniwkNwGX
         Nr69Ml5Oe/cgjCeJF5RLgPHN6hCuRhdDfyAOD+TPAc01iN4QSbTLk4fljHzLJg0iszfc
         r0NTI3vlRT984WQOhFzzBt4sPDqMNeMnu0MEs3F0EKyZBKZguVxgDKa4VwuAoblMcJmC
         rLDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845731; x=1779450531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NjuSMtjvullePnYi7YI98+UWSJ0HXUTIXKG54JOD/HI=;
        b=ntTpzV033dHskBK6lD0KmwjF8Wh+tBfWRZV9UIwFeSZWKUCz5oKcmm+xCy5jNxCGIJ
         ZLAG1PThhoJ369Wceo2pnfw3/kClmn3qTN03K1d/GzaFhbH7chRfYUW5zfltRqYweDPN
         qHoNOEClgQA0ki/tsIj4c6NYux0xS3ki1ZP5hArCW1+IxewVNmWoqq2Hb5Jn7OUczyJL
         U9cepTYvXvwNYMNwiWgDsF7ahZ9IjYqQz2/QwmcNvQRHibbYP++iKjuF8LbKrQdlbWMz
         tQndk/bkuX6BdnNg642ETfacRp/ht35V5TWDUnYK3qGSXFtR2UBrNsUAwCeTfCKDsOXh
         pY7Q==
X-Forwarded-Encrypted: i=1; AFNElJ+Rdm3A3cPmLIqVY+9f3mH61XTiN+zCUso4Uevd5wCRSdb4bHU5dW2FLDnShodAypOijj3zL4NmDTaFL9QEJLJaLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjxprzdwc+7Vh5tD78HKc9PE2H7VYGIgNln2eJz66onmPGgHIl
	ir7+29WhAVxv2Y45gYgHX09NQANTu/DqBWE+sbAVuoBCZf4F+SL5JqZm8Sk+BWxHO9JpadAINuA
	fteA3kadH7K5l0itoYO8Y5qrnhQcQY5Y=
X-Gm-Gg: Acq92OHObycoykpHeQsmvOy88MTYh8fTuMKNhZ8NkDhLDpXwiG/7VcD1vY9OPOo2P6A
	Y6RuFqozLOsuk40SQXIeyPBaVMn35mtpFwajAQ4QIUi6da12/sHiJnpbuKY9kFWuz8uu9bNxBec
	giV17mNcx2ThqhEdtsCCU9ogtCAXsx3XyYAzGJi1gitvxWra895K8UOZaDRM+BHr+UqcH1hdl4H
	o5DSKUztZr82uAvuo3z9XuLm5x7n0Aw/+FtI/lS2TdoQjV411QW9rlsLe/GhsdmEzofQvBiR0aP
	fokW9u9qofNenEBKhsyGGqFXZFMlzkT8c4xDO1Jmx0Esd/m7Zhd6JXgzWDyGFQJ9Vrs=
X-Received: by 2002:a05:6000:25c6:b0:446:189c:ac4e with SMTP id
 ffacd0b85a97d-45e5c59f684mr4806457f8f.34.1778845730337; Fri, 15 May 2026
 04:48:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505112405.667796-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260505112405.667796-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260513174211.GA1400932-robh@kernel.org>
In-Reply-To: <20260513174211.GA1400932-robh@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 15 May 2026 12:48:24 +0100
X-Gm-Features: AVHnY4JoESd-gzATyvjCHny04cCPotWuTiip4JC-1zEmWw2ejA6Kbb1CtdF9f2Y
Message-ID: <CA+V-a8vCdhoC+=zp3GR0JMtDWL6BQV+t+Ae46HfMOPEHsh+mmA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: memory: renesas,rzg3e-xspi: Add
 RZ/T2H and RZ/N2H support
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 77AC054F546
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32677-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,sang-engineering.com,bp.renesas.com,vger.kernel.org,renesas.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hi Rob,

Thank you for the review.

On Wed, May 13, 2026 at 6:42=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Tue, May 05, 2026 at 12:24:04PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Document xSPI controller found on the Renesas RZ/T2H and RZ/N2H SoCs.
> > The xSPI IP on these SoCs is identical to that found on the RZ/G3E SoC.
> >
> > The RZ/G3E HW manual (Rev.1.15) references bridge channel 1 and its
> > bits, however the hardware actually supports only a single bridge
> > channel (channel 0), matching the RZ/T2H design. The references to
> > channel 1 and its configuration bits will be corrected in a future
> > revision of the HW manual.
> >
> > Update clock/reset constraints to handle the SoC differences.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v2->v3:
> > - Used RZ/G3E comptiable as a fallback compatible for
> >   RZ/T2H and RZ/N2H SoCs since the xSPI IP is identical.
> > - Updated commit message to reflect that the xSPI IP is
> >  identical between RZ/G3E, RZ/T2H, and RZ/N2H SoCs.
> > - Dropped RB tag from Rob due to above changes.
> >
> > v1->v2:
> > - Add RB tag from Rob for the dt-bindings patch.
> > ---
> >  .../renesas,rzg3e-xspi.yaml                   | 56 +++++++++++++++----
> >  1 file changed, 46 insertions(+), 10 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/memory-controllers/renes=
as,rzg3e-xspi.yaml b/Documentation/devicetree/bindings/memory-controllers/r=
enesas,rzg3e-xspi.yaml
> > index 7a84f5bb7284..e2633476bd54 100644
> > --- a/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3=
e-xspi.yaml
> > +++ b/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3=
e-xspi.yaml
> > @@ -30,6 +30,8 @@ properties:
> >            - enum:
> >                - renesas,r9a09g056-xspi  # RZ/V2N
> >                - renesas,r9a09g057-xspi  # RZ/V2H(P)
> > +              - renesas,r9a09g077-xspi  # RZ/T2H
> > +              - renesas,r9a09g087-xspi  # RZ/N2H
> >            - const: renesas,r9a09g047-xspi
> >
> >    reg:
> > @@ -53,28 +55,38 @@ properties:
> >        - const: err_pulse
> >
> >    clocks:
> > -    items:
> > -      - description: AHB clock
> > -      - description: AXI clock
> > -      - description: SPI clock
> > -      - description: Double speed SPI clock
> > +    oneOf:
> > +      - items:
> > +          - description: AHB clock
> > +          - description: AXI clock
> > +          - description: SPI clock
> > +          - description: Double speed SPI clock
> > +      - items:
> > +          - description: AHB clock
> > +          - description: SPI clock
> >
> >    clock-names:
> > -    items:
> > -      - const: ahb
> > -      - const: axi
> > -      - const: spi
> > -      - const: spix2
> > +    oneOf:
> > +      - items:
> > +          - const: ahb
> > +          - const: axi
> > +          - const: spi
> > +          - const: spix2
> > +      - items:
> > +          - const: ahb
> > +          - const: spi
> >
> >    power-domains:
> >      maxItems: 1
> >
> >    resets:
> > +    minItems: 1
> >      items:
> >        - description: Hardware reset
> >        - description: AXI reset
> >
> >    reset-names:
> > +    minItems: 1
> >      items:
> >        - const: hresetn
> >        - const: aresetn
> > @@ -109,6 +121,30 @@ required:
> >    - '#address-cells'
> >    - '#size-cells'
> >
> > +if:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        enum:
> > +          - renesas,r9a09g077-xspi
> > +          - renesas,r9a09g087-xspi
> > +then:
> > +  properties:
> > +    clocks:
> > +      maxItems: 2
> > +    clock-names:
> > +      maxItems: 2
>
> What about resets?:
>
> resets:
>   maxItems: 1
>
Agreed, I will update it and send a new version.

Cheers,
Prabhakar


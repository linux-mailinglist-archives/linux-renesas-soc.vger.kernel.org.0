Return-Path: <linux-renesas-soc+bounces-34748-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AnKJMnyeS2qEXAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34748-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Jul 2026 14:24:28 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 175307107BE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Jul 2026 14:24:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=dGO8L3cI;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34748-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34748-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0CD5A3775BB8
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jul 2026 10:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 388BF3FF1B4;
	Mon,  6 Jul 2026 10:19:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683443FB7C1
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jul 2026 10:19:54 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783333196; cv=pass; b=GvyHAysdrxx+oszm3CrL8T2dRHrFCvoSFquIe6+9v8d7DJSca+HPb0QfmAIxMAJ+BBm3MXMpPlsMeyWCu9AIbP3tYRIlY12qbyCc35w8d3hm8mRafj4eDbKxLiwK49INCdg98iViE0s3UsBmnbMd24D2CierLFvUGaSCQMm53Y0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783333196; c=relaxed/simple;
	bh=PJQ5UmcsxmykSC0BE/ND2jQEE712lBcMOooWOb3phaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IHW73/90Ir8WUHIrcpABlg6cmwdfW5TavmG2QF284py+yG3bX4Yg7is8B5KmAtp69cAMkGDi0OjpVMkYdA4aZ/pvrGi+H38Ic8VO0dnkap6DV96fShujFqIBVpfLoy1Hhd6BhqIjFGw5AtLjIALFUSUxkJJuUJVwE0GSDttw9O0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dGO8L3cI; arc=pass smtp.client-ip=209.85.218.43
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c08acccf4a4so345776166b.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jul 2026 03:19:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783333193; cv=none;
        d=google.com; s=arc-20260327;
        b=S1d3kbIWMYXxyAtKAtWaDkrj5CrujaW6qCqjfJLtoVbfnmFhmGPntNa7Puj2tINCjx
         yPT7Mg6KiCWA0cf/i6Pso50c0dbqpfXhBLoViAPEaEOEwPKNbxtnzQXZ55OHUFbnEbB1
         XZ8ihupzsv5AhmnE7bPySVIwKbSBU8NU6hofhJE158c/YXM00PWcPQ6CaAOwlFFBqSV7
         pVBgjNtb9XHkT9GpTnwGxBiGN+KUr/OEja73UiM+NDfZxouN2ertJP0OjUX6iMtVUuor
         xnszh7ziA5gp9gUDifGgfnjwyLGZkLWtoCMKKuYmqGrytVC5kWPJrpnopsUDXA9IueWT
         K8KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fm0Kcy2K0oJ4B8QIP06f/MQz75S5ZTjRepITBSZjIOk=;
        fh=tj83X5ljAcEeDhxZgtCtpgwV6Go0S/dA7THr7pBc5Mo=;
        b=DeirMsbTylMj7WxPGbjF8JS+8qhuTRsdbS7DIIV43AT/fLwA+Hro1JB16yj27y9Emm
         65IY3RJpUezvWCzQURgZlWcfiXH9dZmS5RdAnZLvtsOvcpowPCUBsPwh14WYyQm/K3d4
         d6JNuBvTJeGjBkbay8zxH2RLniS6rVibAIIHLfsEwE3y+1Gt+9UkxZUFqin1VYCFRFks
         M5UDQstQO3KnJ1SYhtwZ8DbVOHNxKgndXHmTdE2G7S6SWRWKDYKmA4SI2KSSkW8CgGrO
         KSBDXIkb+VIswv1qDa8o23Jm3M50YZZpyINCtIJLo0h7BwWeEgGveiKTI7rWsQPKKo5N
         j6tQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783333193; x=1783937993; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fm0Kcy2K0oJ4B8QIP06f/MQz75S5ZTjRepITBSZjIOk=;
        b=dGO8L3cICw2aP2ydqFy4Y/zHs+YJbypPEvzntRC+gJS3qJKY9p8flEoOUoGfLE6e99
         Dmlhx/AS/48AOMV3quBMD10S46r50YwGlvbqSxjH9J1IqdYOn4Lirx1tzxmJnMxpSYqJ
         QfXLgo617pnQAsxaMsRvI8PKxmnaUxo5g7yTF0KHqzWIR+53GDmMK8wmh4CrWzN96bkU
         iTWuahgcLiEi7PfomlvQVlYPqon+/th/nBP8frI9Htn+V8ucnwQy5/aa4F6hvofGOkzj
         jioTgUBvGxgXb505S0U0V8lFAAN5lKcqykRmzQFLTDQtN80ELXwfWW3k90c7/YRcKjE+
         6x2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333193; x=1783937993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fm0Kcy2K0oJ4B8QIP06f/MQz75S5ZTjRepITBSZjIOk=;
        b=UZSlEUQJnA1NETlkNZN4xI8KYpDWbcCqNFZo63sLXFSenCxTVOCt5MjrkhQSM0HFMG
         tMeFn/xsV0ZJE9kW21VH9rAiMK4xW/OytPaFQU4lhq9Y2YjUZfBFAZGmT1KM2dCUFrQj
         Oj9CUMSLexrheOEToWu+A10ijehk1C1B3sPFip3GCcIuh2hB78Q5PBz9inOWLbSKzqcn
         V5YhwKdpj+6x7XKj0JAYPnO+gNsC/dl0Q0rkUfJFpBVYtPBdwTrO+oG25/kzNOnPFCES
         v3X1/W+dULr1wVzoXPgZ2pGE343D5hO1DOOhR18GLd5sq+23g0g3OAIc6R3m4mfxf9VH
         YWmw==
X-Forwarded-Encrypted: i=1; AHgh+Rr7Go3X6eFvnOvedAfhC/I/nz84easAaE5kcH9OQceDVdrXgmu7G2nGZvQXYC7V9ytMCuBLsdJYHgL91drtvYmi9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLEf+ZwHpBQ9UM9QsBEXyP1bNSGFd8wLDl5ipDwaoYRVzae8jy
	rAHL5q48LfozvDSD+nMAqxI3o3YLbxHtGoeJ+LnRAMxPaMoDVKW6kBI55G/CtpDIvewf0+Nnv5b
	HDpMt45b+y6/4VNjxtjXrQwCWzoa9OqA=
X-Gm-Gg: AfdE7cmWYMVRsO5gyZHDkLXciunfcYX4UMQVHIk5QRE0mM17riBp+iqopJ8fJsFfSu0
	2pnpf8WNTqsUT7whQC5QaDVb8vmAdWQEVGSLlzrNEtc2TAC+fdc3mcIwncZIFzPGvzYDb3UxOgZ
	Mjd66i2RShqhMyTZpzrZL9yPEF8JE+OHNjSALqrklRawe6JNoMMa+rKtOzR+S/PZm8yun552ltC
	IxYXtvc1UxFuWS9jw3e1XOxXzWNdrn8/wDpmMOIEzZLJagbCknFuiWBnhV4AgP0Fl8gQxErt7U=
X-Received: by 2002:a17:907:86a3:b0:bfd:6cf6:1952 with SMTP id
 a640c23a62f3a-c12e6a9daf1mr386845966b.28.1783333192619; Mon, 06 Jul 2026
 03:19:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622155610.184271-1-biju.das.jz@bp.renesas.com>
 <20260622155610.184271-2-biju.das.jz@bp.renesas.com> <20260622160548.04F5B1F000E9@smtp.kernel.org>
In-Reply-To: <20260622160548.04F5B1F000E9@smtp.kernel.org>
From: Biju Das <biju.das.au@gmail.com>
Date: Mon, 6 Jul 2026 11:19:40 +0100
X-Gm-Features: AVVi8Cf2Rtt9_ieWlUPGWmUBXQw2-mmoGRLmFkbx6A0nrEKzRFYI9JCxTbEcgQY
Message-ID: <CADT+UeD6x7KN-zd-22r7aeAbYzcRqot_0TSDHuZTOtPzx39hkA@mail.gmail.com>
Subject: Re: [PATCH v18 01/12] dt-bindings: mmc: renesas,sdhi: Document RZ/G3L
 (r9a08g046) SoC
To: sashiko-reviews@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34748-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:sashiko-reviews@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:wsa+renesas@sang-engineering.com,m:devicetree@vger.kernel.org,m:conor@kernel.org,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 175307107BE

Hi Sashiko,


On Mon, Jun 22, 2026 at 5:05=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Relaxing the global `maxItems` for `resets` and `reset-names` =
from 1 to 3 removes the strict constraint for legacy controllers, allowing =
them to incorrectly define up to 3 resets.
> --
>
> commit 5bd955e3c9833c72a7847cd9926c293d95e5c927
> Author: Biju Das <biju.das.jz@bp.renesas.com>
>
> dt-bindings: mmc: renesas,sdhi: Document RZ/G3L (r9a08g046) SoC
>
> Document the RZ/G3L (r9a08g046) SDHI controller. The RZ/G3L SDHI
> controller is similar to RZ/G2L but has five clocks (core, clkh,
> cd, aclk, aclkm) and three resets (rst, axim, axis), so update the
> clocks/clock-names maximum to 5 and resets/reset-names maximum to 3.
> It has an internal divider for all modes except HS400, and a 2048-bit
> divider compared to 512 on others.
>
> > diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/=
Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > @@ -116,7 +117,12 @@ properties:
> >      maxItems: 1
> >
> >    resets:
> > -    maxItems: 1
> > +    minItems: 1
> > +    maxItems: 3
> > +
> > +  reset-names:
> > +    minItems: 1
> > +    maxItems: 3
>
> [ ... ]
>
> > @@ -155,60 +161,101 @@ allOf:
> [ ... ]
> > +        else:
> > +          if:
> > +            properties:
> > +              compatible:
> > +                contains:
> > +                  enum:
> > +                    - renesas,rcar-gen2-sdhi
> > +                    - renesas,rcar-gen3-sdhi
> > +                    - renesas,rcar-gen4-sdhi
> > +          then:
> > +            properties:
> > +              clocks:
> > +                minItems: 1
> > +                maxItems: 3
> > +              clock-names:
> > +                minItems: 1
> > +                uniqueItems: true
> > +                items:
> > +                  - const: core
> > +                  - enum: [ clkh, cd ]
> > +                  - const: cd
> > +          else:
> > +            properties:
> > +              clocks:
> > +                minItems: 1
> > +                maxItems: 2
> > +              clock-names:
> > +                minItems: 1
> > +                items:
> > +                  - const: core
> > +                  - const: cd
>
> [Severity: Medium]
> Since the top-level resets and reset-names maxItems were increased to 3, =
do
> the conditional branches for R-Car Gen2/3/4 and the subsequent fallback b=
ranch
> need to explicitly constrain resets and reset-names back to maxItems: 1?
>
> Without overriding the top-level relaxation here, it appears legacy contr=
ollers
> are now permitted to incorrectly define up to 3 resets.


OK, will add the below blocks for non RZ/G3L SoCs.

--- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
+++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
@@ -196,6 +196,11 @@ allOf:
           - resets
           - reset-names
       else:
+        properties:
+          resets:
+            maxItems: 1
+          reset-names:
+            maxItems: 1

Cheers,
Biju


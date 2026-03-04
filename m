Return-Path: <linux-renesas-soc+bounces-28747-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBUgOQLsp2mWlwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28747-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 09:23:30 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D00B11FC850
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 09:23:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5BC1F3054C15
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2026 08:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22551390209;
	Wed,  4 Mar 2026 08:22:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1318390C9B
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Mar 2026 08:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772612536; cv=none; b=NMBeXNuPFy2eoi/WFCYOinst9OTOgf0XIuVZSLonhq76CTuxDiHmuZ2/+TphnJk7T3hQwDL+SK4vOrhUdx7M/WZn4HHKQtBt2jBO1lHYAEj2Zg6fw7Fbo23tDnEinZwo5olbtNqJJsP8adaMOgI4hE8ZBLMgBt5ESXvk2/sKNRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772612536; c=relaxed/simple;
	bh=7/wPTDCTtiPAqWfH8TyBseAYgEZt04T6e94ACGrqkKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ORI7TC6zLCs5JMNiVt7FCJ3Zf1ENQWLHbN1FKFqQHVXs6V1XaWR888WzSQ8WLQC/ET3Yo2k2JJ6C8YicHU0Jwd4dA+tV29huvxMZ4oZZDTpk3EH0SX80U+0hkCtMSN0gI3f2muljpO+tZm2ItMoWAsDFuwtLfADfzAW/fTcaSNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5688b9e4e80so1658456e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Mar 2026 00:22:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772612533; x=1773217333;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=glRfPg2dFgKoSAd8Np4FiflBn8BE4BQOn9BTgaT8ZrM=;
        b=pfIXoRJ5C9vBikvw/CnC3sb+vA397OmqHM2vRH8u/MasmF+PX+6iRYpgV291ZcxuN4
         4GTfbfhPmhZ3iOsD9LYCdpx6vy4Q32mPIHW1RjEbs9oPE1e3NMnBChp6C/sONK9AAPFw
         +71yn+r7MpCDUo8E49QpyEiaeZ4XYcSQTbRibUAnM48elSArZ7t25NAVe1mjtZH9FNF8
         N6An0NdqUVZGVQebLCFUqqVlOqUiew4YjYkqNGLVhgobLVHkbkTqA+iQ5lbMG7hQNYll
         d7GVVCmINfTYt/UnTx0q6MmacUrCgTA4uU/aUecbXir6JbDt50LXeiP0CQRq858monxx
         KTdw==
X-Forwarded-Encrypted: i=1; AJvYcCXV3ITm/22QBbGj1od2rCeGcIsS87wkd3Oak/TzYavcopoK7MSIkrCCB2YuqBr477y2OPUjVKlC9Z8SBwXFQOp3HQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjIWz6YZ8PKOLDyVHg9e7WGzH5o4AgaYurczhA3I5otsTjdQ47
	JTuo88858J2rAW6zA5rZmDv2QWaVFyRePU9Kwixf+W7yZ/gBmzm1qnnw679R2LOe
X-Gm-Gg: ATEYQzzBahK/BTXvuQOK5eg4wPdkOa6JWO+wLBt3IRWAOuwjkwXbT0FZRyfqvK0gvo1
	sXUUJ6WLxPP5nsDRe2qjs+vipfvhIKQor+ZRoYEx/s+vbu4FwoueuyalasM+92cThIlMPPhYDBV
	SD7WzzmOr19KV2yDKmnjiphXPTPefZSAUDZKjgm3wF9M+d8ecZ8xf9KuEYYTigDd88BeYkNQYW+
	JA6eIEUf6yhMC/rhDqkRCquVJ7iR2uZ2YFxOW5uPW7sc86olrJCGDbYR+ToVXc6wwzMKjTxg011
	LKz5IsUMGLClPY4WrdYFf5rv+LojXruHRuzB5FDVBb1b0Xw+q/SIbyYoXcTMWGfQ6eoPhMhEa2t
	JCRdP8ggIgljS1k8UvJs8ZAhEpGUN+gVcyYEQEx77xmABBc6dNlte52E8IpBsVInpdSgvWyWOR0
	mU8pxQwxK04sQlaEGO3rYH8zcBp9f3jnlTN4IejBo75nyvav2ftqXR73uzx8ST
X-Received: by 2002:a05:6122:4d19:b0:55c:be5e:e9e9 with SMTP id 71dfb90a1353d-56ae7eae6e2mr505988e0c.1.1772612532853;
        Wed, 04 Mar 2026 00:22:12 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a92175e87sm22079756e0c.15.2026.03.04.00.22.11
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 00:22:12 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5ff28393b18so3344677137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Mar 2026 00:22:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVvPisVWPPxTS1Q/lAwOS3Nhb5h15Q8cRwtghrKnx5RI9epvxQplOgExJ+/mF8axhHrlSxn1X5lEue5IzP/89rAMA==@vger.kernel.org
X-Received: by 2002:a05:6102:5110:b0:5ef:a1ea:bd33 with SMTP id
 ada2fe7eead31-5ff8f9ef7b0mr2443984137.9.1772612531530; Wed, 04 Mar 2026
 00:22:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203103031.247435-1-biju.das.jz@bp.renesas.com> <20260203103031.247435-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260203103031.247435-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Mar 2026 09:21:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXDt=VZ9-tpHWqHdZq_Uv=67Try_Un+SRKotRkL9yN94Q@mail.gmail.com>
X-Gm-Features: AaiRm51pC7YVz2x2KDtt6tjYIN7TWmh14FLmPTSKWXMV-aPGDw8SpsP9in0fhkk
Message-ID: <CAMuHMdXDt=VZ9-tpHWqHdZq_Uv=67Try_Un+SRKotRkL9yN94Q@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] dt-bindings: dma: rz-dmac: Document RZ/G3L SoC
To: Biju <biju.das.au@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: D00B11FC850
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28747-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,bp.renesas.com,vger.kernel.org,renesas.com,microchip.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	NEURAL_SPAM(0.00)[0.050];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,renesas.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

Hi Biju,

On Tue, 3 Feb 2026 at 11:30, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Document the Renesas RZ/G3L DMAC block. This is identical to the one found
> on the RZ/G3S SoC.
>
> Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch, which is now commit e45cf0c7d9b960f1
("dt-bindings: dma: rz-dmac: Document RZ/G3L SoC") in dmaengine/next.

> --- a/Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml
> +++ b/Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml
> @@ -19,6 +19,7 @@ properties:
>                - renesas,r9a07g044-dmac # RZ/G2{L,LC}
>                - renesas,r9a07g054-dmac # RZ/V2L
>                - renesas,r9a08g045-dmac # RZ/G3S
> +              - renesas,r9a08g046-dmac # RZ/G3L
>            - const: renesas,rz-dmac
>
>        - items:

This part is good, but you forgot to update the conditional section
below, restricting various property ranges.

                    - renesas,r9a07g044-dmac
                    - renesas,r9a07g054-dmac
                    - renesas,r9a08g045-dmac
    +               - renesas,r9a08g045-dmac
          then:
            properties:
              reg:

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


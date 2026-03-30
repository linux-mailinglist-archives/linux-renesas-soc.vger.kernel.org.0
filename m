Return-Path: <linux-renesas-soc+bounces-30589-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADLeJpt/ymnX9QUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30589-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 15:50:19 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A13C35C524
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 15:50:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0970B30417B4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 13:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DEE93D3D03;
	Mon, 30 Mar 2026 13:40:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3D81B4F1F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 13:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774878031; cv=none; b=eLwJNIOZ5h/T0N6zNBPuUIWTJk7nwd/gQDeIE5tea5aZ2vupq2lgNNKgneZqEFGUsz9CwSM5a86wkHOTMDPy/Vasa6LuxI1gz14DIj2mXw45n52tmmOWdfUshYEC4SMCGushksNKNRCNPZnqSGmHLWghJLhrmt9YkfHHBp3aPZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774878031; c=relaxed/simple;
	bh=/kxWTA52BAt2g4WnQqRpqhpA4ac3KQhFlNL2rViCQp8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tNzaZvY6FrQ9VAuQI3MEehjglbRx8uA47i6Wp++zK4o5bZ3kJRxFHejij47gH+HmsjYlyLlt78U0IMNVCCFqFup7bs55JEVjVVSaRGMiRGU7R13hCx1xL+O2oWWklGzGUKUFqDmokpCcdZPcIL/WTyOvRxmqWfDjupjgzYKyCdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2b23f90f53aso22959775ad.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 06:40:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774878029; x=1775482829;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JCelPAg5TqeEG1G1zPAvcyqOUxcgqEhU8AXcqqEt3aI=;
        b=JqCzdHfxovO1VGnuNdGHZH53M1RXeiH6B5xOj22/hO6t+cRIiu51AWneli1jM24XrC
         hRXiNAKo3xH2/hgJzE4wC9hym7sxDBXZaD+gj40XpTlgbL353K3QFX0zzvGZPrttzSI4
         bmSrIubbw93W0kQdHHBXvlfN2pzU537zF0pnTopX+N7QpeYRmADjil+LzmYQDqiaSUgU
         PoFqAEYTgMw6IhDhSoXQizxqljOD1XRkFMt176dqa/xruAV2AbzqOP6TO9+A4S40ic8s
         hFzLQGHTDKCTF7Bg5/gxNz8IliCovmnAFDuji6kjbt0CaSKshbCEPUX2dURLxEZtvSGQ
         UaQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbCBmWgaysyY4J5tmSgSDIXn5YNUkqGgtcE50K50Awv7Nuzud3of2dxD9bzAvMwaplrCOIm02+QrNNfOqJafufNw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn/+jBkzguKicar1EaIe9cLsehoQl2CcQ1nIDaVMkZ8Dplw+8o
	VL1jxXpBKg03kZ0ZlMvnq7YOF6MnGf7HfN5VT796NOAgGuk/XrRUb9Jl2nACgNbD
X-Gm-Gg: ATEYQzydfXeXxC8d1MOs9mxK4NFo6zOtUEBDyHbZhzuSymzRL4HFo7KYPNuQg8w4XZ3
	7kVUZRvDKzthDPeM4xetetCtCl4ugcBZP7r/8G7mEzcNYEJ6rVLABzGs1WczPm9g4uTbfqcrGq+
	7JgDElUQ8Or5wRI5r4DPqaJVqH9vgqPc/0Fr3FdPRsCa3L59YhxGMITJ9UAsmKpgUO2GQOADVff
	Ongsk7wSwlkoXLIdaVDUDfADzOg/LTfkbyuzFarS9YjuzY1diAhPTNO4CfgrCL5HeheT/8GsDFk
	+FmlQGDVMUHHvbEs81Ot50a1B7W2wzyb1tY/GnOqGifd3JCK+DYX8LCfnJ2XbKCfaBHQCNUzJrO
	/oP2zKZAc9Bi2s7X+7hQHwA47oWxFVI/SXMzaOUQtxy3ENgQadJsfQCxC2SRI7MCBfO5jXAtzZs
	/D3pgLYhL7A9NOVuan1+dIFypZNy0LHcwm9ERKxEa+ghBrnVlEtJvVV/UKrE2UY4Y=
X-Received: by 2002:a17:903:947:b0:2b0:5cee:c421 with SMTP id d9443c01a7336-2b0cdc20ee6mr128589835ad.4.1774878029442;
        Mon, 30 Mar 2026 06:40:29 -0700 (PDT)
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com. [74.125.82.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24265a954sm84228075ad.18.2026.03.30.06.40.29
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 06:40:29 -0700 (PDT)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2bd9a485bd6so8806686eec.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 06:40:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVmW0jEeDpTe8Q617+fnH0ZwEZfHkJh5iwzfOf9Z/lmuFzXCHG+6WHonSW5nKUZxdXuKyrX0T0qQZjMJN7xSSyddw==@vger.kernel.org
X-Received: by 2002:a05:6102:2b85:b0:605:26eb:cc1a with SMTP id
 ada2fe7eead31-60526ebcfa6mr1670554137.29.1774877621873; Mon, 30 Mar 2026
 06:33:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
In-Reply-To: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Mar 2026 15:33:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX23LQYFFzs9STykFVECb4uv1u3DmEMCh453GBK=4XbYQ@mail.gmail.com>
X-Gm-Features: AQROBzDj9P2QcJJ03rVKxKEo5zx-Wow-J_zNYCm0-1wsBhaAiKvmNzwG6-mGiTE
Message-ID: <CAMuHMdX23LQYFFzs9STykFVECb4uv1u3DmEMCh453GBK=4XbYQ@mail.gmail.com>
Subject: Re: [PATCH 00/16] Add support for Inside-Secure EIP-150 crypto block
To: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Olivia Mackall <olivia@selenic.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Jayesh Choudhary <j-choudhary@ti.com>, 
	"David S. Miller" <davem@davemloft.net>, Christian Marangi <ansuelsmth@gmail.com>, 
	Antoine Tenart <atenart@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Pascal EBERHARD <pascal.eberhard@se.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,selenic.com,gondor.apana.org.au,ti.com,davemloft.net,gmail.com,glider.be,bootlin.com,se.com,sang-engineering.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-30589-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux-m68k.org:email,bootlin.com:email]
X-Rspamd-Queue-Id: 0A13C35C524
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Miquel,

On Fri, 27 Mar 2026 at 21:10, Miquel Raynal (Schneider Electric)
<miquel.raynal@bootlin.com> wrote:
> This is a series adding support for the EIP-150, which is a crypto block
> containing:
> - a public key accelerator
> - a random number generator
> - an interrupt controller

Thanks for your series!

>       irqchip/eip201-aic: Add support for Safexcel EIP-201 AIC
[...]
>       crypto: eip28: Add support for SafeXcel EIP-28 Public Key Accelerator

My OCD tells me to ask for using "SafeXcel" consistently,  ;-)

drivers/crypto/inside-secure/eip28.c: .name = "Safexcel EIP28 PKA",
drivers/irqchip/Kconfig:        tristate "Safexcel EIP201 AIC"
drivers/irqchip/Kconfig:   inside Safexcel EIP150 IPs, gathering
Public Key Accelerator

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


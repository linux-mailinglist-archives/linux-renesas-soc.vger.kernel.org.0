Return-Path: <linux-renesas-soc+bounces-33001-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MPFHVNhEGprWwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33001-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:59:47 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C3F5B5B69
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:59:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 39AAB30FB0AF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 13:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3D133AB46F;
	Fri, 22 May 2026 13:23:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5133A9D9C
	for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 13:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456234; cv=none; b=qUj2Me+iFQlKXriByE7l+bLu0hclyjMy5lDpaQXqfoCoxZKEo/uFu2uSNGU15cEtRM5Pjv76SqwHfXTWBqfxTlcgZezPh+KjFkCdULCwi+tWcANa0agWF1Vno1TIPGYdTuBCakxBdCb30H6BqokXhlSXlX6qc3YoudF+A4dlp6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456234; c=relaxed/simple;
	bh=68A+4NpoBqPQ4SaNDjVvJdhq8EIacxhjPpQR5/frgEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wc1d71CVtbvD9WFCwbtXP6oC10lmCfLIKMcl6te3lf9qpJBMUgNEHza+3rgfjmMY1ElQZkqVmshL4upeMxe6TyzN8B9LyeShDzUzKK5GmTQEJMT/KpY3fFriaYoBoHn7G9Ka+LxdjlQuLIX/uZLESqbttX/yMTD2XmhuFrTEczQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-67bb5ad91bfso15144151a12.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:23:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456230; x=1780061030;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wEDEgL2tLkOR4zWl+L+uuKuVbGErUH4r4hxSDSLZGiA=;
        b=iH0Fs+liOTDWkI5ZFKdbGcQNKdcJWoofJosxwTC7bIIgazcT4dlOh8FnZXEO+MppTw
         FhX8j820hEh/8AnpKrlb6kZj0MlIWQd8fNEUDzeGKhDgOkn9aaEbrHqOBr1QDFiXHxYY
         6CNwShJlvZqkSowyBosjf7rLmcOODxgKVpML+CB3OlXR1TBhGls2uNYv9G1WXwAGdUYS
         fc/kldRWTJrVsyBNbxuJRHv1KrLXxuLWQCA/PgpuI17TF2LlyaE3YhLI6T/D17r9Zv1x
         L1nat9bqemMdDtX+464bhu7LZgcRuQuHBgPSpj1l8fX8vS/KV/IeIBH/R9wg0r0A2NCZ
         yBFg==
X-Forwarded-Encrypted: i=1; AFNElJ/kurLg9DAX5TxRlvb9nilTaTOE0ROXxSPkjPNxjPnbo5WmsVEdP5q7/CXcuU2yOUDA0Lpl4DpTF25AVDS4lFUE7A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9sm+JLr5zlPSDcXZYqikrpagLPRZBFq0e/LQDjLds7RYOLeFh
	EeT7RSfqoGP202zj8AEJnHVBEhM+cUWKc/jp/vzICVLy6dgd0++vPDxMoRJaAuXz7F0=
X-Gm-Gg: Acq92OGaRLefxHFbSlz5M8cud93RFwErRx72dWmJ9oAan9kDldsYGmHsI4VU5oTbws7
	lT1cv23oc0QZ34fdgMWbbmgAMP89SiBFB+ZAsHRuyY85MJbLLxYlJrJ4n8IPyN6xJNvrnXKZTII
	wyom/Iz8XSNqjaVFIdAzJIDxR7yKbuzff2BC4UaWjiM3k4YwM9Z1QvqkHoLInkipu+NmPkFdvny
	vrYYfexCBwnEf/GubGgaHgMUX2LkRLPg5dQ/mlMVL6PlrcRwW98ZJMhknyuhBgwRpJRmlzAC9dr
	ZlsgQ010CEtfwpBNGlOvFoL7PGF4y1CKw+K/ddF6sqExe7nQtV4DJHl7NJg6JAPwgNVOo3itdQf
	oHyQUNy6NQLq0SWMlLcCEbU1jY55/2Vt9/D55/Bj74drl6u/ldt8F+Dvre7M3aVLkTlm4io4GbL
	zNA68aQtq5c7mEKOtu+34P4QIiy7EhWjfevYMHu2SHbKtNOogSbyuorKKO4R5RRXTJfKcneLw=
X-Received: by 2002:a05:6402:13c3:b0:66e:6ac4:2c01 with SMTP id 4fb4d7f45d1cf-6889c420ef7mr2006613a12.2.1779456229382;
        Fri, 22 May 2026 06:23:49 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688b9b6d277sm656012a12.1.2026.05.22.06.23.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:23:48 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-67f94c078e8so11649635a12.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:23:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8+8h28G1bGjFvCpQ/AsBkz48N9EUIpSaV52iiVlJRqLICelv0I3viN1CJToNbhA92wRTX5KSRUeEvQv1nAT4zabQ==@vger.kernel.org
X-Received: by 2002:a05:6402:4491:b0:670:8b30:a8a7 with SMTP id
 4fb4d7f45d1cf-6889c2a41e0mr2094221a12.0.1779456227391; Fri, 22 May 2026
 06:23:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org> <20260505034325.167797-10-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-10-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:23:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV13=yJwuCm2PYgqZ3uWzH4ePiA8W0KOBP-3DV9YGazGQ@mail.gmail.com>
X-Gm-Features: AVHnY4KmwTbG4JqyJfdjScRT_TVewlS59f158FM_wCnR3G3Yqp4fZC7KAhrzR-E
Message-ID: <CAMuHMdV13=yJwuCm2PYgqZ3uWzH4ePiA8W0KOBP-3DV9YGazGQ@mail.gmail.com>
Subject: Re: [PATCH 09/11] arm64: dts: renesas: falcon: Specify ethernet PHY
 reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33001-lists,linux-renesas-soc=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: C3C3F5B5B69
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 5 May 2026 at 05:44, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The KSZ9031RNX reference manual [1] DS00002096H page 60 FIGURE 7-7:
> POWER-UP/POWER-DOWN/RESET TIMING Note 2 states, that after the
> de-assertion of reset, wait a minimum of 100 us before starting
> programming on the MIIM (MDC/MDIO) interface. Set DT property
> reset-deassert-us to three times that, 300 us, to provide ample
> time between reset deassertion and MDIO access.
>
> The KSZ9031RNX reference manual [1] DS00002096H page 60 TABLE 7-7:
> POWER-UP/POWER-DOWN/RESET TIMING PARAMETERS row tSR Stable supply
> voltages to de-assertion of reset is at minimum 10 ms. Set DT
> property reset-assert-us to 10ms because the KSZ9031RNX RM does
> not explicitly spell out how long the reset has to be asserted,
> but this at least covers the worst case scenario.
>
> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/KSZ9031MNX-Data-Sheet-DS00002096.pdf
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Modulo the document references:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


Return-Path: <linux-renesas-soc+bounces-29181-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yG06DYgvsWkVrwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29181-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 10:02:00 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DABF225FE54
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 10:01:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32CE730EBF46
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 08:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A93753C13F4;
	Wed, 11 Mar 2026 08:39:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41F33BAD88
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 08:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773218396; cv=none; b=G5gRdqNsZCYmAIIGAMb0Iw2tTm+MGfwKr/LLN/8S0JWbG/ot9iKevB7QGdaSZz6FZGvRGjmsFlAPn4vZHLLsuHkviGO08+IOcxGklAWAtc9gc1DP62oddz5NN59HBqQkJVkKwzA0Kv0ql9srSJIxhLoZRp5NqjE0HH/+fEk8WuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773218396; c=relaxed/simple;
	bh=aOoOQpRMMQeHaPC3tRhWLJALfIv8CokuAajCILEgC30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V/Sex4N0BWgqQZEtYwAG/SciVc0JUaunzLlwWS29ftUgzL9CCZoiY43E6N79hqgwkHhVDb8VEqgko3qbxtYGRMZKEILX+FBtul30xuzx2naPQcaW+07EQA85BPq3Kx4uzefEZGIPfKaGdZB2WhiUBBmt78L5Q8ilt1Hds5kJXKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56af41d1e0bso2697734e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 01:39:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773218392; x=1773823192;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wDnX9qq9fL2tmN/qX2V1EHpQ2py5VIfCTjqZsUNQb9k=;
        b=MH0HshXG423H37IUL2k9Xp3DxHygP4k0LeKXb2sKmWDoHS+AugVhi84oE6iKrNHxg4
         WrO/rs9tPFlUYuljoFLFCS2PSbozrDgN8nl70RUQPpaRgPHFwCedK1zIjohxxge06wRX
         Qt1Vluqqs8/Zl+u/usFSk521iUjgd8m/SJE+kVl+/IDu9pMMhbcExgvJwBGD7y+JElYQ
         puNFaQ68qIB82wxLyiCsRAGa0NeneDQ07rmim+1HifgV15pLFP8yzkw4ngkMzjN2sBfh
         rUFHgnF99Qq55UfPoppbTpGOQXuBI0h43+hPv1LfqiW37cTvsu60sMc9fXFmYXct/RSI
         wNoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWw9GmECVzfANEumL4yuh+UMTigm73j1NEDwzHqj2gOHezDw3AYROT9NgFj+TGYnTq70ivTfXh18w5cMcDeVYYmXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOPg0D9gFTF7ZmE/gAPYm58UanvNzhlVKne5HWGy/m/3+hEH/b
	bcoewZtClLtR4TaJp3RccvpY1ZE1SMIel8NP8KIcbstnqkpUo9kKOMMd8VJszcKI
X-Gm-Gg: ATEYQzxQZ78tqzvPDKaOzHts664s74t0OKwexatMXXNtXBzx5cad0qdv/uOiE4aKmjz
	I3SH35fJFIatTC4t0xqMekAoQoTw+0KsGBxUvek5exsXJMnUq1uqP1GBkf9GBwRZK7/TNRbY6IQ
	Y7DM7a9YzooTeSPtsH5QGuwcrt5LPBI4e15M39hL/kC0sXY8j5XOlbqnWxMhxI0hxbdeznNNlh4
	Bo4qMtf3v9VpN3mViXbxTc8g/VfNmEgsm2BCCeIw7+6cvfIKPdPJCrWbqm/MGZ3AqrGYRBWyYjO
	giM1iY/f5Lobng8KFTBVw5l2O8R67snS8PGfba1ktAM15dOvF0FzmGiPITc7QCoMprc5B10qvqT
	9/y4SF3SATOR4HHQDB4HshB7THtNKRndc5uSmwcfZ/sm8URcxLcHm8dGBaE6rCfNusZ7CX3cvKw
	uyV/6Gce5EtQx+XHrDJF850V0x4QANC9e4sZ+wPE6qkC8rrUS8B6aWNHauKLhf
X-Received: by 2002:a05:6122:310b:b0:559:58a5:f6cc with SMTP id 71dfb90a1353d-56b474392d7mr553369e0c.4.1773218391753;
        Wed, 11 Mar 2026 01:39:51 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b4645d11csm676725e0c.12.2026.03.11.01.39.51
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 01:39:51 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-94dda16ff9fso3975882241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 01:39:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUzrMW5RZrGrQ36Jo2mvrw8sYcXpeQS/Nq+capZY7YeUrHhJk6jvfZixVpWMSWP9Bdge0b0OQ+D4y2Li8pnl7UP/w==@vger.kernel.org
X-Received: by 2002:a05:6102:cc6:b0:5ff:cb2c:a013 with SMTP id
 ada2fe7eead31-601def2ae84mr566130137.29.1773218391268; Wed, 11 Mar 2026
 01:39:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303102029.147359-1-herve.codina@bootlin.com> <abEotS0ZbGwqEmO5@ninjato>
In-Reply-To: <abEotS0ZbGwqEmO5@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Mar 2026 09:39:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX01rwBMGn1FLGm-fHA0w-7+BCskMiucgxcui+PTVF7rA@mail.gmail.com>
X-Gm-Features: AaiRm53jk8vPte5MXJ7yQCkcGHKTwxyl2TK4jY54UfUzJkhzbTTXphD0vlJtQSI
Message-ID: <CAMuHMdX01rwBMGn1FLGm-fHA0w-7+BCskMiucgxcui+PTVF7rA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: r9a06g032: Add #address-cells in the GIC node
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: DABF225FE54
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[bootlin.com,gmail.com,kernel.org,vger.kernel.org,se.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-29181-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.587];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux-m68k.org:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

Hi Wolfram,

On Wed, 11 Mar 2026 at 09:32, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> On Tue, Mar 03, 2026 at 11:20:29AM +0100, Herve Codina (Schneider Electric) wrote:
> > When checking dts involving the r9a06g032.dtsi file, the following kind
> > of warnings are reported:
> >    Missing property '#address-cells' in node xxx, using 0 as fallback
> >
> > Indeed, #address-cells is not present in the GIC interrupt controller
> > node.
> >
> > Fix it adding the missing property.
> >
> > No functional change.
> >
> > Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> I like Krzysztof's explanation "Value '0' is correct because GIC
> interrupt controller does not have children." Maybe it can be added to
> the commit message?

Some of the examples in the GIC DT bindings, do?
But #address-cells is not a required property in the GIC DT bindings,
so why should it be added at all?

BTW, I never understood why an interrupt-controller should have
#address-cells (according to dtc)?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


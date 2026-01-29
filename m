Return-Path: <linux-renesas-soc+bounces-27577-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKX4EboUe2n5BAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27577-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 09:05:14 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF49AD184
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 09:05:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 91EFD3007A7D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 08:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43B8837BE65;
	Thu, 29 Jan 2026 08:05:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B6B2FFF8C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jan 2026 08:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769673902; cv=none; b=ZrV6asA6KhkN0tqCEav3/2/Rs53V4agwPgWdHBOeTw0DidupQKamG4+/3JBGXW525bfwgY5JbG01keCO/eaSy/LEFAPeqzvFh9c8EjjH3TjDERevc940EKOzMxjFOHoiTp2Kc5JmXQgHBZF7ku6HK6zRwE1tUn76mSuqA/r07wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769673902; c=relaxed/simple;
	bh=91tVL5mKuNj73Dz7moYY7OGxZC1gqClrSFgk0jV0cNc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y9tuulvMRohBa7wXS2RFGq5PNtI7qU7Xn6sgL34Ji4ofrPRdpKIF6ave5hdO7c/ZiiXKWye0G/zfnlGsIAbk3LPBFxbN/vVincJ+p4PAz969I1MTA1pZbGjI6Dlj3AbosxSMGASpokqoG2sj9HKYW9Cn/c3dpRKBiB0cNvivA/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-566360cab02so476043e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jan 2026 00:04:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769673899; x=1770278699;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v0gR7dZCHphDKOV6AbU9UOkdND+zeoXCfVO1M2NTZUU=;
        b=eGD+OlOx7MW55zWaFW2VZPdpdptL54Qktjwxp3GahzAE4C9S2+HEepfrBg9WTSEuqe
         znruLaO+6m/1uQaF9NxkpITKIYbjXcbxw5do29f79yYjmAYl7Tk81za1pKqne6GOaZAk
         PsDgB5qt+y5N97u5WarE5s7p4IKd7MYphN4uVn7nPcQ941H8zLrUGw3W2apH0vUin5Jk
         qs3TO7lANFkGB2BWdlb5394MT7neAla2F5OfRwlIw3kY2uUj3VNkWCYgmssqAo44Gnv5
         UxtS8OXHwn/aSurDqAC+/rHa5Py/mHfmdhK0rYIEd/ntExJ6Kvp5TeU8+oXaEcuSQj4j
         2Jtg==
X-Forwarded-Encrypted: i=1; AJvYcCXqmzEo2h6rI1rauS+9qn3kk1DwX3pYJt5PWS5CAUPjAWt33fHQKX3sux6sEx1ZEulRgNA7Q3dTHrBMUu5Say/wEA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+kVCDzoMrJJv4aJ/wYheYyd3Y5Dxfuq5ufuVFu49B+e7VHvAx
	aeJNEYo/k2lb0eF/DGAwEsBEqexagaWS6UM0D4Nf+wSoJonFcTfj0uKpsP0S0k5Y
X-Gm-Gg: AZuq6aJOdlc+ChdIrGbpJbw3CnqRcQQuGQnm5vAsd/GsVTDZ/LR8vn+Ev0UblXulKqk
	W4jbNYLrpjMqddZFo2tw9QPnZqlDL62d9oIgVIpG9CaRoRxlef33GkKSEVdexjYEONvS01H+UXq
	RWwfBSJohYnivdkX4Ag6WXn6fH7scdh0q7XLJsMF0R60yFIdVmZ/xd3+PK/PcA99WOYtAMg6VkY
	FhDfcRsk+EJy0WPVRF4vlUWo2PKuVSUpJBi3hzjwYmQEbCSczmJjnvqZSa9CiNe12pRFH/mc+1T
	FY6wlQ55jwBZNvPA8/Dm9fCIWPN83rCtyepOt3JvZ4H29Fux+m9/k5T2+Xd49Y5Tkn8vNdPmQlk
	MlntQ4CJvm9Z0jsUilB/akUXgtKyjZ/cW30UZSBsca5TSGIhrh7D+9y4rsDZKASyGcX5qZq7Hb3
	b5FkyLTC5l15kGxx2xE1gJccT433V+QfmTqL2FZ1OrGzjlrjex
X-Received: by 2002:a05:6122:20a2:b0:566:3548:815c with SMTP id 71dfb90a1353d-566794aa0b1mr2893129e0c.1.1769673898917;
        Thu, 29 Jan 2026 00:04:58 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56685b03ff5sm1081432e0c.4.2026.01.29.00.04.57
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 00:04:58 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5f53505f012so523495137.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jan 2026 00:04:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUGrWmPsqhu6xhlv5F7m7QD/E4ctCUGrmWkqm5Bd970LSUg/nYiqRxbXH3hiwQBQfIX6Kj9YrN9rYpKLBAlKcGGIQ==@vger.kernel.org
X-Received: by 2002:a05:6102:54a6:b0:5df:b7f3:5875 with SMTP id
 ada2fe7eead31-5f7236eb1d3mr2932320137.3.1769673897247; Thu, 29 Jan 2026
 00:04:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127201706.616374-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260127201706.616374-2-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260128-sequence-platypus-59ae3318318a@spud> <TYRPR01MB15619DCD987445778003A81588591A@TYRPR01MB15619.jpnprd01.prod.outlook.com>
 <20260128-debatable-scribe-4e55c208b31a@spud>
In-Reply-To: <20260128-debatable-scribe-4e55c208b31a@spud>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 29 Jan 2026 09:04:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWYKFoBnGaCfvVJFwYXEvtVyxXiAzHC2JvmTCwc5H91wQ@mail.gmail.com>
X-Gm-Features: AZwV_QjTTisPi414sjhCr82V_-8ygcgoSAfE-Ll893eiMx8FQNA9_dDyqKpLyMg
Message-ID: <CAMuHMdWYKFoBnGaCfvVJFwYXEvtVyxXiAzHC2JvmTCwc5H91wQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: spi: renesas,rzv2h-rspi: allow
 multiple DMAs
To: Conor Dooley <conor@kernel.org>
Cc: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, "magnus.damm" <magnus.damm@gmail.com>, 
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27577-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,glider.be,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9EF49AD184
X-Rspamd-Action: no action

Hi Conor,

On Wed, 28 Jan 2026 at 21:09, Conor Dooley <conor@kernel.org> wrote:
> On Wed, Jan 28, 2026 at 06:51:48PM +0000, Cosmin-Gabriel Tanislav wrote:
> > > From: Conor Dooley <conor@kernel.org>

> > > On Tue, Jan 27, 2026 at 10:17:04PM +0200, Cosmin Tanislav wrote:
> > > > The Renesas RZ/T2H and RZ/N2H SoCs have multiple DMA controllers that
> > > > can be used with the RSPI peripheral. The current bindings only allow a
> > > > single pair of RX and TX DMAs.
> > > >
> > > > Allow multiple DMAs by only restricting the possible names of the DMA
> > > > channels.
> > >
> > > > All '.*-names$' properties must conform to the string-array.yaml
> > > > meta-schema, which requires both minItems and maxItems properties to be
> > > > present before the items can be a schema. Otherwise, the items need to
> > > > be an array.
> > >
> > > Why is this in the commit message?
> >
> > To provide a context for the maxItems that are needed below, even if
> > there's not really a maximum. Which is why having a maxItems does not
> > really make sense but it is expected by the meta-schema so we can
> > constrain the names of the DMA channels.
> >
> > dtschema/meta-schemas/string-array.yaml:
> >
> > if:
> >   not:
> >     required:
> >       - minItems
> >       - maxItems
> > then:
> >   properties:
> >     items:
> >       type: array
>
> Right. You can probably remove all that since I'm asking you to add
> actual constraints to the property.
>
> > > > Declare a generous maxItems of 32, which should be enough for 16 DMA
> > > > controllers, so that we don't have to update this value ever again, even
> > > > if currently the maximum number of DMA controllers on a Renesas SoC is
> > > > 5.
> > >
> > > Huh, No. The binding should constrain this to fit what the actual
> > > devices do.

The device is the SPI controller, or the SoC where the SPI controller
is integrated?

> >
> > Should the binding for SPI be updated if a device ever comes up with
> > 6 DMA controllers? It seems a bit unrelated to me. In this case, should
> > we constrain the number of dmas and dma-names per SoC? Some may have 2
> > DMA controllers, while others may have 5. Please let me know your
> > thoughts, taking into account that I only added maxItems to satisfy the
> > meta-schema.
>
> Yes, I think you should constrain it to the correct number of providers
> for each device.
> Whether that's done or not, there's not all that much reason to set it
> above whatever the current maximum is, since the binding will have to be
> updated to add the compatible for whatever device exceeds the current max
> and the limit can be increased then.

The actual maximum number of dmas pairs does not depend on the SPI
controller, but on the SoC integration.  I think the (single) DMA
request signal from the SPI controller is just wired to all DMACs
present (on this SoC, IIRC there were some Renesas SoCs where some
 DMA clients are wired to only a single DMAC).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


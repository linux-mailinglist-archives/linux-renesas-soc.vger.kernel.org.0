Return-Path: <linux-renesas-soc+bounces-31929-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALp1Ea9W+GnTtAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31929-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 10:19:59 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D87C44BA16D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 10:19:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DE9D43004DD4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 May 2026 08:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6712F31ED8B;
	Mon,  4 May 2026 08:19:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B883016EE
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 May 2026 08:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777882796; cv=none; b=L+m8WDpKpYKAIcsFM9DJvWqV5hALX5FLPRqdj/cLkrKgN2OwTd7AevHdYEwmxRL9xwuhVLR3IcVznxXLQ9K3xwkFwdmRGnXffyDsAb+Jmi58LAXOo68mec9cOx2ybpmO5tsERAqJHTyOMnK5Un/pgijlyaYqW4XhA0RRWQcY2PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777882796; c=relaxed/simple;
	bh=ufP7vWp08CvNF0edUBUSk2pG6uz8C46BeoX5YxHUf7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AoNi3oQyimaJDM8VF3KtRZ8vNiJHfDMHKUUcqFZ41xvLJtz8whNKEZrtaTzxypGmEk3VYCi2y1rFjRk66PKOpGmCxUUFYIK8jlgLLgGdhRn39TfQyXl3TTVMl4qIqvQ4slH3T9sPm8EXNF/vFA2O/cNmpwtH7dQLQbE8lI24Zs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-575320e6f2aso314985e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 May 2026 01:19:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777882793; x=1778487593;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9bVJNr48mbuXqcLtQanZN2nd/IOT9Q1mbdvULl7e7Mc=;
        b=pUVXimPoKxA+C2bneD/IPOW4A/bDaaYeVpeMjV+xWwH9KCI4R9l9+2UPV4HFqcZyT9
         gR0mpw8QZ+63hnOisImN7vCTNk0nz6mv4YJglnZYboG9HkZgNZx+pGy8Evku0WpOHWfL
         pDsH1k+Cu+jyOpZlyuvvefRWR6ZF6DWZN2w1gk8QEoZH45dZpkFiH+OHCUifuStjeRrV
         Lw63WJ9cYLHFcUJMxG6P4sa3Dwc7heZVsX3rKx5uLQFJKlgK414q/IFy06JpILDDMHnJ
         dpi0l/pDOoJ1TdW2WCbl0ii6fHLWKYcnnC63AH6zaYz9GT3SVB36LTptomKJ0hErXMUl
         CUCQ==
X-Forwarded-Encrypted: i=1; AFNElJ9pRu2kkqE9vLpVC04p7ytvXhAQru11Qc43Nuy4MUlP6UFOrrsys6MAxiG4knYyOobkSDG1uCCpHeAw8Ki1sTIs5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiYnU2B2L+9Dt5OQVMT+S4rjk3px1CNd0AW+NMonmvpjLJMEWQ
	oId6HZ9BcPJAAIYfoJ+ToNKbFt8UdR/8BO9FqdMxzjkw6HOW2KnzPyScpEtynNxB
X-Gm-Gg: AeBDievAdXzATA6BuiQs4abS0L20DsHtlbaaghW9GT8BmejmOD3ugITetwteDplGA48
	zhnd/hvcLRVK9MuHYmKxd5sMRJLIQ5Rxi1wySuynOg7cfGX+2vBwjYzM+QqZHBGoDUeXEXdY/+4
	fiF6DFmE9ioQMHd1X0d2MTREhLB2hpMW6wVpPB4MBxsWoga4TTsfhRuweIPzgZY/bEjQtSlcYzW
	MShSCYks5eNUOkHpZ9K1Ve0nudADJfqrOfWxoibaYbgtrodPD5svFCGMcE/BRvVCC09vMwXiKR1
	9pVb+E4tuokRQPyeSuz0GFZ/xgxcOOrveYuNr3foH7aUG4fHz15gYp3a5QAL+t4mGkjN6+1Wn2h
	UY/QHYVCRrxTqW3LJLizaWdyY5uErd5wZPbj/jbLwpeXLTfxPhPbT3Z1FbT2zHuwA20+dlPb97N
	3NcDry6RyYDemUusdrkIm/VdH++W9TE0y1MxDCML41Sfr3xn0dqDhyvOqnYbvc6/hL9hiXHq4=
X-Received: by 2002:a05:6122:e14e:b0:56b:1eb:d396 with SMTP id 71dfb90a1353d-5750c6eccd5mr3817244e0c.14.1777882793462;
        Mon, 04 May 2026 01:19:53 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-574a6c6c582sm5809874e0c.9.2026.05.04.01.19.52
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 01:19:53 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-95d04f205beso832324241.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 May 2026 01:19:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/2LFqH7tS6ML/q5DrYyeJQnlHJi0vzYlyO18hDPKuFrPLduYln2SG+PNSxO4oSnF3Auku+kgHwgPcPBdGWMtPgyg==@vger.kernel.org
X-Received: by 2002:a05:6102:809e:b0:605:6089:674a with SMTP id
 ada2fe7eead31-62d8754d144mr3013701137.23.1777882792441; Mon, 04 May 2026
 01:19:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260503154439.27362-1-marek.vasut+renesas@mailbox.org> <20260503-vagabond-barge-dac8ececfc11@spud>
In-Reply-To: <20260503-vagabond-barge-dac8ececfc11@spud>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 May 2026 10:19:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV-4jRYfF8LxdP9XrDuKDsAp7ZXdpCChdp=CanE0xGPUA@mail.gmail.com>
X-Gm-Features: AVHnY4L_7YXtlo4qE1y_LYqC7rM20qjGgpwaQzzNh45fY7gYtsmwSqrimcTuATY
Message-ID: <CAMuHMdV-4jRYfF8LxdP9XrDuKDsAp7ZXdpCChdp=CanE0xGPUA@mail.gmail.com>
Subject: Re: [PATCH] schemas: Allow clocks: property in cache nodes
To: Conor Dooley <conor@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, devicetree@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: D87C44BA16D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31929-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.985];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,glider.be:email,mailbox.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux-m68k.org:email]

Hi Conor,

On Sun, 3 May 2026 at 20:09, Conor Dooley <conor@kernel.org> wrote:
> On Sun, May 03, 2026 at 05:44:13PM +0200, Marek Vasut wrote:
> > Renesas R-Mobile APE6 currently describes clock which supply the cache
> > controller in their DT using "clocks" property. This is not the only
> > hardware that has cache controller clock controllable via some sort of
> > clock controller, for example Altera SoCFPGA Cyclone V and Arria V also
> > has controllable cache controller clock. Allow clocks: property in cache
> > controller node to allow users to fully describe such hardware.
>
> Hmm, shouldn't these cache controllers have dedicated bindings that
> enforce their clock requirements?

Just a few general comments:
  - All electronics needs power, so "power-domains" should always
    be permitted,
  - All synchronous logic needs a clock, so "clocks" should always
    be permitteded,
  - All reasonably complex circuits need a reset, so "resets" should
    always be permitted.

> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

As I have sent the same patch before[1]:
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/dtschema/schemas/cache.yaml
> > +++ b/dtschema/schemas/cache.yaml
> > @@ -33,6 +33,9 @@ properties:
> >    compatible:
> >      const: cache
> >
> > +  clocks:
> > +    maxItems: 1
> > +
> >    power-domains:
> >      maxItems: 1

[1] https://lore.kernel.org/20260113075243.1192477-1-geert+renesas@glider.be/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


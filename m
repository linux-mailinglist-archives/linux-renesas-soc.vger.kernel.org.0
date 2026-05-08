Return-Path: <linux-renesas-soc+bounces-32279-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGu2MyO8/WmOiQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32279-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 08 May 2026 12:34:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B734F5112
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 08 May 2026 12:34:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 685F03019E40
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 May 2026 10:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 928543BFE44;
	Fri,  8 May 2026 10:34:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244262D2382
	for <linux-renesas-soc@vger.kernel.org>; Fri,  8 May 2026 10:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778236449; cv=none; b=AW+y2HnINkA241fL+kvqz/BthTLXP635TitSxZtNdxiwEF1kqTrFplZlq4KYUb/61jg/YxPFAt7d64La3YlN9kFcWXOCUnJmKEwIQ7VsFcNJntpqg4A5elfh77ogPucwGun1E35tN+JTUTz6EAfkRfNEX17N94pAlrPIe43g7tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778236449; c=relaxed/simple;
	bh=36lBpAkEr0H2Wsx1O/r0B32FSIwBe2F6o8wScyIxU0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GSGIVYDP67cSUdEJCv8LxVX44PCiI53DTtJU626TR82Q7Gzbl/N1fO4zjiycdnLh5uowRMRBA90ThGJLMOd31ZyCI0GLTu2K6trO4Ov93fFozBnhIllTh3UTbsl/ov+9xzVWTmvMIxor0A1LPZXP3/7OHOfXaPd/fSc6pykXUbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-944168e8c5fso1097607241.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 May 2026 03:34:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778236447; x=1778841247;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZIqmD8zZ0qFeOi8hR6tlVmjP85Y0OQ26EIUPvE1H2I=;
        b=aBgTEvJHv+PPndyQgwUdRcOkjQ2yNklkBUIni6EM3A7I1N9iYa20V5uEYblXiEKXIZ
         xNVWL1sYR+HTtKBuD4ywMp8yuM7KvL1NZrWSIU2nNI8QDyZMeZNyYJLXG/KVzxjKc9b1
         e4tAMRbW0W8r197TWFpF9HpdTr74zzWwhGrS9wi11HqTbZWhxNAH42hXPMsw3qg0rYpi
         fnHZ3GOJKM799SpqmUO7vOEy8dqaBWU3BXguluEs6KMcHwHPx67hgpDDBhxYcYyzk8pr
         uf0N1P+bOFOjYsYZ5fkHM3cO0G9Pr4uPgs+6cq2GSJfJTBBkpV/3zY4fyBl82C2JwoLo
         sbWw==
X-Forwarded-Encrypted: i=1; AFNElJ+H6/E3bVmh1n1AzASr+jCDyc5ndODA31lF0oYyGv9NpeXFepxNPK2XS2dTm/ZJMiiZwEjeIyEXTJuJyaZfLbIgxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMfdOWbeVsWMhxutOYpK7c2QESdW/Ytg+Ikf+GDom5IzHXOvH7
	ESBc/2vtdbI2F/3iMkAN5IyWlm/zpc09t4qMJe3DZeJwc8Zgu3a3dM0thXLzaPe7p+U=
X-Gm-Gg: Acq92OGG8mtycCi0rrbs9+QTk5BxTZyCN4HEm1bgIKkx1eiOBOSS78ZVlnYWcMPdko3
	i8QIJ6csdY2OC+4tXcNbZcLze8NfOtZU9A5I4+WXOY0ZYuUy72ORPM4k1pE703wMk1c2aineeZo
	ylgsmIRk6nSYYXYAhPjfIVwp5Av5i/ne93Fzps8Qhumw4vDKZBdkvVQREZiPWCkIUIP6zTrS0kI
	xBG0XXkDAXPuByJBbQ6WFiXtiADY8nTHsKE/fEKoDui4VlJgCrpi6kbVWZpRs3cEAciy8wN/y7g
	wszd+IcZd8ZjvFNn4BOEFDDTJuu22GDWydOcJOhKs27nNCMP3UNR9lyz/zlluxw7FzLLh8GD72S
	12SkoayCftFlHHMBTSEp3GZhmKqxnDQPop3R9oT+xR6M0O+kWAdFWkBbECZzZ7UgcY/AKoNaZdF
	BW/BvJD7XhzvvG7IPC9qWBY/0v9KmgQGgAvmBApwdtCs7KHhy4H74IV6MnJWjO
X-Received: by 2002:a67:e70d:0:b0:605:17b8:16dc with SMTP id ada2fe7eead31-630f902ee3cmr6525482137.20.1778236446855;
        Fri, 08 May 2026 03:34:06 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-63140216a98sm638766137.8.2026.05.08.03.34.06
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 03:34:06 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-94b07fddecbso1102187241.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 May 2026 03:34:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/Dk7SWzZRCh6d6O/kFO0dNn99Z/CN9hgbSN1TO0mENEQIKBjvZvY2FGxfOtTLIk4CwgRj3qIp9qBv0dNejAhPUfw==@vger.kernel.org
X-Received: by 2002:a05:6102:3048:b0:614:bef5:637c with SMTP id
 ada2fe7eead31-630f8c2bb7dmr6450388137.0.1778235990622; Fri, 08 May 2026
 03:26:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1776793163.git.geert+renesas@glider.be> <72e2a0e7a5abda02fe36b3f5851842f7a77b2593.1776793163.git.geert+renesas@glider.be>
 <aekXUvIPb8nkhdKu@pluto> <CAMuHMdWJvMH+a1RqozbaCxxH_8M569JcruTFa8PW+87FysnjHw@mail.gmail.com>
 <ae6Zp54NhKlVes8J@pluto>
In-Reply-To: <ae6Zp54NhKlVes8J@pluto>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 8 May 2026 12:26:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWK3Noh5ZQVWT9C0EKyXZePMaJ97C0A_syK+xCb_=abeQ@mail.gmail.com>
X-Gm-Features: AVHnY4J3TVnOKvIG81cskhXstanCgVV2EYjhdTAUgyNfFJiiKyj4H0BCwyLVTfY
Message-ID: <CAMuHMdWK3Noh5ZQVWT9C0EKyXZePMaJ97C0A_syK+xCb_=abeQ@mail.gmail.com>
Subject: Re: [PATCH/RFC 05/14] firmware: arm_scmi: Add scmi_get_base_info()
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Ulf Hansson <ulfh@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 75B734F5112
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,pengutronix.de,broadcom.com,sang-engineering.com,mailbox.org,renesas.com,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-32279-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.970];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,arm.com:email,linux-m68k.org:email]
X-Rspamd-Action: no action

Hi Cristian,

On Mon, 27 Apr 2026 at 01:03, Cristian Marussi <cristian.marussi@arm.com> wrote:
> On Fri, Apr 24, 2026 at 02:08:55PM +0200, Geert Uytterhoeven wrote:
> > On Wed, 22 Apr 2026 at 20:45, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > Also because this should be one of the selling point of the SCMI stack
> > > in a virtualized environment: you can ship the same kernel drivers with
> > > the same DT and you know that ID=<N> will always identify the specific
> > > resource that is needed by your driver without worrying about the fact
> > > that in reality in the backstage the effectively managed physical resource
> > > could be different across different platforms, because that does not matter
> >
> > This sounds strange to me, do I understand it correctly?
> > So the ID should (1) be tied to the use-case, and not to the underlying
> > hardware, and (2) be the same for different platforms?
> >
> > For (1): Then we must not put these IDs in DT at all, as DT is supposed
> >     to describe the hardware (and firmware IDs in DT were IMHO already
> >     a stretch before).
> > For (2): How can there be a contiguous list of IDs, as not all platforms
> >     may have the same underlying hardware?
>
> I would NOT say that an SCMI FW must behave like this regarding IDs, but it
> is a possible SCMI deployed setup that can be useful in virtualized setups
>
> I mean, the DT describes the hardware of course BUT when you refer to
> some of this hardware DT bits from some other subsystem by referencing a
> phandle, even in the non-SCMI world, you are in fact selecting a specific
> resource that fit you use case, right ? Can we say this ?
> I mean you needed that specific clock or regulator that you described
> previously so as to be able to enable some other piece of HW...
>
> Now, the SCMI provides an abstraction on top of this, since you really
> discover domain IDs of a specific class (clocks/regulators etc) you are
> in fact describing an HW abstraction that you then refer with the usual
> phandle...also because there is NOT so much SCMI hardware to describe,
> given that the HW is handled transparently (opaquely really :P) by the
> driver on the FW side...
>
> ...you basically obtain such domain ID, usable as phandles through dynamic
> SCMI enumeration so that you can use it all over your DT to make use of such
> resources...
>
> ...on top of this, consider that the SCMI server CAN provide to its agents
> a per-agent-view of the world, IOW it can (and should) expose to a specific
> agent ONLY the resources needed by that agent, i.e. it can expose the set
> of resources 1-N to two distinct agents and that does NOT mean that the
> underlying physical resource mapped by ID=3 in both agents has to be
> effectively the same piece of hardware: it could be the case, and this
> would be useful to exposed and managed properly a shared resource, or
> it could also be that the same ID=3 could refer to completely distinct
> pieces of the same class of hardware...(same protocol same class of
> resource...)

Exposing only the clocks/reset/power domains the agent can use,
in a contiguous list of IDS, means that the number space changes,
depending on which resources are exposed.

Suppose you have a system where you want to assign a specific hardware
block in the SoC to the realtime CPU core instead of the application
CPU core running Linux.
That means all resources used by that block must no longer be exposed
to the Linux agent, and the corresponding IDs must be removed from
the ID space exposed to Linux.  As the ID space must be sequential
and contiguous, the IDs must be renumbered, impacting resources that
are exposed to Linux.  As these IDs are used in the SoC .dtsi, they
must be changed there, too, However, these IDs have become part of
the stable DT ABI, and thus cannot be changed.

This patch series fixes that issue, too, by describing the actual
hardware in DT, and doing the mapping to exposed SCMI features in the
kernel, based on which firmware version is running on the SCP.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


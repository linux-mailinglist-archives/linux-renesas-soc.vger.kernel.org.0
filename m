Return-Path: <linux-renesas-soc+bounces-28162-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFO1GnqvjGl/sAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28162-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Feb 2026 17:34:02 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2096D126292
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Feb 2026 17:34:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B4836305465B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Feb 2026 16:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5C0332A3D1;
	Wed, 11 Feb 2026 16:30:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857E033F38C
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Feb 2026 16:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770827424; cv=none; b=OLfBcXxjiXhsMeYWqnikoWRX7khbEUd0TrYkyroORNRAOC7A9gwiYsVnkIcI+JV1Ps+zMsErcT8NWwMFNRDZnC72do37Zy5unAzW5j7fALukOAMTrWPUrnv12obRnxYuh9w6erIbNvxMRIJ7+LhXCX0JsfDr039HRUJfq+BrJVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770827424; c=relaxed/simple;
	bh=cMeZSP4ASQ8GWND8BDmf5TSh+qhh/ToWaWSuqXzHvDM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uSa7YIu+H2ShZDOaxSlYqTsFzEh+UNtpZLY055G5cMT6LHc8jJkmO18cNm2rViagqEVNw7WiWT400TAH3DBIlBHdj/l1Zyc8SkqKPG3bp140ecwgWEoZTBS1XkjH1CVIiWI0HGO77KKNVH96rlwnyDp+wTOZhkRH4i1k165m3p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5faa8a9d7b7so2013568137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Feb 2026 08:30:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770827422; x=1771432222;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B4ogstsr1LPrx78n1KJ8ejaHIz64tROV+G0WDoBzT9Y=;
        b=GEryU6z9a3IWMRV7ZJN3Vq2lSbAa+04hDATAv6j3kFl6HdUpwzLRvPFQSVBsuZ0kyi
         8AoGXcRIs2bZzAWGpOR9k8XmF9E11DL/3E5jiU4Zgc0tW0pemOr67xnBofpDgH+O0sSw
         MDeieW+idX5IJ6vwS/BppM6Q28A6D83yFK2YY9r4QdsQFiN+9jsOyrz+U7nATOwzg9M0
         ZO+n762XR8KF1bI4a1Ofbn9tZB1cVOHnMrDxpaXSSsJIkYIBOel/crb4hyssmGho8Gk4
         at7dvJRjWmEdqeoRxXZTq8hLheEBQ9aX8wFaeCPu6wAtIwU+hKA+ftW6wF3xP6faY8jY
         21Ew==
X-Forwarded-Encrypted: i=1; AJvYcCVlnO0s7gGQHP+ZnVUSumgXBBTVsl5ZYYpiA8dm7Ye0amEcWZoNY4ziRnGgJMOdGklceWIS+JJkp/mBNq+tqmp72Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhINx4na28vpJfYe5iHKEjkrdVfh/puVI7d49/Jq9i6RQ5yikA
	eKtihehhF5YEyRdBhXqecIjWtE3iMQ0Sl0pzMW+yr2T0sC5btU71qcQv2wWXSniA
X-Gm-Gg: AZuq6aJPzfkX2Mbvb8VdObN6OzKEMkQBEalv/UxpLp7cAzGjGPNthxbbr0b7gxWmiEb
	BmP4QG3+J53kl6QJHyMuPhiU8uOy6m0bgHKZnOwFr/6WiW2SvEqyFA+3p+74SWWR6f6bXdh4WkV
	VBiuny4qr9e/ujpq80JIiuz4Dwa4U48HA0bVPCfjHF/KqozqmcG/FINYzmtMM0eK+e0x2Qf54e1
	2YoyPHVUgvPkvQ3zbUh+XFtX5HlWIqLPfnNEZZETT3j/13oPwzCN0HiTj3yKZZLYT578Tyymtaz
	wZ3P2WKVO7BigJ1DFsNya/99H05taJn18gRqSG7W10MzbTnK+m2VaREhJcHpYX1hEhaqVW1Llm2
	6zVCyC8yxra1mBRLH5fofK6wCHyX6LfeegNkcnvNWSYS1IXc+dlM1AaK/KzpBpcoemhvH6id+1/
	HGTsEwUK1CflONg7sR3K9GE3lkq3ra/LDkDI01LnRwA6rl7512YW2hkhz2X3ID
X-Received: by 2002:a05:6102:3586:b0:5ef:bd3a:ab1f with SMTP id ada2fe7eead31-5fde976a900mr845366137.34.1770827421617;
        Wed, 11 Feb 2026 08:30:21 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94afcdc345asm927013241.0.2026.02.11.08.30.19
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 08:30:19 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5fdb47d6131so291271137.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Feb 2026 08:30:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUOW+H9LV8SQqzgWFv0TZ5bvV+oBWSZrDZttEqpMtzOTzz8tLbrDR8vbONJk3rkStMSqsDD7XEDsTvgGicYJXmhuQ==@vger.kernel.org
X-Received: by 2002:a05:6102:4421:b0:5ee:a8c4:18f2 with SMTP id
 ada2fe7eead31-5fde93f801emr629474137.26.1770827418853; Wed, 11 Feb 2026
 08:30:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <67c8c4f9bf9f09fd0c13daedef27b82ff389ddfb.1770720452.git.geert+renesas@glider.be>
 <CAPDyKFpY2X8hephSfHq7rj_DaKX76ZSkWSCYXrGTEBUFHkvOzg@mail.gmail.com> <aYyrsPTH1923jV7y@vaman>
In-Reply-To: <aYyrsPTH1923jV7y@vaman>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Feb 2026 17:30:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUHNRuMmHU2ACX84nsZdXn_-fSamnF+LMFvZS3vkHnEWA@mail.gmail.com>
X-Gm-Features: AZwV_QiOx-vNn3RXDRusgjf7_W4m-z1gNAHOmJNuwbjVfchz_J9gD3jZ3pe8F9o
Message-ID: <CAMuHMdUHNRuMmHU2ACX84nsZdXn_-fSamnF+LMFvZS3vkHnEWA@mail.gmail.com>
Subject: Re: [PATCH next] phy: renesas: rcar-gen3-usb2: Drop local devm_mux_state_get_optional()
To: Vinod Koul <vkoul@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Vladimir Oltean <olteanv@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Josua Mayer <josua@solid-run.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, linux-phy@lists.infradead.org, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-28162-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,renesas.com,solid-run.com,sang-engineering.com,bp.renesas.com,lists.infradead.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux-m68k.org:email,glider.be:email]
X-Rspamd-Queue-Id: 2096D126292
X-Rspamd-Action: no action

Hi Vinod,

On Wed, 11 Feb 2026 at 17:17, Vinod Koul <vkoul@kernel.org> wrote:
> On 10-02-26, 14:34, Ulf Hansson wrote:
> > On Tue, 10 Feb 2026 at 11:53, Geert Uytterhoeven
> > <geert+renesas@glider.be> wrote:
> > > Now the mux core provides devm_mux_state_get_optional():
> > >
> > >     drivers/phy/renesas/phy-rcar-gen3-usb2.c:944:1: error: static dec=
laration of =E2=80=98devm_mux_state_get_optional=E2=80=99 follows non-stati=
c
> > >      declaration
> > >       944 | devm_mux_state_get_optional(struct device *dev, const cha=
r *mux_name)
> > >           | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >     In file included from drivers/phy/renesas/phy-rcar-gen3-usb2.c:20=
:
> > >     include/linux/mux/consumer.h:64:19: note: previous declaration of=
 =E2=80=98devm_mux_state_get_optional=E2=80=99 with type =E2=80=98struct mu=
x_state *(struct device *, const char *)=E2=80=99
> > >        64 | struct mux_state *devm_mux_state_get_optional(struct devi=
ce *dev, const char *mux_name);
> > >           |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >
> > > Fix this by dropping the temporary local wrapper.
> > >
> > > Fixes: ad314348ceb4fe1f ("mux: Add helper functions for getting optio=
nal and selected mux-state")
> > > Fixes: 8bb92fd7a0407792 ("phy: renesas: rcar-gen3-usb2: Use mux-state=
 for phyrst management")
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Thanks Geert for helping out!
> >
> > > ---
> > >   - ad314348ceb4fe1f is in mmc/next, and a PR has already been sent
> > >     https://lore.kernel.org/20260209133441.556464-1-ulf.hansson@linar=
o.org
> > >   - 8bb92fd7a0407792 is in phy/next
> >
> > Vinod, do you want to pick up the $subject patch as a fix for 7.0-rc1
> > or do you prefer me to handle it?
>
> Should I drop the 8bb92fd7a0407792 and it makes things easier for
> everyone and then we can pick fixed commit for 7.1 cycle..
>
> Does that work for everyone. I was about to send PR, will hold off for a
> bit.

Alternatively, you can mention the semantic conflict in your PR to Linus,
and ask him to fold my patch into the merge commit.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds


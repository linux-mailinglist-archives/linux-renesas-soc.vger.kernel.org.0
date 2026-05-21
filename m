Return-Path: <linux-renesas-soc+bounces-32900-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMd0CI/DDmqiCAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32900-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 10:34:23 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9460E5A11E0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 10:34:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 49F8830BB533
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 08:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A867261B91;
	Thu, 21 May 2026 08:27:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600E53242B8
	for <linux-renesas-soc@vger.kernel.org>; Thu, 21 May 2026 08:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352067; cv=none; b=j+q9kgCtZnAaANGhD35JWVhPR3lWYsYMBjOAtRTUiWnNg1I+CebT3Pw0Gs+WQaNtdd26CGfH9HdoQoUAHa6T5KCx/jdgfLdrSFaS64e2TR5vn+109oBGsEdoIm4IoXYzcl//YxPZ5tj3NtEutWaQKooYY4OG9Vb2dcQoy3urae0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352067; c=relaxed/simple;
	bh=8s7H6XW7k7X7xmSxjH45D5K9tIbgL0en//u1liivD3U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=icybIcb5uQe/1iJTxUTqOLrHNsWzh3HPlvy7/AdPIHV41uH8nE3R0uoGo/6G21lflVctKznk6W0nn7XzOp5pWR54+t2+RjwzKggGEbQ1028dUBsosJ8mcdlwoc/z8caxNbavMSuVG5KIYKHkDl702D4ejNRAhbqR3Hh3J2Zb558=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5752b279662so2082596e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 May 2026 01:27:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779352065; x=1779956865;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJBmBePAR5zxYZavdDNae1lt8A1fnyv8gTHT/WQkGDg=;
        b=HngkutvJILm2n6sE1Qx23rVJD4owQXjZdTYUyUIKzh6znmgCXEMzz3TZTaP41K5kB2
         swOk359DJx0XeqLYmRl4/HnLF8tPzztUlHhGiMC7Kvy8b3TfEXZ+ALAmOmu5i3vmFl+H
         ELQ9qiAfkBp/bgTO+ypXNVDPwGyuog20anxfDCi7Yf+OMz/FRN3+4lNVQtX8YXthnCcg
         Y+PSy+Kb2woh1+TRnjLkaFiqkXpNJ2Qz+EL4PwoAig/N9ASsNowc/38vxzwu4eGtR7HX
         +hltSIug8uCk4K+HapI+2J67C7CidkH3R3KHEuglg0FkrKk65m6zEL+rD0T+lV4vSHhX
         GGrw==
X-Forwarded-Encrypted: i=1; AFNElJ8MN5ifsCLdTe3cCPhVCKkTYyJ7G//vfLAOn0SjweT2b80Qz1COSCKttNbm2Rti7yiilYjCw2MR2FqUWX0SQ9UwPg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4zuQQDjSjH2KJQg668xC2q9fcHWloaz4YSTudfqU4Z1pxJeG9
	XGw1HFx3csNJ7wuIh9NvmyScu+iRIccicM34S7w41ccRHuAkEyMdNFNwN0qKoLvJWS8=
X-Gm-Gg: Acq92OEDDoV9aqi14jECf79UtODnPCxlk1e1gwW6MUG5Px3aFvgJto8y/jd/DdnFgD+
	CD0VD4PF6Y3a5O+7S4hxMn6sWdjCZkzxLC00AtnH7sJs5VoWjyiY288LvYbcw14WImQ7tqcMi+r
	Bp6vBiIizcmAsdiFyxv/XmuDBZDTrAOKoE13VUC0yzrjOSQ53fVwpTjIhNSKGlvYPUTyucH4EW4
	voc77VgywfoEmxRIWQfkRmXOse0w9eo2c7G0TkXn5zYN+43RS9T+8+76fPFmrjOSZ2RRyxDJp/r
	SsgUA5D+EUMaWWqpb9kIhCrHNkn/coEkdTqq/y7Oi8jLExddWiJOP7Ah0GRl3OLaWpkArUcRng8
	9YLsq1ZaD+P0D05fkUcpG5oWjW9oFyH9TmtR7NL5bnYbNILbT4IKYkaWHpvB5oxkFv2swIYu35a
	HPDL+5yRuF4dz1qtrRbDqyko9pxCKnBvqB4zM45FIgP+G9XdXpkCpMI7NB0ojJXkfT
X-Received: by 2002:a05:6122:235:b0:575:a5b5:3233 with SMTP id 71dfb90a1353d-58424155ad5mr565156e0c.4.1779352065191;
        Thu, 21 May 2026 01:27:45 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5760faa5645sm14811123e0c.14.2026.05.21.01.27.44
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 01:27:44 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5752b279662so2082586e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 May 2026 01:27:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8bQQkXWoWye9STI9uYE9UYHTragKDbFSkEPNWuxHabPxncaVBzJm/GEqmI2+eh9vhusD4GfofR764cx4oB1UGhnQ==@vger.kernel.org
X-Received: by 2002:a05:6122:1c10:b0:56e:f071:d4ef with SMTP id
 71dfb90a1353d-584257c283dmr596427e0c.8.1779352064209; Thu, 21 May 2026
 01:27:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1776793163.git.geert+renesas@glider.be> <72e2a0e7a5abda02fe36b3f5851842f7a77b2593.1776793163.git.geert+renesas@glider.be>
 <aekXUvIPb8nkhdKu@pluto> <CAMuHMdWJvMH+a1RqozbaCxxH_8M569JcruTFa8PW+87FysnjHw@mail.gmail.com>
 <ae6Zp54NhKlVes8J@pluto> <CAMuHMdWK3Noh5ZQVWT9C0EKyXZePMaJ97C0A_syK+xCb_=abeQ@mail.gmail.com>
 <agooKghZJw3iElvp@pluto> <CAMuHMdU8VRCOZtLrM2EoHFmhd5XFs8cwXc2A1tPTTr01KvUx0g@mail.gmail.com>
In-Reply-To: <CAMuHMdU8VRCOZtLrM2EoHFmhd5XFs8cwXc2A1tPTTr01KvUx0g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 21 May 2026 10:27:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUo9=J0hpNfVDfiFGoAqfC73QQxvMCYyahBTTbKT8_6VA@mail.gmail.com>
X-Gm-Features: AVHnY4IdjfB7BITVFZv-z-ao_K498dR56La7qQvqwgCb0qZYOOtkE_cpqTj8o-w
Message-ID: <CAMuHMdUo9=J0hpNfVDfiFGoAqfC73QQxvMCYyahBTTbKT8_6VA@mail.gmail.com>
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
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,pengutronix.de,broadcom.com,sang-engineering.com,mailbox.org,renesas.com,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-32900-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid,arm.com:email,linux-m68k.org:email]
X-Rspamd-Queue-Id: 9460E5A11E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 21 May 2026 at 09:53, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Sun, 17 May 2026 at 22:42, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > On Fri, May 08, 2026 at 12:26:19PM +0200, Geert Uytterhoeven wrote:
> > > On Mon, 27 Apr 2026 at 01:03, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > > On Fri, Apr 24, 2026 at 02:08:55PM +0200, Geert Uytterhoeven wrote:
> > > > > On Wed, 22 Apr 2026 at 20:45, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > > > > Also because this should be one of the selling point of the SCMI stack
> > > > > > in a virtualized environment: you can ship the same kernel drivers with
> > > > > > the same DT and you know that ID=<N> will always identify the specific
> > > > > > resource that is needed by your driver without worrying about the fact
> > > > > > that in reality in the backstage the effectively managed physical resource
> > > > > > could be different across different platforms, because that does not matter
> > > > >
> > > > > This sounds strange to me, do I understand it correctly?
> > > > > So the ID should (1) be tied to the use-case, and not to the underlying
> > > > > hardware, and (2) be the same for different platforms?
> > > > >
> > > > > For (1): Then we must not put these IDs in DT at all, as DT is supposed
> > > > >     to describe the hardware (and firmware IDs in DT were IMHO already
> > > > >     a stretch before).
> > > > > For (2): How can there be a contiguous list of IDs, as not all platforms
> > > > >     may have the same underlying hardware?
> > > >
> > > > I would NOT say that an SCMI FW must behave like this regarding IDs, but it
> > > > is a possible SCMI deployed setup that can be useful in virtualized setups
> > > >
> > > > I mean, the DT describes the hardware of course BUT when you refer to
> > > > some of this hardware DT bits from some other subsystem by referencing a
> > > > phandle, even in the non-SCMI world, you are in fact selecting a specific
> > > > resource that fit you use case, right ? Can we say this ?
> > > > I mean you needed that specific clock or regulator that you described
> > > > previously so as to be able to enable some other piece of HW...
> > > >
> > > > Now, the SCMI provides an abstraction on top of this, since you really
> > > > discover domain IDs of a specific class (clocks/regulators etc) you are
> > > > in fact describing an HW abstraction that you then refer with the usual
> > > > phandle...also because there is NOT so much SCMI hardware to describe,
> > > > given that the HW is handled transparently (opaquely really :P) by the
> > > > driver on the FW side...
> > > >
> > > > ...you basically obtain such domain ID, usable as phandles through dynamic
> > > > SCMI enumeration so that you can use it all over your DT to make use of such
> > > > resources...
> > > >
> > > > ...on top of this, consider that the SCMI server CAN provide to its agents
> > > > a per-agent-view of the world, IOW it can (and should) expose to a specific
> > > > agent ONLY the resources needed by that agent, i.e. it can expose the set
> > > > of resources 1-N to two distinct agents and that does NOT mean that the
> > > > underlying physical resource mapped by ID=3 in both agents has to be
> > > > effectively the same piece of hardware: it could be the case, and this
> > > > would be useful to exposed and managed properly a shared resource, or
> > > > it could also be that the same ID=3 could refer to completely distinct
> > > > pieces of the same class of hardware...(same protocol same class of
> > > > resource...)
> > >
> > > Exposing only the clocks/reset/power domains the agent can use,
> > > in a contiguous list of IDS, means that the number space changes,
> > > depending on which resources are exposed.
> >
> > Yes, potentially, it depedns on how the HW/FW stack was designed I
> > suppose...
> >
> > > Suppose you have a system where you want to assign a specific hardware
> > > block in the SoC to the realtime CPU core instead of the application
> > > CPU core running Linux.
> >
> > Ok, so this is definitely a considerable change.
> >
> > > That means all resources used by that block must no longer be exposed
> > > to the Linux agent, and the corresponding IDs must be removed from
> > > the ID space exposed to Linux.  As the ID space must be sequential
> > > and contiguous, the IDs must be renumbered, impacting resources that
> > > are exposed to Linux.  As these IDs are used in the SoC .dtsi, they
> > > must be changed there, too, However, these IDs have become part of
> > > the stable DT ABI, and thus cannot be changed.
> >
> > Well, you have to ship a final DTB blob that is crafted to describe the
> > actual HW at the end, right ?
> >
> > I mean, in your example, it seems to me that you have changed considerably
> > the HW surface by moving a clock (and its related resources) away from the
> > reach of Linux as a whole, so should not be expected to have an updated
> > DTB shipped ?
>
> It is not necessary to ship an updated DTB.
> The bootloader stack can just change the "status" properties of devices
> nodes that are be taken away from Linux from "okay" to "reserved":
>
> Devicetree Specification, Release v0.4, Table 2.4: Values for statu
> property states:
>
>     Value: "reserved"
>     Description:
>         Indicates that the device is operational, but should not be
>         used. Typically this is used for devices that are controlled
>         by another software component, such as platform firmware.
>
> When all SCMI IDs change, too, much more work needs to be done.

It's a pity we cannot use strings in e.g. clock specifiers.
Then we could look them up by name (which would hopefully be more
stable) instead of by ID...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


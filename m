Return-Path: <linux-renesas-soc+bounces-29319-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +D2qM6vNs2n2awAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29319-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 09:41:15 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A54827FDBF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 09:41:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F4923008D0E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 08:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EED1936C0DC;
	Fri, 13 Mar 2026 08:38:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBE51F1518
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 08:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773391088; cv=none; b=jqepEIYMYW7IL+w/aX7iWDI4NFxSSBPxbtPWCYKA2UReTcqlgfvcFSbObS7HAahtDg0k7wSKeDUTlwe9L4rH3KEhRvFr8CFW1V5XEVv0/7dA5jcD6OPjHsvnAhUqkBZKzaNG41s40EAayY95f9GE6dMrczMXh4AMAZAlest8GiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773391088; c=relaxed/simple;
	bh=yzlpbrbBKik0nRBAZ56qKG8JmXRq2CUfTsNYBYFJkvs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qcwYEbwO7KvSq+3NkT5rolCS7Ogno8lpXgh9yHUaYIiGN9YFvSjOkZpsQnZPQxdxkYxgakFkyjtw3vJ+IVtL7vBy9FXrqEEzSPhJYwBW25gryY7d2kSx0fSZJWUPI348Ij5PI61ZgkqDuh/9ig2iO1q90A+6DYbSB0hDrJYgZ10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5675d609621so1633063e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 01:38:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773391086; x=1773995886;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G6Pa9aWTkiMBPCI+D/MHSkr4FjR8grbvwp7DSGWc+Yg=;
        b=shcAXmBfxYwmnOZr0/i7WgCpak2ktRvx86qdy7+DV830PbhS772TSOrU58gd6oAdao
         bfRekl/k8oJlmO+V7PbYCn96CZ9ozJcl7om39u83+yUqouuXAO5FlJFlC0qQbnnx7Ij4
         W8ZOHvY5+lG9aPPUQWSa4t3A6H3wsyTejim4vNWY51fIYzAmGLFREgXerFTxXBn4QVz5
         Z0r1x4uB1j4VCKGeYQVIS88NmYLRA79qIgAGXcxKYsJgEpAq9ZhNRuho2mYvblwaOFka
         nxeNENrHdrU35aktD9CHPpDOTYROMOgQKYHPaxsp29/j8YOYi7vDLrFAP2KmfFvhjosq
         MHFw==
X-Forwarded-Encrypted: i=1; AJvYcCVq09G6aHBLReRrx4iNrrsn+Q37YfBZaJ3qnfNzL7XsN8gKP6N9f4ZPv6DreZHw7qGruFhI6Kl/z3zrLkAAPgE/Mw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yydb+av5Tz552FI4JZgZiy5wv9sji52jE+kbRdS1Nz/8/HUGlL4
	nUFgg2xtDS3shnsijRoENa2ZRoE9Id6Qf4O0KgboZXZbYcy4bx12xIaGUk4M2Ety4IA=
X-Gm-Gg: ATEYQzzbhf2NNDfDwvGVKTbGuqOmYWLvPZwmSsRXrnK/I/C054DT3jznRbxBvAIVJHC
	m4OWPGW9XlPczbEg9WRh1butuk86zy5aJZ0cAyIj569yipUpamkJU2r5lmMy3MnfqQHJHt3QVr+
	PeKhn8MwcxH1G0s7GKWRBhgaw3WnxVdgtF28E0r+CO+b6CM/FIeR0JQ+3+BeIgHiew3M/z+UNuO
	oKfmSoyMPr14xV8QHJhbptD8HBUZUfSZ1S9o0IopauwZM/Ull1sj+m9S/EVh5jQ8I4hLoImkIj6
	qVtj6XNKLhxlfSaKFmXeDIqRaNKdtqIMaQ5pZij8U+cX2fhZQ/B+QhxlwiDvOFHtd5Gy4KECKby
	TsKJrljkIwjb1Qj+1kLYp+6M3qGZyjrjMfv+5hCzCcNabcK/5Om1VX6odxnFs9aLPp8iLB5Y9A6
	njrFZyGafEY2qZ1Xr0JtmIRBL6e9qQcd2LFPNtiPMK3bwiMwSMPMnE/y/P6feB
X-Received: by 2002:a05:6122:2989:b0:55b:7494:177b with SMTP id 71dfb90a1353d-56b628dfb7fmr974707e0c.10.1773391086209;
        Fri, 13 Mar 2026 01:38:06 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94ecff69249sm2446359241.12.2026.03.13.01.38.04
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 01:38:05 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5ffc879c1aeso1232481137.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 01:38:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWpMfmLwAoQ0XMbXeQxRlD1EEgDBC+uXmRtbj3mC9xizODecGADFtdtJUBm0f7IXOvzjflw6K13XbclJFzpZRriLw==@vger.kernel.org
X-Received: by 2002:a05:6102:508c:b0:600:a2:1397 with SMTP id
 ada2fe7eead31-6020e5345d4mr1072589137.25.1773391084694; Fri, 13 Mar 2026
 01:38:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMuHMdXrYTGQkjC1Sr4NjOcsRyOw3_eEj9m5MVVo1GWUuCxo3Q@mail.gmail.com>
 <20260227095742.4449-1-phucduc.bui@gmail.com>
In-Reply-To: <20260227095742.4449-1-phucduc.bui@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Mar 2026 09:37:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUNA=wTksUEmnW7NQ=XCjMBuHDyJy-XqZh4yRxECNFuwQ@mail.gmail.com>
X-Gm-Features: AaiRm52euRkRYote2HVmfk03rr0AuE-oJu0RlS2GkMnI_IuORuzmIExqtJcu-Vk
Message-ID: <CAMuHMdUNA=wTksUEmnW7NQ=XCjMBuHDyJy-XqZh4yRxECNFuwQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm: shmobile: Fix blank screen after resume when LCDC
 is stopped
To: phucduc.bui@gmail.com
Cc: airlied@gmail.com, dri-devel@lists.freedesktop.org, 
	laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, simona@ffwll.ch, tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.freedesktop.org,ideasonboard.com,vger.kernel.org,linux.intel.com,kernel.org,ffwll.ch,suse.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29319-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	DMARC_NA(0.00)[linux-m68k.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email,glider.be:email]
X-Rspamd-Queue-Id: 3A54827FDBF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bui,

On Fri, 27 Feb 2026 at 10:57, <phucduc.bui@gmail.com> wrote:
> > What do you mean by "deep sleep"? s2ram? In upstream, s2ram behaves
> > the same as s2idle, and the LCD works fine after resume from s2ram on
> > my Amadillo, with and without your patch,
>
> > What am I missing?
> > Thanks!
>
> Thank you for your feedback.
>
> To clarify the "deep sleep" context, I have tested both s2idle and deep
> states using:
> - echo freeze > /sys/power/state
> - echo mem > /sys/power/state

OK, same for me.

> On my hardware, the issue is consistently reproducible in both cases,
> resulting in a completely white screen after resume.

TL;DR it depends on kernel config.
With my .config, your patch is not needed (but it doesn't hurt).
With your .config, your patch is needed.
Unfortunately I haven't found yet which config options causes this.
I will send you my .config by personal email.

Your change looks valid to me, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> Regarding why it works on your side: I cannot be certain about the
> specific differences in our hardware configurations. However, on my
> setup, the debug traces clearly confirm that the LDSA1R register is
> reset to 0 after resume.
>
> Video demonstration:

[...]

> Detailed Logs and Configuration:

[...]

Thanks for this very detailed information!
Since I did the investigation anyway, here are my results:

1) Using commit a75cb869a8ccc88b + debug info:

I get:

    >>> ENTER: shmob_drm_plane_atomic_update
    >>> ENTER: shmob_drm_primary_plane_setup
    shmob-drm fe940000.lcd-controller: [BEFORE] LDSA1R: A=0x00000000
B=0x00000000  MIRROR=0x00000000

Same as yours, OK

    shmob-drm fe940000.lcd-controller: [AFTER MIRROR] LDSA1R:
A=0x00000000  B=0x43a00000  MIRROR=0x43a00000

A and B are similar to yours, B is just a different address, so OK.
In your log, the MIRROR value is truncated, so nothing can be decided.

    shmob-drm fe940000.lcd-controller: [AFTER SWAP] LDSA1R:
A=0x00000000  B=0x43a00000  MIRROR=0x43a00000

A and B are similar to yours, so OK
Your MIRROR value is truncated (I don't trust the final zero)

    >>> ENTER: shmob_drm_crtc_atomic_enable
    >>> ENTER: shmob_drm_plane_atomic_update
    >>> ENTER: shmob_drm_primary_plane_setup
    shmob-drm fe940000.lcd-controller: [BEFORE] LDSA1R: A=0x00000000
B=0x43a00000  MIRROR=0x00000000

A and B are similar to yours, so OK
Your MIRROR value is truncated, but different from zero!

    shmob-drm fe940000.lcd-controller: [AFTER MIRROR] LDSA1R:
A=0x43a00000  B=0x43a00000  MIRROR=0x43a00000

Your A value is zero!
B is similar to yours, so OK
Your MIRROR value is truncated (I don't trust the final zero)

    shmob-drm fe940000.lcd-controller: [AFTER SWAP] LDSA1R:
A=0x43a00000  B=0x43a00000  MIRROR=0x43a00000

Your A value is zero!
B is similar to yours, so OK
Your MIRROR value is truncated (I don't trust the final zero)


2) Using commit a75cb869a8ccc88b + debug info + fix:

I get:

    shmob-drm: LDCNT2R=0x00000000 (DO=0)
    shmob-drm fe940000.lcd-controller: [BEFORE] LDSA1R: A=0x00000000
B=0x00000000  MIRROR=0x00000000
    shmob-drm: >>> BRANCH: DO = 0 (Direct write path)

Taking the new path

    shmob-drm fe940000.lcd-controller: [AFTER DIRECT WRITE] LDSA1R:
A=0x43a00000  B=0x43a00000  MIRROR=0x43a00000

A is now set, too

    >>> ENTER: shmob_drm_crtc_atomic_enable
    >>> ENTER: shmob_drm_plane_atomic_update
    >>> ENTER: shmob_drm_primary_plane_setup
    shmob-drm: LDCNT2R=0x00000003 (DO=1)
    shmob-drm fe940000.lcd-controller: [BEFORE] LDSA1R: A=0x43a00000
B=0x43a00000  MIRROR=0x43a00000

A is now set, too

    shmob-drm: >>> BRANCH: DO = 1 (Mirror path)
    shmob-drm fe940000.lcd-controller: [AFTER MIRROR] LDSA1R:
A=0x43a00000  B=0x43a00000  MIRROR=0x43a00000
    shmob-drm fe940000.lcd-controller: [AFTER SWAP] LDSA1R:
A=0x43a00000  B=0x43a00000  MIRROR=0x43a00000

End result is the same as before.

Without the fix, I ended up with the correct value for A, while you didn't.
With the fix, we get the same results.

Using your .config, I get the same results as you did.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


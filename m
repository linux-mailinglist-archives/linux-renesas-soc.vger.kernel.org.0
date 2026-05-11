Return-Path: <linux-renesas-soc+bounces-32388-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOniM9/sAWpHmQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32388-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 16:51:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3141D51093D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 16:51:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B751A3045456
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 14:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC6F73FE670;
	Mon, 11 May 2026 14:43:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268273FE374
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 14:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778510625; cv=none; b=fQAXyE4bZNaubcqf0rp7Pfo1yNXzIzzisJeDnrHbrDSanrMrMyT2UakXGqXhfyDK9O4znPkBvaSKeaMuMN/Bs7NGv5XKpozYbXv5R1j8o2tYARDWJLSCVBIi+2qkzVzDZgaMxJPfrYBK+Ytgz6OKLI1Efszn2vuf0i9TvBm8hxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778510625; c=relaxed/simple;
	bh=YnqJ33I84XVSN+amPM8E1K5ixHc1/5kZeXucJnHeqj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Krtz1G2RvSKXAAZLZ1I17/SMso8mZ5s1gh2M+O47RYdMUxDc4oANyej6Uj2z6ZrljLvku9EnkQ8VFTiZaaoqorJQsiB6LWt/gbVmHrZlxdtSU5Ljmslohe24nQEZ5G4SokWv/4SfG1iRAyC8d5M4Qa3OQZ+/gCK9cfcPaJextk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-57513ac61f0so1278145e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 07:43:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778510623; x=1779115423;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=st99TRUJvP9iusm7HufBndg1A/dlmXWO+RvQR75PMEA=;
        b=kO9fZ+2Ro2d3oDL0ORq3tk9phJbD/mfetysEgr9kHTrkKW1t/2Wss+tIdk6G2JR8FE
         C/RrQuIrM/ZMlgt7CwW7vDxCwFZbCFUlAHIDV6tI2x6tzn+pMExahG2pWlfwUtAY3kiu
         3gpb56ZQRSDSgL+Ow1RiZYo8Cm8MSKf3VlhNFnT2e2qYPe+bE0tFQEx/g7fIz5AZHxpt
         SpEhRnJSWJlupoXBN8ABoLpQ6i7gGE03zoAVOwfd4vv2x7FQ5V5zosGFn4EbjtjkHlcA
         gv6wHvVmBWX9Yt0Bx7CmtErrGZ4VqigoIJqZDPB4IxEn3u2PBKUehyjipAlurADuhvqt
         rX5g==
X-Forwarded-Encrypted: i=1; AFNElJ+efG3ChmWqvos1gYoo4rXwtCPGEWuNfizlreSWyH3TbhwqmV9I0xaZtfTNVsszaZYUJvyllnjbfVPd7M+xB666RQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEt4I8e8v5wF8VW0wWiJWkPAXhdo+3baCqpcpXp0a78uuG8NCe
	O5iNmw1vPPxNjhV0NKVC4SauiINBMl8KbQ+r/zTy/ZbjcW9u+ax+9UAQSfjNcBX4
X-Gm-Gg: Acq92OEW1oGXqzoFz+aufbY2HHAtFqTxJ0hB9MkbXsgHWa3e8ehMwhbJxM68dh4eeQF
	soG4JJFD2Hl6m0NMwrbFtUuY3j143J2V4+sOF1MU5rgSDh+vj349rO0rI5arFwNY5U3xvbjtxm7
	euJlMKbpej4lbDroxK06LFDKju6O06ecUAZ2N0m97I5f9qyzyBm9ytqYH9jZgyQXXzlsAAF2YNl
	Whmqbifl4JBqbZRqdzgQiZakg5pwIyT2bi97wyU+qzeGXw/D92T8UdInx/DgYF8uW/J1oaT0WgF
	XO5Sbp1r15hOKLWPA2Y8KBr7L/XzJO2iNMsreeXHxJMFja8v91zFBpLcNGzOF455d+45a9c9Zkp
	D6iexgUCaoTancA+s0+8Duh51MuCVDfd8BPLKvAwlydQUj+77DbeBaf10uTnt785/22Mc1iDgW1
	hFDlouwQ0JSxZkUg9MWtqO78IJGbO5F92hDPUP8bYAZbkXbmvHo2O1RjD/9O9A3KFE
X-Received: by 2002:a05:6122:1684:b0:575:33d4:d100 with SMTP id 71dfb90a1353d-575991e6954mr3892151e0c.13.1778510622960;
        Mon, 11 May 2026 07:43:42 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-57586996d3esm6955174e0c.6.2026.05.11.07.43.41
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 07:43:41 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5753a289955so1366453e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 07:43:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8n3zCv7vG90WA8LeES2cy8JNcQW6p2YAwSNWR+FMFmdrjvPP3Qe8/9xjDYLfS1Xnv1EldTl7rIpp0vl9E6sOxX+g==@vger.kernel.org
X-Received: by 2002:a05:6102:8553:20b0:632:3bd:65ad with SMTP id
 ada2fe7eead31-63203bd6cdamr2502747137.3.1778510621097; Mon, 11 May 2026
 07:43:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <caf5e011a5b3fbdbab8c50d064bc8342212d5cc1.1778505897.git.geert+renesas@glider.be>
 <f46eff18-4a5c-4c25-a0b7-71cdbd444014@imgtec.com>
In-Reply-To: <f46eff18-4a5c-4c25-a0b7-71cdbd444014@imgtec.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 May 2026 16:43:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW_YbjCfhe=Uf+fPjCiwf6272aNHaOjd8B1HUrkeLJrvA@mail.gmail.com>
X-Gm-Features: AVHnY4K1p3Sxqu1LsvDjBrECNKZ4-7U0HiQ3AWU71iqzjSPovIWm8-sLEWk57G4
Message-ID: <CAMuHMdW_YbjCfhe=Uf+fPjCiwf6272aNHaOjd8B1HUrkeLJrvA@mail.gmail.com>
Subject: Re: [PATCH] Revert "drm/imagination: Warn or error on unsupported hardware"
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Adam Ford <aford173@gmail.com>, Frank Binns <Frank.Binns@imgtec.com>, 
	Alessio Belle <Alessio.Belle@imgtec.com>, Brajesh Gupta <Brajesh.Gupta@imgtec.com>, 
	Alexandru Dadu <Alexandru.Dadu@imgtec.com>, Luigi Santivetti <Luigi.Santivetti@imgtec.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 3141D51093D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linuxfoundation.org,mailbox.org,imgtec.com,lists.freedesktop.org,vger.kernel.org];
	DMARC_NA(0.00)[linux-m68k.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32388-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.916];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,gitlab.freedesktop.org:url,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,imgtec.com:email,glider.be:email]
X-Rspamd-Action: no action

Hi Matt,

On Mon, 11 May 2026 at 16:06, Matt Coster <Matt.Coster@imgtec.com> wrote:
> On 11/05/2026 14:28, Geert Uytterhoeven wrote:
> > Revert commit 1c21f240fbc1e47b94e68abfa2da2c01ed29a74d, as it stopped
> > the driver from working on various Renesas R-Car SoCs.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > DT binding documentation updates were reviewed by the drm/imagination
> > maintainers[1][2][3], DTS additions were reviewed and/or acked by the
> > drm/imagination maintainers[4][5][6], and firmware is available[7].
> > Note that the GPU nodes were not enabled in board DTS files before, as
> > not having suitable firmware installed under /lib/firmware could trigger
> > a crash, not directly related to drm/imagination driver support.  This
> > was fixed only recently in v7.1-rc3[8], so board enablement[9] is now
> > unblocked.
>
> We will freely acknowledge that the sequencing was not ideal here. This
> patch should probably have been sent before we started accepting DTS
> changes for those Renesas platforms. However, the purpose of this patch
> still stands.
>
> We're not saying we never want to list all these platforms as
> "supported", but we don't want to mislead anyone into thinking the GPU
> on these platforms will function in any meaningful way just because they
> now have DTS nodes. We were originally convinved to allow these DTS
> nodes to be added since it would facilitate active development on these
> platforms, but this does not mean that we as a team have the bandwidth
> to do that work ourselves at this time.
>
> Our main concern is around the UAPI: we don't know for sure that support
> for these platforms (which are significantly older than anything we
> currently support) can be correctly implemented without UAPI changes. To
> that end, we don't want to back ourselves into a corner where the UAPI
> cannot be updated at a later date.

Automotive life cycles are long...

> There's a similar mechanism in place in userspace: the user must set an
> environment variable (PVR_I_WANT_A_BROKEN_VULKAN_DRIVER) to use
> platforms for which we don't promise API conformance, but just like in
> the kernel, this is not a compile time option and any user and/or
> developer can enable it if they know what they're doing.
>
> As for "it stopped the driver from working", no it didn't. The driver
> never really worked on those platforms, at least not in any useful way,
> and certainly not sufficiently for any non-developer user to benefit in
> any way from it. The only change is that the user must now acknowledge
> that this is the case to clarify that they shouldn't expect much (if
> anything) to work. Just to be explicit, "firmware boots" is a loooooong
> way from "ooh pretty triangles".

AFAIK, it's working better than just "pretty triangles", e.g. glxgears.
And people are working on support for more SoCs (both newer and older),
for which patches (both Linux kernel and MESA) have been posted...

https://gitlab.freedesktop.org/imagination/linux-firmware/-/work_items/13

> Would you prefer a different approach to providing this information to
> users, perhaps a purely docs-based solution? I'm not convinced that
> would be as effective at preserving our ability to mutate the UAPI for
> these as-yet-unsupported platforms.

One can wonder if it's the kernel's job to block the use of this
hardware by default?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


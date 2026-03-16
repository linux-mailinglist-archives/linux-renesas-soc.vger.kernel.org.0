Return-Path: <linux-renesas-soc+bounces-29461-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMyJD5O+t2n5UwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29461-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 09:25:55 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CE25829621E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 09:25:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5E455301C920
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 08:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37A36373BF2;
	Mon, 16 Mar 2026 08:25:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA5736E460
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 08:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773649535; cv=none; b=hODKFnSjkhp4WCsvvMzs2A2nZ3i/plTtH4KGwX3IRiP0fRAbJsYeUsH5K2vGV2G+ItPzmt7Hj38H6WpPmTs58vziCOXjW1ZBhgd0Hkibq3n5mfxhzTa8Yg2KZVmMGYyA5Uk4C8IVFD+Mawy8wBPeeONi6SsIDDJKR2+RqeJfR18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773649535; c=relaxed/simple;
	bh=b3D2cvYxaRTwimRhpTqSoEI3N106GPgqUDVsPffvnA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t+6lJLNLtKqlpEHJ309UGLp+d3QPuSmnBleCfOH8K5xjx+P0deDfqax7WDasGBJfAP1O2X6I79a/vLgg2g9GzH1u/Fr7QBp3zSclUklwgf2aQARguagDrKs9CqdRwTuXroYxg2AZvjQulkmq+S4xFia97vKf7qv//gmWulebvVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56b7fce3ae6so1025974e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 01:25:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773649533; x=1774254333;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+8w1ZWnLMf6F4C87k8bElJ70YpWAqTRI9KRHLM4iWmQ=;
        b=fb/htS78Iu8xjiue8JICYyi1lm5c05CgKG2DgdiA80bZlQgEzH3L/5LXMwntHexsJD
         335gscCh6bwB1PfsHeTuXWM5pd7fN78Wh8L+t6hZ/J395MlPZFwtn5aVRaEk1BzP/3HA
         wI9kb9M0D/4eCbVLxttb9dmPASrtopUX/SUyZSnN4fsJbxbLhTMtmCTHDoTAn6Xlnqc6
         7cuj/5NFRacO7bk3fOxBKNnDnxM6QrXz2CBydjp50S3v8d3SISCoBLZkAmRgQE8bgnji
         tK08W40JG0IDVuoByefB3uniRM/jaIIjmXP3imU21FxKSrqRjKvJ6CLv+2cWCGqSnxOf
         zfTA==
X-Forwarded-Encrypted: i=1; AJvYcCUgmIec+RPtE3xa1pG9SI6NNF+T1u4HHtKNDV8sfNnPDr03xZHjtg4RZVjtBAyCGyZKAGq3ss38HKulOYh+5lrLOg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb+x5HEwBKuvzKA325UyHVSQ/4DTD/uPKtvgYQN+1D8ocoPpB5
	q2gFBbCG7R4FESpJjW+gLwIh04v/9PJD3R5y9xmrgyaCS0rhM74y7yaj5lF8kFj1
X-Gm-Gg: ATEYQzxTN4GDRoUibr1HUscN+A9rQ0qmcFEdlfjYFbpqCtc7axAAkOlKeL9UD6rLvNz
	GHwTZCBkLYQ8bWDIgOqkvep5PXcHMCGVFe2QANsxsa5ACpbiS4TIaAj2g/KGwo0UxO03lZblZIn
	ZWwXxlfSCCHc6BBZinQB0D0xSpIv4zIqDUVHyphYdXxHgT9rEYbj1RNOtOdsUJpNRV0Zxx78iMh
	/U6tZ0y8opGzr+6s/6F7XnieGEDBmazXnc0Jg0x0/Dha1qpWoMX0Z2k8b2UjuEg9cmyk8LSLaZn
	HBnZPSipgK/Thu943ir8Y6gfMWG1zf8b+MmDubNAbwkevOOTfQI0648o3AtJn+pi4T+w+qQbiur
	a3IkB1sQyD9xcFrs6PPALMpB6ujN4enuPqKZejq5UYE/swDdSrA7+5qUC7xsIHWNUse+MreI23O
	1UImyjs+qKaAgHcgnrHXswwlAYu7f17phWKxa8RC8UEiAb4MnHCj8tNWkCVIKg
X-Received: by 2002:a05:6122:6006:b0:56b:785e:d7b3 with SMTP id 71dfb90a1353d-56b785ed868mr1446567e0c.4.1773649532822;
        Mon, 16 Mar 2026 01:25:32 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b672c2c7csm4030950e0c.20.2026.03.16.01.25.32
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 01:25:32 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-94ddffda372so3267510241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 01:25:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXldYwen/VHG2xgnvFd0lUXAEV4bvRc3pW3JRPFdCMGELHuUVTKAmIt4bZXkyep0ujeYOjrH+4yirLnClMoW3K6dg==@vger.kernel.org
X-Received: by 2002:a05:6102:6ce:b0:5ff:bb36:891f with SMTP id
 ada2fe7eead31-601f4ab98d5mr6344003137.20.1773649532209; Mon, 16 Mar 2026
 01:25:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1773399669.git.geert+renesas@glider.be> <cover.1773399675.git.geert+renesas@glider.be>
 <44491e75-4c73-4c8b-bc34-888d1e047cff@kernel.org> <CAMuHMdWLOCvKfp4bULzm6N_3u1Mh831Z0EW++8473wvs29MRHQ@mail.gmail.com>
 <b5d2f9a6-8039-48fb-8d7e-ee7823c504e3@kernel.org>
In-Reply-To: <b5d2f9a6-8039-48fb-8d7e-ee7823c504e3@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Mar 2026 09:25:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW9dNT99N2UWbh+-YTdhafQtBRz_xE7iX2pA2O+KC-eiQ@mail.gmail.com>
X-Gm-Features: AaiRm51dZoP08rSkEPZA2qRhTlGCqYmiKD1mwKQ8Vzj_OaeTy2G1pzJ_lXZLAZU
Message-ID: <CAMuHMdW9dNT99N2UWbh+-YTdhafQtBRz_xE7iX2pA2O+KC-eiQ@mail.gmail.com>
Subject: Re: [GIT PULL 4/4] Renesas DTS updates for v7.1
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@lists.linux.dev, Magnus Damm <magnus.damm@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,lists.infradead.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-29461-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux-m68k.org:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: CE25829621E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Krzystof,

On Mon, 16 Mar 2026 at 09:22, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 16/03/2026 09:18, Geert Uytterhoeven wrote:
> > On Sat, 14 Mar 2026 at 12:23, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >> On 13/03/2026 12:13, Geert Uytterhoeven wrote:
> >>> The following changes since commit 85c2601e2c2feb60980c7ca23de28c49472f61f1:
> >>>
> >>>   arm64: dts: renesas: r8a78000: Fix out-of-range SPI interrupt numbers (2026-03-06 13:15:21 +0100)
> >>
> >> Also nothing explains me what is this, IOW, why this is not RC1. Pull
> >> request email has place at the beginning where you explain such things
> >> and I can easily locate or understand the base.
> >
> > Let's readd the part you cut, which is also present in the cover letter:
> >
> >>> Note that this PR is based on "[GIT PULL] Renesas SoC fixes for v7.0".
>
> Ah... no one reads cover letters :) so I expected that information here,
> before the pull boilerplate. I guess this depends on scripting, so it's
> fine. I will look for cover letters in the future.

As I wrote above, it was also mentioned in the PR itself.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


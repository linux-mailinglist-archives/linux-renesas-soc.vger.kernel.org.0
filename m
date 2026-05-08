Return-Path: <linux-renesas-soc+bounces-32308-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIulMrEc/mnymwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32308-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 08 May 2026 19:26:09 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 443B84F9EF9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 08 May 2026 19:26:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B2E933029C17
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 May 2026 17:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA76E37BE62;
	Fri,  8 May 2026 17:26:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818FC33AD9A
	for <linux-renesas-soc@vger.kernel.org>; Fri,  8 May 2026 17:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778261165; cv=none; b=sH3/wXU9sra4BUkJzfxMqfsIRm0ULKoR/TQkSZEp0n/VfkS7kKGVb/iPcyEp5eDNwr+jAzTCZvY0n2wgMY0WooeYaqOJ+ZMNDsvgmBwwJzX7cckNdj+B+9GSAEfGnEW39LxslXxqcjP2Z+bnL3rAMJ6bfOxohVOC/79mxhOsTvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778261165; c=relaxed/simple;
	bh=d3tqz39L8iL5cu1eneVe/IK3XxjBUmhnX0iGHJqd3Ns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p1xobHHK6Sf0MDYYUWcL0YOxWFHj0gNmqVquIda0/TWKUjvdOESSwIqH/U61+O21ploF3eGrDK2sp3C4QqrzVgCbayX1oC5KBanUuXQjFz46Lz3O2iOhg/KZsvEY2DUspLvKy+9eUT2ZBgDvVF6LvGxFS3I9qmkg86wNq/7P8U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5751a9020faso1440246e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 May 2026 10:26:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778261163; x=1778865963;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u1gOD0ZM4cLpgZVKDB7ZJDmU99nqHZQBEOc0xVeQoZU=;
        b=tEP+ZJfQfAOb8GAthLM+Vre2whOz5g0soBRySyumBjysK73zof+8im3W0O/8HDdWJ5
         xRtgivlIZlBYamyE3T/2211/gpHagCYf+a73eVgvsSjy3X72y6cnM3MDnDpnEyaobxeA
         egE3wfxXHVQ0CdWjQ6GzfzY2akyNGw5BcwJQe82kcsdsIAmT3XirxigG0mEpZiTnyqHp
         CHjaAgqcnzxO0yQo6bG8LMGv7sCC6drTjz01j195Nl0YmyLMEdB8MZYMvFjPoeSMVgt0
         PgELrq4jzX6ZH01S/7cnTJ7tdOO9m387Bq1r5QKIukAXaHtBR1wsnekwHLvAVZ7uHHVH
         Zzpg==
X-Forwarded-Encrypted: i=1; AFNElJ+gWkLmJYIarG8g7u2IkFxUhgYX3+nI2e4fuWDdsiowNDzz1ZQNGIhtAtBIvwy105ySI3SIjwvp1V1GcYzaJLGRqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlQcakxhkLLHNfgK8Q7e6jb1d0bMvQ+GylecM9bdnJ7k0KQJ3b
	32zHN8SjVoiTei8J7NdXIt9mzyBCLyAP+/aIkc+rXSxoZR+tTfVKl4tgB/ydv2ld
X-Gm-Gg: Acq92OEP5+9VxR7iB8JsvSCrrALFOz9WA4TSSwKcyfuxgeLh6SGaj2RA7TQfjwmknJG
	EdC0hKn+IBUMMirWYnd+ViJxoPBRyi5+zurT9xT1wkZ1ENiMUZeMaiFNO+biHOCCRePv3rZtxKz
	hU0am0n5pAzK+B+C2T53pK6sjY/W4Tmc4+MN3bUNcecRUYtDmHdjylF+B0DoreO2NG/jUF1THp0
	iQW75HIlx43rLIo34xU3w169YgWxA/dyB/VWtFPftWPHYAK11rLBy2sIZoZHk4lUNf+M7NjWcx8
	CzCh6jtjZAHWld+FlP5Pr966kj5Vqd0wFEas1f26LPqDi0mYy3SEEeHeKeufMRnHwBvuSoKIJe4
	EYeOqJBYtDeIo1VUdkC51dzw5o0PmlnxM+ITcFrhX5JDW3r/FA4ISVz5IC6ToNco4FMuxcvisvJ
	OxWZfhoPLRj8gHPbCb1oDtys+gALKXixDfC9BgH8iQWQZeTDSaGINYvtHNfieb
X-Received: by 2002:a05:6122:489a:b0:56a:ef51:4cae with SMTP id 71dfb90a1353d-575594f7432mr8704620e0c.4.1778261163334;
        Fri, 08 May 2026 10:26:03 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95f219c6d64sm1219505241.3.2026.05.08.10.26.01
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 10:26:02 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-95f2c75fca1so171677241.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 May 2026 10:26:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+4Nm7I5Zj6qud9DNbHNbFhDv15PIC07KlJniZO4ArQ5WufnSwAGGP3ysZz5Dqcv40r8rpvKf3duvgH6hBiJmq4Hw==@vger.kernel.org
X-Received: by 2002:a05:6102:8496:10b0:631:37cb:1e64 with SMTP id
 ada2fe7eead31-63137cb2003mr2206554137.4.1778261161532; Fri, 08 May 2026
 10:26:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508153300.2224715-1-cristian.marussi@arm.com>
In-Reply-To: <20260508153300.2224715-1-cristian.marussi@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 8 May 2026 19:25:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXyJcmL1k+odRC3ej1fx2oH_Li3RjniXuqXyJUMpBo7CA@mail.gmail.com>
X-Gm-Features: AVHnY4ImO3mUPR5n2IoskKjzHgmLGVKQHLOrOGove6CxmDdyTEnlUGm3u2KWMbE
Message-ID: <CAMuHMdXyJcmL1k+odRC3ej1fx2oH_Li3RjniXuqXyJUMpBo7CA@mail.gmail.com>
Subject: Re: [PATCH v4 00/15] SCMI Clock rates discovery rework
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com, 
	philip.radford@arm.com, james.quinlan@broadcom.com, f.fainelli@gmail.com, 
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com, 
	peng.fan@oss.nxp.com, michal.simek@amd.com, geert+renesas@glider.be, 
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 443B84F9EF9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com];
	TAGGED_FROM(0.00)[bounces-32308-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.967];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,arm.com:email,linux-m68k.org:email]
X-Rspamd-Action: no action

Hi Cristian,

On Fri, 8 May 2026 at 17:33, Cristian Marussi <cristian.marussi@arm.com> wrote:
> it was a known limitation, in the SCMI Clock protocol support, the lack of
> dynamic allocation around per-clock rates discovery: fixed size statically
> per-clock rates arrays did not scale and was increasingly a waste of memory
> (see [1]).

[...]

> v3 -->v4
>  - Rebased on v7.1-rc2
>  - Removed unused info.rate_discrete [Geert]
>  - Made dev_dbg() more meaningful by printing tot_rates [Geert]
>  - Fixed build bisectability by renaming properly to iter_response_bound_cleanup()

Thanks for the update!

I believe you still have a possible runtime bisectability issue
between "[PATCH v4 04/15] firmware: arm_scmi: Simplify clock
rates exposed interface" and "[PATCH v4 05/15] clk: scmi: Use new
simplified per-clock rate properties": 04/15 removes the last setter
of scmi_clock_info.rate_discrete, before 05/15 removes the last getter.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


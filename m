Return-Path: <linux-renesas-soc+bounces-31698-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDiqGcWA8Gn6UAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31698-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 11:41:25 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAB4481B09
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 11:41:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0A3B6301287E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 09:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E83D3C5DBE;
	Tue, 28 Apr 2026 09:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q3miB2Dd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EFF3CFF55
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Apr 2026 09:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777369282; cv=pass; b=om6IdtXf/S4AbfT/ePPYj+Xg9ScYT4qN4lGHRztBrNwbksVce2UcYtubKBhMy7h4ZKqMMz93MaVQvYcAmRBp5TxNoWSeVQKOhbaB2OfJDtEya08FtJdeCmkWuXbdPJU4o1sXz2rF3nFkPnfnrXEtZ2RjiAmQadiOKkq6TNrDtDk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777369282; c=relaxed/simple;
	bh=z+RviMs9g44rVfq3IhufiHmgZV9hxNooZsGNxeL+nBs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sgeKOG3Wgzw3oqWS5EKfxKRTVYAYPqJb7UvD4e/wHMVyl7nlWnIK3s1f1qYOl1lrErVj5yxJQ4q6v2LOeGkj5xCAYc35bj4C8morz8Y8gl5cN+X9Svqq1qp/fedztMf1KBXqyPxUDhH61hdy8vk0AgAP3A6CsbMwjNA7pnP0uuA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q3miB2Dd; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ad9516a653so56189665ad.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Apr 2026 02:41:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777369280; cv=none;
        d=google.com; s=arc-20240605;
        b=LCAn5LlYCBBYyb4dicveRuZ40zF3QDGkfzjn1yz4IS6pvv85KCjF/XrLsH7AYBRilD
         qpm/Z+THTkZzeTk0AbGCnkzSdw7gdKrA57ngS9pDeX0L53qB0Bzj6kLOPhOIWPJSP0Gt
         07yv/tIOiY6pVO4IWy6owg/ohyetSUF1qrmcnN2wwFmGVecFuHbGtd1AKJw4WM7FF+1r
         IFLAzoayk5SvTFLNhPaID/T/Rnspmnii4xaJQx/IUqFITcOXbTwbtmdlziZx05kg/qYP
         fakL9qz+aVAg//1w+upxLepNLZgeFHi73u0uc9rLgrwAQFvmDPR9VCuL8yXfG0fExrnF
         jXVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AnSnIsMNDAma+IgkOcey9NBHXePZVAGOReDpxepiZEw=;
        fh=xJz6blBZta389CVB96i5HyQUU82u4Z3bLa2gKGqTppw=;
        b=Q1KE+0YU+CsM1eil4sXqSnnf8RTGqb46TN0vRBzPu0GdCgR2xDrQ/hK2htn2ix6q6D
         JEnqbAJ3F6zWrfTTKaKgg+m1k9HqKfT7bThIqd1Vj02FXeVCLfNp+Ukf3vnoaM77/6f0
         VY2jgx61VAYRgfgLwsN1JAV+BTLZusY275Qljx67nVmVrmbPFNU+TQil4WMwQqsEE0bx
         0ZI2UZDjMELKwL5veQYMXXB1YbtqH434NaZEpzI+qgSZLlI+dDNtEmBvnRAYBVbuiX5f
         B1CW+IqAtpFI+uhbz5XGkqbR4W2V6tUvDe1TTk1oZVGGUpNVZMrusmH2tolGrVf2HZ5n
         BgRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777369280; x=1777974080; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AnSnIsMNDAma+IgkOcey9NBHXePZVAGOReDpxepiZEw=;
        b=Q3miB2DdYqHExGww80uDoGpcVI7nAUlpVM3uftty9z9oi2DiN/asfcMDjLN7a2mYTw
         zztSAfFLZ9PaeEwVOEPDn7Fj3fv+1jgnt59PRTKHqz0lS+DzYJU36By3WDqEN+tf1r5d
         On9WQuADu2KkKZlYAlXcciTsL5a7mfknJOInEmlfpyaZnnw75DG+7iztHSE6ulcL0Jaz
         wkWOa3WCj4UjYgrMlz/PLpOma9UfY6QbtR1BSh7pC6PlhqPDQjCG+/IpYTsmMmaXYC2F
         q5nFiJ2HVeBeOHZsIG7SU/MCQ8vJBxYstEhow5bs767dp2DNMWbmuDS/L6PzSZGQB11y
         sM5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777369280; x=1777974080;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AnSnIsMNDAma+IgkOcey9NBHXePZVAGOReDpxepiZEw=;
        b=djmefawrnlXbndO5sVjp1Vzx/Tk7Kxv+bri2Ayenz0zhtd1DThpQopNCrieXdv4Jad
         dZHLly81P5uzzDCfAHB49fIIQTe/k2mjre//kKzD8uBrA4A1PidsBcdLECMzVO/uiVf1
         RwtOwbaP0168l4Q7/k1smXf+dIOI4wJNxes8YsNi3/j/zvrkKcpN2TIQAxph6tas66Sr
         eSh51JOKGaBSjVf0tZ3+nSSxrP5GL7poFER3/Lj7i5p69iSSw00sxCD1mJS8mhq4QKlx
         WqJYRZRJ+Xgk9qJV4qVUTQqiEu7/hl4BnD9YiX+wCZd1X3e2Y65VHFfyUUPsi/6W4lCh
         ljUg==
X-Forwarded-Encrypted: i=1; AFNElJ9NyWcGDSwyTPMbBYFieAwH9hR7yBqqiS6zdVk5wksaDR+XmQsZCVFOEBEPltt6WjDxTg9+3UT1TkecRZY/jkHfug==@vger.kernel.org
X-Gm-Message-State: AOJu0YztsCiNCO97HYiqLRGaPj7FvMJWdZxZdC8KAtt83etHpxTE+scP
	AsOccTSc4Uqifs2XhokWhQLW7EX4Fv9D3WVxiYf7Czk8pQvurrryX0Iy6WExZxmuVF+syFsgEqP
	wPG5fDeH9b5OrzSATuOZvf7J12w4pm/I=
X-Gm-Gg: AeBDiev8zD+Mg8zU2WZXLs5kXHLWEXNkcwGhBL0sg5Z7/yYvgHCYRiw5USbUzD1EC39
	50mtEs31LeM4EbP+AadYn/HIGOdvbk8p1eoM08fJYcjVTYf0VUbbktn6wtYIp/z/Urg8nrYhELA
	eUfUwjwkXEreeSb24MN3aD6UR6CT4JeB8wzfRdU0DM5VmhReurDbBoFKSWp9gOPHOVouk71VOPS
	lKDIRLYyeZGl/lfW9gHE3HfZ6l91XDlRTeSAmyZOyiPSH34pQBrNEjG+PBhlFxZTC55F87HcR6x
	0A0EPO8CQA9xgdOOAlZ4PRwZRa7iJ8az1y3wBRGd3E2MZOII
X-Received: by 2002:a17:902:e746:b0:2b0:6e60:9582 with SMTP id
 d9443c01a7336-2b97c411386mr26853925ad.18.1777369280083; Tue, 28 Apr 2026
 02:41:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413100700.30995-1-phucduc.bui@gmail.com> <20260413100700.30995-4-phucduc.bui@gmail.com>
 <87se8ypeq1.wl-kuninori.morimoto.gx@renesas.com> <CAABR9nGB0u-Y7ddGtu0DmZXUiEWTVrXQy7DhTkLgkSBvFjNyJA@mail.gmail.com>
In-Reply-To: <CAABR9nGB0u-Y7ddGtu0DmZXUiEWTVrXQy7DhTkLgkSBvFjNyJA@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 28 Apr 2026 16:41:08 +0700
X-Gm-Features: AVHnY4Jtd9qov1U9UDBxFBM7FR1sTGp_zRda_9g4fyTQWtjsSvrJmbyAPpkfjao
Message-ID: <CAABR9nHiSxH60ULks7_jZCC5rE+YVu-u+nm3TnO7oKcFoQduhQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] ASoC: renesas: fsi: Fix trigger stop ordering
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 0AAB4481B09
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31698-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,glider.be,perex.cz,suse.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,localhost:email]

Hi Morimoto-san,

Even after reordering the sequence as follows:
    fsi_stream_stop(fsi, io);
    if (!ret)
        ret = fsi_hw_shutdown(fsi, dai->dev);
I had previously tested this change and did not observe any issues.
However, in more recent testing under different conditions, I noticed
a system hang.
It seems that the interrupt handler may still be invoked after
interrupts are disabled and the SPU clock is turned off.
The following log was observed:

root@localhost:~#
root@localhost:~# aplay /audio/file_example_WAV_2MG.wav
[   51.580000] >>>>>DEBUG: enter fsi_dai_startup
Playing WAVE '/audio/file_example_WAV_2MG.wav' : Signed 16 bit Little
Endian, Rat[   51.590000] wm8978 1-001a
: Imprecise sampling rate: 48000Hz, consider using PLL
e 44100 Hz, Stereo
[   51.640000] >>>>>DEBUG: enter fsi_hw_startup
[   51.640000] >>>>>DEBUG: enter fsi_pio_start_stop, enable : 1
[   62.610000] >>>>>DEBUG: enter fsi_pio_start_stop, enable : 0
[   62.610000] >>>>>DEBUG: enter fsi_hw_shutdown
[   62.610000] FSI BUG: READ after clock OFF
[   62.610000] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted
7.0.0-09892-g26b66fbaf162-dirty #5 VOLUNTARY
[   62.610000] Hardware name: Generic R8A7740 (Flattened Device Tree)
[   62.610000] Call trace:
[   62.610000]  unwind_backtrace from show_stack+0x10/0x14
[   62.610000]  show_stack from dump_stack_lvl+0x50/0x64
[   62.610000]  dump_stack_lvl from __fsi_reg_read+0x30/0x5c
[   62.610000]  __fsi_reg_read from fsi_count_fifo_err+0x14/0x88
[   62.610000]  fsi_count_fifo_err from fsi_interrupt+0xa0/0xc0
[   62.610000]  fsi_interrupt from __handle_irq_event_percpu+0x1a8/0x1ec
[   62.610000]  __handle_irq_event_percpu from handle_irq_event_percpu+0xc/0x38
[   62.610000]  handle_irq_event_percpu from handle_irq_event+0x44/0x68
[   62.610000]  handle_irq_event from handle_fasteoi_irq+0xa8/0x130
[   62.610000]  handle_fasteoi_irq from handle_irq_desc+0x64/0x7c
[   62.610000]  handle_irq_desc from gic_handle_irq+0x60/0x70
[   62.610000]  gic_handle_irq from generic_handle_arch_irq+0x28/0x3c
[   62.610000]  generic_handle_arch_irq from __irq_svc+0x88/0xb0
[   62.610000] Exception stack(0xc0d01f48 to 0xc0d01f90)
[   62.610000] 1f40:                   00000003 00000001 000176c4
40000000 00000000 00000000
[   62.610000] 1f60: c0d03f98 c0d07880 c0d90b82 c0d03fd4 c0aea642
00000000 99cea980 c0d01f98
[   62.610000] 1f80: c08228f4 c0822c68 600f0013 ffffffff
[   62.610000]  __irq_svc from default_idle_call+0x24/0x30
[   62.610000]  default_idle_call from do_idle+0xcc/0x124
[   62.610000]  do_idle from cpu_startup_entry+0x28/0x2c
[   62.610000]  cpu_startup_entry from rest_init+0x94/0xb0
[   62.610000]  rest_init from start_kernel+0x608/0x6bc
[   62.610000] FSI BUG: READ after clock OFF
[   62.610000] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted
7.0.0-09892-g26b66fbaf162-dirty #5 VOLUNTARY
[   62.610000] Hardware name: Generic R8A7740 (Flattened Device Tree)
[   62.610000] Call trace:
[   62.610000]  unwind_backtrace from show_stack+0x10/0x14
[   62.610000]  show_stack from dump_stack_lvl+0x50/0x64
[   62.610000]  dump_stack_lvl from __fsi_reg_read+0x30/0x5c
[   62.610000]  __fsi_reg_read from fsi_count_fifo_err+0x24/0x88
[   62.610000]  fsi_count_fifo_err from fsi_interrupt+0xa0/0xc0
[   62.610000]  fsi_interrupt from __handle_irq_event_percpu+0x1a8/0x1ec
[   62.610000]  __handle_irq_event_percpu from handle_irq_event_percpu+0xc/0x38
[   62.610000]  handle_irq_event_percpu from handle_irq_event+0x44/0x68
[   62.610000]  handle_irq_event from handle_fasteoi_irq+0xa8/0x130
[   62.610000]  handle_fasteoi_irq from handle_irq_desc+0x64/0x7c
[   62.610000]  handle_irq_desc from gic_handle_irq+0x60/0x70
[   62.610000]  gic_handle_irq from generic_handle_arch_irq+0x28/0x3c
[   62.610000]  generic_handle_arch_irq from __irq_svc+0x88/0xb0
[   62.610000] Exception stack(0xc0d01f48 to 0xc0d01f90)
[   62.610000] 1f40:                   00000003 00000001 000176c4
40000000 00000000 00000000
[   62.610000] 1f60: c0d03f98 c0d07880 c0d90b82 c0d03fd4 c0aea642
00000000 99cea980 c0d01f98
[   62.610000] 1f80: c08228f4 c0822c68 600f0013 ffffffff
[   62.610000]  __irq_svc from default_idle_call+0x24/0x30
[   62.610000]  default_idle_call from do_idle+0xcc/0x124
[   62.610000]  do_idle from cpu_startup_entry+0x28/0x2c
[   62.610000]  cpu_startup_entry from rest_init+0x94/0xb0
[   62.610000]  rest_init from start_kernel+0x608/0x6bc


.......

In fsi_pio_start_stop(), I also tried adding the following:

    if (enable)
        fsi_irq_enable(fsi, io);
    else {
        fsi_irq_disable(fsi, io);
+    disable_irq_nosync(master->irq);
+        fsi_irq_clear_status(fsi);
     }

However, this still does not resolve the issue where the interrupt
handler may still be invoked after the SPU clock has been turned off.

Do you have any suggestions on this issue?
If we still want to keep the SPU clock enable/disable inside
hw_start/hw_shutdown,
we need to properly handle this race condition where the interrupt
handler is still being triggered after hw_shutdown.

Otherwise, moving the SPU clock control into dai_start/dai_shutdown
seems to be a safer approach,
since at that point all interrupts have already been fully processed.

Best regards,
Phuc


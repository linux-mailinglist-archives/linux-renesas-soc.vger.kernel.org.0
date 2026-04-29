Return-Path: <linux-renesas-soc+bounces-31741-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNycLjmu8WmwjgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31741-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 09:07:37 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3CF490370
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 09:07:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0CB633063C61
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 07:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E1CC3A1CF8;
	Wed, 29 Apr 2026 07:01:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5797B24BBF0
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Apr 2026 07:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777446094; cv=none; b=kjU+VWuOQjhG52Iw+pzhlu5w/8y365/Z581KYAyDy+ySpSL1q9SIRahrOx/hRYUvxlon4He9o2LXXFeFNOvCwFghW35Tm/0Xp5+oNpy5pEiWYQQaeEnu0UJricDzIWm5LqsqKMEYJgIpI4ThFCJ7I3N52HariARR/r71H1mH39E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777446094; c=relaxed/simple;
	bh=2zFGCpdMTl+i5A40Z2bLgw8CP/Po+sJCiVkBITZ+4Ns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FCk0bR/i5VB0orTj0g0sS1HjggAP15JzB5rSKoRgpzHs7/kv2cKc5JsgSFSCtcl5kJ9Rjjr4fsuQM/v80lE6FgITFU2CMwbn/wUg1wQOBTE/6Jbs+r1kByPIQ2sCjbMWCtYPHTcR4ynVGmljdF6KX6DSGC274fA2VOGMnwZA+cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56f65f62b4cso3959969e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Apr 2026 00:01:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777446092; x=1778050892;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NyOy3ACu4LxjGr8lQ205IP/uFtWZrAQIdQcQ1k1pK+s=;
        b=Q5nROgT3DsikyvQKD4NRja9znLKEU0MBw1kg9F8Da4WQmxGhmmqd5XKS5wbFZJ/7QI
         47icphjhlCHX1Uesqv2TRCvUNdmy6JCekKG84CWBviFcbi/XszP9msijlANZ/rI2cMD2
         HrcSynZtmvx1jSL+Z1WNez8BOeXlrutizDhuikUeO73uLj2ZXIfGvubvCZYBX5M+iN3I
         XIv1+st8gMeUlCx1cPY/6R47jhBDEj0PpKCDKp92EvK+WbPhVDUWLXawJRPYllhhEKbD
         MqHEoLicDukJ3Y0/9y0ZUT12o3Q/fOH6CdF2nuzSdOMvElqbm7FDQ4ICRAaY958crvyM
         i5yQ==
X-Gm-Message-State: AOJu0YzTgCwqXHhKRGC5V0oIPY4jY28asJqKaJ1JjPpS5gofVUORwYgA
	hEwnhuUeqzbcDRsaReCYn7mwjJ18keYLuzX0gW4I6sxLw86jsqgG4vIuCkgBapt15ug=
X-Gm-Gg: AeBDievSK/QSbZ6xIXUU520xDgR9i2UUvqFPmDlUky7erTBoS41OjqdB4smk5Xins9u
	rrh91mj2vWXppsYNPtch/s05gVOjcLQvPjdTJidkJTvO1U7niK+6SSOTb1lljxGpEw4jGBCFBFC
	D3n3bmapogH8uJ5cX3FeSJ/U46PsQ/Fwbj3o1Nt9IN+2zQQDJa+jJnOZ0n4u3qC7I5oEjNZnkuB
	zmBvElqCm9JmXWurES2jVjaK1ghTXIvJxJihfW1Vm6IKQ23WJGfVXRWWEkFwEjcnKRY5ljg3fCm
	1n7ZGzqVw/BzFyQPZCaiEtAWFzZJQ/VEVZu4Frz4V3qGeotczAK9i8t9a7D1th0kvqPG82eqCwj
	GpxIyN1ungehkVEwGif3UWbXuyHO4Jm91GZn3mqcYNkoxJpDc7+mPZhI4q0NMvIZSq+iwkxyoCz
	g3k8+lkvXdhjA8gX/aawSqSNwvS1uF92shawa5ZxM1uMcNj/1uVDN5kGd9kPMccN0Xyd+1285PK
	LqCncM52g==
X-Received: by 2002:a05:6122:2108:b0:56c:da22:6921 with SMTP id 71dfb90a1353d-573a558f3famr3419164e0c.5.1777446091406;
        Wed, 29 Apr 2026 00:01:31 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-573b6dfa1fasm660603e0c.15.2026.04.29.00.01.30
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 00:01:30 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-61399bdd395so3991763137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Apr 2026 00:01:30 -0700 (PDT)
X-Received: by 2002:a05:6102:2b90:b0:614:bef5:637b with SMTP id
 ada2fe7eead31-62805cb476amr3136548137.0.1777446090326; Wed, 29 Apr 2026
 00:01:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402112709.13002-1-wsa+renesas@sang-engineering.com> <20260402112709.13002-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260402112709.13002-3-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Apr 2026 09:01:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUSTWivZB+3KhrEd1tsvOD=Sir3o6cfBO5oEpiEBGkmHQ@mail.gmail.com>
X-Gm-Features: AVHnY4KyEMVG1sspIq_TKdKa3u9-OW24R0WtZzeSiPdZjVUTbBm_MbszzQ-tWu0
Message-ID: <CAMuHMdUSTWivZB+3KhrEd1tsvOD=Sir3o6cfBO5oEpiEBGkmHQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] soc: renesas: Add Renesas R-Car MFIS driver
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Marek Vasut <marek.vasut@mailbox.org>, 
	linux-kernel@vger.kernel.org, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 4D3CF490370
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,mailbox.org,renesas.com,gmail.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-31741-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.107];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,glider.be:email,mail.gmail.com:mid,linux-m68k.org:email]

On Thu, 2 Apr 2026 at 13:27, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Renesas R-Car MFIS offers multiple features but most importantly
> mailboxes and hwspinlocks. Because they share a common register space
> and a common register unprotection mechanism, a single driver was chosen
> to handle all dependencies. (MFD and auxiliary bus have been tried as
> well, but they failed because of circular dependencies.)
>
> In this first step, the driver implements common register access and a
> mailbox controller. hwspinlock support will be added incrementally, once
> the subsystem allows out-of-directory drivers.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Acked-by: Jassi Brar <jassisinghbrar@gmail.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Changes since v3:
>
> * use more 'unsigned int' instead of 'int'
> * re-ordered declarations to be more xmas-tree like
>   (don't want to go farther than this)
> * added tags from Geert (Thanks!)

Thanks, will queue in renesas-devel for v7.2, with a few more
reverse-xmas fixes.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


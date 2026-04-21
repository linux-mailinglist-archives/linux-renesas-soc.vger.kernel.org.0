Return-Path: <linux-renesas-soc+bounces-31444-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEu+Lo4j52nV4QEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31444-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 09:13:18 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC9943763F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 09:13:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE4823006B2F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 07:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 115B328C869;
	Tue, 21 Apr 2026 07:12:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C168340DFC6
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Apr 2026 07:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776755523; cv=none; b=r7e0dxBEka+SeA+GRk0pKhP5JU/xzXxqoHJew5RYiDKk//Vy8f9B1gbuv3nIa/HUjy5CoK82hhVF5eL0RoBYwJ7IcAT9b1S6yQFFJIKCxGPS47J4Qgk++6K7nbqRy6YMeWTCmcbJrdwcvQuLrZqGAnqlOjbzLOMIrlCPJVTLneY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776755523; c=relaxed/simple;
	bh=4w9YS78jYo2Q7Hz7QJ47GKx7nDYzPt4igTcoPVL7XL8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AdiPRIqeSBl7jdUgGvdr++ryBim3+nhkr6QFwOo4Bnjws1Sr9GVREqJ1eoDwyBhec8GpqCECVOALXq6f0/SFeZAR8H5t+NDCP3gnt2o0LXwni4Kf33FdnbAJBBM4wsGXJzLZiOAY1r8h7tpHTjn+DxYTn2zPivCNZx+BqSj3avo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56f8c77ca6aso2825662e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Apr 2026 00:12:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776755521; x=1777360321;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JwInXibjWzl/vO4JD/MNvyHm7guro1FSh41fR8veI6E=;
        b=o0BUqHM4BwzD+0CVG1FK9iddha1YhLB/g2SM3vayxh+AdntyPaQJxDAyakUp/tJ2w8
         vibvuf2svEV9RHOzHLoRj3kckEr5t91kOyZF4kuJF+3RRyv/sY+itbZHTRyLseu+l7AU
         ObS9MwoKvC0nDNEUAPlJjvyNYA6SqGCbQsLICDjcIVdrlIA6QPiBmbKKjMl+7jNxwjvR
         WxvCqlyYo2wpQLKuMX0+k2C2HKrQsTnkzRUsyMZEMuJG4JCbcaQ6H50A3Ru1YWBtU32M
         rHEPZyn1cjurJHwVmuLa/oGKi+S4VsyZgk9XS1FgfxpyTi0KJHU/TQRN4GmJo3/We/O1
         28lw==
X-Forwarded-Encrypted: i=1; AFNElJ84Hg/3SYd1VO2rIZqezvL1i6P5HbsXrXK63HLxJTtF7lly77GT1hbK+6CPwt97fHopWA9/oFs3iXswH7KP5dmkYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAiEO6og/0cTm3rYgo2aFWRfETjhrBGQf+I5RWL18Z4hDRNzCq
	GNyuUfWwxBr23c2Q0MJNjPE+YAyFU6hPJzY5ViAOE8hqUvw5L+0QDdBu4wisV+uflBE=
X-Gm-Gg: AeBDies1BYGwtDu9n3gb4LXcPbr4R9cpOS0LqEaIlhbmETQh4/bwjfLMuc52IfzADoR
	38HCJfr/sTQU59DeQEwQiPg1DBH7Zc6kC7qoCZSyKhL/y7hdkHeVoXu1PHTRjRYDWbXJkVS/Dxe
	huMZSN0DnKuZLlpT/W0Lha3swVvW05yvAOeZGh2SBfncKIPe/YYpNj7rDxEc/jJ1wglRoTMsb0E
	Gq93LPTdJvs2yFkFzU6dfMv35ZWCLEkLWcZYzFPA+lCUIaoww4yFE8z69zbnj7vIVTTiYKcBfxy
	Keb+M3PrDUejNz4SujKFW8dR2+PSfIyZGNLuBHuBHoCcDI6AulHibRB8DJcd7c0molouVpc1oEu
	hAP0w27CKQQOs2KvmYCxgff7zhZoVUx4WUXk1qsgLAkwUdMnvxT2/k3d9GEetD5nn9n3NZaBaxe
	4JWNZZpx+YcQzoOQlFkoT/kT0UD7yQcKDHgukdeybnT6MvBIGkAnOG6EnCLbrT8+R7iTZjxCA=
X-Received: by 2002:a05:6122:82a9:b0:56f:b0bd:2276 with SMTP id 71dfb90a1353d-56fb0bd24ddmr7141455e0c.0.1776755520655;
        Tue, 21 Apr 2026 00:12:00 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56fa90335e6sm7787627e0c.0.2026.04.21.00.11.59
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 00:11:59 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-6058ac0ebceso2599781137.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Apr 2026 00:11:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9xXLHF0z5BhizMcCpT2rF/ybT5Y2oQ0LpZhzp7H18GWShaG5cUlg5Qm4G3kwGSIN4M3/aidnG4NmBGrWlxPZf6fA==@vger.kernel.org
X-Received: by 2002:a05:6102:20c8:b0:61a:c2e2:932e with SMTP id
 ada2fe7eead31-61ac2e297e9mr2628301137.22.1776755519482; Tue, 21 Apr 2026
 00:11:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260417140231.3972749-1-chris.brandt@renesas.com>
 <CAMuHMdUVCtzxumM6yniuGTKfqG_z6BuySHNcZYE9UHP5AuDoLw@mail.gmail.com>
 <OS3PR01MB83197FBDFCDECBA1220BF52B8A2F2@OS3PR01MB8319.jpnprd01.prod.outlook.com>
 <OS3PR01MB83193C199C2DF1F2153827458A2F2@OS3PR01MB8319.jpnprd01.prod.outlook.com>
In-Reply-To: <OS3PR01MB83193C199C2DF1F2153827458A2F2@OS3PR01MB8319.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Apr 2026 09:11:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUvUp00y2i-jB=1ZzTo9vQ-1+T_BRhanOWL+oX5CGinog@mail.gmail.com>
X-Gm-Features: AQROBzCgWJdDzE2USTixi86Dz844wFu7yea9_t_E6eSnIWvNdWuUZpLqybVPrSg
Message-ID: <CAMuHMdUvUp00y2i-jB=1ZzTo9vQ-1+T_BRhanOWL+oX5CGinog@mail.gmail.com>
Subject: Re: [PATCH] drm: renesas: rz-du: mipi_dsi: Fix return path on error
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Pavel Machek <pavel@nabladev.com>, Hugo Villeneuve <hugo@hugovil.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,nabladev.com,hugovil.com,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-31444-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email,renesas.com:email]
X-Rspamd-Queue-Id: 0AC9943763F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Chris,

On Tue, 21 Apr 2026 at 00:05, Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Mon, Apr 20, 2026 5:14 PM, Chris Brandt wrote:
> > Since it doesn't really matter -when- that memory is allocated in probe, maybe I'll just keep the original lines, just
> > move them earlier in the function when all the other resources are being allocated using devm_xxx.
> >
> > Then I don't have to worry about the it anymore.
>
> Oh wait, I guess I also need to change from calling dma_alloc_coherent() to dmam_alloc_coherent() so it will automatically unwind.
>
> And then, I can remove the call to dma_free_coherent() in rzg2l_mipi_dsi_remove() as well.
>
> Does this sound like a better idea?

Sounds fine to me!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


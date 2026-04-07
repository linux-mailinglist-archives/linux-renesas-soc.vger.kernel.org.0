Return-Path: <linux-renesas-soc+bounces-30909-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGQ5AwXM1GmtxgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30909-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 11:19:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FB93ABD78
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 11:19:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4406D3003BF7
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Apr 2026 09:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06F1539934E;
	Tue,  7 Apr 2026 09:18:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D7831353B
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Apr 2026 09:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775553534; cv=none; b=HYOdOHwJeHoJZLWsFYgwLNTfWMDzc7bhilLNfJMQiN0+L/qyeC4uZ0hg39ddyxicKxE9T/ZIcxi+soMmWtzYKlSoIs79UgdqppwhD99JZT/GptpzlDvUOx8l+egFJ5pDPgcxDGDZlkDynAZMc/KVSfgl3CmbGionytTVcQmCdmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775553534; c=relaxed/simple;
	bh=1OHP9BR/GOroMzF7dgkqtD1IzaTBfVuKG0kgMkciu50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QCWd0mIdPzVXRjrI2+FAXnFtO5hea5EzP5x9pKX9n5qTgfvMAPaRjbxW6NitK+kHlkzd/cUlDl53MEd/m2QH9rQc+e11fsJ89aqE+yKaVR1gYmkFgFBr0a6sOI91v4nUINT5zPcc1i2LuNHcDWId2Sofxa2x4CC3PKXHRKyjGCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-951c5ac6253so1564323241.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Apr 2026 02:18:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775553532; x=1776158332;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cR9HGabiBXNm33M/l0GZLFmidathx2ZfsEf0OcHHACY=;
        b=tHLTYLihKCnu8a1QMr7qli2sWuJ2bTyToe9ZvRSbYxIo6ZmRKXFXUlsemGnFsfFuFU
         QjyJqHLzrRZDxTqsFn7Zomq2VnQOkRejTMqurzgt4PxuMMolYX9AAcpU3pF8U7I++h9g
         mfmP2oxwhLd6Bj9bdxY4RMs2FFqp9hBY6+8HT0LshEapUd68vEihBKOhLfGak1A/L1M7
         eFBzuI9BMOZP+2nS/43avBtt7oxJdvLUY8e4JPShHOX04IZomnuB4BKJzta+WTQk9Rnz
         By0q5AddWANElt4oaVlUzMf2yBAGTxX2bc7Ak9AIhUMAfGvt1Jr9OQD/dKv5+8Ab1GCy
         YW6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUJVm6QOkImTx3NOwRpiVKsxhtXjQLPm55c2Z+VoRh084+C/GkIFVPNTx7pCxvYOSxUNp98I7Z2/h41sFAtSZ4yHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVNunoGVJGfKeZ0cpVrwsVHnlGu5899rSazPBLVZm0zCabufg/
	cqwSfcAtz32Ht/kqEDF5a5RfnX1ANTHTczu/NACy4UzjJoed7Kz0PyfWf5+2ndid
X-Gm-Gg: AeBDieuWlCXdMdSJSgoD80vjW+muZC6QZBNCeY2rw5czuo/VyCgmVseYsq+BemcELen
	k5uvlxchCF5hN7Pg9HiDpzDPY4m0IisPc6Vohe9E4lNqFVtzKEkmJ9lQZSM9UtfMDaY7uFb6XYZ
	4GdDxGhjCASDEThM7sYzHIhPI5pn9m0+Z2r22u5Fd2iLnLxiaHxbh+UtpjiTM7Uwsn4Ri4RTzz4
	T1hyLUBVemnY8deu/d7WS92ZAqoFGjgHR5v7c8JAW6MGkI3Qtq9tKmvequ//Xg3D4q4lBOn7rj5
	NBVgBzrLYVpOsZks6kcKN796koLm0PwSMcqhVHovslqMYICNNPLriJViU7yKLngYgOm5BcgUSjM
	0yGyhKx6aQyfU6uap2csqEvIjFo4W+0y66BPql6kpKl4s3HaR55ITZf/RXaL4Z72GMCiXdcAJhx
	oeiRcROgtvhRaSZ532vcPl0dbdU0iDr7Y2JPL9cmkiCI5Hjlwv7OPHbxPAWg+xg7cX
X-Received: by 2002:a05:6102:5345:b0:602:ab63:b0ca with SMTP id ada2fe7eead31-605a4c9970bmr4755195137.1.1775553532497;
        Tue, 07 Apr 2026 02:18:52 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60582e730e9sm18887551137.6.2026.04.07.02.18.52
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 02:18:52 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56d9ed609d2so1375669e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Apr 2026 02:18:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUGsbs0k7uK1Z3xc6lYTVQf+n0GaW9+DJRMQNNTUrYiYWfDYaKxBeprcEU8eK7kjOL1hTbgMljnNd0wFRYeIwcSVg==@vger.kernel.org
X-Received: by 2002:a05:6122:1d15:b0:56c:ca50:e963 with SMTP id
 71dfb90a1353d-56daba4441amr5183687e0c.14.1775553531657; Tue, 07 Apr 2026
 02:18:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323164526.2292491-1-laurent.pinchart+renesas@ideasonboard.com>
 <20260323164526.2292491-5-laurent.pinchart+renesas@ideasonboard.com> <CAMuHMdXomz9GFDqkBjGX9Sda_GLccPcrihvFbOz0GAitDVNTbw@mail.gmail.com>
In-Reply-To: <CAMuHMdXomz9GFDqkBjGX9Sda_GLccPcrihvFbOz0GAitDVNTbw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Apr 2026 11:18:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWLcat1BegoTH_=ir9svJ2CECw2g672pfz-5CGg6xtWuA@mail.gmail.com>
X-Gm-Features: AQROBzDsnfwxgRbWuNYO6rWIlZEto2LwHPdqUIPoMgm27H9bZD6G-qlMJsPH2Ss
Message-ID: <CAMuHMdWLcat1BegoTH_=ir9svJ2CECw2g672pfz-5CGg6xtWuA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm: rcar-du: Don't leak device_link to CMM
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-30909-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.271];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,ideasonboard.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux-m68k.org:email]
X-Rspamd-Queue-Id: 28FB93ABD78
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 7 Apr 2026 at 11:10, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, 23 Mar 2026 at 18:22, Laurent Pinchart
> <laurent.pinchart+renesas@ideasonboard.com> wrote:
> > The DU driver creates device_link instances between the DU and CMMs, but
> > never deletes them. Fix it by introducing a rcar_du_cmm structure to
> > group the CMM device and device_link, and deleting the links at cleanup
> > time.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> Thanks for your patch, which is now commit 3bce3fdd1ff2ba24 ("drm:
> rcar-du: Don't leak device_link to CMM") in drm-misc/for-linux-next.
>
> This causes koelsch to hang during boot when a display is already
> connected before boot:
>
>       [drm] Initialized rcar-du 1.0.0 for feb00000.display on minor 0
>       rcar-du feb00000.display: [drm] Device feb00000.display probed
>
> When no display is connected, the system boots fine.
>
> While looking into this, I noticed that hotplug after boot crashes,
> but I haven't bisected that. It definitely worked a few months ago:

I am feeling lucky: reverting this commit fixes HDMI hotplug, too ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


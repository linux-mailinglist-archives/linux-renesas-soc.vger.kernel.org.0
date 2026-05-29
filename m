Return-Path: <linux-renesas-soc+bounces-33342-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFqJC2GBGWrVxAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33342-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 14:06:57 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9071601FE9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 14:06:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AEBD73092F2F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 12:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77F443A2544;
	Fri, 29 May 2026 12:05:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5111B3DC873
	for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 12:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780056334; cv=none; b=b7H3DqPYhTFvSdN1o1FkjjWuid7ezQMQSZYXvJpN0scQ0dXVfXT7ktO9q2Ln/vQjS08xQF0PI3x12Dvu/bof/Ge6r630g8Bgqj2Ba7kMtiS05OK78yyTnJnpQZ746Qm9MM2DbNABHs2tXM+fn1X4QQsRlYn+U6Qm9sILCef2dMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780056334; c=relaxed/simple;
	bh=r6FrM1W4SpqAjwuFPfgTdnYMQZe9dulHckvJpx/ID8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=afWo9+1T8G64n3f3gdgOFll0QYinDiTUJ/qtTQbHjVCK5Vs3hEOLXcjcDWGTN5ALDvQEYOyMG1pUzLBrvS5wIb4vcaKAjSSs0is/TnqI49X1PV/cT+C4UXlLcC3z65LwyvrDPEDjeRgKkJZM4jyLHUVpKLRyQyQK+pejRIOtLEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-9639d7daff3so956323241.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 05:05:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780056332; x=1780661132;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9OX8XoUF7IFu/te1KTNA1tAU1bbe6/Z6QcoLJKS7O78=;
        b=BQrKFDL7l55BJa7oGdHXVJNx86Ta4JPfEMkX3124IUlaXsfrx95FmMWBGk5SxM6XUa
         biE18/PIE4NvLcntM7cUYuY3dx3KqOValB8QealYfuhEXvuSB1OkqUd7VMy5oIXiaBln
         kSUy65zgUjasIwDrhDS/IEEcoRsaoTkBIFR0l7IEGsg7VdnlSiv9KIJ+Wye+P8q6YEtj
         JFq+4W94Vj1DGa0MWLKW8wfxAl/wR3bUkE37xsPVpUpAkIqih6/kM0qFW5c4E+oDXjcN
         rOy9HVLWAiq0gBZEQOe0MAnhjf7Zkjq9soVELdkoCS4JCcMF77jtkxDc54FHVNZtciUV
         W2rA==
X-Forwarded-Encrypted: i=1; AFNElJ8zLuIqNMrRmeMKFvvELeIjnAPOpOZ/Iqgj9wdoGONaLcNH05pCLz6KYD/AL8YDHHZVHY0h3ugw+e0HnE93d5kuVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdlmEhvYZXKno9CYbORkyFP7hIu1pSMm3txFOgodCiySYK3Lav
	3C2dPKyGpfIGSjeH/J+PbAtTtdT2kkFl0xh3jUADDFtRa7a+BqkGrAssbsHcXLyzsEs=
X-Gm-Gg: Acq92OFGjWqEVUaC3jWCTHtc98dfYMx3zfI0/xBX0YiOWkSzIT9arSri6+5Pb8UaMyv
	aFeP24T/Swk8EQ3nMLWg7WfDLPe2pvf+k0phQ6w4WSuWPsr5Pq/Iv0zGJf/9hwvNAQd33P/GohE
	M7UecL+xap/hJi9h0aGzTR7wmsMkEQOz5AEX0ouvjWzqrmdBIrU6C2PnWlyp59pXRrWGyjK3B0W
	24WtaCOYDSVIxW8IXK8rHNarzfd6pzRiP/asqAS/nM3+qsaMmSC1zrVXDKyWocSSbIRz5nnA84R
	a2Q3d1gEeAzkNzm3XMx20zlh8pY2/7fK2kDp1oAj4/YpSLcloKttrfG7ki30Jr0tVibHGUQmz1i
	Tqgf+KF/Hf9JoxwUs9e8yjP0C/jofVvIu2rZ4YJyXlLyLFSvbw2k0MWcoOhBNWduw4W4wjFxJUe
	4PCOFJc4orlVZO0cay5WV6gzyMvbxW899Z/JCF+2xvT5asuluym0Y8/o2BgGdJmZD4nCe2GLuxZ
	hw=
X-Received: by 2002:a05:6122:d0b:b0:575:634a:a604 with SMTP id 71dfb90a1353d-599f65e09a8mr804781e0c.6.1780056332125;
        Fri, 29 May 2026 05:05:32 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-963abeadd1fsm717764241.12.2026.05.29.05.05.29
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 05:05:30 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5771954bcd0so9657256e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 05:05:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9Guc5CaNVZ/EwLRUXne8UZcLSzIUPD527P1K6o2yrPU2w2PCQ8YZHURfzI3FphBJqWqh5l55dL1WwRMX/zErxnvw==@vger.kernel.org
X-Received: by 2002:a05:6122:4d85:b0:56c:ca03:b668 with SMTP id
 71dfb90a1353d-599f53537c8mr819640e0c.3.1780056329661; Fri, 29 May 2026
 05:05:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
 <46547aaff3cdb8ea6e17cf1fdec699d83a1cd71b.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
 <20260408113358.GE1928916@killaraus.ideasonboard.com>
In-Reply-To: <20260408113358.GE1928916@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 May 2026 14:05:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV5xfpj6_5o4Ed+KMLg5MMDuaNUjsUBucrC3nCkkG9vaw@mail.gmail.com>
X-Gm-Features: AVHnY4JwL8_eHuTqhLIZ-49xr1MV4gGX3lGZE_rNlXQ8x2vrv47pvQNALVqlDj0
Message-ID: <CAMuHMdV5xfpj6_5o4Ed+KMLg5MMDuaNUjsUBucrC3nCkkG9vaw@mail.gmail.com>
Subject: Re: [PATCH v6 19/21] arm64: dts: renesas: r9a09g047: Add vspd{0,1} nodes
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, tomm.merciai@gmail.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,gmail.com,vger.kernel.org,linux.intel.com,kernel.org,suse.de,ffwll.ch,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-33342-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,glider.be:email,renesas.com:email,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux-m68k.org:email]
X-Rspamd-Queue-Id: C9071601FE9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 8 Apr 2026 at 13:34, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wed, Apr 08, 2026 at 12:37:04PM +0200, Tommaso Merciai wrote:
> > Add vspd{0,1} nodes to RZ/G3E SoC DTSI.
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks, will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


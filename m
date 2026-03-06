Return-Path: <linux-renesas-soc+bounces-28946-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6B8qFJ7KqmlWXAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28946-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 13:37:50 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CE9220C51
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 13:37:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C67C73051A97
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Mar 2026 12:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72D69221726;
	Fri,  6 Mar 2026 12:35:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AB722A7E6
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Mar 2026 12:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772800546; cv=none; b=Txv9gXhwzZCoXHNLEDuefgLlB3544Ro+ROHThjtQIpJplSAJGF/fwv/DDxMyX0VHyJUAgNR4/qTEEpV44CCLLmiCmmemtTQ/v4d3sy8zicuHnJ3lFqe2da6v4xe4zQODDWtwFjcemj27whWm8/OWNvVL8YcKLyt6God31/w+GyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772800546; c=relaxed/simple;
	bh=t+zhrRtHdxJ0egPar6qDHLUgu1o7nIbY/t2grbrBnTw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RIqFGlDQxzZU9xzRjfXLlKKjNGdVMomjF24gK96V+H/sFm2Rwdteui7sMJFe6I7fzYN/ZK1hmSolVbNdC3PC3AUu3ne+h3DGtdX9/8qp/anTSBsXEFUQA9WZXf1DYbqizuyHBrdqhSiUIVXmRpIyU+OtHyDRKsDJujH6zHp0JN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-94dd01deb53so2056919241.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Mar 2026 04:35:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772800544; x=1773405344;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=96m0o8Clxl4fOeYKH2P2MIwu6gx/EjFZuUHZ+Kn4U/g=;
        b=I6BS/+WGkCd/1Mhw1gOv8z6NF0Y9f4/VzETofahVbFbM6tzccde3RKwzkbak5A2ebr
         NgcSBcF6YrtjA9I3QqcxO1so/fO+Y8jx2XX4LSa6MnGfpWGFUH4nbBQzNpW7Zu+F1Hw2
         5JDhcQFE9lyGdpemRApBq44vXqmEmBpzjRh7sr97JiBoxiJKoUKfR2xZSA3iMMswIaNO
         Igzu5khhsjAKdXqhlbPftK409y+VF0oBEphycO2HYxJyzJKUDRBjj2LsL2+jmB2hMMIv
         u0i+AschhesiHLx4KaGUqmEtNwWwzVdNvJTfXBq5kQebSglvlgjvD4pPAHSgltF0OCBP
         5eJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWta5lsvsk6YmtRAvL9Qw81N+nBkgBlOzD3mvUjNybDLbzFrqtSuwnx8OgmEpR9ykg6Uuz6PaZh+J5gJnYSq8O+lA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUD+RSilqVmd9B3FBCrkvf2TsUqben7L6cSnJpF0NAV+wD+VVJ
	apVAF96vrUYp6ZzTYvxZeE0cbVekqSApcAj8YwHLh8sv4DHPTj6SFF0J0RzlOE149MU=
X-Gm-Gg: ATEYQzwVkfZzOKAbzhQEhnIXLltPrtGfZ/drYlBb3PcPzdk5oIZO6nXh0HjPIo9Pt23
	zPaZUo89Aw9eMLTgjSFAOWwI5NnnRq/BqqEB5RsVNR0XnybXyXdUNvKAzKDu2Pa0cSe0XW3PUKK
	x5OYrvdcVfBHvmbf6q4f00uFRV6uv1mLnHYVE2iED463OxLp/8Mj2lqAvXMUn1VHFhDYvm3g1wZ
	DSaOsdZDZdKaPUjOlq7uyWj92Ms0lofUMR6HoN/tqbv7IbHC/MPbrZQ8Leps61zwoMTGUYe1S+y
	Gaq6yuFYW/HsqhuAPAkElgTXLY4SRsNblxRI8G3WnkU7cHv+am1uXB6FVF/PBo44LWQ9WIvELXP
	7fw21u25gaRY2sKfspgsULrJNT7ad36Ark2J9/NPqC72KIGIgfCj+PlHGYr6OwWfwSYgmi1M9/9
	KBQ+i9aH3HnPZGBbfKoN1vVi7rGlBzcKHZMKdYDHxhaiyb1VelHJTUZaITmAPd
X-Received: by 2002:a05:6102:3f0a:b0:5f8:f6f3:84d7 with SMTP id ada2fe7eead31-5ffe5f8bddemr626575137.13.1772800544017;
        Fri, 06 Mar 2026 04:35:44 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94e7b35f67bsm1240526241.5.2026.03.06.04.35.40
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 04:35:41 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5ff05af29b4so3288678137.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Mar 2026 04:35:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVUGKklp4gGvDsgIFEcTLgQyHprHuPznc0sehZAJo9SkNf+OSSDQxF/WHKQcvEdVO65olGXJXL4RQNWYVw9WE+ckA==@vger.kernel.org
X-Received: by 2002:a05:6102:2908:b0:5fd:ee19:8b30 with SMTP id
 ada2fe7eead31-5ffe632e0d7mr598649137.35.1772800540255; Fri, 06 Mar 2026
 04:35:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260125192706.27099-1-ovidiu.panait.rb@renesas.com>
 <20260125192706.27099-2-ovidiu.panait.rb@renesas.com> <CAMuHMdWZKUjptQCqe_DK3C_g5d9Zhp3r3j6+dAfE1g==NH+ofw@mail.gmail.com>
In-Reply-To: <CAMuHMdWZKUjptQCqe_DK3C_g5d9Zhp3r3j6+dAfE1g==NH+ofw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Mar 2026 13:35:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXyo3hYbWYzdYUUzk=OQJzKn4Q4DdxXZi_0C2zH_goK3w@mail.gmail.com>
X-Gm-Features: AaiRm526yeK4Pkoal5L7g4NriLGd-kQ5uifyBQ0CVN8Qd9yNZfzNgOUcuHaBmPw
Message-ID: <CAMuHMdXyo3hYbWYzdYUUzk=OQJzKn4Q4DdxXZi_0C2zH_goK3w@mail.gmail.com>
Subject: Re: [PATCH 1/5] clk: renesas: r9a09g056: Fix ordering of module
 clocks array
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, alexandre.belloni@bootlin.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, linux-rtc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: E4CE9220C51
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,bootlin.com,kernel.org,gmail.com,baylibre.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-28946-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.938];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,renesas.com:email,linux-m68k.org:email]
X-Rspamd-Action: no action

On Mon, 26 Jan 2026 at 16:27, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Sun, 25 Jan 2026 at 20:27, Ovidiu Panait
> <ovidiu.panait.rb@renesas.com> wrote:
> > The r9a09g056_mod_clks array is sorted by CPG_CLKON register number and
> > bit position. Move the RSPI 0/1/2 module clock entries to their correct
> > position to restore the array sort order.
> >
> > Fixes: 1f76689d1715 ("clk: renesas: r9a09g056: Add entries for RSCIs")
> > Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-clk for v6.21.

Promoting to renesas-clk-fixes for v7.0, as I have other fixes.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

